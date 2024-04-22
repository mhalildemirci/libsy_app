import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class spakezarathustra extends StatefulWidget {
  const spakezarathustra({Key? key}) : super(key: key);

  @override
  State<spakezarathustra> createState() => _spakezarathustraState();
}

class _spakezarathustraState extends State<spakezarathustra> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/thus spake zarathustra/page (1).png',
    'books/thus spake zarathustra/page (2).png',
    'books/thus spake zarathustra/page (3).png',
    'books/thus spake zarathustra/page (4).png',
    'books/thus spake zarathustra/page (5).png',
    'books/thus spake zarathustra/page (6).png',
    'books/thus spake zarathustra/page (7).png',
    'books/thus spake zarathustra/page (8).png',
    'books/thus spake zarathustra/page (9).png',
    'books/thus spake zarathustra/page (10).png',
    'books/thus spake zarathustra/page (11).png',
    'books/thus spake zarathustra/page (12).png',
    'books/thus spake zarathustra/page (13).png',
    'books/thus spake zarathustra/page (14).png',
    'books/thus spake zarathustra/page (15).png',
    'books/thus spake zarathustra/page (16).png',
    'books/thus spake zarathustra/page (17).png',
    'books/thus spake zarathustra/page (18).png',
    'books/thus spake zarathustra/page (19).png',
    'books/thus spake zarathustra/page (20).png',
    'books/thus spake zarathustra/page (21).png',
    'books/thus spake zarathustra/page (22).png',
    'books/thus spake zarathustra/page (23).png',
    'books/thus spake zarathustra/page (24).png',
    'books/thus spake zarathustra/page (25).png',
    'books/thus spake zarathustra/page (26).png',
    'books/thus spake zarathustra/page (27).png',
    'books/thus spake zarathustra/page (28).png',
    'books/thus spake zarathustra/page (29).png',
    'books/thus spake zarathustra/page (30).png',
    'books/thus spake zarathustra/page (31).png',
    'books/thus spake zarathustra/page (32).png',
    'books/thus spake zarathustra/page (33).png',
    'books/thus spake zarathustra/page (34).png',
    'books/thus spake zarathustra/page (35).png',
    'books/thus spake zarathustra/page (36).png',
    'books/thus spake zarathustra/page (37).png',
    'books/thus spake zarathustra/page (38).png',
    'books/thus spake zarathustra/page (39).png',
    'books/thus spake zarathustra/page (40).png',
    'books/thus spake zarathustra/page (41).png',
    'books/thus spake zarathustra/page (42).png',
    'books/thus spake zarathustra/page (43).png',
    'books/thus spake zarathustra/page (44).png',
    'books/thus spake zarathustra/page (45).png',
    'books/thus spake zarathustra/page (46).png',
    'books/thus spake zarathustra/page (47).png',
    'books/thus spake zarathustra/page (48).png',
    'books/thus spake zarathustra/page (49).png',
    'books/thus spake zarathustra/page (50).png',
    'books/thus spake zarathustra/page (51).png',
    'books/thus spake zarathustra/page (52).png',
    'books/thus spake zarathustra/page (53).png',
    'books/thus spake zarathustra/page (54).png',
    'books/thus spake zarathustra/page (55).png',
    'books/thus spake zarathustra/page (56).png',
    'books/thus spake zarathustra/page (57).png',
    'books/thus spake zarathustra/page (58).png',
    'books/thus spake zarathustra/page (59).png',
    'books/thus spake zarathustra/page (60).png',
    'books/thus spake zarathustra/page (61).png',
    'books/thus spake zarathustra/page (62).png',
    'books/thus spake zarathustra/page (63).png',
    'books/thus spake zarathustra/page (64).png',
    'books/thus spake zarathustra/page (65).png',
    'books/thus spake zarathustra/page (66).png',
    'books/thus spake zarathustra/page (67).png',
    'books/thus spake zarathustra/page (68).png',
    'books/thus spake zarathustra/page (69).png',
    'books/thus spake zarathustra/page (70).png',
    'books/thus spake zarathustra/page (71).png',
    'books/thus spake zarathustra/page (72).png',
    'books/thus spake zarathustra/page (73).png',
    'books/thus spake zarathustra/page (74).png',
    'books/thus spake zarathustra/page (75).png',
    'books/thus spake zarathustra/page (76).png',
    'books/thus spake zarathustra/page (77).png',
    'books/thus spake zarathustra/page (78).png',
    'books/thus spake zarathustra/page (79).png',
    'books/thus spake zarathustra/page (80).png',
    'books/thus spake zarathustra/page (81).png',
    'books/thus spake zarathustra/page (82).png',
    'books/thus spake zarathustra/page (83).png',
    'books/thus spake zarathustra/page (84).png',
    'books/thus spake zarathustra/page (85).png',
    'books/thus spake zarathustra/page (86).png',
    'books/thus spake zarathustra/page (87).png',
    'books/thus spake zarathustra/page (88).png',
    'books/thus spake zarathustra/page (89).png',
    'books/thus spake zarathustra/page (90).png',
    'books/thus spake zarathustra/page (91).png',
    'books/thus spake zarathustra/page (92).png',
    'books/thus spake zarathustra/page (93).png',
    'books/thus spake zarathustra/page (94).png',
    'books/thus spake zarathustra/page (95).png',
    'books/thus spake zarathustra/page (96).png',
    'books/thus spake zarathustra/page (97).png',
    'books/thus spake zarathustra/page (98).png',
    'books/thus spake zarathustra/page (99).png',
    'books/thus spake zarathustra/page (100).png',
    'books/thus spake zarathustra/page (101).png',
    'books/thus spake zarathustra/page (102).png',
    'books/thus spake zarathustra/page (103).png',
    'books/thus spake zarathustra/page (104).png',
    'books/thus spake zarathustra/page (105).png',
    'books/thus spake zarathustra/page (106).png',
    'books/thus spake zarathustra/page (107).png',
    'books/thus spake zarathustra/page (108).png',
    'books/thus spake zarathustra/page (109).png',
    'books/thus spake zarathustra/page (110).png',
    'books/thus spake zarathustra/page (111).png',
    'books/thus spake zarathustra/page (112).png',
    'books/thus spake zarathustra/page (113).png',
    'books/thus spake zarathustra/page (114).png',
    'books/thus spake zarathustra/page (115).png',
    'books/thus spake zarathustra/page (116).png',
    'books/thus spake zarathustra/page (117).png',
    'books/thus spake zarathustra/page (118).png',
    'books/thus spake zarathustra/page (119).png',
    'books/thus spake zarathustra/page (120).png',
    'books/thus spake zarathustra/page (121).png',
    'books/thus spake zarathustra/page (122).png',
    'books/thus spake zarathustra/page (123).png',
    'books/thus spake zarathustra/page (124).png',
    'books/thus spake zarathustra/page (125).png',
    'books/thus spake zarathustra/page (126).png',
    'books/thus spake zarathustra/page (127).png',
    'books/thus spake zarathustra/page (128).png',
    'books/thus spake zarathustra/page (129).png',
    'books/thus spake zarathustra/page (130).png',
    'books/thus spake zarathustra/page (131).png',
    'books/thus spake zarathustra/page (132).png',
    'books/thus spake zarathustra/page (133).png',
    'books/thus spake zarathustra/page (134).png',
    'books/thus spake zarathustra/page (135).png',
    'books/thus spake zarathustra/page (136).png',
    'books/thus spake zarathustra/page (137).png',
    'books/thus spake zarathustra/page (138).png',
    'books/thus spake zarathustra/page (139).png',
    'books/thus spake zarathustra/page (140).png',
    'books/thus spake zarathustra/page (141).png',
    'books/thus spake zarathustra/page (142).png',
    'books/thus spake zarathustra/page (143).png',
    'books/thus spake zarathustra/page (144).png',
    'books/thus spake zarathustra/page (145).png',
    'books/thus spake zarathustra/page (146).png',
    'books/thus spake zarathustra/page (147).png',
    'books/thus spake zarathustra/page (148).png',
    'books/thus spake zarathustra/page (149).png',
    'books/thus spake zarathustra/page (150).png',
    'books/thus spake zarathustra/page (151).png',
    'books/thus spake zarathustra/page (152).png',
    'books/thus spake zarathustra/page (153).png',
    'books/thus spake zarathustra/page (154).png',
    'books/thus spake zarathustra/page (155).png',
    'books/thus spake zarathustra/page (156).png',
    'books/thus spake zarathustra/page (157).png',
    'books/thus spake zarathustra/page (158).png',
    'books/thus spake zarathustra/page (159).png',
    'books/thus spake zarathustra/page (160).png',
    'books/thus spake zarathustra/page (161).png',
    'books/thus spake zarathustra/page (162).png',
    'books/thus spake zarathustra/page (163).png',
    'books/thus spake zarathustra/page (164).png',
    'books/thus spake zarathustra/page (165).png',
    'books/thus spake zarathustra/page (166).png',
    'books/thus spake zarathustra/page (167).png',
    'books/thus spake zarathustra/page (168).png',
    'books/thus spake zarathustra/page (169).png',
    'books/thus spake zarathustra/page (170).png',
    'books/thus spake zarathustra/page (171).png',
    'books/thus spake zarathustra/page (172).png',
    'books/thus spake zarathustra/page (173).png',
    'books/thus spake zarathustra/page (174).png',
    'books/thus spake zarathustra/page (175).png',
    'books/thus spake zarathustra/page (176).png',
    'books/thus spake zarathustra/page (177).png',
    'books/thus spake zarathustra/page (178).png',
    'books/thus spake zarathustra/page (179).png',
    'books/thus spake zarathustra/page (180).png',
    'books/thus spake zarathustra/page (181).png',
    'books/thus spake zarathustra/page (182).png',
    'books/thus spake zarathustra/page (183).png',
    'books/thus spake zarathustra/page (184).png',
    'books/thus spake zarathustra/page (185).png',
    'books/thus spake zarathustra/page (186).png',
    'books/thus spake zarathustra/page (187).png',
    'books/thus spake zarathustra/page (188).png',
    'books/thus spake zarathustra/page (189).png',
    'books/thus spake zarathustra/page (190).png',
    'books/thus spake zarathustra/page (191).png',
    'books/thus spake zarathustra/page (192).png',
    'books/thus spake zarathustra/page (193).png',
    'books/thus spake zarathustra/page (194).png',
    'books/thus spake zarathustra/page (195).png',
    'books/thus spake zarathustra/page (196).png',
    'books/thus spake zarathustra/page (197).png',
    'books/thus spake zarathustra/page (198).png',
    'books/thus spake zarathustra/page (199).png',
    'books/thus spake zarathustra/page (200).png',
    'books/thus spake zarathustra/page (201).png',
    'books/thus spake zarathustra/page (202).png',
    'books/thus spake zarathustra/page (203).png',
    'books/thus spake zarathustra/page (204).png',
    'books/thus spake zarathustra/page (205).png',
    'books/thus spake zarathustra/page (206).png',
    'books/thus spake zarathustra/page (207).png',
    'books/thus spake zarathustra/page (208).png',
    'books/thus spake zarathustra/page (209).png',
    'books/thus spake zarathustra/page (210).png',
    'books/thus spake zarathustra/page (211).png',
    'books/thus spake zarathustra/page (212).png',
    'books/thus spake zarathustra/page (213).png',
    'books/thus spake zarathustra/page (214).png',
    'books/thus spake zarathustra/page (215).png',
    'books/thus spake zarathustra/page (216).png',
    'books/thus spake zarathustra/page (217).png',
    'books/thus spake zarathustra/page (218).png',
    'books/thus spake zarathustra/page (219).png',
    'books/thus spake zarathustra/page (220).png',
    'books/thus spake zarathustra/page (221).png',
    'books/thus spake zarathustra/page (222).png',
    'books/thus spake zarathustra/page (223).png',
    'books/thus spake zarathustra/page (224).png',
    'books/thus spake zarathustra/page (225).png',
    'books/thus spake zarathustra/page (226).png',
    'books/thus spake zarathustra/page (227).png',
    'books/thus spake zarathustra/page (228).png',
    'books/thus spake zarathustra/page (229).png',
    'books/thus spake zarathustra/page (230).png',
    'books/thus spake zarathustra/page (231).png',
    'books/thus spake zarathustra/page (232).png',
    'books/thus spake zarathustra/page (233).png',
    'books/thus spake zarathustra/page (234).png',
    'books/thus spake zarathustra/page (235).png',
    'books/thus spake zarathustra/page (236).png',
    'books/thus spake zarathustra/page (237).png',
    'books/thus spake zarathustra/page (238).png',
    'books/thus spake zarathustra/page (239).png',
    'books/thus spake zarathustra/page (240).png',
    'books/thus spake zarathustra/page (241).png',
    'books/thus spake zarathustra/page (242).png',
    'books/thus spake zarathustra/page (243).png',
    'books/thus spake zarathustra/page (244).png',
    'books/thus spake zarathustra/page (245).png',
    'books/thus spake zarathustra/page (246).png',
    'books/thus spake zarathustra/page (247).png',
    'books/thus spake zarathustra/page (248).png',
    'books/thus spake zarathustra/page (249).png',
    'books/thus spake zarathustra/page (250).png',
    'books/thus spake zarathustra/page (251).png',
    'books/thus spake zarathustra/page (252).png',
    'books/thus spake zarathustra/page (253).png',
    'books/thus spake zarathustra/page (254).png',
    'books/thus spake zarathustra/page (255).png',
    'books/thus spake zarathustra/page (256).png',
    'books/thus spake zarathustra/page (257).png',
    'books/thus spake zarathustra/page (258).png',
    'books/thus spake zarathustra/page (259).png',
    'books/thus spake zarathustra/page (260).png',
    'books/thus spake zarathustra/page (261).png',
    'books/thus spake zarathustra/page (262).png',
    'books/thus spake zarathustra/page (263).png',
    'books/thus spake zarathustra/page (264).png',
    'books/thus spake zarathustra/page (265).png',
    'books/thus spake zarathustra/page (266).png',
    'books/thus spake zarathustra/page (267).png',
    'books/thus spake zarathustra/page (268).png',
    'books/thus spake zarathustra/page (269).png',
    'books/thus spake zarathustra/page (270).png',
    'books/thus spake zarathustra/page (271).png',
    'books/thus spake zarathustra/page (272).png',
    'books/thus spake zarathustra/page (273).png',
    'books/thus spake zarathustra/page (274).png',
    'books/thus spake zarathustra/page (275).png',
    'books/thus spake zarathustra/page (276).png',
    'books/thus spake zarathustra/page (277).png',
    'books/thus spake zarathustra/page (278).png',
    'books/thus spake zarathustra/page (279).png',
    'books/thus spake zarathustra/page (280).png',
    'books/thus spake zarathustra/page (281).png',
    'books/thus spake zarathustra/page (282).png',
    'books/thus spake zarathustra/page (283).png',
    'books/thus spake zarathustra/page (284).png',
    'books/thus spake zarathustra/page (285).png',
    'books/thus spake zarathustra/page (286).png',
    'books/thus spake zarathustra/page (287).png',
    'books/thus spake zarathustra/page (288).png',
    'books/thus spake zarathustra/page (289).png',
    'books/thus spake zarathustra/page (290).png',
    'books/thus spake zarathustra/page (291).png',
    'books/thus spake zarathustra/page (292).png',
    'books/thus spake zarathustra/page (293).png',
    'books/thus spake zarathustra/page (294).png',
    'books/thus spake zarathustra/page (295).png',
    'books/thus spake zarathustra/page (296).png',
    'books/thus spake zarathustra/page (297).png',
    'books/thus spake zarathustra/page (298).png',
    'books/thus spake zarathustra/page (299).png',
    'books/thus spake zarathustra/page (300).png',
    'books/thus spake zarathustra/page (301).png',
    'books/thus spake zarathustra/page (302).png',
    'books/thus spake zarathustra/page (303).png',
    'books/thus spake zarathustra/page (304).png',
    'books/thus spake zarathustra/page (305).png',
    'books/thus spake zarathustra/page (306).png',
    'books/thus spake zarathustra/page (307).png',
    'books/thus spake zarathustra/page (308).png',
    'books/thus spake zarathustra/page (309).png',
    'books/thus spake zarathustra/page (310).png',
    'books/thus spake zarathustra/page (311).png',
    'books/thus spake zarathustra/page (312).png',
    'books/thus spake zarathustra/page (313).png',
    'books/thus spake zarathustra/page (314).png',
    'books/thus spake zarathustra/page (315).png',
    'books/thus spake zarathustra/page (316).png',
    'books/thus spake zarathustra/page (317).png',
    'books/thus spake zarathustra/page (318).png',
    'books/thus spake zarathustra/page (319).png',
    'books/thus spake zarathustra/page (320).png',
    'books/thus spake zarathustra/page (321).png',
    'books/thus spake zarathustra/page (322).png',
    'books/thus spake zarathustra/page (323).png',
    'books/thus spake zarathustra/page (324).png',
    'books/thus spake zarathustra/page (325).png',
    'books/thus spake zarathustra/page (326).png',
    'books/thus spake zarathustra/page (327).png',
    'books/thus spake zarathustra/page (328).png',
    'books/thus spake zarathustra/page (329).png',
    'books/thus spake zarathustra/page (330).png',
    'books/thus spake zarathustra/page (331).png',
    'books/thus spake zarathustra/page (332).png',
    'books/thus spake zarathustra/page (333).png',
    'books/thus spake zarathustra/page (334).png',
    'books/thus spake zarathustra/page (335).png',
    'books/thus spake zarathustra/page (336).png',
    'books/thus spake zarathustra/page (337).png',
    'books/thus spake zarathustra/page (338).png',
    'books/thus spake zarathustra/page (339).png',
    'books/thus spake zarathustra/page (340).png',
    'books/thus spake zarathustra/page (341).png',
    'books/thus spake zarathustra/page (342).png',
    'books/thus spake zarathustra/page (343).png',
    'books/thus spake zarathustra/page (344).png',
    'books/thus spake zarathustra/page (345).png',
    'books/thus spake zarathustra/page (346).png',
    'books/thus spake zarathustra/page (347).png',
    'books/thus spake zarathustra/page (348).png',
    'books/thus spake zarathustra/page (349).png',
    'books/thus spake zarathustra/page (350).png',
    'books/thus spake zarathustra/page (351).png',
    'books/thus spake zarathustra/page (352).png',
    'books/thus spake zarathustra/page (353).png',
    'books/thus spake zarathustra/page (354).png',
    'books/thus spake zarathustra/page (355).png',
    'books/thus spake zarathustra/page (356).png',
    'books/thus spake zarathustra/page (357).png',
    'books/thus spake zarathustra/page (358).png',
    'books/thus spake zarathustra/page (359).png',
    'books/thus spake zarathustra/page (360).png',
    'books/thus spake zarathustra/page (361).png',
    'books/thus spake zarathustra/page (362).png',
    'books/thus spake zarathustra/page (363).png',
    'books/thus spake zarathustra/page (364).png',
    'books/thus spake zarathustra/page (365).png',
    'books/thus spake zarathustra/page (366).png',
    'books/thus spake zarathustra/page (367).png',
    'books/thus spake zarathustra/page (368).png',
    'books/thus spake zarathustra/page (369).png',
    'books/thus spake zarathustra/page (370).png',
    'books/thus spake zarathustra/page (371).png',
    'books/thus spake zarathustra/page (372).png',
    'books/thus spake zarathustra/page (373).png',
    'books/thus spake zarathustra/page (374).png',
    'books/thus spake zarathustra/page (375).png',
    'books/thus spake zarathustra/page (376).png',
    'books/thus spake zarathustra/page (377).png',
    'books/thus spake zarathustra/page (378).png',
    'books/thus spake zarathustra/page (379).png',
    'books/thus spake zarathustra/page (380).png',
    'books/thus spake zarathustra/page (381).png',
    'books/thus spake zarathustra/page (382).png',
    'books/thus spake zarathustra/page (383).png',
    'books/thus spake zarathustra/page (384).png',
    'books/thus spake zarathustra/page (385).png',
    'books/thus spake zarathustra/page (386).png',
    'books/thus spake zarathustra/page (387).png',
    'books/thus spake zarathustra/page (388).png',
    'books/thus spake zarathustra/page (389).png',
    'books/thus spake zarathustra/page (390).png',
    'books/thus spake zarathustra/page (391).png',
    'books/thus spake zarathustra/page (392).png',
    'books/thus spake zarathustra/page (393).png',
    'books/thus spake zarathustra/page (394).png',
    'books/thus spake zarathustra/page (395).png',
    'books/thus spake zarathustra/page (396).png',
    'books/thus spake zarathustra/page (397).png',
    'books/thus spake zarathustra/page (398).png',
    'books/thus spake zarathustra/page (399).png',
    'books/thus spake zarathustra/page (400).png',
    'books/thus spake zarathustra/page (401).png',
    'books/thus spake zarathustra/page (402).png',
    'books/thus spake zarathustra/page (403).png',
    'books/thus spake zarathustra/page (404).png',
    'books/thus spake zarathustra/page (405).png',
    'books/thus spake zarathustra/page (406).png',
    'books/thus spake zarathustra/page (407).png',
    'books/thus spake zarathustra/page (408).png',
    'books/thus spake zarathustra/page (409).png',
    'books/thus spake zarathustra/page (410).png',

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
