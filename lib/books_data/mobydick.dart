import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mobydick extends StatefulWidget {
  const mobydick({Key? key}) : super(key: key);

  @override
  State<mobydick> createState() => _mobydickState();
}

class _mobydickState extends State<mobydick> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/moby dick/page (1).png',
    'books/moby dick/page (2).png',
    'books/moby dick/page (3).png',
    'books/moby dick/page (4).png',
    'books/moby dick/page (5).png',
    'books/moby dick/page (6).png',
    'books/moby dick/page (7).png',
    'books/moby dick/page (8).png',
    'books/moby dick/page (9).png',
    'books/moby dick/page (10).png',
    'books/moby dick/page (11).png',
    'books/moby dick/page (12).png',
    'books/moby dick/page (13).png',
    'books/moby dick/page (14).png',
    'books/moby dick/page (15).png',
    'books/moby dick/page (16).png',
    'books/moby dick/page (17).png',
    'books/moby dick/page (18).png',
    'books/moby dick/page (19).png',
    'books/moby dick/page (20).png',
    'books/moby dick/page (21).png',
    'books/moby dick/page (22).png',
    'books/moby dick/page (23).png',
    'books/moby dick/page (24).png',
    'books/moby dick/page (25).png',
    'books/moby dick/page (26).png',
    'books/moby dick/page (27).png',
    'books/moby dick/page (28).png',
    'books/moby dick/page (29).png',
    'books/moby dick/page (30).png',
    'books/moby dick/page (31).png',
    'books/moby dick/page (32).png',
    'books/moby dick/page (33).png',
    'books/moby dick/page (34).png',
    'books/moby dick/page (35).png',
    'books/moby dick/page (36).png',
    'books/moby dick/page (37).png',
    'books/moby dick/page (38).png',
    'books/moby dick/page (39).png',
    'books/moby dick/page (40).png',
    'books/moby dick/page (41).png',
    'books/moby dick/page (42).png',
    'books/moby dick/page (43).png',
    'books/moby dick/page (44).png',
    'books/moby dick/page (45).png',
    'books/moby dick/page (46).png',
    'books/moby dick/page (47).png',
    'books/moby dick/page (48).png',
    'books/moby dick/page (49).png',
    'books/moby dick/page (50).png',
    'books/moby dick/page (51).png',
    'books/moby dick/page (52).png',
    'books/moby dick/page (53).png',
    'books/moby dick/page (54).png',
    'books/moby dick/page (55).png',
    'books/moby dick/page (56).png',
    'books/moby dick/page (57).png',
    'books/moby dick/page (58).png',
    'books/moby dick/page (59).png',
    'books/moby dick/page (60).png',
    'books/moby dick/page (61).png',
    'books/moby dick/page (62).png',
    'books/moby dick/page (63).png',
    'books/moby dick/page (64).png',
    'books/moby dick/page (65).png',
    'books/moby dick/page (66).png',
    'books/moby dick/page (67).png',
    'books/moby dick/page (68).png',
    'books/moby dick/page (69).png',
    'books/moby dick/page (70).png',
    'books/moby dick/page (71).png',
    'books/moby dick/page (72).png',
    'books/moby dick/page (73).png',
    'books/moby dick/page (74).png',
    'books/moby dick/page (75).png',
    'books/moby dick/page (76).png',
    'books/moby dick/page (77).png',
    'books/moby dick/page (78).png',
    'books/moby dick/page (79).png',
    'books/moby dick/page (80).png',
    'books/moby dick/page (81).png',
    'books/moby dick/page (82).png',
    'books/moby dick/page (83).png',
    'books/moby dick/page (84).png',
    'books/moby dick/page (85).png',
    'books/moby dick/page (86).png',
    'books/moby dick/page (87).png',
    'books/moby dick/page (88).png',
    'books/moby dick/page (89).png',
    'books/moby dick/page (90).png',
    'books/moby dick/page (91).png',
    'books/moby dick/page (92).png',
    'books/moby dick/page (93).png',
    'books/moby dick/page (94).png',
    'books/moby dick/page (95).png',
    'books/moby dick/page (96).png',
    'books/moby dick/page (97).png',
    'books/moby dick/page (98).png',
    'books/moby dick/page (99).png',
    'books/moby dick/page (100).png',
    'books/moby dick/page (101).png',
    'books/moby dick/page (102).png',
    'books/moby dick/page (103).png',
    'books/moby dick/page (104).png',
    'books/moby dick/page (105).png',
    'books/moby dick/page (106).png',
    'books/moby dick/page (107).png',
    'books/moby dick/page (108).png',
    'books/moby dick/page (109).png',
    'books/moby dick/page (110).png',
    'books/moby dick/page (111).png',
    'books/moby dick/page (112).png',
    'books/moby dick/page (113).png',
    'books/moby dick/page (114).png',
    'books/moby dick/page (115).png',
    'books/moby dick/page (116).png',
    'books/moby dick/page (117).png',
    'books/moby dick/page (118).png',
    'books/moby dick/page (119).png',
    'books/moby dick/page (120).png',
    'books/moby dick/page (121).png',
    'books/moby dick/page (122).png',
    'books/moby dick/page (123).png',
    'books/moby dick/page (124).png',
    'books/moby dick/page (125).png',
    'books/moby dick/page (126).png',
    'books/moby dick/page (127).png',
    'books/moby dick/page (128).png',
    'books/moby dick/page (129).png',
    'books/moby dick/page (130).png',
    'books/moby dick/page (131).png',
    'books/moby dick/page (132).png',
    'books/moby dick/page (133).png',
    'books/moby dick/page (134).png',
    'books/moby dick/page (135).png',
    'books/moby dick/page (136).png',
    'books/moby dick/page (137).png',
    'books/moby dick/page (138).png',
    'books/moby dick/page (139).png',
    'books/moby dick/page (140).png',
    'books/moby dick/page (141).png',
    'books/moby dick/page (142).png',
    'books/moby dick/page (143).png',
    'books/moby dick/page (144).png',
    'books/moby dick/page (145).png',
    'books/moby dick/page (146).png',
    'books/moby dick/page (147).png',
    'books/moby dick/page (148).png',
    'books/moby dick/page (149).png',
    'books/moby dick/page (150).png',
    'books/moby dick/page (151).png',
    'books/moby dick/page (152).png',
    'books/moby dick/page (153).png',
    'books/moby dick/page (154).png',
    'books/moby dick/page (155).png',
    'books/moby dick/page (156).png',
    'books/moby dick/page (157).png',
    'books/moby dick/page (158).png',
    'books/moby dick/page (159).png',
    'books/moby dick/page (160).png',
    'books/moby dick/page (161).png',
    'books/moby dick/page (162).png',
    'books/moby dick/page (163).png',
    'books/moby dick/page (164).png',
    'books/moby dick/page (165).png',
    'books/moby dick/page (166).png',
    'books/moby dick/page (167).png',
    'books/moby dick/page (168).png',
    'books/moby dick/page (169).png',
    'books/moby dick/page (170).png',
    'books/moby dick/page (171).png',
    'books/moby dick/page (172).png',
    'books/moby dick/page (173).png',
    'books/moby dick/page (174).png',
    'books/moby dick/page (175).png',
    'books/moby dick/page (176).png',
    'books/moby dick/page (177).png',
    'books/moby dick/page (178).png',
    'books/moby dick/page (179).png',
    'books/moby dick/page (180).png',
    'books/moby dick/page (181).png',
    'books/moby dick/page (182).png',
    'books/moby dick/page (183).png',
    'books/moby dick/page (184).png',
    'books/moby dick/page (185).png',
    'books/moby dick/page (186).png',
    'books/moby dick/page (187).png',
    'books/moby dick/page (188).png',
    'books/moby dick/page (189).png',
    'books/moby dick/page (190).png',
    'books/moby dick/page (191).png',
    'books/moby dick/page (192).png',
    'books/moby dick/page (193).png',
    'books/moby dick/page (194).png',
    'books/moby dick/page (195).png',
    'books/moby dick/page (196).png',
    'books/moby dick/page (197).png',
    'books/moby dick/page (198).png',
    'books/moby dick/page (199).png',
    'books/moby dick/page (200).png',
    'books/moby dick/page (201).png',
    'books/moby dick/page (202).png',
    'books/moby dick/page (203).png',
    'books/moby dick/page (204).png',
    'books/moby dick/page (205).png',
    'books/moby dick/page (206).png',
    'books/moby dick/page (207).png',
    'books/moby dick/page (208).png',
    'books/moby dick/page (209).png',
    'books/moby dick/page (210).png',
    'books/moby dick/page (211).png',
    'books/moby dick/page (212).png',
    'books/moby dick/page (213).png',
    'books/moby dick/page (214).png',
    'books/moby dick/page (215).png',
    'books/moby dick/page (216).png',
    'books/moby dick/page (217).png',
    'books/moby dick/page (218).png',
    'books/moby dick/page (219).png',
    'books/moby dick/page (220).png',
    'books/moby dick/page (221).png',
    'books/moby dick/page (222).png',
    'books/moby dick/page (223).png',
    'books/moby dick/page (224).png',
    'books/moby dick/page (225).png',
    'books/moby dick/page (226).png',
    'books/moby dick/page (227).png',
    'books/moby dick/page (228).png',
    'books/moby dick/page (229).png',
    'books/moby dick/page (230).png',
    'books/moby dick/page (231).png',
    'books/moby dick/page (232).png',
    'books/moby dick/page (233).png',
    'books/moby dick/page (234).png',
    'books/moby dick/page (235).png',
    'books/moby dick/page (236).png',
    'books/moby dick/page (237).png',
    'books/moby dick/page (238).png',
    'books/moby dick/page (239).png',
    'books/moby dick/page (240).png',
    'books/moby dick/page (241).png',
    'books/moby dick/page (242).png',
    'books/moby dick/page (243).png',
    'books/moby dick/page (244).png',
    'books/moby dick/page (245).png',
    'books/moby dick/page (246).png',
    'books/moby dick/page (247).png',
    'books/moby dick/page (248).png',
    'books/moby dick/page (249).png',
    'books/moby dick/page (250).png',
    'books/moby dick/page (251).png',
    'books/moby dick/page (252).png',
    'books/moby dick/page (253).png',
    'books/moby dick/page (254).png',
    'books/moby dick/page (255).png',
    'books/moby dick/page (256).png',
    'books/moby dick/page (257).png',
    'books/moby dick/page (258).png',
    'books/moby dick/page (259).png',
    'books/moby dick/page (260).png',
    'books/moby dick/page (261).png',
    'books/moby dick/page (262).png',
    'books/moby dick/page (263).png',
    'books/moby dick/page (264).png',
    'books/moby dick/page (265).png',
    'books/moby dick/page (266).png',
    'books/moby dick/page (267).png',
    'books/moby dick/page (268).png',
    'books/moby dick/page (269).png',
    'books/moby dick/page (270).png',
    'books/moby dick/page (271).png',
    'books/moby dick/page (272).png',
    'books/moby dick/page (273).png',
    'books/moby dick/page (274).png',
    'books/moby dick/page (275).png',
    'books/moby dick/page (276).png',
    'books/moby dick/page (277).png',
    'books/moby dick/page (278).png',
    'books/moby dick/page (279).png',
    'books/moby dick/page (280).png',
    'books/moby dick/page (281).png',
    'books/moby dick/page (282).png',
    'books/moby dick/page (283).png',
    'books/moby dick/page (284).png',
    'books/moby dick/page (285).png',
    'books/moby dick/page (286).png',
    'books/moby dick/page (287).png',
    'books/moby dick/page (288).png',
    'books/moby dick/page (289).png',
    'books/moby dick/page (290).png',
    'books/moby dick/page (291).png',
    'books/moby dick/page (292).png',
    'books/moby dick/page (293).png',
    'books/moby dick/page (294).png',
    'books/moby dick/page (295).png',
    'books/moby dick/page (296).png',
    'books/moby dick/page (297).png',
    'books/moby dick/page (298).png',
    'books/moby dick/page (299).png',
    'books/moby dick/page (300).png',
    'books/moby dick/page (301).png',
    'books/moby dick/page (302).png',
    'books/moby dick/page (303).png',
    'books/moby dick/page (304).png',
    'books/moby dick/page (305).png',
    'books/moby dick/page (306).png',
    'books/moby dick/page (307).png',
    'books/moby dick/page (308).png',
    'books/moby dick/page (309).png',
    'books/moby dick/page (310).png',
    'books/moby dick/page (311).png',
    'books/moby dick/page (312).png',
    'books/moby dick/page (313).png',
    'books/moby dick/page (314).png',
    'books/moby dick/page (315).png',
    'books/moby dick/page (316).png',
    'books/moby dick/page (317).png',
    'books/moby dick/page (318).png',
    'books/moby dick/page (319).png',
    'books/moby dick/page (320).png',
    'books/moby dick/page (321).png',
    'books/moby dick/page (322).png',
    'books/moby dick/page (323).png',
    'books/moby dick/page (324).png',
    'books/moby dick/page (325).png',
    'books/moby dick/page (326).png',
    'books/moby dick/page (327).png',
    'books/moby dick/page (328).png',
    'books/moby dick/page (329).png',
    'books/moby dick/page (330).png',
    'books/moby dick/page (331).png',
    'books/moby dick/page (332).png',
    'books/moby dick/page (333).png',
    'books/moby dick/page (334).png',
    'books/moby dick/page (335).png',
    'books/moby dick/page (336).png',
    'books/moby dick/page (337).png',
    'books/moby dick/page (338).png',
    'books/moby dick/page (339).png',
    'books/moby dick/page (340).png',
    'books/moby dick/page (341).png',
    'books/moby dick/page (342).png',
    'books/moby dick/page (343).png',
    'books/moby dick/page (344).png',
    'books/moby dick/page (345).png',
    'books/moby dick/page (346).png',
    'books/moby dick/page (347).png',
    'books/moby dick/page (348).png',
    'books/moby dick/page (349).png',
    'books/moby dick/page (350).png',
    'books/moby dick/page (351).png',
    'books/moby dick/page (352).png',
    'books/moby dick/page (353).png',
    'books/moby dick/page (354).png',
    'books/moby dick/page (355).png',
    'books/moby dick/page (356).png',
    'books/moby dick/page (357).png',
    'books/moby dick/page (358).png',
    'books/moby dick/page (359).png',
    'books/moby dick/page (360).png',
    'books/moby dick/page (361).png',
    'books/moby dick/page (362).png',
    'books/moby dick/page (363).png',
    'books/moby dick/page (364).png',
    'books/moby dick/page (365).png',
    'books/moby dick/page (366).png',
    'books/moby dick/page (367).png',
    'books/moby dick/page (368).png',
    'books/moby dick/page (369).png',
    'books/moby dick/page (370).png',
    'books/moby dick/page (371).png',
    'books/moby dick/page (372).png',
    'books/moby dick/page (373).png',
    'books/moby dick/page (374).png',
    'books/moby dick/page (375).png',
    'books/moby dick/page (376).png',
    'books/moby dick/page (377).png',
    'books/moby dick/page (378).png',
    'books/moby dick/page (379).png',
    'books/moby dick/page (380).png',
    'books/moby dick/page (381).png',
    'books/moby dick/page (382).png',
    'books/moby dick/page (383).png',
    'books/moby dick/page (384).png',
    'books/moby dick/page (385).png',
    'books/moby dick/page (386).png',
    'books/moby dick/page (387).png',
    'books/moby dick/page (388).png',
    'books/moby dick/page (389).png',
    'books/moby dick/page (390).png',
    'books/moby dick/page (391).png',
    'books/moby dick/page (392).png',
    'books/moby dick/page (393).png',
    'books/moby dick/page (394).png',
    'books/moby dick/page (395).png',
    'books/moby dick/page (396).png',
    'books/moby dick/page (397).png',
    'books/moby dick/page (398).png',
    'books/moby dick/page (399).png',
    'books/moby dick/page (400).png',
    'books/moby dick/page (401).png',
    'books/moby dick/page (402).png',
    'books/moby dick/page (403).png',
    'books/moby dick/page (404).png',
    'books/moby dick/page (405).png',
    'books/moby dick/page (406).png',
    'books/moby dick/page (407).png',
    'books/moby dick/page (408).png',
    'books/moby dick/page (409).png',
    'books/moby dick/page (410).png',
    'books/moby dick/page (411).png',
    'books/moby dick/page (412).png',
    'books/moby dick/page (413).png',
    'books/moby dick/page (414).png',
    'books/moby dick/page (415).png',
    'books/moby dick/page (416).png',
    'books/moby dick/page (417).png',
    'books/moby dick/page (418).png',
    'books/moby dick/page (419).png',
    'books/moby dick/page (420).png',
    'books/moby dick/page (421).png',
    'books/moby dick/page (422).png',
    'books/moby dick/page (423).png',
    'books/moby dick/page (424).png',
    'books/moby dick/page (425).png',
    'books/moby dick/page (426).png',
    'books/moby dick/page (427).png',
    'books/moby dick/page (428).png',
    'books/moby dick/page (429).png',
    'books/moby dick/page (430).png',
    'books/moby dick/page (431).png',
    'books/moby dick/page (432).png',
    'books/moby dick/page (433).png',
    'books/moby dick/page (434).png',
    'books/moby dick/page (435).png',
    'books/moby dick/page (436).png',
    'books/moby dick/page (437).png',
    'books/moby dick/page (438).png',
    'books/moby dick/page (439).png',
    'books/moby dick/page (440).png',
    'books/moby dick/page (441).png',
    'books/moby dick/page (442).png',
    'books/moby dick/page (443).png',
    'books/moby dick/page (444).png',
    'books/moby dick/page (445).png',
    'books/moby dick/page (446).png',
    'books/moby dick/page (447).png',
    'books/moby dick/page (448).png',
    'books/moby dick/page (449).png',
    'books/moby dick/page (450).png',
    'books/moby dick/page (451).png',
    'books/moby dick/page (452).png',
    'books/moby dick/page (453).png',
    'books/moby dick/page (454).png',
    'books/moby dick/page (455).png',
    'books/moby dick/page (456).png',
    'books/moby dick/page (457).png',
    'books/moby dick/page (458).png',
    'books/moby dick/page (459).png',
    'books/moby dick/page (460).png',
    'books/moby dick/page (461).png',
    'books/moby dick/page (462).png',
    'books/moby dick/page (463).png',
    'books/moby dick/page (464).png',
    'books/moby dick/page (465).png',
    'books/moby dick/page (466).png',
    'books/moby dick/page (467).png',
    'books/moby dick/page (468).png',
    'books/moby dick/page (469).png',
    'books/moby dick/page (470).png',
    'books/moby dick/page (471).png',
    'books/moby dick/page (472).png',
    'books/moby dick/page (473).png',
    'books/moby dick/page (474).png',
    'books/moby dick/page (475).png',
    'books/moby dick/page (476).png',
    'books/moby dick/page (477).png',
    'books/moby dick/page (478).png',
    'books/moby dick/page (479).png',
    'books/moby dick/page (480).png',
    'books/moby dick/page (481).png',
    'books/moby dick/page (482).png',
    'books/moby dick/page (483).png',
    'books/moby dick/page (484).png',
    'books/moby dick/page (485).png',
    'books/moby dick/page (486).png',
    'books/moby dick/page (487).png',
    'books/moby dick/page (488).png',
    'books/moby dick/page (489).png',
    'books/moby dick/page (490).png',
    'books/moby dick/page (491).png',
    'books/moby dick/page (492).png',
    'books/moby dick/page (493).png',
    'books/moby dick/page (494).png',
    'books/moby dick/page (495).png',
    'books/moby dick/page (496).png',
    'books/moby dick/page (497).png',
    'books/moby dick/page (498).png',
    'books/moby dick/page (499).png',
    'books/moby dick/page (500).png',
    'books/moby dick/page (501).png',
    'books/moby dick/page (502).png',
    'books/moby dick/page (503).png',
    'books/moby dick/page (504).png',
    'books/moby dick/page (505).png',
    'books/moby dick/page (506).png',
    'books/moby dick/page (507).png',
    'books/moby dick/page (508).png',
    'books/moby dick/page (509).png',
    'books/moby dick/page (510).png',
    'books/moby dick/page (511).png',
    'books/moby dick/page (512).png',
    'books/moby dick/page (513).png',
    'books/moby dick/page (514).png',
    'books/moby dick/page (515).png',
    'books/moby dick/page (516).png',
    'books/moby dick/page (517).png',
    'books/moby dick/page (518).png',
    'books/moby dick/page (519).png',
    'books/moby dick/page (520).png',
    'books/moby dick/page (521).png',
    'books/moby dick/page (522).png',
    'books/moby dick/page (523).png',
    'books/moby dick/page (524).png',
    'books/moby dick/page (525).png',
    'books/moby dick/page (526).png',
    'books/moby dick/page (527).png',
    'books/moby dick/page (528).png',
    'books/moby dick/page (529).png',
    'books/moby dick/page (530).png',
    'books/moby dick/page (531).png',
    'books/moby dick/page (532).png',
    'books/moby dick/page (533).png',
    'books/moby dick/page (534).png',
    'books/moby dick/page (535).png',
    'books/moby dick/page (536).png',
    'books/moby dick/page (537).png',
    'books/moby dick/page (538).png',
    'books/moby dick/page (539).png',
    'books/moby dick/page (540).png',
    'books/moby dick/page (541).png',
    'books/moby dick/page (542).png',
    'books/moby dick/page (543).png',
    'books/moby dick/page (544).png',
    'books/moby dick/page (545).png',
    'books/moby dick/page (546).png',
    'books/moby dick/page (547).png',
    'books/moby dick/page (548).png',
    'books/moby dick/page (549).png',
    'books/moby dick/page (550).png',
    'books/moby dick/page (551).png',
    'books/moby dick/page (552).png',
    'books/moby dick/page (553).png',
    'books/moby dick/page (554).png',
    'books/moby dick/page (555).png',
    'books/moby dick/page (556).png',
    'books/moby dick/page (557).png',
    'books/moby dick/page (558).png',
    'books/moby dick/page (559).png',
    'books/moby dick/page (560).png',
    'books/moby dick/page (561).png',
    'books/moby dick/page (562).png',
    'books/moby dick/page (563).png',
    'books/moby dick/page (564).png',
    'books/moby dick/page (565).png',
    'books/moby dick/page (566).png',
    'books/moby dick/page (567).png',
    'books/moby dick/page (568).png',
    'books/moby dick/page (569).png',
    'books/moby dick/page (570).png',
    'books/moby dick/page (571).png',
    'books/moby dick/page (572).png',
    'books/moby dick/page (573).png',
    'books/moby dick/page (574).png',
    'books/moby dick/page (575).png',
    'books/moby dick/page (576).png',
    'books/moby dick/page (577).png',
    'books/moby dick/page (578).png',
    'books/moby dick/page (579).png',
    'books/moby dick/page (580).png',
    'books/moby dick/page (581).png',
    'books/moby dick/page (582).png',
    'books/moby dick/page (583).png',
    'books/moby dick/page (584).png',
    'books/moby dick/page (585).png',
    'books/moby dick/page (586).png',
    'books/moby dick/page (587).png',
    'books/moby dick/page (588).png',
    'books/moby dick/page (589).png',
    'books/moby dick/page (590).png',
    'books/moby dick/page (591).png',
    'books/moby dick/page (592).png',

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
