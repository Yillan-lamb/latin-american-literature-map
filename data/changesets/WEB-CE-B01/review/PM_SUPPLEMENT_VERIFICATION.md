# PM 受限补验记录（WEB-CE-B01,2026-08-18）

Worker A/B 报告网络受限导致中译核验缺口。PM 按 fail-closed 原则做最小范围补验（仅书目级核验,不作文学事实依据）。每条记录:书名 / 译者 / 出版社 / 年份 / ISBN / 核验来源与访问状态。

## 已核验（verified）

1. 《最明净的地区》/ 徐少军（另有王小方并见,以 MARC 为准待复核）/ 云南人民出版社 / 1993 / ISBN 7-222-01047-5
   - 金陵图书馆 MARC（http://opac.jllib.cn/opac/show_format_marc.php?marc_no=56375362523356610064003202655a370138573a）access_pass:200 字段题名+作者,010 字段 ISBN,210 出版年 1993
   - 豆瓣 https://book.douban.com/subject/1784891/ access_pass:云南人民出版社 1993、译者 徐少军
   - status 建议:verified_old_edition
2. 《阿尔特米奥·克罗斯之死》/ 亦潜 / 外国文学出版社 / 1983（页内另有 1987/1988 版次印迹）/ ISBN 未确认
   - 豆瓣 https://book.douban.com/subject/2033810/ access_pass:外国文学出版社、亦潜、1983/1987/1988
   - archive.org 扫描件文件名证实「二十世纪外国文学丛书 017《阿尔特米奥.克罗斯之死》[墨]卡洛斯·富恩特斯著」
   - status 建议:verified_old_edition（ISBN/确切首印年留 pending 注记）
3. 米斯特拉尔《柔情》（中文诗集选本）/ 赵振江 / 漓江出版社 / 首版 1992（页内含多版次 1992/2000/2005/2015/2016/2019）
   - 豆瓣 https://book.douban.com/subject/2266691/ access_pass:漓江出版社、赵振江
   - **收录范围未核验**:不能证实「完整收入《绝望集》《柔情集》《塔拉集》」。三集 translation_status 暂维持:Desolación/Ternura `pending`(线索=该选本)、Tala `pending`(同)。待目录页核验后再定 verified_collection。

## 补验追加(2026-08-18 第二波)

4. 帕斯《太阳石》/ 赵振江 / 北京燕山出版社 / 2014(页内另见 2015 版次)/ ISBN 未确认
   - 豆瓣 https://book.douban.com/subject/25962160/ access_pass:北京燕山出版社、译者 赵振江、2014/2015
   - 微信读书 https://weread.qq.com/web/bookDetail/f0b328c0811e1ad18g012636 access_pass:燕山 2014
   - 线索佐证:帕斯作品套装(精装全四卷)=《太阳石》《孤独的迷宫》《弓与琴》《批评的激情》(queshu.com),同属「天下大师·帕斯作品」
   - status 建议:verified_single_volume(ISBN 留 pending 注记)
5. 米斯特拉尔《柔情》收录范围 **已核验**(解除 REVISE-2 条件):
   - 缺书网书目页 http://www.queshu.com/book/41897712/ access_pass:漓江出版社 2019.8、赵振江译、336 页、ISBN 9787540786717;目录明确分卷收入《绝望集》《柔情集》《塔拉集》《葡萄压榨机》+ 附录(授奖辞/获奖演说/年表/主要作品集目录)
   - 豆瓣 https://book.douban.com/subject/2266691/ access_pass:漓江出版社、赵振江、首版 1992 起多版次
   - 结论:《绝望集》《柔情集》《塔拉集》三集 translation_status → `verified_collection`(漓江《柔情》2019.8 完整收录;译者为赵振江)

## 补验追加(2026-08-18 第三波:建议池替换决策)

6. 卡彭铁尔两部计划作品无中译本 → 按计划规则「同一作者代表作品中选已有可靠中译本的替代」:
   - 《方法的资源》El recurso del método → **替换为《时间之战》Guerra del tiempo**:人民文学出版社 2021-07,陈皓译,ISBN 9787020165223,228 页精装。核验:文轩网书目页 https://item.winxuan.com/1203235303 access_pass。
   - 《巴洛克协奏曲》Concierto barroco → **替换为《追击》El acoso**:人民文学出版社 2025-4,陈皓译(旧版:中央编译出版社 2004,晓林译)。核验:豆瓣作品页 https://book.douban.com/works/1055835 access_pass(全部版本 3:两中文版+一西文版)。
   - 替换理由:两部计划作品经全批次检索均无任何中译本(not_found);《时间之战》《追击》为卡彭铁尔核心创作(短篇集/中篇),与库内既有三部长篇(《人间王国》《消逝的足迹》《光明世纪》)互补,且有正式中译。
7. 建议池最终状态(11 部):9 部 verified + 2 部替换(时间之战、追击)。已有作家追加合计 14 部(帕斯 3 + 建议池 11),与 USER 方案 B 授权一致。

## 未核验（维持 pending）

- 富恩特斯《奥拉》:本轮未打开任何中文书目页;entity/CREATED 仍按 Worker A 的 hold(缺作品级来源)。

## PM 决策草案（交 Reviewer 裁量）

- D1 `birth_place` 作为 fact_field 使用:操作手册 SOP-B 第 8 条明示「出生地先存为有来源的 birth_place 事实」,虽不在主库既有词表,属受手册认可的事实字段扩展,非 Schema 关系词变更。建议:PASS(在迁移中作为新 fact_field 值写入,README 注明依据)。
- D2 帕斯超现实主义运动关联:双来源证据已备但库内无超现实主义运动实体 → 本批 `hold`(entity_gap),不新建运动实体,不扩大范围;留待后续批次或专项决策。
- D3 《奥拉》:本批不占正式作品额度;如无法取得作品级来源,实体+CREATED 一并 hold,富恩特斯本批入库 2 部作品。
