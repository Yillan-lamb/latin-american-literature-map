#!/usr/bin/env python3
"""Compatibility entry point for the all-candidate projection evidence.

The filename is retained because prior handoffs and validators invoke it;
the implementation now lives in ``generate_projection_evidence.py`` and
checks all numeric candidates, not AEQD alone.
"""

from generate_projection_evidence import main


if __name__ == "__main__":
    raise SystemExit(main())
