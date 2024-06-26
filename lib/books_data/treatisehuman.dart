import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class treatisehuman extends StatefulWidget {
  const treatisehuman({Key? key}) : super(key: key);

  @override
  State<treatisehuman> createState() => _treatisehumanState();
}

class _treatisehumanState extends State<treatisehuman> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/a treatise of human nature/page (1).png',
    'books/a treatise of human nature/page (2).png',
    'books/a treatise of human nature/page (3).png',
    'books/a treatise of human nature/page (4).png',
    'books/a treatise of human nature/page (5).png',
    'books/a treatise of human nature/page (6).png',
    'books/a treatise of human nature/page (7).png',
    'books/a treatise of human nature/page (8).png',
    'books/a treatise of human nature/page (9).png',
    'books/a treatise of human nature/page (10).png',
    'books/a treatise of human nature/page (11).png',
    'books/a treatise of human nature/page (12).png',
    'books/a treatise of human nature/page (13).png',
    'books/a treatise of human nature/page (14).png',
    'books/a treatise of human nature/page (15).png',
    'books/a treatise of human nature/page (16).png',
    'books/a treatise of human nature/page (17).png',
    'books/a treatise of human nature/page (18).png',
    'books/a treatise of human nature/page (19).png',
    'books/a treatise of human nature/page (20).png',
    'books/a treatise of human nature/page (21).png',
    'books/a treatise of human nature/page (22).png',
    'books/a treatise of human nature/page (23).png',
    'books/a treatise of human nature/page (24).png',
    'books/a treatise of human nature/page (25).png',
    'books/a treatise of human nature/page (26).png',
    'books/a treatise of human nature/page (27).png',
    'books/a treatise of human nature/page (28).png',
    'books/a treatise of human nature/page (29).png',
    'books/a treatise of human nature/page (30).png',
    'books/a treatise of human nature/page (31).png',
    'books/a treatise of human nature/page (32).png',
    'books/a treatise of human nature/page (33).png',
    'books/a treatise of human nature/page (34).png',
    'books/a treatise of human nature/page (35).png',
    'books/a treatise of human nature/page (36).png',
    'books/a treatise of human nature/page (37).png',
    'books/a treatise of human nature/page (38).png',
    'books/a treatise of human nature/page (39).png',
    'books/a treatise of human nature/page (40).png',
    'books/a treatise of human nature/page (41).png',
    'books/a treatise of human nature/page (42).png',
    'books/a treatise of human nature/page (43).png',
    'books/a treatise of human nature/page (44).png',
    'books/a treatise of human nature/page (45).png',
    'books/a treatise of human nature/page (46).png',
    'books/a treatise of human nature/page (47).png',
    'books/a treatise of human nature/page (48).png',
    'books/a treatise of human nature/page (49).png',
    'books/a treatise of human nature/page (50).png',
    'books/a treatise of human nature/page (51).png',
    'books/a treatise of human nature/page (52).png',
    'books/a treatise of human nature/page (53).png',
    'books/a treatise of human nature/page (54).png',
    'books/a treatise of human nature/page (55).png',
    'books/a treatise of human nature/page (56).png',
    'books/a treatise of human nature/page (57).png',
    'books/a treatise of human nature/page (58).png',
    'books/a treatise of human nature/page (59).png',
    'books/a treatise of human nature/page (60).png',
    'books/a treatise of human nature/page (61).png',
    'books/a treatise of human nature/page (62).png',
    'books/a treatise of human nature/page (63).png',
    'books/a treatise of human nature/page (64).png',
    'books/a treatise of human nature/page (65).png',
    'books/a treatise of human nature/page (66).png',
    'books/a treatise of human nature/page (67).png',
    'books/a treatise of human nature/page (68).png',
    'books/a treatise of human nature/page (69).png',
    'books/a treatise of human nature/page (70).png',
    'books/a treatise of human nature/page (71).png',
    'books/a treatise of human nature/page (72).png',
    'books/a treatise of human nature/page (73).png',
    'books/a treatise of human nature/page (74).png',
    'books/a treatise of human nature/page (75).png',
    'books/a treatise of human nature/page (76).png',
    'books/a treatise of human nature/page (77).png',
    'books/a treatise of human nature/page (78).png',
    'books/a treatise of human nature/page (79).png',
    'books/a treatise of human nature/page (80).png',
    'books/a treatise of human nature/page (81).png',
    'books/a treatise of human nature/page (82).png',
    'books/a treatise of human nature/page (83).png',
    'books/a treatise of human nature/page (84).png',
    'books/a treatise of human nature/page (85).png',
    'books/a treatise of human nature/page (86).png',
    'books/a treatise of human nature/page (87).png',
    'books/a treatise of human nature/page (88).png',
    'books/a treatise of human nature/page (89).png',
    'books/a treatise of human nature/page (90).png',
    'books/a treatise of human nature/page (91).png',
    'books/a treatise of human nature/page (92).png',
    'books/a treatise of human nature/page (93).png',
    'books/a treatise of human nature/page (94).png',
    'books/a treatise of human nature/page (95).png',
    'books/a treatise of human nature/page (96).png',
    'books/a treatise of human nature/page (97).png',
    'books/a treatise of human nature/page (98).png',
    'books/a treatise of human nature/page (99).png',
    'books/a treatise of human nature/page (100).png',
    'books/a treatise of human nature/page (101).png',
    'books/a treatise of human nature/page (102).png',
    'books/a treatise of human nature/page (103).png',
    'books/a treatise of human nature/page (104).png',
    'books/a treatise of human nature/page (105).png',
    'books/a treatise of human nature/page (106).png',
    'books/a treatise of human nature/page (107).png',
    'books/a treatise of human nature/page (108).png',
    'books/a treatise of human nature/page (109).png',
    'books/a treatise of human nature/page (110).png',
    'books/a treatise of human nature/page (111).png',
    'books/a treatise of human nature/page (112).png',
    'books/a treatise of human nature/page (113).png',
    'books/a treatise of human nature/page (114).png',
    'books/a treatise of human nature/page (115).png',
    'books/a treatise of human nature/page (116).png',
    'books/a treatise of human nature/page (117).png',
    'books/a treatise of human nature/page (118).png',
    'books/a treatise of human nature/page (119).png',
    'books/a treatise of human nature/page (120).png',
    'books/a treatise of human nature/page (121).png',
    'books/a treatise of human nature/page (122).png',
    'books/a treatise of human nature/page (123).png',
    'books/a treatise of human nature/page (124).png',
    'books/a treatise of human nature/page (125).png',
    'books/a treatise of human nature/page (126).png',
    'books/a treatise of human nature/page (127).png',
    'books/a treatise of human nature/page (128).png',
    'books/a treatise of human nature/page (129).png',
    'books/a treatise of human nature/page (130).png',
    'books/a treatise of human nature/page (131).png',
    'books/a treatise of human nature/page (132).png',
    'books/a treatise of human nature/page (133).png',
    'books/a treatise of human nature/page (134).png',
    'books/a treatise of human nature/page (135).png',
    'books/a treatise of human nature/page (136).png',
    'books/a treatise of human nature/page (137).png',
    'books/a treatise of human nature/page (138).png',
    'books/a treatise of human nature/page (139).png',
    'books/a treatise of human nature/page (140).png',
    'books/a treatise of human nature/page (141).png',
    'books/a treatise of human nature/page (142).png',
    'books/a treatise of human nature/page (143).png',
    'books/a treatise of human nature/page (144).png',
    'books/a treatise of human nature/page (145).png',
    'books/a treatise of human nature/page (146).png',
    'books/a treatise of human nature/page (147).png',
    'books/a treatise of human nature/page (148).png',
    'books/a treatise of human nature/page (149).png',
    'books/a treatise of human nature/page (150).png',
    'books/a treatise of human nature/page (151).png',
    'books/a treatise of human nature/page (152).png',
    'books/a treatise of human nature/page (153).png',
    'books/a treatise of human nature/page (154).png',
    'books/a treatise of human nature/page (155).png',
    'books/a treatise of human nature/page (156).png',
    'books/a treatise of human nature/page (157).png',
    'books/a treatise of human nature/page (158).png',
    'books/a treatise of human nature/page (159).png',
    'books/a treatise of human nature/page (160).png',
    'books/a treatise of human nature/page (161).png',
    'books/a treatise of human nature/page (162).png',
    'books/a treatise of human nature/page (163).png',
    'books/a treatise of human nature/page (164).png',
    'books/a treatise of human nature/page (165).png',
    'books/a treatise of human nature/page (166).png',
    'books/a treatise of human nature/page (167).png',
    'books/a treatise of human nature/page (168).png',
    'books/a treatise of human nature/page (169).png',
    'books/a treatise of human nature/page (170).png',
    'books/a treatise of human nature/page (171).png',
    'books/a treatise of human nature/page (172).png',
    'books/a treatise of human nature/page (173).png',
    'books/a treatise of human nature/page (174).png',
    'books/a treatise of human nature/page (175).png',
    'books/a treatise of human nature/page (176).png',
    'books/a treatise of human nature/page (177).png',
    'books/a treatise of human nature/page (178).png',
    'books/a treatise of human nature/page (179).png',
    'books/a treatise of human nature/page (180).png',
    'books/a treatise of human nature/page (181).png',
    'books/a treatise of human nature/page (182).png',
    'books/a treatise of human nature/page (183).png',
    'books/a treatise of human nature/page (184).png',
    'books/a treatise of human nature/page (185).png',
    'books/a treatise of human nature/page (186).png',
    'books/a treatise of human nature/page (187).png',
    'books/a treatise of human nature/page (188).png',
    'books/a treatise of human nature/page (189).png',
    'books/a treatise of human nature/page (190).png',
    'books/a treatise of human nature/page (191).png',
    'books/a treatise of human nature/page (192).png',
    'books/a treatise of human nature/page (193).png',
    'books/a treatise of human nature/page (194).png',
    'books/a treatise of human nature/page (195).png',
    'books/a treatise of human nature/page (196).png',
    'books/a treatise of human nature/page (197).png',
    'books/a treatise of human nature/page (198).png',
    'books/a treatise of human nature/page (199).png',
    'books/a treatise of human nature/page (200).png',
    'books/a treatise of human nature/page (201).png',
    'books/a treatise of human nature/page (202).png',
    'books/a treatise of human nature/page (203).png',
    'books/a treatise of human nature/page (204).png',
    'books/a treatise of human nature/page (205).png',
    'books/a treatise of human nature/page (206).png',
    'books/a treatise of human nature/page (207).png',
    'books/a treatise of human nature/page (208).png',
    'books/a treatise of human nature/page (209).png',
    'books/a treatise of human nature/page (210).png',
    'books/a treatise of human nature/page (211).png',
    'books/a treatise of human nature/page (212).png',
    'books/a treatise of human nature/page (213).png',
    'books/a treatise of human nature/page (214).png',
    'books/a treatise of human nature/page (215).png',
    'books/a treatise of human nature/page (216).png',
    'books/a treatise of human nature/page (217).png',
    'books/a treatise of human nature/page (218).png',
    'books/a treatise of human nature/page (219).png',
    'books/a treatise of human nature/page (220).png',
    'books/a treatise of human nature/page (221).png',
    'books/a treatise of human nature/page (222).png',
    'books/a treatise of human nature/page (223).png',
    'books/a treatise of human nature/page (224).png',
    'books/a treatise of human nature/page (225).png',
    'books/a treatise of human nature/page (226).png',
    'books/a treatise of human nature/page (227).png',
    'books/a treatise of human nature/page (228).png',
    'books/a treatise of human nature/page (229).png',
    'books/a treatise of human nature/page (230).png',
    'books/a treatise of human nature/page (231).png',
    'books/a treatise of human nature/page (232).png',
    'books/a treatise of human nature/page (233).png',
    'books/a treatise of human nature/page (234).png',
    'books/a treatise of human nature/page (235).png',
    'books/a treatise of human nature/page (236).png',
    'books/a treatise of human nature/page (237).png',
    'books/a treatise of human nature/page (238).png',
    'books/a treatise of human nature/page (239).png',
    'books/a treatise of human nature/page (240).png',
    'books/a treatise of human nature/page (241).png',
    'books/a treatise of human nature/page (242).png',
    'books/a treatise of human nature/page (243).png',
    'books/a treatise of human nature/page (244).png',
    'books/a treatise of human nature/page (245).png',
    'books/a treatise of human nature/page (246).png',
    'books/a treatise of human nature/page (247).png',
    'books/a treatise of human nature/page (248).png',
    'books/a treatise of human nature/page (249).png',
    'books/a treatise of human nature/page (250).png',
    'books/a treatise of human nature/page (251).png',
    'books/a treatise of human nature/page (252).png',
    'books/a treatise of human nature/page (253).png',
    'books/a treatise of human nature/page (254).png',
    'books/a treatise of human nature/page (255).png',
    'books/a treatise of human nature/page (256).png',
    'books/a treatise of human nature/page (257).png',
    'books/a treatise of human nature/page (258).png',
    'books/a treatise of human nature/page (259).png',
    'books/a treatise of human nature/page (260).png',
    'books/a treatise of human nature/page (261).png',
    'books/a treatise of human nature/page (262).png',
    'books/a treatise of human nature/page (263).png',
    'books/a treatise of human nature/page (264).png',
    'books/a treatise of human nature/page (265).png',
    'books/a treatise of human nature/page (266).png',
    'books/a treatise of human nature/page (267).png',
    'books/a treatise of human nature/page (268).png',
    'books/a treatise of human nature/page (269).png',
    'books/a treatise of human nature/page (270).png',
    'books/a treatise of human nature/page (271).png',
    'books/a treatise of human nature/page (272).png',
    'books/a treatise of human nature/page (273).png',
    'books/a treatise of human nature/page (274).png',
    'books/a treatise of human nature/page (275).png',
    'books/a treatise of human nature/page (276).png',
    'books/a treatise of human nature/page (277).png',
    'books/a treatise of human nature/page (278).png',
    'books/a treatise of human nature/page (279).png',
    'books/a treatise of human nature/page (280).png',
    'books/a treatise of human nature/page (281).png',
    'books/a treatise of human nature/page (282).png',
    'books/a treatise of human nature/page (283).png',
    'books/a treatise of human nature/page (284).png',
    'books/a treatise of human nature/page (285).png',
    'books/a treatise of human nature/page (286).png',
    'books/a treatise of human nature/page (287).png',
    'books/a treatise of human nature/page (288).png',
    'books/a treatise of human nature/page (289).png',
    'books/a treatise of human nature/page (290).png',
    'books/a treatise of human nature/page (291).png',
    'books/a treatise of human nature/page (292).png',
    'books/a treatise of human nature/page (293).png',
    'books/a treatise of human nature/page (294).png',
    'books/a treatise of human nature/page (295).png',
    'books/a treatise of human nature/page (296).png',
    'books/a treatise of human nature/page (297).png',
    'books/a treatise of human nature/page (298).png',
    'books/a treatise of human nature/page (299).png',
    'books/a treatise of human nature/page (300).png',
    'books/a treatise of human nature/page (301).png',
    'books/a treatise of human nature/page (302).png',
    'books/a treatise of human nature/page (303).png',
    'books/a treatise of human nature/page (304).png',
    'books/a treatise of human nature/page (305).png',
    'books/a treatise of human nature/page (306).png',
    'books/a treatise of human nature/page (307).png',
    'books/a treatise of human nature/page (308).png',
    'books/a treatise of human nature/page (309).png',
    'books/a treatise of human nature/page (310).png',
    'books/a treatise of human nature/page (311).png',
    'books/a treatise of human nature/page (312).png',
    'books/a treatise of human nature/page (313).png',
    'books/a treatise of human nature/page (314).png',
    'books/a treatise of human nature/page (315).png',
    'books/a treatise of human nature/page (316).png',
    'books/a treatise of human nature/page (317).png',
    'books/a treatise of human nature/page (318).png',
    'books/a treatise of human nature/page (319).png',
    'books/a treatise of human nature/page (320).png',
    'books/a treatise of human nature/page (321).png',
    'books/a treatise of human nature/page (322).png',
    'books/a treatise of human nature/page (323).png',
    'books/a treatise of human nature/page (324).png',
    'books/a treatise of human nature/page (325).png',
    'books/a treatise of human nature/page (326).png',
    'books/a treatise of human nature/page (327).png',
    'books/a treatise of human nature/page (328).png',
    'books/a treatise of human nature/page (329).png',
    'books/a treatise of human nature/page (330).png',
    'books/a treatise of human nature/page (331).png',
    'books/a treatise of human nature/page (332).png',
    'books/a treatise of human nature/page (333).png',
    'books/a treatise of human nature/page (334).png',
    'books/a treatise of human nature/page (335).png',
    'books/a treatise of human nature/page (336).png',
    'books/a treatise of human nature/page (337).png',
    'books/a treatise of human nature/page (338).png',
    'books/a treatise of human nature/page (339).png',
    'books/a treatise of human nature/page (340).png',
    'books/a treatise of human nature/page (341).png',
    'books/a treatise of human nature/page (342).png',
    'books/a treatise of human nature/page (343).png',
    'books/a treatise of human nature/page (344).png',
    'books/a treatise of human nature/page (345).png',
    'books/a treatise of human nature/page (346).png',
    'books/a treatise of human nature/page (347).png',
    'books/a treatise of human nature/page (348).png',
    'books/a treatise of human nature/page (349).png',
    'books/a treatise of human nature/page (350).png',
    'books/a treatise of human nature/page (351).png',
    'books/a treatise of human nature/page (352).png',
    'books/a treatise of human nature/page (353).png',
    'books/a treatise of human nature/page (354).png',
    'books/a treatise of human nature/page (355).png',
    'books/a treatise of human nature/page (356).png',
    'books/a treatise of human nature/page (357).png',
    'books/a treatise of human nature/page (358).png',
    'books/a treatise of human nature/page (359).png',
    'books/a treatise of human nature/page (360).png',
    'books/a treatise of human nature/page (361).png',
    'books/a treatise of human nature/page (362).png',
    'books/a treatise of human nature/page (363).png',
    'books/a treatise of human nature/page (364).png',
    'books/a treatise of human nature/page (365).png',
    'books/a treatise of human nature/page (366).png',
    'books/a treatise of human nature/page (367).png',
    'books/a treatise of human nature/page (368).png',
    'books/a treatise of human nature/page (369).png',
    'books/a treatise of human nature/page (370).png',
    'books/a treatise of human nature/page (371).png',
    'books/a treatise of human nature/page (372).png',
    'books/a treatise of human nature/page (373).png',
    'books/a treatise of human nature/page (374).png',
    'books/a treatise of human nature/page (375).png',
    'books/a treatise of human nature/page (376).png',
    'books/a treatise of human nature/page (377).png',
    'books/a treatise of human nature/page (378).png',
    'books/a treatise of human nature/page (379).png',
    'books/a treatise of human nature/page (380).png',
    'books/a treatise of human nature/page (381).png',
    'books/a treatise of human nature/page (382).png',
    'books/a treatise of human nature/page (383).png',
    'books/a treatise of human nature/page (384).png',
    'books/a treatise of human nature/page (385).png',
    'books/a treatise of human nature/page (386).png',
    'books/a treatise of human nature/page (387).png',
    'books/a treatise of human nature/page (388).png',
    'books/a treatise of human nature/page (389).png',
    'books/a treatise of human nature/page (390).png',
    'books/a treatise of human nature/page (391).png',
    'books/a treatise of human nature/page (392).png',
    'books/a treatise of human nature/page (393).png',
    'books/a treatise of human nature/page (394).png',
    'books/a treatise of human nature/page (395).png',
    'books/a treatise of human nature/page (396).png',
    'books/a treatise of human nature/page (397).png',
    'books/a treatise of human nature/page (398).png',
    'books/a treatise of human nature/page (399).png',
    'books/a treatise of human nature/page (400).png',
    'books/a treatise of human nature/page (401).png',
    'books/a treatise of human nature/page (402).png',
    'books/a treatise of human nature/page (403).png',
    'books/a treatise of human nature/page (404).png',
    'books/a treatise of human nature/page (405).png',
    'books/a treatise of human nature/page (406).png',
    'books/a treatise of human nature/page (407).png',
    'books/a treatise of human nature/page (408).png',
    'books/a treatise of human nature/page (409).png',
    'books/a treatise of human nature/page (410).png',
    'books/a treatise of human nature/page (411).png',
    'books/a treatise of human nature/page (412).png',
    'books/a treatise of human nature/page (413).png',
    'books/a treatise of human nature/page (414).png',
    'books/a treatise of human nature/page (415).png',
    'books/a treatise of human nature/page (416).png',
    'books/a treatise of human nature/page (417).png',
    'books/a treatise of human nature/page (418).png',
    'books/a treatise of human nature/page (419).png',
    'books/a treatise of human nature/page (420).png',
    'books/a treatise of human nature/page (421).png',
    'books/a treatise of human nature/page (422).png',
    'books/a treatise of human nature/page (423).png',
    'books/a treatise of human nature/page (424).png',
    'books/a treatise of human nature/page (425).png',
    'books/a treatise of human nature/page (426).png',
    'books/a treatise of human nature/page (427).png',
    'books/a treatise of human nature/page (428).png',
    'books/a treatise of human nature/page (429).png',
    'books/a treatise of human nature/page (430).png',
    'books/a treatise of human nature/page (431).png',
    'books/a treatise of human nature/page (432).png',
    'books/a treatise of human nature/page (433).png',
    'books/a treatise of human nature/page (434).png',
    'books/a treatise of human nature/page (435).png',
    'books/a treatise of human nature/page (436).png',
    'books/a treatise of human nature/page (437).png',
    'books/a treatise of human nature/page (438).png',
    'books/a treatise of human nature/page (439).png',
    'books/a treatise of human nature/page (440).png',
    'books/a treatise of human nature/page (441).png',
    'books/a treatise of human nature/page (442).png',
    'books/a treatise of human nature/page (443).png',
    'books/a treatise of human nature/page (444).png',
    'books/a treatise of human nature/page (445).png',
    'books/a treatise of human nature/page (446).png',
    'books/a treatise of human nature/page (447).png',
    'books/a treatise of human nature/page (448).png',
    'books/a treatise of human nature/page (449).png',
    'books/a treatise of human nature/page (450).png',
    'books/a treatise of human nature/page (451).png',
    'books/a treatise of human nature/page (452).png',
    'books/a treatise of human nature/page (453).png',
    'books/a treatise of human nature/page (454).png',
    'books/a treatise of human nature/page (455).png',
    'books/a treatise of human nature/page (456).png',
    'books/a treatise of human nature/page (457).png',
    'books/a treatise of human nature/page (458).png',
    'books/a treatise of human nature/page (459).png',
    'books/a treatise of human nature/page (460).png',
    'books/a treatise of human nature/page (461).png',
    'books/a treatise of human nature/page (462).png',
    'books/a treatise of human nature/page (463).png',
    'books/a treatise of human nature/page (464).png',
    'books/a treatise of human nature/page (465).png',
    'books/a treatise of human nature/page (466).png',
    'books/a treatise of human nature/page (467).png',
    'books/a treatise of human nature/page (468).png',
    'books/a treatise of human nature/page (469).png',
    'books/a treatise of human nature/page (470).png',
    'books/a treatise of human nature/page (471).png',
    'books/a treatise of human nature/page (472).png',
    'books/a treatise of human nature/page (473).png',
    'books/a treatise of human nature/page (474).png',
    'books/a treatise of human nature/page (475).png',
    'books/a treatise of human nature/page (476).png',
    'books/a treatise of human nature/page (477).png',
    'books/a treatise of human nature/page (478).png',
    'books/a treatise of human nature/page (479).png',
    'books/a treatise of human nature/page (480).png',
    'books/a treatise of human nature/page (481).png',
    'books/a treatise of human nature/page (482).png',
    'books/a treatise of human nature/page (483).png',
    'books/a treatise of human nature/page (484).png',
    'books/a treatise of human nature/page (485).png',
    'books/a treatise of human nature/page (486).png',
    'books/a treatise of human nature/page (487).png',
    'books/a treatise of human nature/page (488).png',
    'books/a treatise of human nature/page (489).png',
    'books/a treatise of human nature/page (490).png',
    'books/a treatise of human nature/page (491).png',
    'books/a treatise of human nature/page (492).png',
    'books/a treatise of human nature/page (493).png',
    'books/a treatise of human nature/page (494).png',
    'books/a treatise of human nature/page (495).png',
    'books/a treatise of human nature/page (496).png',
    'books/a treatise of human nature/page (497).png',
    'books/a treatise of human nature/page (498).png',
    'books/a treatise of human nature/page (499).png',
    'books/a treatise of human nature/page (500).png',
    'books/a treatise of human nature/page (501).png',
    'books/a treatise of human nature/page (502).png',
    'books/a treatise of human nature/page (503).png',
    'books/a treatise of human nature/page (504).png',
    'books/a treatise of human nature/page (505).png',
    'books/a treatise of human nature/page (506).png',
    'books/a treatise of human nature/page (507).png',
    'books/a treatise of human nature/page (508).png',
    'books/a treatise of human nature/page (509).png',
    'books/a treatise of human nature/page (510).png',
    'books/a treatise of human nature/page (511).png',
    'books/a treatise of human nature/page (512).png',
    'books/a treatise of human nature/page (513).png',
    'books/a treatise of human nature/page (514).png',
    'books/a treatise of human nature/page (515).png',
    'books/a treatise of human nature/page (516).png',
    'books/a treatise of human nature/page (517).png',
    'books/a treatise of human nature/page (518).png',
    'books/a treatise of human nature/page (519).png',
    'books/a treatise of human nature/page (520).png',
    'books/a treatise of human nature/page (521).png',
    'books/a treatise of human nature/page (522).png',
    'books/a treatise of human nature/page (523).png',
    'books/a treatise of human nature/page (524).png',
    'books/a treatise of human nature/page (525).png',
    'books/a treatise of human nature/page (526).png',
    'books/a treatise of human nature/page (527).png',
    'books/a treatise of human nature/page (528).png',
    'books/a treatise of human nature/page (529).png',
    'books/a treatise of human nature/page (530).png',
    'books/a treatise of human nature/page (531).png',
    'books/a treatise of human nature/page (532).png',
    'books/a treatise of human nature/page (533).png',
    'books/a treatise of human nature/page (534).png',
    'books/a treatise of human nature/page (535).png',
    'books/a treatise of human nature/page (536).png',
    'books/a treatise of human nature/page (537).png',
    'books/a treatise of human nature/page (538).png',
    'books/a treatise of human nature/page (539).png',
    'books/a treatise of human nature/page (540).png',
    'books/a treatise of human nature/page (541).png',
    'books/a treatise of human nature/page (542).png',
    'books/a treatise of human nature/page (543).png',
    'books/a treatise of human nature/page (544).png',
    'books/a treatise of human nature/page (545).png',
    'books/a treatise of human nature/page (546).png',
    'books/a treatise of human nature/page (547).png',
    'books/a treatise of human nature/page (548).png',
    'books/a treatise of human nature/page (549).png',
    'books/a treatise of human nature/page (550).png',
    'books/a treatise of human nature/page (551).png',
    'books/a treatise of human nature/page (552).png',
    'books/a treatise of human nature/page (553).png',
    'books/a treatise of human nature/page (554).png',
    'books/a treatise of human nature/page (555).png',
    'books/a treatise of human nature/page (556).png',
    'books/a treatise of human nature/page (557).png',
    'books/a treatise of human nature/page (558).png',
    'books/a treatise of human nature/page (559).png',
    'books/a treatise of human nature/page (560).png',
    'books/a treatise of human nature/page (561).png',
    'books/a treatise of human nature/page (562).png',
    'books/a treatise of human nature/page (563).png',
    'books/a treatise of human nature/page (564).png',
    'books/a treatise of human nature/page (565).png',
    'books/a treatise of human nature/page (566).png',
    'books/a treatise of human nature/page (567).png',
    'books/a treatise of human nature/page (568).png',
    'books/a treatise of human nature/page (569).png',
    'books/a treatise of human nature/page (570).png',
    'books/a treatise of human nature/page (571).png',
    'books/a treatise of human nature/page (572).png',
    'books/a treatise of human nature/page (573).png',
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
