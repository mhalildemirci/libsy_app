import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wareastjapan extends StatefulWidget {
  const wareastjapan({Key? key}) : super(key: key);

  @override
  State<wareastjapan> createState() => _wareastjapanState();
}

class _wareastjapanState extends State<wareastjapan> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/war east japan/page (1).png',
    'books/war east japan/page (2).png',
    'books/war east japan/page (3).png',
    'books/war east japan/page (4).png',
    'books/war east japan/page (5).png',
    'books/war east japan/page (6).png',
    'books/war east japan/page (7).png',
    'books/war east japan/page (8).png',
    'books/war east japan/page (9).png',
    'books/war east japan/page (10).png',
    'books/war east japan/page (11).png',
    'books/war east japan/page (12).png',
    'books/war east japan/page (13).png',
    'books/war east japan/page (14).png',
    'books/war east japan/page (15).png',
    'books/war east japan/page (16).png',
    'books/war east japan/page (17).png',
    'books/war east japan/page (18).png',
    'books/war east japan/page (19).png',
    'books/war east japan/page (20).png',
    'books/war east japan/page (21).png',
    'books/war east japan/page (22).png',
    'books/war east japan/page (23).png',
    'books/war east japan/page (24).png',
    'books/war east japan/page (25).png',
    'books/war east japan/page (26).png',
    'books/war east japan/page (27).png',
    'books/war east japan/page (28).png',
    'books/war east japan/page (29).png',
    'books/war east japan/page (30).png',
    'books/war east japan/page (31).png',
    'books/war east japan/page (32).png',
    'books/war east japan/page (33).png',
    'books/war east japan/page (34).png',
    'books/war east japan/page (35).png',
    'books/war east japan/page (36).png',
    'books/war east japan/page (37).png',
    'books/war east japan/page (38).png',
    'books/war east japan/page (39).png',
    'books/war east japan/page (40).png',
    'books/war east japan/page (41).png',
    'books/war east japan/page (42).png',
    'books/war east japan/page (43).png',
    'books/war east japan/page (44).png',
    'books/war east japan/page (45).png',
    'books/war east japan/page (46).png',
    'books/war east japan/page (47).png',
    'books/war east japan/page (48).png',
    'books/war east japan/page (49).png',
    'books/war east japan/page (50).png',
    'books/war east japan/page (51).png',
    'books/war east japan/page (52).png',
    'books/war east japan/page (53).png',
    'books/war east japan/page (54).png',
    'books/war east japan/page (55).png',
    'books/war east japan/page (56).png',
    'books/war east japan/page (57).png',
    'books/war east japan/page (58).png',
    'books/war east japan/page (59).png',
    'books/war east japan/page (60).png',
    'books/war east japan/page (61).png',
    'books/war east japan/page (62).png',
    'books/war east japan/page (63).png',
    'books/war east japan/page (64).png',
    'books/war east japan/page (65).png',
    'books/war east japan/page (66).png',
    'books/war east japan/page (67).png',
    'books/war east japan/page (68).png',
    'books/war east japan/page (69).png',
    'books/war east japan/page (70).png',
    'books/war east japan/page (71).png',
    'books/war east japan/page (72).png',
    'books/war east japan/page (73).png',
    'books/war east japan/page (74).png',
    'books/war east japan/page (75).png',
    'books/war east japan/page (76).png',
    'books/war east japan/page (77).png',
    'books/war east japan/page (78).png',
    'books/war east japan/page (79).png',
    'books/war east japan/page (80).png',
    'books/war east japan/page (81).png',
    'books/war east japan/page (82).png',
    'books/war east japan/page (83).png',
    'books/war east japan/page (84).png',
    'books/war east japan/page (85).png',
    'books/war east japan/page (86).png',
    'books/war east japan/page (87).png',
    'books/war east japan/page (88).png',
    'books/war east japan/page (89).png',
    'books/war east japan/page (90).png',
    'books/war east japan/page (91).png',
    'books/war east japan/page (92).png',
    'books/war east japan/page (93).png',
    'books/war east japan/page (94).png',
    'books/war east japan/page (95).png',
    'books/war east japan/page (96).png',
    'books/war east japan/page (97).png',
    'books/war east japan/page (98).png',
    'books/war east japan/page (99).png',
    'books/war east japan/page (100).png',
    'books/war east japan/page (101).png',
    'books/war east japan/page (102).png',
    'books/war east japan/page (103).png',
    'books/war east japan/page (104).png',
    'books/war east japan/page (105).png',
    'books/war east japan/page (106).png',
    'books/war east japan/page (107).png',
    'books/war east japan/page (108).png',
    'books/war east japan/page (109).png',
    'books/war east japan/page (110).png',
    'books/war east japan/page (111).png',
    'books/war east japan/page (112).png',
    'books/war east japan/page (113).png',
    'books/war east japan/page (114).png',
    'books/war east japan/page (115).png',
    'books/war east japan/page (116).png',
    'books/war east japan/page (117).png',
    'books/war east japan/page (118).png',
    'books/war east japan/page (119).png',
    'books/war east japan/page (120).png',
    'books/war east japan/page (121).png',
    'books/war east japan/page (122).png',
    'books/war east japan/page (123).png',
    'books/war east japan/page (124).png',
    'books/war east japan/page (125).png',
    'books/war east japan/page (126).png',
    'books/war east japan/page (127).png',
    'books/war east japan/page (128).png',
    'books/war east japan/page (129).png',
    'books/war east japan/page (130).png',
    'books/war east japan/page (131).png',
    'books/war east japan/page (132).png',
    'books/war east japan/page (133).png',
    'books/war east japan/page (134).png',
    'books/war east japan/page (135).png',
    'books/war east japan/page (136).png',
    'books/war east japan/page (137).png',
    'books/war east japan/page (138).png',
    'books/war east japan/page (139).png',
    'books/war east japan/page (140).png',
    'books/war east japan/page (141).png',
    'books/war east japan/page (142).png',
    'books/war east japan/page (143).png',
    'books/war east japan/page (144).png',
    'books/war east japan/page (145).png',
    'books/war east japan/page (146).png',
    'books/war east japan/page (147).png',
    'books/war east japan/page (148).png',
    'books/war east japan/page (149).png',
    'books/war east japan/page (150).png',
    'books/war east japan/page (151).png',
    'books/war east japan/page (152).png',
    'books/war east japan/page (153).png',
    'books/war east japan/page (154).png',
    'books/war east japan/page (155).png',
    'books/war east japan/page (156).png',
    'books/war east japan/page (157).png',
    'books/war east japan/page (158).png',
    'books/war east japan/page (159).png',
    'books/war east japan/page (160).png',
    'books/war east japan/page (161).png',
    'books/war east japan/page (162).png',
    'books/war east japan/page (163).png',
    'books/war east japan/page (164).png',
    'books/war east japan/page (165).png',
    'books/war east japan/page (166).png',
    'books/war east japan/page (167).png',
    'books/war east japan/page (168).png',
    'books/war east japan/page (169).png',
    'books/war east japan/page (170).png',
    'books/war east japan/page (171).png',
    'books/war east japan/page (172).png',
    'books/war east japan/page (173).png',
    'books/war east japan/page (174).png',
    'books/war east japan/page (175).png',
    'books/war east japan/page (176).png',
    'books/war east japan/page (177).png',
    'books/war east japan/page (178).png',
    'books/war east japan/page (179).png',
    'books/war east japan/page (180).png',
    'books/war east japan/page (181).png',
    'books/war east japan/page (182).png',
    'books/war east japan/page (183).png',
    'books/war east japan/page (184).png',
    'books/war east japan/page (185).png',
    'books/war east japan/page (186).png',
    'books/war east japan/page (187).png',
    'books/war east japan/page (188).png',
    'books/war east japan/page (189).png',
    'books/war east japan/page (190).png',
    'books/war east japan/page (191).png',
    'books/war east japan/page (192).png',
    'books/war east japan/page (193).png',
    'books/war east japan/page (194).png',
    'books/war east japan/page (195).png',
    'books/war east japan/page (196).png',
    'books/war east japan/page (197).png',
    'books/war east japan/page (198).png',
    'books/war east japan/page (199).png',
    'books/war east japan/page (200).png',
    'books/war east japan/page (201).png',
    'books/war east japan/page (202).png',
    'books/war east japan/page (203).png',
    'books/war east japan/page (204).png',
    'books/war east japan/page (205).png',
    'books/war east japan/page (206).png',
    'books/war east japan/page (207).png',
    'books/war east japan/page (208).png',
    'books/war east japan/page (209).png',
    'books/war east japan/page (210).png',
    'books/war east japan/page (211).png',
    'books/war east japan/page (212).png',
    'books/war east japan/page (213).png',
    'books/war east japan/page (214).png',
    'books/war east japan/page (215).png',
    'books/war east japan/page (216).png',
    'books/war east japan/page (217).png',
    'books/war east japan/page (218).png',
    'books/war east japan/page (219).png',
    'books/war east japan/page (220).png',
    'books/war east japan/page (221).png',
    'books/war east japan/page (222).png',
    'books/war east japan/page (223).png',
    'books/war east japan/page (224).png',
    'books/war east japan/page (225).png',
    'books/war east japan/page (226).png',
    'books/war east japan/page (227).png',
    'books/war east japan/page (228).png',
    'books/war east japan/page (229).png',
    'books/war east japan/page (230).png',
    'books/war east japan/page (231).png',
    'books/war east japan/page (232).png',
    'books/war east japan/page (233).png',
    'books/war east japan/page (234).png',
    'books/war east japan/page (235).png',
    'books/war east japan/page (236).png',
    'books/war east japan/page (237).png',
    'books/war east japan/page (238).png',
    'books/war east japan/page (239).png',
    'books/war east japan/page (240).png',
    'books/war east japan/page (241).png',
    'books/war east japan/page (242).png',
    'books/war east japan/page (243).png',
    'books/war east japan/page (244).png',
    'books/war east japan/page (245).png',
    'books/war east japan/page (246).png',
    'books/war east japan/page (247).png',
    'books/war east japan/page (248).png',
    'books/war east japan/page (249).png',
    'books/war east japan/page (250).png',
    'books/war east japan/page (251).png',
    'books/war east japan/page (252).png',
    'books/war east japan/page (253).png',
    'books/war east japan/page (254).png',
    'books/war east japan/page (255).png',
    'books/war east japan/page (256).png',
    'books/war east japan/page (257).png',
    'books/war east japan/page (258).png',
    'books/war east japan/page (259).png',
    'books/war east japan/page (260).png',
    'books/war east japan/page (261).png',
    'books/war east japan/page (262).png',
    'books/war east japan/page (263).png',
    'books/war east japan/page (264).png',
    'books/war east japan/page (265).png',
    'books/war east japan/page (266).png',
    'books/war east japan/page (267).png',
    'books/war east japan/page (268).png',
    'books/war east japan/page (269).png',
    'books/war east japan/page (270).png',
    'books/war east japan/page (271).png',
    'books/war east japan/page (272).png',
    'books/war east japan/page (273).png',
    'books/war east japan/page (274).png',
    'books/war east japan/page (275).png',
    'books/war east japan/page (276).png',
    'books/war east japan/page (277).png',
    'books/war east japan/page (278).png',
    'books/war east japan/page (279).png',
    'books/war east japan/page (280).png',
    'books/war east japan/page (281).png',
    'books/war east japan/page (282).png',
    'books/war east japan/page (283).png',
    'books/war east japan/page (284).png',
    'books/war east japan/page (285).png',
    'books/war east japan/page (286).png',
    'books/war east japan/page (287).png',
    'books/war east japan/page (288).png',
    'books/war east japan/page (289).png',
    'books/war east japan/page (290).png',
    'books/war east japan/page (291).png',
    'books/war east japan/page (292).png',
    'books/war east japan/page (293).png',
    'books/war east japan/page (294).png',
    'books/war east japan/page (295).png',
    'books/war east japan/page (296).png',
    'books/war east japan/page (297).png',
    'books/war east japan/page (298).png',
    'books/war east japan/page (299).png',
    'books/war east japan/page (300).png',
    'books/war east japan/page (301).png',
    'books/war east japan/page (302).png',
    'books/war east japan/page (303).png',
    'books/war east japan/page (304).png',
    'books/war east japan/page (305).png',
    'books/war east japan/page (306).png',
    'books/war east japan/page (307).png',
    'books/war east japan/page (308).png',
    'books/war east japan/page (309).png',
    'books/war east japan/page (310).png',
    'books/war east japan/page (311).png',
    'books/war east japan/page (312).png',
    'books/war east japan/page (313).png',
    'books/war east japan/page (314).png',
    'books/war east japan/page (315).png',
    'books/war east japan/page (316).png',
    'books/war east japan/page (317).png',
    'books/war east japan/page (318).png',
    'books/war east japan/page (319).png',
    'books/war east japan/page (320).png',
    'books/war east japan/page (321).png',
    'books/war east japan/page (322).png',
    'books/war east japan/page (323).png',
    'books/war east japan/page (324).png',
    'books/war east japan/page (325).png',
    'books/war east japan/page (326).png',
    'books/war east japan/page (327).png',
    'books/war east japan/page (328).png',
    'books/war east japan/page (329).png',
    'books/war east japan/page (330).png',
    'books/war east japan/page (331).png',
    'books/war east japan/page (332).png',
    'books/war east japan/page (333).png',
    'books/war east japan/page (334).png',
    'books/war east japan/page (335).png',
    'books/war east japan/page (336).png',
    'books/war east japan/page (337).png',
    'books/war east japan/page (338).png',
    'books/war east japan/page (339).png',
    'books/war east japan/page (340).png',
    'books/war east japan/page (341).png',
    'books/war east japan/page (342).png',
    'books/war east japan/page (343).png',
    'books/war east japan/page (344).png',
    'books/war east japan/page (345).png',
    'books/war east japan/page (346).png',
    'books/war east japan/page (347).png',
    'books/war east japan/page (348).png',
    'books/war east japan/page (349).png',
    'books/war east japan/page (350).png',
    'books/war east japan/page (351).png',
    'books/war east japan/page (352).png',
    'books/war east japan/page (353).png',
    'books/war east japan/page (354).png',
    'books/war east japan/page (355).png',
    'books/war east japan/page (356).png',
    'books/war east japan/page (357).png',
    'books/war east japan/page (358).png',
    'books/war east japan/page (359).png',
    'books/war east japan/page (360).png',
    'books/war east japan/page (361).png',
    'books/war east japan/page (362).png',
    'books/war east japan/page (363).png',
    'books/war east japan/page (364).png',
    'books/war east japan/page (365).png',
    'books/war east japan/page (366).png',
    'books/war east japan/page (367).png',
    'books/war east japan/page (368).png',
    'books/war east japan/page (369).png',
    'books/war east japan/page (370).png',
    'books/war east japan/page (371).png',
    'books/war east japan/page (372).png',
    'books/war east japan/page (373).png',
    'books/war east japan/page (374).png',
    'books/war east japan/page (375).png',
    'books/war east japan/page (376).png',
    'books/war east japan/page (377).png',
    'books/war east japan/page (378).png',
    'books/war east japan/page (379).png',
    'books/war east japan/page (380).png',
    'books/war east japan/page (381).png',
    'books/war east japan/page (382).png',
    'books/war east japan/page (383).png',
    'books/war east japan/page (384).png',
    'books/war east japan/page (385).png',
    'books/war east japan/page (386).png',
    'books/war east japan/page (387).png',
    'books/war east japan/page (388).png',
    'books/war east japan/page (389).png',
    'books/war east japan/page (390).png',
    'books/war east japan/page (391).png',
    'books/war east japan/page (392).png',
    'books/war east japan/page (393).png',
    'books/war east japan/page (394).png',
    'books/war east japan/page (395).png',
    'books/war east japan/page (396).png',
    'books/war east japan/page (397).png',
    'books/war east japan/page (398).png',
    'books/war east japan/page (399).png',
    'books/war east japan/page (400).png',
    'books/war east japan/page (401).png',
    'books/war east japan/page (402).png',
    'books/war east japan/page (403).png',
    'books/war east japan/page (404).png',
    'books/war east japan/page (405).png',
    'books/war east japan/page (406).png',
    'books/war east japan/page (407).png',
    'books/war east japan/page (408).png',
    'books/war east japan/page (409).png',
    'books/war east japan/page (410).png',
    'books/war east japan/page (411).png',
    'books/war east japan/page (412).png',
    'books/war east japan/page (413).png',
    'books/war east japan/page (414).png',
    'books/war east japan/page (415).png',
    'books/war east japan/page (416).png',
    'books/war east japan/page (417).png',
    'books/war east japan/page (418).png',
    'books/war east japan/page (419).png',
    'books/war east japan/page (420).png',
    'books/war east japan/page (421).png',
    'books/war east japan/page (422).png',
    'books/war east japan/page (423).png',
    'books/war east japan/page (424).png',
    'books/war east japan/page (425).png',
    'books/war east japan/page (426).png',
    'books/war east japan/page (427).png',
    'books/war east japan/page (428).png',
    'books/war east japan/page (429).png',
    'books/war east japan/page (430).png',
    'books/war east japan/page (431).png',
    'books/war east japan/page (432).png',
    'books/war east japan/page (433).png',
    'books/war east japan/page (434).png',
    'books/war east japan/page (435).png',
    'books/war east japan/page (436).png',
    'books/war east japan/page (437).png',
    'books/war east japan/page (438).png',
    'books/war east japan/page (439).png',
    'books/war east japan/page (440).png',
    'books/war east japan/page (441).png',
    'books/war east japan/page (442).png',
    'books/war east japan/page (443).png',
    'books/war east japan/page (444).png',
    'books/war east japan/page (445).png',
    'books/war east japan/page (446).png',
    'books/war east japan/page (447).png',
    'books/war east japan/page (448).png',
    'books/war east japan/page (449).png',
    'books/war east japan/page (450).png',
    'books/war east japan/page (451).png',
    'books/war east japan/page (452).png',
    'books/war east japan/page (453).png',
    'books/war east japan/page (454).png',
    'books/war east japan/page (455).png',
    'books/war east japan/page (456).png',
    'books/war east japan/page (457).png',
    'books/war east japan/page (458).png',
    'books/war east japan/page (459).png',
    'books/war east japan/page (460).png',
    'books/war east japan/page (461).png',
    'books/war east japan/page (462).png',
    'books/war east japan/page (463).png',
    'books/war east japan/page (464).png',
    'books/war east japan/page (465).png',
    'books/war east japan/page (466).png',
    'books/war east japan/page (467).png',
    'books/war east japan/page (468).png',
    'books/war east japan/page (469).png',
    'books/war east japan/page (470).png',
    'books/war east japan/page (471).png',
    'books/war east japan/page (472).png',
    'books/war east japan/page (473).png',
    'books/war east japan/page (474).png',
    'books/war east japan/page (475).png',
    'books/war east japan/page (476).png',
    'books/war east japan/page (477).png',
    'books/war east japan/page (478).png',
    'books/war east japan/page (479).png',
    'books/war east japan/page (480).png',
    'books/war east japan/page (481).png',
    'books/war east japan/page (482).png',
    'books/war east japan/page (483).png',
    'books/war east japan/page (484).png',
    'books/war east japan/page (485).png',
    'books/war east japan/page (486).png',
    'books/war east japan/page (487).png',
    'books/war east japan/page (488).png',
    'books/war east japan/page (489).png',
    'books/war east japan/page (490).png',
    'books/war east japan/page (491).png',
    'books/war east japan/page (492).png',
    'books/war east japan/page (493).png',
    'books/war east japan/page (494).png',
    'books/war east japan/page (495).png',
    'books/war east japan/page (496).png',
    'books/war east japan/page (497).png',
    'books/war east japan/page (498).png',
    'books/war east japan/page (499).png',
    'books/war east japan/page (500).png',
    'books/war east japan/page (501).png',
    'books/war east japan/page (502).png',
    'books/war east japan/page (503).png',
    'books/war east japan/page (504).png',
    'books/war east japan/page (505).png',
    'books/war east japan/page (506).png',
    'books/war east japan/page (507).png',
    'books/war east japan/page (508).png',
    'books/war east japan/page (509).png',
    'books/war east japan/page (510).png',
    'books/war east japan/page (511).png',
    'books/war east japan/page (512).png',
    'books/war east japan/page (513).png',
    'books/war east japan/page (514).png',
    'books/war east japan/page (515).png',
    'books/war east japan/page (516).png',
    'books/war east japan/page (517).png',
    'books/war east japan/page (518).png',
    'books/war east japan/page (519).png',
    'books/war east japan/page (520).png',
    'books/war east japan/page (521).png',
    'books/war east japan/page (522).png',
    'books/war east japan/page (523).png',
    'books/war east japan/page (524).png',
    'books/war east japan/page (525).png',
    'books/war east japan/page (526).png',
    'books/war east japan/page (527).png',
    'books/war east japan/page (528).png',
    'books/war east japan/page (529).png',
    'books/war east japan/page (530).png',
    'books/war east japan/page (531).png',
    'books/war east japan/page (532).png',
    'books/war east japan/page (533).png',
    'books/war east japan/page (534).png',
    'books/war east japan/page (535).png',
    'books/war east japan/page (536).png',
    'books/war east japan/page (537).png',
    'books/war east japan/page (538).png',
    'books/war east japan/page (539).png',
    'books/war east japan/page (540).png',
    'books/war east japan/page (541).png',
    'books/war east japan/page (542).png',
    'books/war east japan/page (543).png',
    'books/war east japan/page (544).png',
    'books/war east japan/page (545).png',
    'books/war east japan/page (546).png',
    'books/war east japan/page (547).png',
    'books/war east japan/page (548).png',
    'books/war east japan/page (549).png',
    'books/war east japan/page (550).png',
    'books/war east japan/page (551).png',
    'books/war east japan/page (552).png',
    'books/war east japan/page (553).png',
    'books/war east japan/page (554).png',
    'books/war east japan/page (555).png',
    'books/war east japan/page (556).png',
    'books/war east japan/page (557).png',
    'books/war east japan/page (558).png',
    'books/war east japan/page (559).png',
    'books/war east japan/page (560).png',
    'books/war east japan/page (561).png',
    'books/war east japan/page (562).png',
    'books/war east japan/page (563).png',
    'books/war east japan/page (564).png',
    'books/war east japan/page (565).png',
    'books/war east japan/page (566).png',
    'books/war east japan/page (567).png',
    'books/war east japan/page (568).png',
    'books/war east japan/page (569).png',
    'books/war east japan/page (570).png',
    'books/war east japan/page (571).png',
    'books/war east japan/page (572).png',
    'books/war east japan/page (573).png',
    'books/war east japan/page (574).png',
    'books/war east japan/page (575).png',
    'books/war east japan/page (576).png',
    'books/war east japan/page (577).png',
    'books/war east japan/page (578).png',
    'books/war east japan/page (579).png',
    'books/war east japan/page (580).png',
    'books/war east japan/page (581).png',
    'books/war east japan/page (582).png',
    'books/war east japan/page (583).png',
    'books/war east japan/page (584).png',
    'books/war east japan/page (585).png',
    'books/war east japan/page (586).png',
    'books/war east japan/page (587).png',
    'books/war east japan/page (588).png',
    'books/war east japan/page (589).png',
    'books/war east japan/page (590).png',
    'books/war east japan/page (591).png',
    'books/war east japan/page (592).png',
    'books/war east japan/page (593).png',
    'books/war east japan/page (594).png',
    'books/war east japan/page (595).png',
    'books/war east japan/page (596).png',
    'books/war east japan/page (597).png',
    'books/war east japan/page (598).png',
    'books/war east japan/page (599).png',
    'books/war east japan/page (600).png',
    'books/war east japan/page (601).png',
    'books/war east japan/page (602).png',
    'books/war east japan/page (603).png',
    'books/war east japan/page (604).png',
    'books/war east japan/page (605).png',
    'books/war east japan/page (606).png',
    'books/war east japan/page (607).png',
    'books/war east japan/page (608).png',

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
