import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class journalstella extends StatefulWidget {
  const journalstella({Key? key}) : super(key: key);

  @override
  State<journalstella> createState() => _journalstellaState();
}

class _journalstellaState extends State<journalstella> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/journal stella/page (1).png',
    'books/journal stella/page (2).png',
    'books/journal stella/page (3).png',
    'books/journal stella/page (4).png',
    'books/journal stella/page (5).png',
    'books/journal stella/page (6).png',
    'books/journal stella/page (7).png',
    'books/journal stella/page (8).png',
    'books/journal stella/page (9).png',
    'books/journal stella/page (10).png',
    'books/journal stella/page (11).png',
    'books/journal stella/page (12).png',
    'books/journal stella/page (13).png',
    'books/journal stella/page (14).png',
    'books/journal stella/page (15).png',
    'books/journal stella/page (16).png',
    'books/journal stella/page (17).png',
    'books/journal stella/page (18).png',
    'books/journal stella/page (19).png',
    'books/journal stella/page (20).png',
    'books/journal stella/page (21).png',
    'books/journal stella/page (22).png',
    'books/journal stella/page (23).png',
    'books/journal stella/page (24).png',
    'books/journal stella/page (25).png',
    'books/journal stella/page (26).png',
    'books/journal stella/page (27).png',
    'books/journal stella/page (28).png',
    'books/journal stella/page (29).png',
    'books/journal stella/page (30).png',
    'books/journal stella/page (31).png',
    'books/journal stella/page (32).png',
    'books/journal stella/page (33).png',
    'books/journal stella/page (34).png',
    'books/journal stella/page (35).png',
    'books/journal stella/page (36).png',
    'books/journal stella/page (37).png',
    'books/journal stella/page (38).png',
    'books/journal stella/page (39).png',
    'books/journal stella/page (40).png',
    'books/journal stella/page (41).png',
    'books/journal stella/page (42).png',
    'books/journal stella/page (43).png',
    'books/journal stella/page (44).png',
    'books/journal stella/page (45).png',
    'books/journal stella/page (46).png',
    'books/journal stella/page (47).png',
    'books/journal stella/page (48).png',
    'books/journal stella/page (49).png',
    'books/journal stella/page (50).png',
    'books/journal stella/page (51).png',
    'books/journal stella/page (52).png',
    'books/journal stella/page (53).png',
    'books/journal stella/page (54).png',
    'books/journal stella/page (55).png',
    'books/journal stella/page (56).png',
    'books/journal stella/page (57).png',
    'books/journal stella/page (58).png',
    'books/journal stella/page (59).png',
    'books/journal stella/page (60).png',
    'books/journal stella/page (61).png',
    'books/journal stella/page (62).png',
    'books/journal stella/page (63).png',
    'books/journal stella/page (64).png',
    'books/journal stella/page (65).png',
    'books/journal stella/page (66).png',
    'books/journal stella/page (67).png',
    'books/journal stella/page (68).png',
    'books/journal stella/page (69).png',
    'books/journal stella/page (70).png',
    'books/journal stella/page (71).png',
    'books/journal stella/page (72).png',
    'books/journal stella/page (73).png',
    'books/journal stella/page (74).png',
    'books/journal stella/page (75).png',
    'books/journal stella/page (76).png',
    'books/journal stella/page (77).png',
    'books/journal stella/page (78).png',
    'books/journal stella/page (79).png',
    'books/journal stella/page (80).png',
    'books/journal stella/page (81).png',
    'books/journal stella/page (82).png',
    'books/journal stella/page (83).png',
    'books/journal stella/page (84).png',
    'books/journal stella/page (85).png',
    'books/journal stella/page (86).png',
    'books/journal stella/page (87).png',
    'books/journal stella/page (88).png',
    'books/journal stella/page (89).png',
    'books/journal stella/page (90).png',
    'books/journal stella/page (91).png',
    'books/journal stella/page (92).png',
    'books/journal stella/page (93).png',
    'books/journal stella/page (94).png',
    'books/journal stella/page (95).png',
    'books/journal stella/page (96).png',
    'books/journal stella/page (97).png',
    'books/journal stella/page (98).png',
    'books/journal stella/page (99).png',
    'books/journal stella/page (100).png',
    'books/journal stella/page (101).png',
    'books/journal stella/page (102).png',
    'books/journal stella/page (103).png',
    'books/journal stella/page (104).png',
    'books/journal stella/page (105).png',
    'books/journal stella/page (106).png',
    'books/journal stella/page (107).png',
    'books/journal stella/page (108).png',
    'books/journal stella/page (109).png',
    'books/journal stella/page (110).png',
    'books/journal stella/page (111).png',
    'books/journal stella/page (112).png',
    'books/journal stella/page (113).png',
    'books/journal stella/page (114).png',
    'books/journal stella/page (115).png',
    'books/journal stella/page (116).png',
    'books/journal stella/page (117).png',
    'books/journal stella/page (118).png',
    'books/journal stella/page (119).png',
    'books/journal stella/page (120).png',
    'books/journal stella/page (121).png',
    'books/journal stella/page (122).png',
    'books/journal stella/page (123).png',
    'books/journal stella/page (124).png',
    'books/journal stella/page (125).png',
    'books/journal stella/page (126).png',
    'books/journal stella/page (127).png',
    'books/journal stella/page (128).png',
    'books/journal stella/page (129).png',
    'books/journal stella/page (130).png',
    'books/journal stella/page (131).png',
    'books/journal stella/page (132).png',
    'books/journal stella/page (133).png',
    'books/journal stella/page (134).png',
    'books/journal stella/page (135).png',
    'books/journal stella/page (136).png',
    'books/journal stella/page (137).png',
    'books/journal stella/page (138).png',
    'books/journal stella/page (139).png',
    'books/journal stella/page (140).png',
    'books/journal stella/page (141).png',
    'books/journal stella/page (142).png',
    'books/journal stella/page (143).png',
    'books/journal stella/page (144).png',
    'books/journal stella/page (145).png',
    'books/journal stella/page (146).png',
    'books/journal stella/page (147).png',
    'books/journal stella/page (148).png',
    'books/journal stella/page (149).png',
    'books/journal stella/page (150).png',
    'books/journal stella/page (151).png',
    'books/journal stella/page (152).png',
    'books/journal stella/page (153).png',
    'books/journal stella/page (154).png',
    'books/journal stella/page (155).png',
    'books/journal stella/page (156).png',
    'books/journal stella/page (157).png',
    'books/journal stella/page (158).png',
    'books/journal stella/page (159).png',
    'books/journal stella/page (160).png',
    'books/journal stella/page (161).png',
    'books/journal stella/page (162).png',
    'books/journal stella/page (163).png',
    'books/journal stella/page (164).png',
    'books/journal stella/page (165).png',
    'books/journal stella/page (166).png',
    'books/journal stella/page (167).png',
    'books/journal stella/page (168).png',
    'books/journal stella/page (169).png',
    'books/journal stella/page (170).png',
    'books/journal stella/page (171).png',
    'books/journal stella/page (172).png',
    'books/journal stella/page (173).png',
    'books/journal stella/page (174).png',
    'books/journal stella/page (175).png',
    'books/journal stella/page (176).png',
    'books/journal stella/page (177).png',
    'books/journal stella/page (178).png',
    'books/journal stella/page (179).png',
    'books/journal stella/page (180).png',
    'books/journal stella/page (181).png',
    'books/journal stella/page (182).png',
    'books/journal stella/page (183).png',
    'books/journal stella/page (184).png',
    'books/journal stella/page (185).png',
    'books/journal stella/page (186).png',
    'books/journal stella/page (187).png',
    'books/journal stella/page (188).png',
    'books/journal stella/page (189).png',
    'books/journal stella/page (190).png',
    'books/journal stella/page (191).png',
    'books/journal stella/page (192).png',
    'books/journal stella/page (193).png',
    'books/journal stella/page (194).png',
    'books/journal stella/page (195).png',
    'books/journal stella/page (196).png',
    'books/journal stella/page (197).png',
    'books/journal stella/page (198).png',
    'books/journal stella/page (199).png',
    'books/journal stella/page (200).png',
    'books/journal stella/page (201).png',
    'books/journal stella/page (202).png',
    'books/journal stella/page (203).png',
    'books/journal stella/page (204).png',
    'books/journal stella/page (205).png',
    'books/journal stella/page (206).png',
    'books/journal stella/page (207).png',
    'books/journal stella/page (208).png',
    'books/journal stella/page (209).png',
    'books/journal stella/page (210).png',
    'books/journal stella/page (211).png',
    'books/journal stella/page (212).png',
    'books/journal stella/page (213).png',
    'books/journal stella/page (214).png',
    'books/journal stella/page (215).png',
    'books/journal stella/page (216).png',
    'books/journal stella/page (217).png',
    'books/journal stella/page (218).png',
    'books/journal stella/page (219).png',
    'books/journal stella/page (220).png',
    'books/journal stella/page (221).png',
    'books/journal stella/page (222).png',
    'books/journal stella/page (223).png',
    'books/journal stella/page (224).png',
    'books/journal stella/page (225).png',
    'books/journal stella/page (226).png',
    'books/journal stella/page (227).png',
    'books/journal stella/page (228).png',
    'books/journal stella/page (229).png',
    'books/journal stella/page (230).png',
    'books/journal stella/page (231).png',
    'books/journal stella/page (232).png',
    'books/journal stella/page (233).png',
    'books/journal stella/page (234).png',
    'books/journal stella/page (235).png',
    'books/journal stella/page (236).png',
    'books/journal stella/page (237).png',
    'books/journal stella/page (238).png',
    'books/journal stella/page (239).png',
    'books/journal stella/page (240).png',
    'books/journal stella/page (241).png',
    'books/journal stella/page (242).png',
    'books/journal stella/page (243).png',
    'books/journal stella/page (244).png',
    'books/journal stella/page (245).png',
    'books/journal stella/page (246).png',
    'books/journal stella/page (247).png',
    'books/journal stella/page (248).png',
    'books/journal stella/page (249).png',
    'books/journal stella/page (250).png',
    'books/journal stella/page (251).png',
    'books/journal stella/page (252).png',
    'books/journal stella/page (253).png',
    'books/journal stella/page (254).png',
    'books/journal stella/page (255).png',
    'books/journal stella/page (256).png',
    'books/journal stella/page (257).png',
    'books/journal stella/page (258).png',
    'books/journal stella/page (259).png',
    'books/journal stella/page (260).png',
    'books/journal stella/page (261).png',
    'books/journal stella/page (262).png',
    'books/journal stella/page (263).png',
    'books/journal stella/page (264).png',
    'books/journal stella/page (265).png',
    'books/journal stella/page (266).png',
    'books/journal stella/page (267).png',
    'books/journal stella/page (268).png',
    'books/journal stella/page (269).png',
    'books/journal stella/page (270).png',
    'books/journal stella/page (271).png',
    'books/journal stella/page (272).png',
    'books/journal stella/page (273).png',
    'books/journal stella/page (274).png',
    'books/journal stella/page (275).png',
    'books/journal stella/page (276).png',
    'books/journal stella/page (277).png',
    'books/journal stella/page (278).png',
    'books/journal stella/page (279).png',
    'books/journal stella/page (280).png',
    'books/journal stella/page (281).png',
    'books/journal stella/page (282).png',
    'books/journal stella/page (283).png',
    'books/journal stella/page (284).png',
    'books/journal stella/page (285).png',
    'books/journal stella/page (286).png',
    'books/journal stella/page (287).png',
    'books/journal stella/page (288).png',
    'books/journal stella/page (289).png',
    'books/journal stella/page (290).png',
    'books/journal stella/page (291).png',
    'books/journal stella/page (292).png',
    'books/journal stella/page (293).png',
    'books/journal stella/page (294).png',
    'books/journal stella/page (295).png',
    'books/journal stella/page (296).png',
    'books/journal stella/page (297).png',
    'books/journal stella/page (298).png',
    'books/journal stella/page (299).png',
    'books/journal stella/page (300).png',
    'books/journal stella/page (301).png',
    'books/journal stella/page (302).png',
    'books/journal stella/page (303).png',
    'books/journal stella/page (304).png',
    'books/journal stella/page (305).png',
    'books/journal stella/page (306).png',
    'books/journal stella/page (307).png',
    'books/journal stella/page (308).png',
    'books/journal stella/page (309).png',
    'books/journal stella/page (310).png',
    'books/journal stella/page (311).png',
    'books/journal stella/page (312).png',
    'books/journal stella/page (313).png',
    'books/journal stella/page (314).png',
    'books/journal stella/page (315).png',
    'books/journal stella/page (316).png',
    'books/journal stella/page (317).png',
    'books/journal stella/page (318).png',
    'books/journal stella/page (319).png',
    'books/journal stella/page (320).png',
    'books/journal stella/page (321).png',
    'books/journal stella/page (322).png',
    'books/journal stella/page (323).png',
    'books/journal stella/page (324).png',
    'books/journal stella/page (325).png',
    'books/journal stella/page (326).png',
    'books/journal stella/page (327).png',
    'books/journal stella/page (328).png',
    'books/journal stella/page (329).png',
    'books/journal stella/page (330).png',
    'books/journal stella/page (331).png',
    'books/journal stella/page (332).png',
    'books/journal stella/page (333).png',
    'books/journal stella/page (334).png',
    'books/journal stella/page (335).png',
    'books/journal stella/page (336).png',
    'books/journal stella/page (337).png',
    'books/journal stella/page (338).png',
    'books/journal stella/page (339).png',
    'books/journal stella/page (340).png',
    'books/journal stella/page (341).png',
    'books/journal stella/page (342).png',
    'books/journal stella/page (343).png',
    'books/journal stella/page (344).png',
    'books/journal stella/page (345).png',
    'books/journal stella/page (346).png',
    'books/journal stella/page (347).png',
    'books/journal stella/page (348).png',
    'books/journal stella/page (349).png',
    'books/journal stella/page (350).png',
    'books/journal stella/page (351).png',
    'books/journal stella/page (352).png',
    'books/journal stella/page (353).png',
    'books/journal stella/page (354).png',
    'books/journal stella/page (355).png',
    'books/journal stella/page (356).png',
    'books/journal stella/page (357).png',
    'books/journal stella/page (358).png',
    'books/journal stella/page (359).png',
    'books/journal stella/page (360).png',
    'books/journal stella/page (361).png',
    'books/journal stella/page (362).png',
    'books/journal stella/page (363).png',
    'books/journal stella/page (364).png',
    'books/journal stella/page (365).png',
    'books/journal stella/page (366).png',
    'books/journal stella/page (367).png',
    'books/journal stella/page (368).png',
    'books/journal stella/page (369).png',
    'books/journal stella/page (370).png',
    'books/journal stella/page (371).png',
    'books/journal stella/page (372).png',
    'books/journal stella/page (373).png',
    'books/journal stella/page (374).png',
    'books/journal stella/page (375).png',
    'books/journal stella/page (376).png',
    'books/journal stella/page (377).png',
    'books/journal stella/page (378).png',
    'books/journal stella/page (379).png',
    'books/journal stella/page (380).png',
    'books/journal stella/page (381).png',
    'books/journal stella/page (382).png',
    'books/journal stella/page (383).png',
    'books/journal stella/page (384).png',
    'books/journal stella/page (385).png',
    'books/journal stella/page (386).png',
    'books/journal stella/page (387).png',
    'books/journal stella/page (388).png',
    'books/journal stella/page (389).png',
    'books/journal stella/page (390).png',
    'books/journal stella/page (391).png',
    'books/journal stella/page (392).png',
    'books/journal stella/page (393).png',
    'books/journal stella/page (394).png',
    'books/journal stella/page (395).png',
    'books/journal stella/page (396).png',
    'books/journal stella/page (397).png',
    'books/journal stella/page (398).png',
    'books/journal stella/page (399).png',
    'books/journal stella/page (400).png',
    'books/journal stella/page (401).png',
    'books/journal stella/page (402).png',
    'books/journal stella/page (403).png',
    'books/journal stella/page (404).png',
    'books/journal stella/page (405).png',
    'books/journal stella/page (406).png',
    'books/journal stella/page (407).png',
    'books/journal stella/page (408).png',
    'books/journal stella/page (409).png',
    'books/journal stella/page (410).png',
    'books/journal stella/page (411).png',
    'books/journal stella/page (412).png',
    'books/journal stella/page (413).png',
    'books/journal stella/page (414).png',
    'books/journal stella/page (415).png',
    'books/journal stella/page (416).png',
    'books/journal stella/page (417).png',
    'books/journal stella/page (418).png',
    'books/journal stella/page (419).png',
    'books/journal stella/page (420).png',
    'books/journal stella/page (421).png',
    'books/journal stella/page (422).png',
    'books/journal stella/page (423).png',
    'books/journal stella/page (424).png',
    'books/journal stella/page (425).png',
    'books/journal stella/page (426).png',
    'books/journal stella/page (427).png',
    'books/journal stella/page (428).png',
    'books/journal stella/page (429).png',
    'books/journal stella/page (430).png',
    'books/journal stella/page (431).png',
    'books/journal stella/page (432).png',
    'books/journal stella/page (433).png',
    'books/journal stella/page (434).png',
    'books/journal stella/page (435).png',
    'books/journal stella/page (436).png',
    'books/journal stella/page (437).png',
    'books/journal stella/page (438).png',
    'books/journal stella/page (439).png',
    'books/journal stella/page (440).png',
    'books/journal stella/page (441).png',
    'books/journal stella/page (442).png',
    'books/journal stella/page (443).png',
    'books/journal stella/page (444).png',
    'books/journal stella/page (445).png',
    'books/journal stella/page (446).png',
    'books/journal stella/page (447).png',
    'books/journal stella/page (448).png',
    'books/journal stella/page (449).png',
    'books/journal stella/page (450).png',
    'books/journal stella/page (451).png',
    'books/journal stella/page (452).png',
    'books/journal stella/page (453).png',
    'books/journal stella/page (454).png',
    'books/journal stella/page (455).png',
    'books/journal stella/page (456).png',
    'books/journal stella/page (457).png',
    'books/journal stella/page (458).png',
    'books/journal stella/page (459).png',
    'books/journal stella/page (460).png',
    'books/journal stella/page (461).png',
    'books/journal stella/page (462).png',
    'books/journal stella/page (463).png',
    'books/journal stella/page (464).png',
    'books/journal stella/page (465).png',
    'books/journal stella/page (466).png',
    'books/journal stella/page (467).png',
    'books/journal stella/page (468).png',
    'books/journal stella/page (469).png',
    'books/journal stella/page (470).png',
    'books/journal stella/page (471).png',
    'books/journal stella/page (472).png',
    'books/journal stella/page (473).png',
    'books/journal stella/page (474).png',
    'books/journal stella/page (475).png',
    'books/journal stella/page (476).png',
    'books/journal stella/page (477).png',
    'books/journal stella/page (478).png',
    'books/journal stella/page (479).png',
    'books/journal stella/page (480).png',
    'books/journal stella/page (481).png',
    'books/journal stella/page (482).png',
    'books/journal stella/page (483).png',
    'books/journal stella/page (484).png',
    'books/journal stella/page (485).png',
    'books/journal stella/page (486).png',
    'books/journal stella/page (487).png',
    'books/journal stella/page (488).png',
    'books/journal stella/page (489).png',
    'books/journal stella/page (490).png',
    'books/journal stella/page (491).png',
    'books/journal stella/page (492).png',
    'books/journal stella/page (493).png',
    'books/journal stella/page (494).png',
    'books/journal stella/page (495).png',
    'books/journal stella/page (496).png',
    'books/journal stella/page (497).png',
    'books/journal stella/page (498).png',
    'books/journal stella/page (499).png',
    'books/journal stella/page (500).png',
    'books/journal stella/page (501).png',
    'books/journal stella/page (502).png',
    'books/journal stella/page (503).png',
    'books/journal stella/page (504).png',
    'books/journal stella/page (505).png',
    'books/journal stella/page (506).png',
    'books/journal stella/page (507).png',
    'books/journal stella/page (508).png',
    'books/journal stella/page (509).png',
    'books/journal stella/page (510).png',
    'books/journal stella/page (511).png',
    'books/journal stella/page (512).png',
    'books/journal stella/page (513).png',
    'books/journal stella/page (514).png',
    'books/journal stella/page (515).png',
    'books/journal stella/page (516).png',
    'books/journal stella/page (517).png',
    'books/journal stella/page (518).png',
    'books/journal stella/page (519).png',
    'books/journal stella/page (520).png',
    'books/journal stella/page (521).png',
    'books/journal stella/page (522).png',
    'books/journal stella/page (523).png',
    'books/journal stella/page (524).png',
    'books/journal stella/page (525).png',
    'books/journal stella/page (526).png',
    'books/journal stella/page (527).png',
    'books/journal stella/page (528).png',
    'books/journal stella/page (529).png',
    'books/journal stella/page (530).png',
    'books/journal stella/page (531).png',
    'books/journal stella/page (532).png',
    'books/journal stella/page (533).png',
    'books/journal stella/page (534).png',
    'books/journal stella/page (535).png',
    'books/journal stella/page (536).png',
    'books/journal stella/page (537).png',
    'books/journal stella/page (538).png',
    'books/journal stella/page (539).png',
    'books/journal stella/page (540).png',
    'books/journal stella/page (541).png',
    'books/journal stella/page (542).png',
    'books/journal stella/page (543).png',
    'books/journal stella/page (544).png',
    'books/journal stella/page (545).png',
    'books/journal stella/page (546).png',
    'books/journal stella/page (547).png',
    'books/journal stella/page (548).png',
    'books/journal stella/page (549).png',
    'books/journal stella/page (550).png',
    'books/journal stella/page (551).png',
    'books/journal stella/page (552).png',
    'books/journal stella/page (553).png',
    'books/journal stella/page (554).png',
    'books/journal stella/page (555).png',
    'books/journal stella/page (556).png',
    'books/journal stella/page (557).png',
    'books/journal stella/page (558).png',
    'books/journal stella/page (559).png',
    'books/journal stella/page (560).png',
    'books/journal stella/page (561).png',
    'books/journal stella/page (562).png',
    'books/journal stella/page (563).png',
    'books/journal stella/page (564).png',
    'books/journal stella/page (565).png',
    'books/journal stella/page (566).png',
    'books/journal stella/page (567).png',
    'books/journal stella/page (568).png',
    'books/journal stella/page (569).png',
    'books/journal stella/page (570).png',
    'books/journal stella/page (571).png',
    'books/journal stella/page (572).png',
    'books/journal stella/page (573).png',
    'books/journal stella/page (574).png',
    'books/journal stella/page (575).png',
    'books/journal stella/page (576).png',
    'books/journal stella/page (577).png',
    'books/journal stella/page (578).png',
    'books/journal stella/page (579).png',
    'books/journal stella/page (580).png',
    'books/journal stella/page (581).png',
    'books/journal stella/page (582).png',
    'books/journal stella/page (583).png',
    'books/journal stella/page (584).png',
    'books/journal stella/page (585).png',
    'books/journal stella/page (586).png',
    'books/journal stella/page (587).png',
    'books/journal stella/page (588).png',
    'books/journal stella/page (589).png',
    'books/journal stella/page (590).png',
    'books/journal stella/page (591).png',
    'books/journal stella/page (592).png',
    'books/journal stella/page (593).png',
    'books/journal stella/page (594).png',
    'books/journal stella/page (595).png',
    'books/journal stella/page (596).png',
    'books/journal stella/page (597).png',
    'books/journal stella/page (598).png',
    'books/journal stella/page (599).png',
    'books/journal stella/page (600).png',
    'books/journal stella/page (601).png',
    'books/journal stella/page (602).png',
    'books/journal stella/page (603).png',
    'books/journal stella/page (604).png',
    'books/journal stella/page (605).png',
    'books/journal stella/page (606).png',
    'books/journal stella/page (607).png',
    'books/journal stella/page (608).png',
    'books/journal stella/page (609).png',
    'books/journal stella/page (610).png',
    'books/journal stella/page (611).png',
    'books/journal stella/page (612).png',
    'books/journal stella/page (613).png',
    'books/journal stella/page (614).png',
    'books/journal stella/page (615).png',
    'books/journal stella/page (616).png',
    'books/journal stella/page (617).png',
    'books/journal stella/page (618).png',
    'books/journal stella/page (619).png',
    'books/journal stella/page (620).png',
    'books/journal stella/page (621).png',
    'books/journal stella/page (622).png',
    'books/journal stella/page (623).png',
    'books/journal stella/page (624).png',
    'books/journal stella/page (625).png',
    'books/journal stella/page (626).png',
    'books/journal stella/page (627).png',
    'books/journal stella/page (628).png',
    'books/journal stella/page (629).png',
    'books/journal stella/page (630).png',
    'books/journal stella/page (631).png',
    'books/journal stella/page (632).png',
    'books/journal stella/page (633).png',
    'books/journal stella/page (634).png',
    'books/journal stella/page (635).png',
    'books/journal stella/page (636).png',
    'books/journal stella/page (637).png',
    'books/journal stella/page (638).png',
    'books/journal stella/page (639).png',
    'books/journal stella/page (640).png',
    'books/journal stella/page (641).png',
    'books/journal stella/page (642).png',
    'books/journal stella/page (643).png',
    'books/journal stella/page (644).png',
    'books/journal stella/page (645).png',
    'books/journal stella/page (646).png',
    'books/journal stella/page (647).png',
    'books/journal stella/page (648).png',
    'books/journal stella/page (649).png',
    'books/journal stella/page (650).png',
    'books/journal stella/page (651).png',
    'books/journal stella/page (652).png',
    'books/journal stella/page (653).png',
    'books/journal stella/page (654).png',
    'books/journal stella/page (655).png',
    'books/journal stella/page (656).png',
    'books/journal stella/page (657).png',
    'books/journal stella/page (658).png',
    'books/journal stella/page (659).png',
    'books/journal stella/page (660).png',
    'books/journal stella/page (661).png',
    'books/journal stella/page (662).png',
    'books/journal stella/page (663).png',
    'books/journal stella/page (664).png',
    'books/journal stella/page (665).png',
    'books/journal stella/page (666).png',
    'books/journal stella/page (667).png',
    'books/journal stella/page (668).png',
    'books/journal stella/page (669).png',
    'books/journal stella/page (670).png',
    'books/journal stella/page (671).png',
    'books/journal stella/page (672).png',
    'books/journal stella/page (673).png',
    'books/journal stella/page (674).png',
    'books/journal stella/page (675).png',
    'books/journal stella/page (676).png',
    'books/journal stella/page (677).png',
    'books/journal stella/page (678).png',
    'books/journal stella/page (679).png',
    'books/journal stella/page (680).png',
    'books/journal stella/page (681).png',
    'books/journal stella/page (682).png',
    'books/journal stella/page (683).png',
    'books/journal stella/page (684).png',
    'books/journal stella/page (685).png',
    'books/journal stella/page (686).png',
    'books/journal stella/page (687).png',
    'books/journal stella/page (688).png',
    'books/journal stella/page (689).png',
    'books/journal stella/page (690).png',
    'books/journal stella/page (691).png',
    'books/journal stella/page (692).png',
    'books/journal stella/page (693).png',
    'books/journal stella/page (694).png',
    'books/journal stella/page (695).png',
    'books/journal stella/page (696).png',
    'books/journal stella/page (697).png',
    'books/journal stella/page (698).png',
    'books/journal stella/page (699).png',
    'books/journal stella/page (700).png',
    'books/journal stella/page (701).png',
    'books/journal stella/page (702).png',
    'books/journal stella/page (703).png',
    'books/journal stella/page (704).png',
    'books/journal stella/page (705).png',
    'books/journal stella/page (706).png',
    'books/journal stella/page (707).png',
    'books/journal stella/page (708).png',
    'books/journal stella/page (709).png',
    'books/journal stella/page (710).png',
    'books/journal stella/page (711).png',
    'books/journal stella/page (712).png',
    'books/journal stella/page (713).png',
    'books/journal stella/page (714).png',
    'books/journal stella/page (715).png',
    'books/journal stella/page (716).png',
    'books/journal stella/page (717).png',
    'books/journal stella/page (718).png',
    'books/journal stella/page (719).png',
    'books/journal stella/page (720).png',
    'books/journal stella/page (721).png',
    'books/journal stella/page (722).png',
    'books/journal stella/page (723).png',
    'books/journal stella/page (724).png',
    'books/journal stella/page (725).png',
    'books/journal stella/page (726).png',
    'books/journal stella/page (727).png',
    'books/journal stella/page (728).png',
    'books/journal stella/page (729).png',
    'books/journal stella/page (730).png',
    'books/journal stella/page (731).png',
    'books/journal stella/page (732).png',
    'books/journal stella/page (733).png',
    'books/journal stella/page (734).png',
    'books/journal stella/page (735).png',
    'books/journal stella/page (736).png',
    'books/journal stella/page (737).png',
    'books/journal stella/page (738).png',
    'books/journal stella/page (739).png',
    'books/journal stella/page (740).png',
    'books/journal stella/page (741).png',
    'books/journal stella/page (742).png',

    // Diğer sayfaları ekleyin
  ];

  late List<String> downloadUrls;

  @override
  void initState() {
    // Firebase'i başlat
    Firebase.initializeApp();

    // restore the previous lastLeftOverPageIndex;
    _restoreLeftOverPage();
    super.initState();
  }

  Future<void> _restoreLeftOverPage() async {
    SharedPreferences pref = await _prefs;
    lastLeftOverPageIndex =
        pref.getInt(lastLeftOverPageNoPrefKey)?.toInt() ?? 0;
    // navigate the book page index to lastLeftOverPageIndex
    _controller.currentState?.goToPage(lastLeftOverPageIndex);
  }

  Widget _buildDemoPage(String imagePath) {
    return FutureBuilder(
      future: _getImageUrl(imagePath),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error fetching image'));
        }
        return Scaffold(
          body: Center(
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Future<String?> _getImageUrl(String imagePath) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(imagePath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error getting image URL for $imagePath: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        initialIndex: lastLeftOverPageIndex,
        lastPage: Container(
            color: Colors.white, child: const Center(child: Text('The End!'))),
        children: [
          for (var imagePath in imagesPath) _buildDemoPage(imagePath),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.looks_one_outlined),
        onPressed: () {
          _controller.currentState?.goToPage(1);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    // before disposing the widget save the current page no
    var currentPageNo = _controller.currentState?.pageNumber.toInt() ?? 0;
    saveLastLeftOverPagePref(currentPageNo);
  }

  Future<void> saveLastLeftOverPagePref(int lastPage) async {
    SharedPreferences pref = await _prefs;
    pref.setInt(lastLeftOverPageNoPrefKey, lastPage);
  }
}