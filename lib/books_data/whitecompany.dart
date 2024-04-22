import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class whitecompany extends StatefulWidget {
  const whitecompany({Key? key}) : super(key: key);

  @override
  State<whitecompany> createState() => _whitecompanyState();
}

class _whitecompanyState extends State<whitecompany> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/white company/page (1).png',
    'books/white company/page (2).png',
    'books/white company/page (3).png',
    'books/white company/page (4).png',
    'books/white company/page (5).png',
    'books/white company/page (6).png',
    'books/white company/page (7).png',
    'books/white company/page (8).png',
    'books/white company/page (9).png',
    'books/white company/page (10).png',
    'books/white company/page (11).png',
    'books/white company/page (12).png',
    'books/white company/page (13).png',
    'books/white company/page (14).png',
    'books/white company/page (15).png',
    'books/white company/page (16).png',
    'books/white company/page (17).png',
    'books/white company/page (18).png',
    'books/white company/page (19).png',
    'books/white company/page (20).png',
    'books/white company/page (21).png',
    'books/white company/page (22).png',
    'books/white company/page (23).png',
    'books/white company/page (24).png',
    'books/white company/page (25).png',
    'books/white company/page (26).png',
    'books/white company/page (27).png',
    'books/white company/page (28).png',
    'books/white company/page (29).png',
    'books/white company/page (30).png',
    'books/white company/page (31).png',
    'books/white company/page (32).png',
    'books/white company/page (33).png',
    'books/white company/page (34).png',
    'books/white company/page (35).png',
    'books/white company/page (36).png',
    'books/white company/page (37).png',
    'books/white company/page (38).png',
    'books/white company/page (39).png',
    'books/white company/page (40).png',
    'books/white company/page (41).png',
    'books/white company/page (42).png',
    'books/white company/page (43).png',
    'books/white company/page (44).png',
    'books/white company/page (45).png',
    'books/white company/page (46).png',
    'books/white company/page (47).png',
    'books/white company/page (48).png',
    'books/white company/page (49).png',
    'books/white company/page (50).png',
    'books/white company/page (51).png',
    'books/white company/page (52).png',
    'books/white company/page (53).png',
    'books/white company/page (54).png',
    'books/white company/page (55).png',
    'books/white company/page (56).png',
    'books/white company/page (57).png',
    'books/white company/page (58).png',
    'books/white company/page (59).png',
    'books/white company/page (60).png',
    'books/white company/page (61).png',
    'books/white company/page (62).png',
    'books/white company/page (63).png',
    'books/white company/page (64).png',
    'books/white company/page (65).png',
    'books/white company/page (66).png',
    'books/white company/page (67).png',
    'books/white company/page (68).png',
    'books/white company/page (69).png',
    'books/white company/page (70).png',
    'books/white company/page (71).png',
    'books/white company/page (72).png',
    'books/white company/page (73).png',
    'books/white company/page (74).png',
    'books/white company/page (75).png',
    'books/white company/page (76).png',
    'books/white company/page (77).png',
    'books/white company/page (78).png',
    'books/white company/page (79).png',
    'books/white company/page (80).png',
    'books/white company/page (81).png',
    'books/white company/page (82).png',
    'books/white company/page (83).png',
    'books/white company/page (84).png',
    'books/white company/page (85).png',
    'books/white company/page (86).png',
    'books/white company/page (87).png',
    'books/white company/page (88).png',
    'books/white company/page (89).png',
    'books/white company/page (90).png',
    'books/white company/page (91).png',
    'books/white company/page (92).png',
    'books/white company/page (93).png',
    'books/white company/page (94).png',
    'books/white company/page (95).png',
    'books/white company/page (96).png',
    'books/white company/page (97).png',
    'books/white company/page (98).png',
    'books/white company/page (99).png',
    'books/white company/page (100).png',
    'books/white company/page (101).png',
    'books/white company/page (102).png',
    'books/white company/page (103).png',
    'books/white company/page (104).png',
    'books/white company/page (105).png',
    'books/white company/page (106).png',
    'books/white company/page (107).png',
    'books/white company/page (108).png',
    'books/white company/page (109).png',
    'books/white company/page (110).png',
    'books/white company/page (111).png',
    'books/white company/page (112).png',
    'books/white company/page (113).png',
    'books/white company/page (114).png',
    'books/white company/page (115).png',
    'books/white company/page (116).png',
    'books/white company/page (117).png',
    'books/white company/page (118).png',
    'books/white company/page (119).png',
    'books/white company/page (120).png',
    'books/white company/page (121).png',
    'books/white company/page (122).png',
    'books/white company/page (123).png',
    'books/white company/page (124).png',
    'books/white company/page (125).png',
    'books/white company/page (126).png',
    'books/white company/page (127).png',
    'books/white company/page (128).png',
    'books/white company/page (129).png',
    'books/white company/page (130).png',
    'books/white company/page (131).png',
    'books/white company/page (132).png',
    'books/white company/page (133).png',
    'books/white company/page (134).png',
    'books/white company/page (135).png',
    'books/white company/page (136).png',
    'books/white company/page (137).png',
    'books/white company/page (138).png',
    'books/white company/page (139).png',
    'books/white company/page (140).png',
    'books/white company/page (141).png',
    'books/white company/page (142).png',
    'books/white company/page (143).png',
    'books/white company/page (144).png',
    'books/white company/page (145).png',
    'books/white company/page (146).png',
    'books/white company/page (147).png',
    'books/white company/page (148).png',
    'books/white company/page (149).png',
    'books/white company/page (150).png',
    'books/white company/page (151).png',
    'books/white company/page (152).png',
    'books/white company/page (153).png',
    'books/white company/page (154).png',
    'books/white company/page (155).png',
    'books/white company/page (156).png',
    'books/white company/page (157).png',
    'books/white company/page (158).png',
    'books/white company/page (159).png',
    'books/white company/page (160).png',
    'books/white company/page (161).png',
    'books/white company/page (162).png',
    'books/white company/page (163).png',
    'books/white company/page (164).png',
    'books/white company/page (165).png',
    'books/white company/page (166).png',
    'books/white company/page (167).png',
    'books/white company/page (168).png',
    'books/white company/page (169).png',
    'books/white company/page (170).png',
    'books/white company/page (171).png',
    'books/white company/page (172).png',
    'books/white company/page (173).png',
    'books/white company/page (174).png',
    'books/white company/page (175).png',
    'books/white company/page (176).png',
    'books/white company/page (177).png',
    'books/white company/page (178).png',
    'books/white company/page (179).png',
    'books/white company/page (180).png',
    'books/white company/page (181).png',
    'books/white company/page (182).png',
    'books/white company/page (183).png',
    'books/white company/page (184).png',
    'books/white company/page (185).png',
    'books/white company/page (186).png',
    'books/white company/page (187).png',
    'books/white company/page (188).png',
    'books/white company/page (189).png',
    'books/white company/page (190).png',
    'books/white company/page (191).png',
    'books/white company/page (192).png',
    'books/white company/page (193).png',
    'books/white company/page (194).png',
    'books/white company/page (195).png',
    'books/white company/page (196).png',
    'books/white company/page (197).png',
    'books/white company/page (198).png',
    'books/white company/page (199).png',
    'books/white company/page (200).png',
    'books/white company/page (201).png',
    'books/white company/page (202).png',
    'books/white company/page (203).png',
    'books/white company/page (204).png',
    'books/white company/page (205).png',
    'books/white company/page (206).png',
    'books/white company/page (207).png',
    'books/white company/page (208).png',
    'books/white company/page (209).png',
    'books/white company/page (210).png',
    'books/white company/page (211).png',
    'books/white company/page (212).png',
    'books/white company/page (213).png',
    'books/white company/page (214).png',
    'books/white company/page (215).png',
    'books/white company/page (216).png',
    'books/white company/page (217).png',
    'books/white company/page (218).png',
    'books/white company/page (219).png',
    'books/white company/page (220).png',
    'books/white company/page (221).png',
    'books/white company/page (222).png',
    'books/white company/page (223).png',
    'books/white company/page (224).png',
    'books/white company/page (225).png',
    'books/white company/page (226).png',
    'books/white company/page (227).png',
    'books/white company/page (228).png',
    'books/white company/page (229).png',
    'books/white company/page (230).png',
    'books/white company/page (231).png',
    'books/white company/page (232).png',
    'books/white company/page (233).png',
    'books/white company/page (234).png',
    'books/white company/page (235).png',
    'books/white company/page (236).png',
    'books/white company/page (237).png',
    'books/white company/page (238).png',
    'books/white company/page (239).png',
    'books/white company/page (240).png',
    'books/white company/page (241).png',
    'books/white company/page (242).png',
    'books/white company/page (243).png',
    'books/white company/page (244).png',
    'books/white company/page (245).png',
    'books/white company/page (246).png',
    'books/white company/page (247).png',
    'books/white company/page (248).png',
    'books/white company/page (249).png',
    'books/white company/page (250).png',
    'books/white company/page (251).png',
    'books/white company/page (252).png',
    'books/white company/page (253).png',
    'books/white company/page (254).png',
    'books/white company/page (255).png',
    'books/white company/page (256).png',
    'books/white company/page (257).png',
    'books/white company/page (258).png',
    'books/white company/page (259).png',
    'books/white company/page (260).png',
    'books/white company/page (261).png',
    'books/white company/page (262).png',
    'books/white company/page (263).png',
    'books/white company/page (264).png',
    'books/white company/page (265).png',
    'books/white company/page (266).png',
    'books/white company/page (267).png',
    'books/white company/page (268).png',
    'books/white company/page (269).png',
    'books/white company/page (270).png',
    'books/white company/page (271).png',
    'books/white company/page (272).png',
    'books/white company/page (273).png',
    'books/white company/page (274).png',
    'books/white company/page (275).png',
    'books/white company/page (276).png',
    'books/white company/page (277).png',
    'books/white company/page (278).png',
    'books/white company/page (279).png',
    'books/white company/page (280).png',
    'books/white company/page (281).png',
    'books/white company/page (282).png',
    'books/white company/page (283).png',
    'books/white company/page (284).png',
    'books/white company/page (285).png',
    'books/white company/page (286).png',
    'books/white company/page (287).png',
    'books/white company/page (288).png',
    'books/white company/page (289).png',
    'books/white company/page (290).png',
    'books/white company/page (291).png',
    'books/white company/page (292).png',
    'books/white company/page (293).png',
    'books/white company/page (294).png',
    'books/white company/page (295).png',
    'books/white company/page (296).png',
    'books/white company/page (297).png',
    'books/white company/page (298).png',
    'books/white company/page (299).png',
    'books/white company/page (300).png',
    'books/white company/page (301).png',
    'books/white company/page (302).png',
    'books/white company/page (303).png',
    'books/white company/page (304).png',
    'books/white company/page (305).png',
    'books/white company/page (306).png',
    'books/white company/page (307).png',
    'books/white company/page (308).png',
    'books/white company/page (309).png',
    'books/white company/page (310).png',
    'books/white company/page (311).png',
    'books/white company/page (312).png',
    'books/white company/page (313).png',
    'books/white company/page (314).png',
    'books/white company/page (315).png',
    'books/white company/page (316).png',
    'books/white company/page (317).png',
    'books/white company/page (318).png',
    'books/white company/page (319).png',
    'books/white company/page (320).png',
    'books/white company/page (321).png',
    'books/white company/page (322).png',
    'books/white company/page (323).png',
    'books/white company/page (324).png',
    'books/white company/page (325).png',
    'books/white company/page (326).png',
    'books/white company/page (327).png',
    'books/white company/page (328).png',
    'books/white company/page (329).png',
    'books/white company/page (330).png',
    'books/white company/page (331).png',
    'books/white company/page (332).png',
    'books/white company/page (333).png',
    'books/white company/page (334).png',
    'books/white company/page (335).png',
    'books/white company/page (336).png',
    'books/white company/page (337).png',
    'books/white company/page (338).png',
    'books/white company/page (339).png',
    'books/white company/page (340).png',
    'books/white company/page (341).png',
    'books/white company/page (342).png',
    'books/white company/page (343).png',
    'books/white company/page (344).png',
    'books/white company/page (345).png',
    'books/white company/page (346).png',
    'books/white company/page (347).png',
    'books/white company/page (348).png',
    'books/white company/page (349).png',
    'books/white company/page (350).png',
    'books/white company/page (351).png',
    'books/white company/page (352).png',
    'books/white company/page (353).png',
    'books/white company/page (354).png',
    'books/white company/page (355).png',
    'books/white company/page (356).png',
    'books/white company/page (357).png',
    'books/white company/page (358).png',
    'books/white company/page (359).png',
    'books/white company/page (360).png',
    'books/white company/page (361).png',
    'books/white company/page (362).png',
    'books/white company/page (363).png',
    'books/white company/page (364).png',
    'books/white company/page (365).png',
    'books/white company/page (366).png',
    'books/white company/page (367).png',
    'books/white company/page (368).png',
    'books/white company/page (369).png',
    'books/white company/page (370).png',
    'books/white company/page (371).png',
    'books/white company/page (372).png',
    'books/white company/page (373).png',
    'books/white company/page (374).png',
    'books/white company/page (375).png',
    'books/white company/page (376).png',
    'books/white company/page (377).png',
    'books/white company/page (378).png',
    'books/white company/page (379).png',
    'books/white company/page (380).png',
    'books/white company/page (381).png',
    'books/white company/page (382).png',
    'books/white company/page (383).png',
    'books/white company/page (384).png',
    'books/white company/page (385).png',
    'books/white company/page (386).png',
    'books/white company/page (387).png',
    'books/white company/page (388).png',
    'books/white company/page (389).png',
    'books/white company/page (390).png',
    'books/white company/page (391).png',
    'books/white company/page (392).png',
    'books/white company/page (393).png',
    'books/white company/page (394).png',
    'books/white company/page (395).png',
    'books/white company/page (396).png',
    'books/white company/page (397).png',
    'books/white company/page (398).png',
    'books/white company/page (399).png',
    'books/white company/page (400).png',
    'books/white company/page (401).png',
    'books/white company/page (402).png',
    'books/white company/page (403).png',
    'books/white company/page (404).png',
    'books/white company/page (405).png',
    'books/white company/page (406).png',
    'books/white company/page (407).png',
    'books/white company/page (408).png',
    'books/white company/page (409).png',
    'books/white company/page (410).png',
    'books/white company/page (411).png',
    'books/white company/page (412).png',
    'books/white company/page (413).png',
    'books/white company/page (414).png',
    'books/white company/page (415).png',
    'books/white company/page (416).png',
    'books/white company/page (417).png',
    'books/white company/page (418).png',
    'books/white company/page (419).png',
    'books/white company/page (420).png',
    'books/white company/page (421).png',
    'books/white company/page (422).png',
    'books/white company/page (423).png',
    'books/white company/page (424).png',
    'books/white company/page (425).png',
    'books/white company/page (426).png',
    'books/white company/page (427).png',
    'books/white company/page (428).png',
    'books/white company/page (429).png',
    'books/white company/page (430).png',
    'books/white company/page (431).png',
    'books/white company/page (432).png',
    'books/white company/page (433).png',
    'books/white company/page (434).png',
    'books/white company/page (435).png',
    'books/white company/page (436).png',
    'books/white company/page (437).png',
    'books/white company/page (438).png',
    'books/white company/page (439).png',
    'books/white company/page (440).png',
    'books/white company/page (441).png',
    'books/white company/page (442).png',
    'books/white company/page (443).png',
    'books/white company/page (444).png',
    'books/white company/page (445).png',
    'books/white company/page (446).png',
    'books/white company/page (447).png',
    'books/white company/page (448).png',
    'books/white company/page (449).png',
    'books/white company/page (450).png',
    'books/white company/page (451).png',
    'books/white company/page (452).png',
    'books/white company/page (453).png',
    'books/white company/page (454).png',
    'books/white company/page (455).png',
    'books/white company/page (456).png',
    'books/white company/page (457).png',
    'books/white company/page (458).png',
    'books/white company/page (459).png',
    'books/white company/page (460).png',
    'books/white company/page (461).png',
    'books/white company/page (462).png',
    'books/white company/page (463).png',
    'books/white company/page (464).png',
    'books/white company/page (465).png',
    'books/white company/page (466).png',
    'books/white company/page (467).png',
    'books/white company/page (468).png',
    'books/white company/page (469).png',
    'books/white company/page (470).png',
    'books/white company/page (471).png',
    'books/white company/page (472).png',
    'books/white company/page (473).png',
    'books/white company/page (474).png',
    'books/white company/page (475).png',
    'books/white company/page (476).png',
    'books/white company/page (477).png',
    'books/white company/page (478).png',
    'books/white company/page (479).png',
    'books/white company/page (480).png',
    'books/white company/page (481).png',
    'books/white company/page (482).png',
    'books/white company/page (483).png',
    'books/white company/page (484).png',
    'books/white company/page (485).png',
    'books/white company/page (486).png',
    'books/white company/page (487).png',
    'books/white company/page (488).png',
    'books/white company/page (489).png',
    'books/white company/page (490).png',
    'books/white company/page (491).png',
    'books/white company/page (492).png',
    'books/white company/page (493).png',
    'books/white company/page (494).png',
    'books/white company/page (495).png',
    'books/white company/page (496).png',
    'books/white company/page (497).png',
    'books/white company/page (498).png',
    'books/white company/page (499).png',
    'books/white company/page (500).png',
    'books/white company/page (501).png',
    'books/white company/page (502).png',
    'books/white company/page (503).png',
    'books/white company/page (504).png',
    'books/white company/page (505).png',
    'books/white company/page (506).png',
    'books/white company/page (507).png',
    'books/white company/page (508).png',
    'books/white company/page (509).png',
    'books/white company/page (510).png',
    'books/white company/page (511).png',
    'books/white company/page (512).png',
    'books/white company/page (513).png',
    'books/white company/page (514).png',
    'books/white company/page (515).png',
    'books/white company/page (516).png',
    'books/white company/page (517).png',
    'books/white company/page (518).png',
    'books/white company/page (519).png',
    'books/white company/page (520).png',
    'books/white company/page (521).png',
    'books/white company/page (522).png',
    'books/white company/page (523).png',
    'books/white company/page (524).png',
    'books/white company/page (525).png',
    'books/white company/page (526).png',
    'books/white company/page (527).png',
    'books/white company/page (528).png',
    'books/white company/page (529).png',
    'books/white company/page (530).png',
    'books/white company/page (531).png',
    'books/white company/page (532).png',
    'books/white company/page (533).png',
    'books/white company/page (534).png',
    'books/white company/page (535).png',
    'books/white company/page (536).png',
    'books/white company/page (537).png',
    'books/white company/page (538).png',
    'books/white company/page (539).png',
    'books/white company/page (540).png',
    'books/white company/page (541).png',
    'books/white company/page (542).png',
    'books/white company/page (543).png',
    'books/white company/page (544).png',
    'books/white company/page (545).png',
    'books/white company/page (546).png',
    'books/white company/page (547).png',
    'books/white company/page (548).png',
    'books/white company/page (549).png',
    'books/white company/page (550).png',
    'books/white company/page (551).png',
    'books/white company/page (552).png',
    'books/white company/page (553).png',
    'books/white company/page (554).png',
    'books/white company/page (555).png',
    'books/white company/page (556).png',
    'books/white company/page (557).png',
    'books/white company/page (558).png',
    'books/white company/page (559).png',
    'books/white company/page (560).png',
    'books/white company/page (561).png',
    'books/white company/page (562).png',
    'books/white company/page (563).png',
    'books/white company/page (564).png',
    'books/white company/page (565).png',
    'books/white company/page (566).png',
    'books/white company/page (567).png',
    'books/white company/page (568).png',
    'books/white company/page (569).png',
    'books/white company/page (570).png',
    'books/white company/page (571).png',
    'books/white company/page (572).png',
    'books/white company/page (573).png',
    'books/white company/page (574).png',
    'books/white company/page (575).png',
    'books/white company/page (576).png',
    'books/white company/page (577).png',
    'books/white company/page (578).png',
    'books/white company/page (579).png',
    'books/white company/page (580).png',
    'books/white company/page (581).png',
    'books/white company/page (582).png',
    'books/white company/page (583).png',
    'books/white company/page (584).png',
    'books/white company/page (585).png',
    'books/white company/page (586).png',
    'books/white company/page (587).png',
    'books/white company/page (588).png',
    'books/white company/page (589).png',
    'books/white company/page (590).png',
    'books/white company/page (591).png',
    'books/white company/page (592).png',
    'books/white company/page (593).png',
    'books/white company/page (594).png',
    'books/white company/page (595).png',
    'books/white company/page (596).png',
    'books/white company/page (597).png',
    'books/white company/page (598).png',
    'books/white company/page (599).png',
    'books/white company/page (600).png',
    'books/white company/page (601).png',
    'books/white company/page (602).png',
    'books/white company/page (603).png',
    'books/white company/page (604).png',
    'books/white company/page (605).png',
    'books/white company/page (606).png',
    'books/white company/page (607).png',
    'books/white company/page (608).png',
    'books/white company/page (609).png',
    'books/white company/page (610).png',
    'books/white company/page (611).png',
    'books/white company/page (612).png',
    'books/white company/page (613).png',
    'books/white company/page (614).png',
    'books/white company/page (615).png',
    'books/white company/page (616).png',
    'books/white company/page (617).png',
    'books/white company/page (618).png',
    'books/white company/page (619).png',
    'books/white company/page (620).png',
    'books/white company/page (621).png',
    'books/white company/page (622).png',
    'books/white company/page (623).png',
    'books/white company/page (624).png',
    'books/white company/page (625).png',
    'books/white company/page (626).png',
    'books/white company/page (627).png',
    'books/white company/page (628).png',
    'books/white company/page (629).png',
    'books/white company/page (630).png',
    'books/white company/page (631).png',
    'books/white company/page (632).png',
    'books/white company/page (633).png',
    'books/white company/page (634).png',
    'books/white company/page (635).png',
    'books/white company/page (636).png',
    'books/white company/page (637).png',
    'books/white company/page (638).png',
    'books/white company/page (639).png',
    'books/white company/page (640).png',
    'books/white company/page (641).png',
    'books/white company/page (642).png',
    'books/white company/page (643).png',
    'books/white company/page (644).png',
    'books/white company/page (645).png',

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