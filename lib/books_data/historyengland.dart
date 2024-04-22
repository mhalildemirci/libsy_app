import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class historyengland extends StatefulWidget {
  const historyengland({Key? key}) : super(key: key);

  @override
  State<historyengland> createState() => _historyenglandState();
}

class _historyenglandState extends State<historyengland> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/history england/page (1).png',
    'books/history england/page (2).png',
    'books/history england/page (3).png',
    'books/history england/page (4).png',
    'books/history england/page (5).png',
    'books/history england/page (6).png',
    'books/history england/page (7).png',
    'books/history england/page (8).png',
    'books/history england/page (9).png',
    'books/history england/page (10).png',
    'books/history england/page (11).png',
    'books/history england/page (12).png',
    'books/history england/page (13).png',
    'books/history england/page (14).png',
    'books/history england/page (15).png',
    'books/history england/page (16).png',
    'books/history england/page (17).png',
    'books/history england/page (18).png',
    'books/history england/page (19).png',
    'books/history england/page (20).png',
    'books/history england/page (21).png',
    'books/history england/page (22).png',
    'books/history england/page (23).png',
    'books/history england/page (24).png',
    'books/history england/page (25).png',
    'books/history england/page (26).png',
    'books/history england/page (27).png',
    'books/history england/page (28).png',
    'books/history england/page (29).png',
    'books/history england/page (30).png',
    'books/history england/page (31).png',
    'books/history england/page (32).png',
    'books/history england/page (33).png',
    'books/history england/page (34).png',
    'books/history england/page (35).png',
    'books/history england/page (36).png',
    'books/history england/page (37).png',
    'books/history england/page (38).png',
    'books/history england/page (39).png',
    'books/history england/page (40).png',
    'books/history england/page (41).png',
    'books/history england/page (42).png',
    'books/history england/page (43).png',
    'books/history england/page (44).png',
    'books/history england/page (45).png',
    'books/history england/page (46).png',
    'books/history england/page (47).png',
    'books/history england/page (48).png',
    'books/history england/page (49).png',
    'books/history england/page (50).png',
    'books/history england/page (51).png',
    'books/history england/page (52).png',
    'books/history england/page (53).png',
    'books/history england/page (54).png',
    'books/history england/page (55).png',
    'books/history england/page (56).png',
    'books/history england/page (57).png',
    'books/history england/page (58).png',
    'books/history england/page (59).png',
    'books/history england/page (60).png',
    'books/history england/page (61).png',
    'books/history england/page (62).png',
    'books/history england/page (63).png',
    'books/history england/page (64).png',
    'books/history england/page (65).png',
    'books/history england/page (66).png',
    'books/history england/page (67).png',
    'books/history england/page (68).png',
    'books/history england/page (69).png',
    'books/history england/page (70).png',
    'books/history england/page (71).png',
    'books/history england/page (72).png',
    'books/history england/page (73).png',
    'books/history england/page (74).png',
    'books/history england/page (75).png',
    'books/history england/page (76).png',
    'books/history england/page (77).png',
    'books/history england/page (78).png',
    'books/history england/page (79).png',
    'books/history england/page (80).png',
    'books/history england/page (81).png',
    'books/history england/page (82).png',
    'books/history england/page (83).png',
    'books/history england/page (84).png',
    'books/history england/page (85).png',
    'books/history england/page (86).png',
    'books/history england/page (87).png',
    'books/history england/page (88).png',
    'books/history england/page (89).png',
    'books/history england/page (90).png',
    'books/history england/page (91).png',
    'books/history england/page (92).png',
    'books/history england/page (93).png',
    'books/history england/page (94).png',
    'books/history england/page (95).png',
    'books/history england/page (96).png',
    'books/history england/page (97).png',
    'books/history england/page (98).png',
    'books/history england/page (99).png',
    'books/history england/page (100).png',
    'books/history england/page (101).png',
    'books/history england/page (102).png',
    'books/history england/page (103).png',
    'books/history england/page (104).png',
    'books/history england/page (105).png',
    'books/history england/page (106).png',
    'books/history england/page (107).png',
    'books/history england/page (108).png',
    'books/history england/page (109).png',
    'books/history england/page (110).png',
    'books/history england/page (111).png',
    'books/history england/page (112).png',
    'books/history england/page (113).png',
    'books/history england/page (114).png',
    'books/history england/page (115).png',
    'books/history england/page (116).png',
    'books/history england/page (117).png',
    'books/history england/page (118).png',
    'books/history england/page (119).png',
    'books/history england/page (120).png',
    'books/history england/page (121).png',
    'books/history england/page (122).png',
    'books/history england/page (123).png',
    'books/history england/page (124).png',
    'books/history england/page (125).png',
    'books/history england/page (126).png',
    'books/history england/page (127).png',
    'books/history england/page (128).png',
    'books/history england/page (129).png',
    'books/history england/page (130).png',
    'books/history england/page (131).png',
    'books/history england/page (132).png',
    'books/history england/page (133).png',
    'books/history england/page (134).png',
    'books/history england/page (135).png',
    'books/history england/page (136).png',
    'books/history england/page (137).png',
    'books/history england/page (138).png',
    'books/history england/page (139).png',
    'books/history england/page (140).png',
    'books/history england/page (141).png',
    'books/history england/page (142).png',
    'books/history england/page (143).png',
    'books/history england/page (144).png',
    'books/history england/page (145).png',
    'books/history england/page (146).png',
    'books/history england/page (147).png',
    'books/history england/page (148).png',
    'books/history england/page (149).png',
    'books/history england/page (150).png',
    'books/history england/page (151).png',
    'books/history england/page (152).png',
    'books/history england/page (153).png',
    'books/history england/page (154).png',
    'books/history england/page (155).png',
    'books/history england/page (156).png',
    'books/history england/page (157).png',
    'books/history england/page (158).png',
    'books/history england/page (159).png',
    'books/history england/page (160).png',
    'books/history england/page (161).png',
    'books/history england/page (162).png',
    'books/history england/page (163).png',
    'books/history england/page (164).png',
    'books/history england/page (165).png',
    'books/history england/page (166).png',
    'books/history england/page (167).png',
    'books/history england/page (168).png',
    'books/history england/page (169).png',
    'books/history england/page (170).png',
    'books/history england/page (171).png',
    'books/history england/page (172).png',
    'books/history england/page (173).png',
    'books/history england/page (174).png',
    'books/history england/page (175).png',
    'books/history england/page (176).png',
    'books/history england/page (177).png',
    'books/history england/page (178).png',
    'books/history england/page (179).png',
    'books/history england/page (180).png',
    'books/history england/page (181).png',
    'books/history england/page (182).png',
    'books/history england/page (183).png',
    'books/history england/page (184).png',
    'books/history england/page (185).png',
    'books/history england/page (186).png',
    'books/history england/page (187).png',
    'books/history england/page (188).png',
    'books/history england/page (189).png',
    'books/history england/page (190).png',
    'books/history england/page (191).png',
    'books/history england/page (192).png',
    'books/history england/page (193).png',
    'books/history england/page (194).png',
    'books/history england/page (195).png',
    'books/history england/page (196).png',
    'books/history england/page (197).png',
    'books/history england/page (198).png',
    'books/history england/page (199).png',
    'books/history england/page (200).png',
    'books/history england/page (201).png',
    'books/history england/page (202).png',
    'books/history england/page (203).png',
    'books/history england/page (204).png',
    'books/history england/page (205).png',
    'books/history england/page (206).png',
    'books/history england/page (207).png',
    'books/history england/page (208).png',
    'books/history england/page (209).png',
    'books/history england/page (210).png',
    'books/history england/page (211).png',
    'books/history england/page (212).png',
    'books/history england/page (213).png',
    'books/history england/page (214).png',
    'books/history england/page (215).png',
    'books/history england/page (216).png',
    'books/history england/page (217).png',
    'books/history england/page (218).png',
    'books/history england/page (219).png',
    'books/history england/page (220).png',
    'books/history england/page (221).png',
    'books/history england/page (222).png',
    'books/history england/page (223).png',
    'books/history england/page (224).png',
    'books/history england/page (225).png',
    'books/history england/page (226).png',
    'books/history england/page (227).png',
    'books/history england/page (228).png',
    'books/history england/page (229).png',
    'books/history england/page (230).png',
    'books/history england/page (231).png',
    'books/history england/page (232).png',
    'books/history england/page (233).png',
    'books/history england/page (234).png',
    'books/history england/page (235).png',
    'books/history england/page (236).png',
    'books/history england/page (237).png',
    'books/history england/page (238).png',
    'books/history england/page (239).png',
    'books/history england/page (240).png',
    'books/history england/page (241).png',
    'books/history england/page (242).png',
    'books/history england/page (243).png',
    'books/history england/page (244).png',
    'books/history england/page (245).png',
    'books/history england/page (246).png',
    'books/history england/page (247).png',
    'books/history england/page (248).png',
    'books/history england/page (249).png',
    'books/history england/page (250).png',
    'books/history england/page (251).png',
    'books/history england/page (252).png',
    'books/history england/page (253).png',
    'books/history england/page (254).png',
    'books/history england/page (255).png',
    'books/history england/page (256).png',
    'books/history england/page (257).png',
    'books/history england/page (258).png',
    'books/history england/page (259).png',
    'books/history england/page (260).png',
    'books/history england/page (261).png',
    'books/history england/page (262).png',
    'books/history england/page (263).png',
    'books/history england/page (264).png',
    'books/history england/page (265).png',
    'books/history england/page (266).png',
    'books/history england/page (267).png',
    'books/history england/page (268).png',
    'books/history england/page (269).png',
    'books/history england/page (270).png',
    'books/history england/page (271).png',
    'books/history england/page (272).png',
    'books/history england/page (273).png',
    'books/history england/page (274).png',
    'books/history england/page (275).png',
    'books/history england/page (276).png',
    'books/history england/page (277).png',
    'books/history england/page (278).png',
    'books/history england/page (279).png',
    'books/history england/page (280).png',
    'books/history england/page (281).png',
    'books/history england/page (282).png',
    'books/history england/page (283).png',
    'books/history england/page (284).png',
    'books/history england/page (285).png',
    'books/history england/page (286).png',
    'books/history england/page (287).png',
    'books/history england/page (288).png',
    'books/history england/page (289).png',
    'books/history england/page (290).png',
    'books/history england/page (291).png',
    'books/history england/page (292).png',
    'books/history england/page (293).png',
    'books/history england/page (294).png',
    'books/history england/page (295).png',
    'books/history england/page (296).png',
    'books/history england/page (297).png',
    'books/history england/page (298).png',
    'books/history england/page (299).png',
    'books/history england/page (300).png',
    'books/history england/page (301).png',
    'books/history england/page (302).png',
    'books/history england/page (303).png',
    'books/history england/page (304).png',
    'books/history england/page (305).png',
    'books/history england/page (306).png',
    'books/history england/page (307).png',
    'books/history england/page (308).png',
    'books/history england/page (309).png',
    'books/history england/page (310).png',
    'books/history england/page (311).png',
    'books/history england/page (312).png',
    'books/history england/page (313).png',
    'books/history england/page (314).png',
    'books/history england/page (315).png',
    'books/history england/page (316).png',
    'books/history england/page (317).png',
    'books/history england/page (318).png',
    'books/history england/page (319).png',
    'books/history england/page (320).png',
    'books/history england/page (321).png',
    'books/history england/page (322).png',
    'books/history england/page (323).png',
    'books/history england/page (324).png',
    'books/history england/page (325).png',
    'books/history england/page (326).png',
    'books/history england/page (327).png',
    'books/history england/page (328).png',
    'books/history england/page (329).png',
    'books/history england/page (330).png',
    'books/history england/page (331).png',
    'books/history england/page (332).png',
    'books/history england/page (333).png',
    'books/history england/page (334).png',
    'books/history england/page (335).png',
    'books/history england/page (336).png',
    'books/history england/page (337).png',
    'books/history england/page (338).png',
    'books/history england/page (339).png',
    'books/history england/page (340).png',
    'books/history england/page (341).png',
    'books/history england/page (342).png',
    'books/history england/page (343).png',
    'books/history england/page (344).png',
    'books/history england/page (345).png',
    'books/history england/page (346).png',
    'books/history england/page (347).png',
    'books/history england/page (348).png',
    'books/history england/page (349).png',
    'books/history england/page (350).png',
    'books/history england/page (351).png',
    'books/history england/page (352).png',
    'books/history england/page (353).png',
    'books/history england/page (354).png',
    'books/history england/page (355).png',
    'books/history england/page (356).png',
    'books/history england/page (357).png',
    'books/history england/page (358).png',
    'books/history england/page (359).png',
    'books/history england/page (360).png',
    'books/history england/page (361).png',
    'books/history england/page (362).png',
    'books/history england/page (363).png',
    'books/history england/page (364).png',
    'books/history england/page (365).png',
    'books/history england/page (366).png',
    'books/history england/page (367).png',
    'books/history england/page (368).png',
    'books/history england/page (369).png',
    'books/history england/page (370).png',
    'books/history england/page (371).png',
    'books/history england/page (372).png',
    'books/history england/page (373).png',
    'books/history england/page (374).png',
    'books/history england/page (375).png',
    'books/history england/page (376).png',
    'books/history england/page (377).png',
    'books/history england/page (378).png',
    'books/history england/page (379).png',
    'books/history england/page (380).png',
    'books/history england/page (381).png',
    'books/history england/page (382).png',
    'books/history england/page (383).png',
    'books/history england/page (384).png',
    'books/history england/page (385).png',
    'books/history england/page (386).png',
    'books/history england/page (387).png',
    'books/history england/page (388).png',
    'books/history england/page (389).png',
    'books/history england/page (390).png',
    'books/history england/page (391).png',
    'books/history england/page (392).png',
    'books/history england/page (393).png',
    'books/history england/page (394).png',
    'books/history england/page (395).png',
    'books/history england/page (396).png',
    'books/history england/page (397).png',
    'books/history england/page (398).png',
    'books/history england/page (399).png',
    'books/history england/page (400).png',
    'books/history england/page (401).png',
    'books/history england/page (402).png',
    'books/history england/page (403).png',
    'books/history england/page (404).png',
    'books/history england/page (405).png',
    'books/history england/page (406).png',
    'books/history england/page (407).png',
    'books/history england/page (408).png',
    'books/history england/page (409).png',
    'books/history england/page (410).png',
    'books/history england/page (411).png',
    'books/history england/page (412).png',
    'books/history england/page (413).png',
    'books/history england/page (414).png',
    'books/history england/page (415).png',
    'books/history england/page (416).png',
    'books/history england/page (417).png',
    'books/history england/page (418).png',
    'books/history england/page (419).png',
    'books/history england/page (420).png',
    'books/history england/page (421).png',
    'books/history england/page (422).png',
    'books/history england/page (423).png',
    'books/history england/page (424).png',
    'books/history england/page (425).png',
    'books/history england/page (426).png',
    'books/history england/page (427).png',
    'books/history england/page (428).png',
    'books/history england/page (429).png',
    'books/history england/page (430).png',
    'books/history england/page (431).png',
    'books/history england/page (432).png',
    'books/history england/page (433).png',
    'books/history england/page (434).png',
    'books/history england/page (435).png',
    'books/history england/page (436).png',
    'books/history england/page (437).png',
    'books/history england/page (438).png',
    'books/history england/page (439).png',
    'books/history england/page (440).png',
    'books/history england/page (441).png',
    'books/history england/page (442).png',
    'books/history england/page (443).png',
    'books/history england/page (444).png',
    'books/history england/page (445).png',
    'books/history england/page (446).png',
    'books/history england/page (447).png',
    'books/history england/page (448).png',
    'books/history england/page (449).png',
    'books/history england/page (450).png',
    'books/history england/page (451).png',
    'books/history england/page (452).png',
    'books/history england/page (453).png',
    'books/history england/page (454).png',
    'books/history england/page (455).png',
    'books/history england/page (456).png',
    'books/history england/page (457).png',
    'books/history england/page (458).png',
    'books/history england/page (459).png',
    'books/history england/page (460).png',
    'books/history england/page (461).png',
    'books/history england/page (462).png',
    'books/history england/page (463).png',
    'books/history england/page (464).png',
    'books/history england/page (465).png',
    'books/history england/page (466).png',
    'books/history england/page (467).png',
    'books/history england/page (468).png',
    'books/history england/page (469).png',
    'books/history england/page (470).png',
    'books/history england/page (471).png',
    'books/history england/page (472).png',
    'books/history england/page (473).png',
    'books/history england/page (474).png',
    'books/history england/page (475).png',
    'books/history england/page (476).png',
    'books/history england/page (477).png',
    'books/history england/page (478).png',
    'books/history england/page (479).png',
    'books/history england/page (480).png',
    'books/history england/page (481).png',
    'books/history england/page (482).png',
    'books/history england/page (483).png',
    'books/history england/page (484).png',
    'books/history england/page (485).png',
    'books/history england/page (486).png',
    'books/history england/page (487).png',
    'books/history england/page (488).png',
    'books/history england/page (489).png',
    'books/history england/page (490).png',
    'books/history england/page (491).png',
    'books/history england/page (492).png',
    'books/history england/page (493).png',
    'books/history england/page (494).png',
    'books/history england/page (495).png',
    'books/history england/page (496).png',
    'books/history england/page (497).png',
    'books/history england/page (498).png',
    'books/history england/page (499).png',
    'books/history england/page (500).png',
    'books/history england/page (501).png',
    'books/history england/page (502).png',
    'books/history england/page (503).png',
    'books/history england/page (504).png',
    'books/history england/page (505).png',
    'books/history england/page (506).png',
    'books/history england/page (507).png',
    'books/history england/page (508).png',
    'books/history england/page (509).png',
    'books/history england/page (510).png',
    'books/history england/page (511).png',
    'books/history england/page (512).png',
    'books/history england/page (513).png',
    'books/history england/page (514).png',
    'books/history england/page (515).png',
    'books/history england/page (516).png',
    'books/history england/page (517).png',
    'books/history england/page (518).png',
    'books/history england/page (519).png',
    'books/history england/page (520).png',
    'books/history england/page (521).png',
    'books/history england/page (522).png',
    'books/history england/page (523).png',
    'books/history england/page (524).png',
    'books/history england/page (525).png',
    'books/history england/page (526).png',
    'books/history england/page (527).png',

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