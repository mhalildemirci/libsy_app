import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class idiot extends StatefulWidget {
  const idiot({Key? key}) : super(key: key);

  @override
  State<idiot> createState() => _idiotState();
}

class _idiotState extends State<idiot> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/the idiot/page (1).png',
    'books/the idiot/page (2).png',
    'books/the idiot/page (3).png',
    'books/the idiot/page (4).png',
    'books/the idiot/page (5).png',
    'books/the idiot/page (6).png',
    'books/the idiot/page (7).png',
    'books/the idiot/page (8).png',
    'books/the idiot/page (9).png',
    'books/the idiot/page (10).png',
    'books/the idiot/page (11).png',
    'books/the idiot/page (12).png',
    'books/the idiot/page (13).png',
    'books/the idiot/page (14).png',
    'books/the idiot/page (15).png',
    'books/the idiot/page (16).png',
    'books/the idiot/page (17).png',
    'books/the idiot/page (18).png',
    'books/the idiot/page (19).png',
    'books/the idiot/page (20).png',
    'books/the idiot/page (21).png',
    'books/the idiot/page (22).png',
    'books/the idiot/page (23).png',
    'books/the idiot/page (24).png',
    'books/the idiot/page (25).png',
    'books/the idiot/page (26).png',
    'books/the idiot/page (27).png',
    'books/the idiot/page (28).png',
    'books/the idiot/page (29).png',
    'books/the idiot/page (30).png',
    'books/the idiot/page (31).png',
    'books/the idiot/page (32).png',
    'books/the idiot/page (33).png',
    'books/the idiot/page (34).png',
    'books/the idiot/page (35).png',
    'books/the idiot/page (36).png',
    'books/the idiot/page (37).png',
    'books/the idiot/page (38).png',
    'books/the idiot/page (39).png',
    'books/the idiot/page (40).png',
    'books/the idiot/page (41).png',
    'books/the idiot/page (42).png',
    'books/the idiot/page (43).png',
    'books/the idiot/page (44).png',
    'books/the idiot/page (45).png',
    'books/the idiot/page (46).png',
    'books/the idiot/page (47).png',
    'books/the idiot/page (48).png',
    'books/the idiot/page (49).png',
    'books/the idiot/page (50).png',
    'books/the idiot/page (51).png',
    'books/the idiot/page (52).png',
    'books/the idiot/page (53).png',
    'books/the idiot/page (54).png',
    'books/the idiot/page (55).png',
    'books/the idiot/page (56).png',
    'books/the idiot/page (57).png',
    'books/the idiot/page (58).png',
    'books/the idiot/page (59).png',
    'books/the idiot/page (60).png',
    'books/the idiot/page (61).png',
    'books/the idiot/page (62).png',
    'books/the idiot/page (63).png',
    'books/the idiot/page (64).png',
    'books/the idiot/page (65).png',
    'books/the idiot/page (66).png',
    'books/the idiot/page (67).png',
    'books/the idiot/page (68).png',
    'books/the idiot/page (69).png',
    'books/the idiot/page (70).png',
    'books/the idiot/page (71).png',
    'books/the idiot/page (72).png',
    'books/the idiot/page (73).png',
    'books/the idiot/page (74).png',
    'books/the idiot/page (75).png',
    'books/the idiot/page (76).png',
    'books/the idiot/page (77).png',
    'books/the idiot/page (78).png',
    'books/the idiot/page (79).png',
    'books/the idiot/page (80).png',
    'books/the idiot/page (81).png',
    'books/the idiot/page (82).png',
    'books/the idiot/page (83).png',
    'books/the idiot/page (84).png',
    'books/the idiot/page (85).png',
    'books/the idiot/page (86).png',
    'books/the idiot/page (87).png',
    'books/the idiot/page (88).png',
    'books/the idiot/page (89).png',
    'books/the idiot/page (90).png',
    'books/the idiot/page (91).png',
    'books/the idiot/page (92).png',
    'books/the idiot/page (93).png',
    'books/the idiot/page (94).png',
    'books/the idiot/page (95).png',
    'books/the idiot/page (96).png',
    'books/the idiot/page (97).png',
    'books/the idiot/page (98).png',
    'books/the idiot/page (99).png',
    'books/the idiot/page (100).png',
    'books/the idiot/page (101).png',
    'books/the idiot/page (102).png',
    'books/the idiot/page (103).png',
    'books/the idiot/page (104).png',
    'books/the idiot/page (105).png',
    'books/the idiot/page (106).png',
    'books/the idiot/page (107).png',
    'books/the idiot/page (108).png',
    'books/the idiot/page (109).png',
    'books/the idiot/page (110).png',
    'books/the idiot/page (111).png',
    'books/the idiot/page (112).png',
    'books/the idiot/page (113).png',
    'books/the idiot/page (114).png',
    'books/the idiot/page (115).png',
    'books/the idiot/page (116).png',
    'books/the idiot/page (117).png',
    'books/the idiot/page (118).png',
    'books/the idiot/page (119).png',
    'books/the idiot/page (120).png',
    'books/the idiot/page (121).png',
    'books/the idiot/page (122).png',
    'books/the idiot/page (123).png',
    'books/the idiot/page (124).png',
    'books/the idiot/page (125).png',
    'books/the idiot/page (126).png',
    'books/the idiot/page (127).png',
    'books/the idiot/page (128).png',
    'books/the idiot/page (129).png',
    'books/the idiot/page (130).png',
    'books/the idiot/page (131).png',
    'books/the idiot/page (132).png',
    'books/the idiot/page (133).png',
    'books/the idiot/page (134).png',
    'books/the idiot/page (135).png',
    'books/the idiot/page (136).png',
    'books/the idiot/page (137).png',
    'books/the idiot/page (138).png',
    'books/the idiot/page (139).png',
    'books/the idiot/page (140).png',
    'books/the idiot/page (141).png',
    'books/the idiot/page (142).png',
    'books/the idiot/page (143).png',
    'books/the idiot/page (144).png',
    'books/the idiot/page (145).png',
    'books/the idiot/page (146).png',
    'books/the idiot/page (147).png',
    'books/the idiot/page (148).png',
    'books/the idiot/page (149).png',
    'books/the idiot/page (150).png',
    'books/the idiot/page (151).png',
    'books/the idiot/page (152).png',
    'books/the idiot/page (153).png',
    'books/the idiot/page (154).png',
    'books/the idiot/page (155).png',
    'books/the idiot/page (156).png',
    'books/the idiot/page (157).png',
    'books/the idiot/page (158).png',
    'books/the idiot/page (159).png',
    'books/the idiot/page (160).png',
    'books/the idiot/page (161).png',
    'books/the idiot/page (162).png',
    'books/the idiot/page (163).png',
    'books/the idiot/page (164).png',
    'books/the idiot/page (165).png',
    'books/the idiot/page (166).png',
    'books/the idiot/page (167).png',
    'books/the idiot/page (168).png',
    'books/the idiot/page (169).png',
    'books/the idiot/page (170).png',
    'books/the idiot/page (171).png',
    'books/the idiot/page (172).png',
    'books/the idiot/page (173).png',
    'books/the idiot/page (174).png',
    'books/the idiot/page (175).png',
    'books/the idiot/page (176).png',
    'books/the idiot/page (177).png',
    'books/the idiot/page (178).png',
    'books/the idiot/page (179).png',
    'books/the idiot/page (180).png',
    'books/the idiot/page (181).png',
    'books/the idiot/page (182).png',
    'books/the idiot/page (183).png',
    'books/the idiot/page (184).png',
    'books/the idiot/page (185).png',
    'books/the idiot/page (186).png',
    'books/the idiot/page (187).png',
    'books/the idiot/page (188).png',
    'books/the idiot/page (189).png',
    'books/the idiot/page (190).png',
    'books/the idiot/page (191).png',
    'books/the idiot/page (192).png',
    'books/the idiot/page (193).png',
    'books/the idiot/page (194).png',
    'books/the idiot/page (195).png',
    'books/the idiot/page (196).png',
    'books/the idiot/page (197).png',
    'books/the idiot/page (198).png',
    'books/the idiot/page (199).png',
    'books/the idiot/page (200).png',
    'books/the idiot/page (201).png',
    'books/the idiot/page (202).png',
    'books/the idiot/page (203).png',
    'books/the idiot/page (204).png',
    'books/the idiot/page (205).png',
    'books/the idiot/page (206).png',
    'books/the idiot/page (207).png',
    'books/the idiot/page (208).png',
    'books/the idiot/page (209).png',
    'books/the idiot/page (210).png',
    'books/the idiot/page (211).png',
    'books/the idiot/page (212).png',
    'books/the idiot/page (213).png',
    'books/the idiot/page (214).png',
    'books/the idiot/page (215).png',
    'books/the idiot/page (216).png',
    'books/the idiot/page (217).png',
    'books/the idiot/page (218).png',
    'books/the idiot/page (219).png',
    'books/the idiot/page (220).png',
    'books/the idiot/page (221).png',
    'books/the idiot/page (222).png',
    'books/the idiot/page (223).png',
    'books/the idiot/page (224).png',
    'books/the idiot/page (225).png',
    'books/the idiot/page (226).png',
    'books/the idiot/page (227).png',
    'books/the idiot/page (228).png',
    'books/the idiot/page (229).png',
    'books/the idiot/page (230).png',
    'books/the idiot/page (231).png',
    'books/the idiot/page (232).png',
    'books/the idiot/page (233).png',
    'books/the idiot/page (234).png',
    'books/the idiot/page (235).png',
    'books/the idiot/page (236).png',
    'books/the idiot/page (237).png',
    'books/the idiot/page (238).png',
    'books/the idiot/page (239).png',
    'books/the idiot/page (240).png',
    'books/the idiot/page (241).png',
    'books/the idiot/page (242).png',
    'books/the idiot/page (243).png',
    'books/the idiot/page (244).png',
    'books/the idiot/page (245).png',
    'books/the idiot/page (246).png',
    'books/the idiot/page (247).png',
    'books/the idiot/page (248).png',
    'books/the idiot/page (249).png',
    'books/the idiot/page (250).png',
    'books/the idiot/page (251).png',
    'books/the idiot/page (252).png',
    'books/the idiot/page (253).png',
    'books/the idiot/page (254).png',
    'books/the idiot/page (255).png',
    'books/the idiot/page (256).png',
    'books/the idiot/page (257).png',
    'books/the idiot/page (258).png',
    'books/the idiot/page (259).png',
    'books/the idiot/page (260).png',
    'books/the idiot/page (261).png',
    'books/the idiot/page (262).png',
    'books/the idiot/page (263).png',
    'books/the idiot/page (264).png',
    'books/the idiot/page (265).png',
    'books/the idiot/page (266).png',
    'books/the idiot/page (267).png',
    'books/the idiot/page (268).png',
    'books/the idiot/page (269).png',
    'books/the idiot/page (270).png',
    'books/the idiot/page (271).png',
    'books/the idiot/page (272).png',
    'books/the idiot/page (273).png',
    'books/the idiot/page (274).png',
    'books/the idiot/page (275).png',
    'books/the idiot/page (276).png',
    'books/the idiot/page (277).png',
    'books/the idiot/page (278).png',
    'books/the idiot/page (279).png',
    'books/the idiot/page (280).png',
    'books/the idiot/page (281).png',
    'books/the idiot/page (282).png',
    'books/the idiot/page (283).png',
    'books/the idiot/page (284).png',
    'books/the idiot/page (285).png',
    'books/the idiot/page (286).png',
    'books/the idiot/page (287).png',
    'books/the idiot/page (288).png',
    'books/the idiot/page (289).png',
    'books/the idiot/page (290).png',
    'books/the idiot/page (291).png',
    'books/the idiot/page (292).png',
    'books/the idiot/page (293).png',
    'books/the idiot/page (294).png',
    'books/the idiot/page (295).png',
    'books/the idiot/page (296).png',
    'books/the idiot/page (297).png',
    'books/the idiot/page (298).png',
    'books/the idiot/page (299).png',
    'books/the idiot/page (300).png',
    'books/the idiot/page (301).png',
    'books/the idiot/page (302).png',
    'books/the idiot/page (303).png',
    'books/the idiot/page (304).png',
    'books/the idiot/page (305).png',
    'books/the idiot/page (306).png',
    'books/the idiot/page (307).png',
    'books/the idiot/page (308).png',
    'books/the idiot/page (309).png',
    'books/the idiot/page (310).png',
    'books/the idiot/page (311).png',
    'books/the idiot/page (312).png',
    'books/the idiot/page (313).png',
    'books/the idiot/page (314).png',
    'books/the idiot/page (315).png',
    'books/the idiot/page (316).png',
    'books/the idiot/page (317).png',
    'books/the idiot/page (318).png',
    'books/the idiot/page (319).png',
    'books/the idiot/page (320).png',
    'books/the idiot/page (321).png',
    'books/the idiot/page (322).png',
    'books/the idiot/page (323).png',
    'books/the idiot/page (324).png',
    'books/the idiot/page (325).png',
    'books/the idiot/page (326).png',
    'books/the idiot/page (327).png',
    'books/the idiot/page (328).png',
    'books/the idiot/page (329).png',
    'books/the idiot/page (330).png',
    'books/the idiot/page (331).png',
    'books/the idiot/page (332).png',
    'books/the idiot/page (333).png',
    'books/the idiot/page (334).png',
    'books/the idiot/page (335).png',
    'books/the idiot/page (336).png',
    'books/the idiot/page (337).png',
    'books/the idiot/page (338).png',
    'books/the idiot/page (339).png',
    'books/the idiot/page (340).png',
    'books/the idiot/page (341).png',
    'books/the idiot/page (342).png',
    'books/the idiot/page (343).png',
    'books/the idiot/page (344).png',
    'books/the idiot/page (345).png',
    'books/the idiot/page (346).png',
    'books/the idiot/page (347).png',
    'books/the idiot/page (348).png',
    'books/the idiot/page (349).png',
    'books/the idiot/page (350).png',
    'books/the idiot/page (351).png',
    'books/the idiot/page (352).png',
    'books/the idiot/page (353).png',
    'books/the idiot/page (354).png',
    'books/the idiot/page (355).png',
    'books/the idiot/page (356).png',
    'books/the idiot/page (357).png',
    'books/the idiot/page (358).png',
    'books/the idiot/page (359).png',
    'books/the idiot/page (360).png',
    'books/the idiot/page (361).png',
    'books/the idiot/page (362).png',
    'books/the idiot/page (363).png',
    'books/the idiot/page (364).png',
    'books/the idiot/page (365).png',
    'books/the idiot/page (366).png',
    'books/the idiot/page (367).png',
    'books/the idiot/page (368).png',
    'books/the idiot/page (369).png',
    'books/the idiot/page (370).png',
    'books/the idiot/page (371).png',
    'books/the idiot/page (372).png',
    'books/the idiot/page (373).png',
    'books/the idiot/page (374).png',
    'books/the idiot/page (375).png',
    'books/the idiot/page (376).png',
    'books/the idiot/page (377).png',
    'books/the idiot/page (378).png',
    'books/the idiot/page (379).png',
    'books/the idiot/page (380).png',
    'books/the idiot/page (381).png',
    'books/the idiot/page (382).png',
    'books/the idiot/page (383).png',
    'books/the idiot/page (384).png',
    'books/the idiot/page (385).png',
    'books/the idiot/page (386).png',
    'books/the idiot/page (387).png',
    'books/the idiot/page (388).png',
    'books/the idiot/page (389).png',
    'books/the idiot/page (390).png',
    'books/the idiot/page (391).png',
    'books/the idiot/page (392).png',
    'books/the idiot/page (393).png',
    'books/the idiot/page (394).png',
    'books/the idiot/page (395).png',
    'books/the idiot/page (396).png',
    'books/the idiot/page (397).png',
    'books/the idiot/page (398).png',
    'books/the idiot/page (399).png',
    'books/the idiot/page (400).png',
    'books/the idiot/page (401).png',
    'books/the idiot/page (402).png',
    'books/the idiot/page (403).png',
    'books/the idiot/page (404).png',
    'books/the idiot/page (405).png',
    'books/the idiot/page (406).png',
    'books/the idiot/page (407).png',
    'books/the idiot/page (408).png',
    'books/the idiot/page (409).png',
    'books/the idiot/page (410).png',
    'books/the idiot/page (411).png',
    'books/the idiot/page (412).png',
    'books/the idiot/page (413).png',
    'books/the idiot/page (414).png',
    'books/the idiot/page (415).png',
    'books/the idiot/page (416).png',
    'books/the idiot/page (417).png',
    'books/the idiot/page (418).png',
    'books/the idiot/page (419).png',
    'books/the idiot/page (420).png',
    'books/the idiot/page (421).png',
    'books/the idiot/page (422).png',
    'books/the idiot/page (423).png',
    'books/the idiot/page (424).png',
    'books/the idiot/page (425).png',
    'books/the idiot/page (426).png',
    'books/the idiot/page (427).png',
    'books/the idiot/page (428).png',
    'books/the idiot/page (429).png',
    'books/the idiot/page (430).png',
    'books/the idiot/page (431).png',
    'books/the idiot/page (432).png',
    'books/the idiot/page (433).png',
    'books/the idiot/page (434).png',
    'books/the idiot/page (435).png',
    'books/the idiot/page (436).png',
    'books/the idiot/page (437).png',
    'books/the idiot/page (438).png',
    'books/the idiot/page (439).png',
    'books/the idiot/page (440).png',
    'books/the idiot/page (441).png',
    'books/the idiot/page (442).png',
    'books/the idiot/page (443).png',
    'books/the idiot/page (444).png',
    'books/the idiot/page (445).png',
    'books/the idiot/page (446).png',
    'books/the idiot/page (447).png',
    'books/the idiot/page (448).png',
    'books/the idiot/page (449).png',
    'books/the idiot/page (450).png',
    'books/the idiot/page (451).png',
    'books/the idiot/page (452).png',
    'books/the idiot/page (453).png',
    'books/the idiot/page (454).png',
    'books/the idiot/page (455).png',
    'books/the idiot/page (456).png',
    'books/the idiot/page (457).png',
    'books/the idiot/page (458).png',
    'books/the idiot/page (459).png',
    'books/the idiot/page (460).png',
    'books/the idiot/page (461).png',
    'books/the idiot/page (462).png',
    'books/the idiot/page (463).png',
    'books/the idiot/page (464).png',
    'books/the idiot/page (465).png',
    'books/the idiot/page (466).png',
    'books/the idiot/page (467).png',
    'books/the idiot/page (468).png',
    'books/the idiot/page (469).png',
    'books/the idiot/page (470).png',
    'books/the idiot/page (471).png',
    'books/the idiot/page (472).png',
    'books/the idiot/page (473).png',
    'books/the idiot/page (474).png',
    'books/the idiot/page (475).png',
    'books/the idiot/page (476).png',
    'books/the idiot/page (477).png',
    'books/the idiot/page (478).png',
    'books/the idiot/page (479).png',
    'books/the idiot/page (480).png',
    'books/the idiot/page (481).png',
    'books/the idiot/page (482).png',
    'books/the idiot/page (483).png',
    'books/the idiot/page (484).png',
    'books/the idiot/page (485).png',
    'books/the idiot/page (486).png',
    'books/the idiot/page (487).png',
    'books/the idiot/page (488).png',
    'books/the idiot/page (489).png',
    'books/the idiot/page (490).png',
    'books/the idiot/page (491).png',
    'books/the idiot/page (492).png',
    'books/the idiot/page (493).png',
    'books/the idiot/page (494).png',
    'books/the idiot/page (495).png',
    'books/the idiot/page (496).png',
    'books/the idiot/page (497).png',
    'books/the idiot/page (498).png',
    'books/the idiot/page (499).png',
    'books/the idiot/page (500).png',
    'books/the idiot/page (501).png',
    'books/the idiot/page (502).png',
    'books/the idiot/page (503).png',
    'books/the idiot/page (504).png',
    'books/the idiot/page (505).png',
    'books/the idiot/page (506).png',
    'books/the idiot/page (507).png',
    'books/the idiot/page (508).png',
    'books/the idiot/page (509).png',
    'books/the idiot/page (510).png',
    'books/the idiot/page (511).png',
    'books/the idiot/page (512).png',
    'books/the idiot/page (513).png',
    'books/the idiot/page (514).png',
    'books/the idiot/page (515).png',
    'books/the idiot/page (516).png',
    'books/the idiot/page (517).png',
    'books/the idiot/page (518).png',
    'books/the idiot/page (519).png',
    'books/the idiot/page (520).png',
    'books/the idiot/page (521).png',
    'books/the idiot/page (522).png',
    'books/the idiot/page (523).png',
    'books/the idiot/page (524).png',
    'books/the idiot/page (525).png',
    'books/the idiot/page (526).png',
    'books/the idiot/page (527).png',
    'books/the idiot/page (528).png',
    'books/the idiot/page (529).png',
    'books/the idiot/page (530).png',
    'books/the idiot/page (531).png',
    'books/the idiot/page (532).png',
    'books/the idiot/page (533).png',
    'books/the idiot/page (534).png',
    'books/the idiot/page (535).png',
    'books/the idiot/page (536).png',
    'books/the idiot/page (537).png',
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
