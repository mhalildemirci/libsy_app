import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class nowcantold extends StatefulWidget {
  const nowcantold({Key? key}) : super(key: key);

  @override
  State<nowcantold> createState() => _nowcantoldState();
}

class _nowcantoldState extends State<nowcantold> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/now it can/page (1).png',
    'books/now it can/page (2).png',
    'books/now it can/page (3).png',
    'books/now it can/page (4).png',
    'books/now it can/page (5).png',
    'books/now it can/page (6).png',
    'books/now it can/page (7).png',
    'books/now it can/page (8).png',
    'books/now it can/page (9).png',
    'books/now it can/page (10).png',
    'books/now it can/page (11).png',
    'books/now it can/page (12).png',
    'books/now it can/page (13).png',
    'books/now it can/page (14).png',
    'books/now it can/page (15).png',
    'books/now it can/page (16).png',
    'books/now it can/page (17).png',
    'books/now it can/page (18).png',
    'books/now it can/page (19).png',
    'books/now it can/page (20).png',
    'books/now it can/page (21).png',
    'books/now it can/page (22).png',
    'books/now it can/page (23).png',
    'books/now it can/page (24).png',
    'books/now it can/page (25).png',
    'books/now it can/page (26).png',
    'books/now it can/page (27).png',
    'books/now it can/page (28).png',
    'books/now it can/page (29).png',
    'books/now it can/page (30).png',
    'books/now it can/page (31).png',
    'books/now it can/page (32).png',
    'books/now it can/page (33).png',
    'books/now it can/page (34).png',
    'books/now it can/page (35).png',
    'books/now it can/page (36).png',
    'books/now it can/page (37).png',
    'books/now it can/page (38).png',
    'books/now it can/page (39).png',
    'books/now it can/page (40).png',
    'books/now it can/page (41).png',
    'books/now it can/page (42).png',
    'books/now it can/page (43).png',
    'books/now it can/page (44).png',
    'books/now it can/page (45).png',
    'books/now it can/page (46).png',
    'books/now it can/page (47).png',
    'books/now it can/page (48).png',
    'books/now it can/page (49).png',
    'books/now it can/page (50).png',
    'books/now it can/page (51).png',
    'books/now it can/page (52).png',
    'books/now it can/page (53).png',
    'books/now it can/page (54).png',
    'books/now it can/page (55).png',
    'books/now it can/page (56).png',
    'books/now it can/page (57).png',
    'books/now it can/page (58).png',
    'books/now it can/page (59).png',
    'books/now it can/page (60).png',
    'books/now it can/page (61).png',
    'books/now it can/page (62).png',
    'books/now it can/page (63).png',
    'books/now it can/page (64).png',
    'books/now it can/page (65).png',
    'books/now it can/page (66).png',
    'books/now it can/page (67).png',
    'books/now it can/page (68).png',
    'books/now it can/page (69).png',
    'books/now it can/page (70).png',
    'books/now it can/page (71).png',
    'books/now it can/page (72).png',
    'books/now it can/page (73).png',
    'books/now it can/page (74).png',
    'books/now it can/page (75).png',
    'books/now it can/page (76).png',
    'books/now it can/page (77).png',
    'books/now it can/page (78).png',
    'books/now it can/page (79).png',
    'books/now it can/page (80).png',
    'books/now it can/page (81).png',
    'books/now it can/page (82).png',
    'books/now it can/page (83).png',
    'books/now it can/page (84).png',
    'books/now it can/page (85).png',
    'books/now it can/page (86).png',
    'books/now it can/page (87).png',
    'books/now it can/page (88).png',
    'books/now it can/page (89).png',
    'books/now it can/page (90).png',
    'books/now it can/page (91).png',
    'books/now it can/page (92).png',
    'books/now it can/page (93).png',
    'books/now it can/page (94).png',
    'books/now it can/page (95).png',
    'books/now it can/page (96).png',
    'books/now it can/page (97).png',
    'books/now it can/page (98).png',
    'books/now it can/page (99).png',
    'books/now it can/page (100).png',
    'books/now it can/page (101).png',
    'books/now it can/page (102).png',
    'books/now it can/page (103).png',
    'books/now it can/page (104).png',
    'books/now it can/page (105).png',
    'books/now it can/page (106).png',
    'books/now it can/page (107).png',
    'books/now it can/page (108).png',
    'books/now it can/page (109).png',
    'books/now it can/page (110).png',
    'books/now it can/page (111).png',
    'books/now it can/page (112).png',
    'books/now it can/page (113).png',
    'books/now it can/page (114).png',
    'books/now it can/page (115).png',
    'books/now it can/page (116).png',
    'books/now it can/page (117).png',
    'books/now it can/page (118).png',
    'books/now it can/page (119).png',
    'books/now it can/page (120).png',
    'books/now it can/page (121).png',
    'books/now it can/page (122).png',
    'books/now it can/page (123).png',
    'books/now it can/page (124).png',
    'books/now it can/page (125).png',
    'books/now it can/page (126).png',
    'books/now it can/page (127).png',
    'books/now it can/page (128).png',
    'books/now it can/page (129).png',
    'books/now it can/page (130).png',
    'books/now it can/page (131).png',
    'books/now it can/page (132).png',
    'books/now it can/page (133).png',
    'books/now it can/page (134).png',
    'books/now it can/page (135).png',
    'books/now it can/page (136).png',
    'books/now it can/page (137).png',
    'books/now it can/page (138).png',
    'books/now it can/page (139).png',
    'books/now it can/page (140).png',
    'books/now it can/page (141).png',
    'books/now it can/page (142).png',
    'books/now it can/page (143).png',
    'books/now it can/page (144).png',
    'books/now it can/page (145).png',
    'books/now it can/page (146).png',
    'books/now it can/page (147).png',
    'books/now it can/page (148).png',
    'books/now it can/page (149).png',
    'books/now it can/page (150).png',
    'books/now it can/page (151).png',
    'books/now it can/page (152).png',
    'books/now it can/page (153).png',
    'books/now it can/page (154).png',
    'books/now it can/page (155).png',
    'books/now it can/page (156).png',
    'books/now it can/page (157).png',
    'books/now it can/page (158).png',
    'books/now it can/page (159).png',
    'books/now it can/page (160).png',
    'books/now it can/page (161).png',
    'books/now it can/page (162).png',
    'books/now it can/page (163).png',
    'books/now it can/page (164).png',
    'books/now it can/page (165).png',
    'books/now it can/page (166).png',
    'books/now it can/page (167).png',
    'books/now it can/page (168).png',
    'books/now it can/page (169).png',
    'books/now it can/page (170).png',
    'books/now it can/page (171).png',
    'books/now it can/page (172).png',
    'books/now it can/page (173).png',
    'books/now it can/page (174).png',
    'books/now it can/page (175).png',
    'books/now it can/page (176).png',
    'books/now it can/page (177).png',
    'books/now it can/page (178).png',
    'books/now it can/page (179).png',
    'books/now it can/page (180).png',
    'books/now it can/page (181).png',
    'books/now it can/page (182).png',
    'books/now it can/page (183).png',
    'books/now it can/page (184).png',
    'books/now it can/page (185).png',
    'books/now it can/page (186).png',
    'books/now it can/page (187).png',
    'books/now it can/page (188).png',
    'books/now it can/page (189).png',
    'books/now it can/page (190).png',
    'books/now it can/page (191).png',
    'books/now it can/page (192).png',
    'books/now it can/page (193).png',
    'books/now it can/page (194).png',
    'books/now it can/page (195).png',
    'books/now it can/page (196).png',
    'books/now it can/page (197).png',
    'books/now it can/page (198).png',
    'books/now it can/page (199).png',
    'books/now it can/page (200).png',
    'books/now it can/page (201).png',
    'books/now it can/page (202).png',
    'books/now it can/page (203).png',
    'books/now it can/page (204).png',
    'books/now it can/page (205).png',
    'books/now it can/page (206).png',
    'books/now it can/page (207).png',
    'books/now it can/page (208).png',
    'books/now it can/page (209).png',
    'books/now it can/page (210).png',
    'books/now it can/page (211).png',
    'books/now it can/page (212).png',
    'books/now it can/page (213).png',
    'books/now it can/page (214).png',
    'books/now it can/page (215).png',
    'books/now it can/page (216).png',
    'books/now it can/page (217).png',
    'books/now it can/page (218).png',
    'books/now it can/page (219).png',
    'books/now it can/page (220).png',
    'books/now it can/page (221).png',
    'books/now it can/page (222).png',
    'books/now it can/page (223).png',
    'books/now it can/page (224).png',
    'books/now it can/page (225).png',
    'books/now it can/page (226).png',
    'books/now it can/page (227).png',
    'books/now it can/page (228).png',
    'books/now it can/page (229).png',
    'books/now it can/page (230).png',
    'books/now it can/page (231).png',
    'books/now it can/page (232).png',
    'books/now it can/page (233).png',
    'books/now it can/page (234).png',
    'books/now it can/page (235).png',
    'books/now it can/page (236).png',
    'books/now it can/page (237).png',
    'books/now it can/page (238).png',
    'books/now it can/page (239).png',
    'books/now it can/page (240).png',
    'books/now it can/page (241).png',
    'books/now it can/page (242).png',
    'books/now it can/page (243).png',
    'books/now it can/page (244).png',
    'books/now it can/page (245).png',
    'books/now it can/page (246).png',
    'books/now it can/page (247).png',
    'books/now it can/page (248).png',
    'books/now it can/page (249).png',
    'books/now it can/page (250).png',
    'books/now it can/page (251).png',
    'books/now it can/page (252).png',
    'books/now it can/page (253).png',
    'books/now it can/page (254).png',
    'books/now it can/page (255).png',
    'books/now it can/page (256).png',
    'books/now it can/page (257).png',
    'books/now it can/page (258).png',
    'books/now it can/page (259).png',
    'books/now it can/page (260).png',
    'books/now it can/page (261).png',
    'books/now it can/page (262).png',
    'books/now it can/page (263).png',
    'books/now it can/page (264).png',
    'books/now it can/page (265).png',
    'books/now it can/page (266).png',
    'books/now it can/page (267).png',
    'books/now it can/page (268).png',
    'books/now it can/page (269).png',
    'books/now it can/page (270).png',
    'books/now it can/page (271).png',
    'books/now it can/page (272).png',
    'books/now it can/page (273).png',
    'books/now it can/page (274).png',
    'books/now it can/page (275).png',
    'books/now it can/page (276).png',
    'books/now it can/page (277).png',
    'books/now it can/page (278).png',
    'books/now it can/page (279).png',
    'books/now it can/page (280).png',
    'books/now it can/page (281).png',
    'books/now it can/page (282).png',
    'books/now it can/page (283).png',
    'books/now it can/page (284).png',
    'books/now it can/page (285).png',
    'books/now it can/page (286).png',
    'books/now it can/page (287).png',
    'books/now it can/page (288).png',
    'books/now it can/page (289).png',
    'books/now it can/page (290).png',
    'books/now it can/page (291).png',
    'books/now it can/page (292).png',
    'books/now it can/page (293).png',
    'books/now it can/page (294).png',
    'books/now it can/page (295).png',
    'books/now it can/page (296).png',
    'books/now it can/page (297).png',
    'books/now it can/page (298).png',
    'books/now it can/page (299).png',
    'books/now it can/page (300).png',
    'books/now it can/page (301).png',
    'books/now it can/page (302).png',
    'books/now it can/page (303).png',
    'books/now it can/page (304).png',
    'books/now it can/page (305).png',
    'books/now it can/page (306).png',
    'books/now it can/page (307).png',
    'books/now it can/page (308).png',
    'books/now it can/page (309).png',
    'books/now it can/page (310).png',
    'books/now it can/page (311).png',
    'books/now it can/page (312).png',
    'books/now it can/page (313).png',
    'books/now it can/page (314).png',
    'books/now it can/page (315).png',
    'books/now it can/page (316).png',
    'books/now it can/page (317).png',
    'books/now it can/page (318).png',
    'books/now it can/page (319).png',
    'books/now it can/page (320).png',
    'books/now it can/page (321).png',
    'books/now it can/page (322).png',
    'books/now it can/page (323).png',
    'books/now it can/page (324).png',
    'books/now it can/page (325).png',
    'books/now it can/page (326).png',
    'books/now it can/page (327).png',
    'books/now it can/page (328).png',
    'books/now it can/page (329).png',
    'books/now it can/page (330).png',
    'books/now it can/page (331).png',
    'books/now it can/page (332).png',
    'books/now it can/page (333).png',
    'books/now it can/page (334).png',
    'books/now it can/page (335).png',
    'books/now it can/page (336).png',
    'books/now it can/page (337).png',
    'books/now it can/page (338).png',
    'books/now it can/page (339).png',
    'books/now it can/page (340).png',
    'books/now it can/page (341).png',
    'books/now it can/page (342).png',
    'books/now it can/page (343).png',
    'books/now it can/page (344).png',
    'books/now it can/page (345).png',
    'books/now it can/page (346).png',
    'books/now it can/page (347).png',
    'books/now it can/page (348).png',
    'books/now it can/page (349).png',
    'books/now it can/page (350).png',
    'books/now it can/page (351).png',
    'books/now it can/page (352).png',
    'books/now it can/page (353).png',
    'books/now it can/page (354).png',
    'books/now it can/page (355).png',
    'books/now it can/page (356).png',
    'books/now it can/page (357).png',
    'books/now it can/page (358).png',
    'books/now it can/page (359).png',
    'books/now it can/page (360).png',
    'books/now it can/page (361).png',
    'books/now it can/page (362).png',
    'books/now it can/page (363).png',
    'books/now it can/page (364).png',
    'books/now it can/page (365).png',
    'books/now it can/page (366).png',
    'books/now it can/page (367).png',
    'books/now it can/page (368).png',
    'books/now it can/page (369).png',
    'books/now it can/page (370).png',
    'books/now it can/page (371).png',
    'books/now it can/page (372).png',
    'books/now it can/page (373).png',
    'books/now it can/page (374).png',
    'books/now it can/page (375).png',
    'books/now it can/page (376).png',
    'books/now it can/page (377).png',
    'books/now it can/page (378).png',
    'books/now it can/page (379).png',
    'books/now it can/page (380).png',
    'books/now it can/page (381).png',
    'books/now it can/page (382).png',
    'books/now it can/page (383).png',
    'books/now it can/page (384).png',
    'books/now it can/page (385).png',
    'books/now it can/page (386).png',
    'books/now it can/page (387).png',
    'books/now it can/page (388).png',
    'books/now it can/page (389).png',
    'books/now it can/page (390).png',
    'books/now it can/page (391).png',
    'books/now it can/page (392).png',
    'books/now it can/page (393).png',
    'books/now it can/page (394).png',
    'books/now it can/page (395).png',
    'books/now it can/page (396).png',
    'books/now it can/page (397).png',
    'books/now it can/page (398).png',
    'books/now it can/page (399).png',
    'books/now it can/page (400).png',
    'books/now it can/page (401).png',
    'books/now it can/page (402).png',
    'books/now it can/page (403).png',
    'books/now it can/page (404).png',
    'books/now it can/page (405).png',
    'books/now it can/page (406).png',
    'books/now it can/page (407).png',
    'books/now it can/page (408).png',
    'books/now it can/page (409).png',
    'books/now it can/page (410).png',
    'books/now it can/page (411).png',
    'books/now it can/page (412).png',
    'books/now it can/page (413).png',
    'books/now it can/page (414).png',
    'books/now it can/page (415).png',
    'books/now it can/page (416).png',
    'books/now it can/page (417).png',
    'books/now it can/page (418).png',
    'books/now it can/page (419).png',
    'books/now it can/page (420).png',
    'books/now it can/page (421).png',
    'books/now it can/page (422).png',
    'books/now it can/page (423).png',
    'books/now it can/page (424).png',
    'books/now it can/page (425).png',
    'books/now it can/page (426).png',
    'books/now it can/page (427).png',
    'books/now it can/page (428).png',
    'books/now it can/page (429).png',
    'books/now it can/page (430).png',
    'books/now it can/page (431).png',
    'books/now it can/page (432).png',
    'books/now it can/page (433).png',
    'books/now it can/page (434).png',
    'books/now it can/page (435).png',
    'books/now it can/page (436).png',
    'books/now it can/page (437).png',
    'books/now it can/page (438).png',
    'books/now it can/page (439).png',
    'books/now it can/page (440).png',
    'books/now it can/page (441).png',
    'books/now it can/page (442).png',
    'books/now it can/page (443).png',
    'books/now it can/page (444).png',
    'books/now it can/page (445).png',
    'books/now it can/page (446).png',
    'books/now it can/page (447).png',
    'books/now it can/page (448).png',
    'books/now it can/page (449).png',
    'books/now it can/page (450).png',
    'books/now it can/page (451).png',
    'books/now it can/page (452).png',
    'books/now it can/page (453).png',
    'books/now it can/page (454).png',
    'books/now it can/page (455).png',
    'books/now it can/page (456).png',
    'books/now it can/page (457).png',
    'books/now it can/page (458).png',
    'books/now it can/page (459).png',
    'books/now it can/page (460).png',
    'books/now it can/page (461).png',
    'books/now it can/page (462).png',
    'books/now it can/page (463).png',
    'books/now it can/page (464).png',
    'books/now it can/page (465).png',
    'books/now it can/page (466).png',
    'books/now it can/page (467).png',
    'books/now it can/page (468).png',
    'books/now it can/page (469).png',
    'books/now it can/page (470).png',
    'books/now it can/page (471).png',
    'books/now it can/page (472).png',
    'books/now it can/page (473).png',
    'books/now it can/page (474).png',
    'books/now it can/page (475).png',
    'books/now it can/page (476).png',
    'books/now it can/page (477).png',
    'books/now it can/page (478).png',
    'books/now it can/page (479).png',
    'books/now it can/page (480).png',
    'books/now it can/page (481).png',
    'books/now it can/page (482).png',
    'books/now it can/page (483).png',
    'books/now it can/page (484).png',
    'books/now it can/page (485).png',
    'books/now it can/page (486).png',
    'books/now it can/page (487).png',
    'books/now it can/page (488).png',
    'books/now it can/page (489).png',
    'books/now it can/page (490).png',
    'books/now it can/page (491).png',
    'books/now it can/page (492).png',
    'books/now it can/page (493).png',
    'books/now it can/page (494).png',
    'books/now it can/page (495).png',
    'books/now it can/page (496).png',
    'books/now it can/page (497).png',
    'books/now it can/page (498).png',
    'books/now it can/page (499).png',
    'books/now it can/page (500).png',
    'books/now it can/page (501).png',
    'books/now it can/page (502).png',
    'books/now it can/page (503).png',
    'books/now it can/page (504).png',
    'books/now it can/page (505).png',
    'books/now it can/page (506).png',
    'books/now it can/page (507).png',
    'books/now it can/page (508).png',
    'books/now it can/page (509).png',
    'books/now it can/page (510).png',
    'books/now it can/page (511).png',
    'books/now it can/page (512).png',
    'books/now it can/page (513).png',
    'books/now it can/page (514).png',
    'books/now it can/page (515).png',
    'books/now it can/page (516).png',
    'books/now it can/page (517).png',
    'books/now it can/page (518).png',
    'books/now it can/page (519).png',
    'books/now it can/page (520).png',
    'books/now it can/page (521).png',
    'books/now it can/page (522).png',
    'books/now it can/page (523).png',
    'books/now it can/page (524).png',
    'books/now it can/page (525).png',
    'books/now it can/page (526).png',
    'books/now it can/page (527).png',
    'books/now it can/page (528).png',
    'books/now it can/page (529).png',
    'books/now it can/page (530).png',
    'books/now it can/page (531).png',
    'books/now it can/page (532).png',
    'books/now it can/page (533).png',
    'books/now it can/page (534).png',
    'books/now it can/page (535).png',
    'books/now it can/page (536).png',
    'books/now it can/page (537).png',
    'books/now it can/page (538).png',
    'books/now it can/page (539).png',

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
