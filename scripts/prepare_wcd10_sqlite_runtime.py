#!/usr/bin/env python3
"""Build the frozen checkpoint writer for CI; never patch DB bytes or hash gates."""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import platform
import sqlite3
import subprocess
import urllib.request
import zipfile
from contextlib import closing
from pathlib import Path

VERSION = "3.53.1"
SOURCE_ID = "2026-05-05 10:34:17 c88b22011a54b4f6fbd149e9f8e4de77658ce58143a1af0e3785e4e6475127e9"
SOURCE_URL = "https://www.sqlite.org/2026/sqlite-amalgamation-3530100.zip"
ARCHIVE_SHA256 = "36ad6e7f38540a3b21a2ac36340833f0a9e426bc1c752751c3ba669466827eae"
# Official sqlite3.c SHA3: https://www.sqlite.org/releaselog/3_53_1.html
SOURCE_SHA3 = "414432ae5719f6cdc485f3927e12c7ad107e2b8c6b434e5df2eadb5312bfabb5"


def verified_source(archive: bytes) -> bytes:
    if hashlib.sha256(archive).hexdigest() != ARCHIVE_SHA256:
        raise ValueError("SQLite source archive SHA-256 mismatch")
    with zipfile.ZipFile(io.BytesIO(archive)) as bundle:
        # Read exactly one hash-pinned source; do not extract archive paths.
        source = bundle.read("sqlite-amalgamation-3530100/sqlite3.c")
    if hashlib.sha3_256(source).hexdigest() != SOURCE_SHA3:
        raise ValueError("SQLite source SHA3-256 mismatch")
    return source


def verify_loaded_runtime() -> dict:
    if sqlite3.sqlite_version != VERSION:
        raise ValueError(f"checkpoint runtime must be SQLite {VERSION}, loaded {sqlite3.sqlite_version}")
    with closing(sqlite3.connect(":memory:")) as connection:
        source_id = connection.execute("SELECT sqlite_source_id()").fetchone()[0]
        secure_delete = connection.execute("PRAGMA secure_delete").fetchone()[0]
    if source_id != SOURCE_ID:
        raise ValueError("loaded SQLite source identity differs from pinned official source")
    if secure_delete != 0:
        raise ValueError("checkpoint runtime requires the original secure_delete=0 default")
    return {"status": "PASS", "sqlite_version": VERSION, "source_id": source_id, "secure_delete": secure_delete}


def build_runtime(output: Path, archive: bytes) -> dict:
    source = verified_source(archive)
    system = platform.system()
    if system not in {"Linux", "Darwin"}:
        raise ValueError("CI SQLite bootstrap supports Linux and macOS")
    output.mkdir(parents=True, exist_ok=False)
    source_path = output / "sqlite3.c"
    source_path.write_bytes(source)
    library = output / ("libsqlite3.dylib" if system == "Darwin" else "libsqlite3.so.0")
    # Match the writer of the frozen fixtures. Host Ubuntu enables secure
    # deletion, changing free-page bytes even when every logical row matches.
    arguments = ["cc", "-O2", "-fPIC", "-dynamiclib" if system == "Darwin" else "-shared",
                 "-DSQLITE_THREADSAFE=1", "-DSQLITE_ENABLE_COLUMN_METADATA",
                 "-DSQLITE_ENABLE_FTS5", "-DSQLITE_ENABLE_RTREE", "-DSQLITE_ENABLE_STAT4",
                 "-DSQLITE_DEFAULT_AUTOVACUUM=1", "-DSQLITE_USE_URI=1", "-USQLITE_SECURE_DELETE",
                 str(source_path), "-o", str(library), "-lm", "-lpthread"]
    if system == "Linux":
        arguments.append("-ldl")
    subprocess.run(arguments, check=True)
    return {"status": "BUILT", "library": str(library), "sqlite_version": VERSION,
            "archive_sha256": ARCHIVE_SHA256, "source_sha3": SOURCE_SHA3}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--archive", type=Path, help="Optional offline copy; both pinned checksums still apply")
    parser.add_argument("--verify", action="store_true", help="Check the library loaded by this Python process")
    args = parser.parse_args()
    if args.verify:
        result = verify_loaded_runtime()
    else:
        if not args.output:
            parser.error("--output is required to build the runtime")
        if args.archive:
            archive = args.archive.read_bytes()
        else:
            with urllib.request.urlopen(SOURCE_URL, timeout=60) as response:
                archive = response.read()
        result = build_runtime(args.output, archive)
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
