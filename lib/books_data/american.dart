import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class american extends StatefulWidget {
  const american({Key? key}) : super(key: key);

  @override
  State<american> createState() => _americanState();
}

class _americanState extends State<american> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/american/page (1).png',
    'books/american/page (2).png',
    'books/american/page (3).png',
    'books/american/page (4).png',
    'books/american/page (5).png',
    'books/american/page (6).png',
    'books/american/page (7).png',
    'books/american/page (8).png',
    'books/american/page (9).png',
    'books/american/page (10).png',
    'books/american/page (11).png',
    'books/american/page (12).png',
    'books/american/page (13).png',
    'books/american/page (14).png',
    'books/american/page (15).png',
    'books/american/page (16).png',
    'books/american/page (17).png',
    'books/american/page (18).png',
    'books/american/page (19).png',
    'books/american/page (20).png',
    'books/american/page (21).png',
    'books/american/page (22).png',
    'books/american/page (23).png',
    'books/american/page (24).png',
    'books/american/page (25).png',
    'books/american/page (26).png',
    'books/american/page (27).png',
    'books/american/page (28).png',
    'books/american/page (29).png',
    'books/american/page (30).png',
    'books/american/page (31).png',
    'books/american/page (32).png',
    'books/american/page (33).png',
    'books/american/page (34).png',
    'books/american/page (35).png',
    'books/american/page (36).png',
    'books/american/page (37).png',
    'books/american/page (38).png',
    'books/american/page (39).png',
    'books/american/page (40).png',
    'books/american/page (41).png',
    'books/american/page (42).png',
    'books/american/page (43).png',
    'books/american/page (44).png',
    'books/american/page (45).png',
    'books/american/page (46).png',
    'books/american/page (47).png',
    'books/american/page (48).png',
    'books/american/page (49).png',
    'books/american/page (50).png',
    'books/american/page (51).png',
    'books/american/page (52).png',
    'books/american/page (53).png',
    'books/american/page (54).png',
    'books/american/page (55).png',
    'books/american/page (56).png',
    'books/american/page (57).png',
    'books/american/page (58).png',
    'books/american/page (59).png',
    'books/american/page (60).png',
    'books/american/page (61).png',
    'books/american/page (62).png',
    'books/american/page (63).png',
    'books/american/page (64).png',
    'books/american/page (65).png',
    'books/american/page (66).png',
    'books/american/page (67).png',
    'books/american/page (68).png',
    'books/american/page (69).png',
    'books/american/page (70).png',
    'books/american/page (71).png',
    'books/american/page (72).png',
    'books/american/page (73).png',
    'books/american/page (74).png',
    'books/american/page (75).png',
    'books/american/page (76).png',
    'books/american/page (77).png',
    'books/american/page (78).png',
    'books/american/page (79).png',
    'books/american/page (80).png',
    'books/american/page (81).png',
    'books/american/page (82).png',
    'books/american/page (83).png',
    'books/american/page (84).png',
    'books/american/page (85).png',
    'books/american/page (86).png',
    'books/american/page (87).png',
    'books/american/page (88).png',
    'books/american/page (89).png',
    'books/american/page (90).png',
    'books/american/page (91).png',
    'books/american/page (92).png',
    'books/american/page (93).png',
    'books/american/page (94).png',
    'books/american/page (95).png',
    'books/american/page (96).png',
    'books/american/page (97).png',
    'books/american/page (98).png',
    'books/american/page (99).png',
    'books/american/page (100).png',
    'books/american/page (101).png',
    'books/american/page (102).png',
    'books/american/page (103).png',
    'books/american/page (104).png',
    'books/american/page (105).png',
    'books/american/page (106).png',
    'books/american/page (107).png',
    'books/american/page (108).png',
    'books/american/page (109).png',
    'books/american/page (110).png',
    'books/american/page (111).png',
    'books/american/page (112).png',
    'books/american/page (113).png',
    'books/american/page (114).png',
    'books/american/page (115).png',
    'books/american/page (116).png',
    'books/american/page (117).png',
    'books/american/page (118).png',
    'books/american/page (119).png',
    'books/american/page (120).png',
    'books/american/page (121).png',
    'books/american/page (122).png',
    'books/american/page (123).png',
    'books/american/page (124).png',
    'books/american/page (125).png',
    'books/american/page (126).png',
    'books/american/page (127).png',
    'books/american/page (128).png',
    'books/american/page (129).png',
    'books/american/page (130).png',
    'books/american/page (131).png',
    'books/american/page (132).png',
    'books/american/page (133).png',
    'books/american/page (134).png',
    'books/american/page (135).png',
    'books/american/page (136).png',
    'books/american/page (137).png',
    'books/american/page (138).png',
    'books/american/page (139).png',
    'books/american/page (140).png',
    'books/american/page (141).png',
    'books/american/page (142).png',
    'books/american/page (143).png',
    'books/american/page (144).png',
    'books/american/page (145).png',
    'books/american/page (146).png',
    'books/american/page (147).png',
    'books/american/page (148).png',
    'books/american/page (149).png',
    'books/american/page (150).png',
    'books/american/page (151).png',
    'books/american/page (152).png',
    'books/american/page (153).png',
    'books/american/page (154).png',
    'books/american/page (155).png',
    'books/american/page (156).png',
    'books/american/page (157).png',
    'books/american/page (158).png',
    'books/american/page (159).png',
    'books/american/page (160).png',
    'books/american/page (161).png',
    'books/american/page (162).png',
    'books/american/page (163).png',
    'books/american/page (164).png',
    'books/american/page (165).png',
    'books/american/page (166).png',
    'books/american/page (167).png',
    'books/american/page (168).png',
    'books/american/page (169).png',
    'books/american/page (170).png',
    'books/american/page (171).png',
    'books/american/page (172).png',
    'books/american/page (173).png',
    'books/american/page (174).png',
    'books/american/page (175).png',
    'books/american/page (176).png',
    'books/american/page (177).png',
    'books/american/page (178).png',
    'books/american/page (179).png',
    'books/american/page (180).png',
    'books/american/page (181).png',
    'books/american/page (182).png',
    'books/american/page (183).png',
    'books/american/page (184).png',
    'books/american/page (185).png',
    'books/american/page (186).png',
    'books/american/page (187).png',
    'books/american/page (188).png',
    'books/american/page (189).png',
    'books/american/page (190).png',
    'books/american/page (191).png',
    'books/american/page (192).png',
    'books/american/page (193).png',
    'books/american/page (194).png',
    'books/american/page (195).png',
    'books/american/page (196).png',
    'books/american/page (197).png',
    'books/american/page (198).png',
    'books/american/page (199).png',
    'books/american/page (200).png',
    'books/american/page (201).png',
    'books/american/page (202).png',
    'books/american/page (203).png',
    'books/american/page (204).png',
    'books/american/page (205).png',
    'books/american/page (206).png',
    'books/american/page (207).png',
    'books/american/page (208).png',
    'books/american/page (209).png',
    'books/american/page (210).png',
    'books/american/page (211).png',
    'books/american/page (212).png',
    'books/american/page (213).png',
    'books/american/page (214).png',
    'books/american/page (215).png',
    'books/american/page (216).png',
    'books/american/page (217).png',
    'books/american/page (218).png',
    'books/american/page (219).png',
    'books/american/page (220).png',
    'books/american/page (221).png',
    'books/american/page (222).png',
    'books/american/page (223).png',
    'books/american/page (224).png',
    'books/american/page (225).png',
    'books/american/page (226).png',
    'books/american/page (227).png',
    'books/american/page (228).png',
    'books/american/page (229).png',
    'books/american/page (230).png',
    'books/american/page (231).png',
    'books/american/page (232).png',
    'books/american/page (233).png',
    'books/american/page (234).png',
    'books/american/page (235).png',
    'books/american/page (236).png',
    'books/american/page (237).png',
    'books/american/page (238).png',
    'books/american/page (239).png',
    'books/american/page (240).png',
    'books/american/page (241).png',
    'books/american/page (242).png',
    'books/american/page (243).png',
    'books/american/page (244).png',
    'books/american/page (245).png',
    'books/american/page (246).png',
    'books/american/page (247).png',
    'books/american/page (248).png',
    'books/american/page (249).png',
    'books/american/page (250).png',
    'books/american/page (251).png',
    'books/american/page (252).png',
    'books/american/page (253).png',
    'books/american/page (254).png',
    'books/american/page (255).png',
    'books/american/page (256).png',
    'books/american/page (257).png',
    'books/american/page (258).png',
    'books/american/page (259).png',
    'books/american/page (260).png',
    'books/american/page (261).png',
    'books/american/page (262).png',
    'books/american/page (263).png',
    'books/american/page (264).png',
    'books/american/page (265).png',
    'books/american/page (266).png',
    'books/american/page (267).png',
    'books/american/page (268).png',
    'books/american/page (269).png',
    'books/american/page (270).png',
    'books/american/page (271).png',
    'books/american/page (272).png',
    'books/american/page (273).png',
    'books/american/page (274).png',
    'books/american/page (275).png',
    'books/american/page (276).png',
    'books/american/page (277).png',
    'books/american/page (278).png',
    'books/american/page (279).png',
    'books/american/page (280).png',
    'books/american/page (281).png',
    'books/american/page (282).png',
    'books/american/page (283).png',
    'books/american/page (284).png',
    'books/american/page (285).png',
    'books/american/page (286).png',
    'books/american/page (287).png',
    'books/american/page (288).png',
    'books/american/page (289).png',
    'books/american/page (290).png',
    'books/american/page (291).png',
    'books/american/page (292).png',
    'books/american/page (293).png',
    'books/american/page (294).png',
    'books/american/page (295).png',
    'books/american/page (296).png',
    'books/american/page (297).png',
    'books/american/page (298).png',
    'books/american/page (299).png',
    'books/american/page (300).png',
    'books/american/page (301).png',
    'books/american/page (302).png',
    'books/american/page (303).png',
    'books/american/page (304).png',
    'books/american/page (305).png',
    'books/american/page (306).png',
    'books/american/page (307).png',
    'books/american/page (308).png',
    'books/american/page (309).png',
    'books/american/page (310).png',
    'books/american/page (311).png',
    'books/american/page (312).png',
    'books/american/page (313).png',
    'books/american/page (314).png',
    'books/american/page (315).png',
    'books/american/page (316).png',
    'books/american/page (317).png',
    'books/american/page (318).png',
    'books/american/page (319).png',
    'books/american/page (320).png',
    'books/american/page (321).png',
    'books/american/page (322).png',
    'books/american/page (323).png',
    'books/american/page (324).png',
    'books/american/page (325).png',
    'books/american/page (326).png',
    'books/american/page (327).png',
    'books/american/page (328).png',
    'books/american/page (329).png',
    'books/american/page (330).png',
    'books/american/page (331).png',
    'books/american/page (332).png',
    'books/american/page (333).png',
    'books/american/page (334).png',
    'books/american/page (335).png',
    'books/american/page (336).png',
    'books/american/page (337).png',
    'books/american/page (338).png',
    'books/american/page (339).png',
    'books/american/page (340).png',
    'books/american/page (341).png',
    'books/american/page (342).png',
    'books/american/page (343).png',
    'books/american/page (344).png',
    'books/american/page (345).png',
    'books/american/page (346).png',
    'books/american/page (347).png',
    'books/american/page (348).png',
    'books/american/page (349).png',
    'books/american/page (350).png',
    'books/american/page (351).png',
    'books/american/page (352).png',
    'books/american/page (353).png',
    'books/american/page (354).png',
    'books/american/page (355).png',
    'books/american/page (356).png',
    'books/american/page (357).png',
    'books/american/page (358).png',
    'books/american/page (359).png',
    'books/american/page (360).png',
    'books/american/page (361).png',
    'books/american/page (362).png',
    'books/american/page (363).png',
    'books/american/page (364).png',
    'books/american/page (365).png',
    'books/american/page (366).png',
    'books/american/page (367).png',
    'books/american/page (368).png',
    'books/american/page (369).png',
    'books/american/page (370).png',
    'books/american/page (371).png',
    'books/american/page (372).png',
    'books/american/page (373).png',
    'books/american/page (374).png',
    'books/american/page (375).png',
    'books/american/page (376).png',
    'books/american/page (377).png',
    'books/american/page (378).png',
    'books/american/page (379).png',
    'books/american/page (380).png',
    'books/american/page (381).png',
    'books/american/page (382).png',
    'books/american/page (383).png',
    'books/american/page (384).png',
    'books/american/page (385).png',
    'books/american/page (386).png',
    'books/american/page (387).png',
    'books/american/page (388).png',
    'books/american/page (389).png',
    'books/american/page (390).png',
    'books/american/page (391).png',
    'books/american/page (392).png',
    'books/american/page (393).png',
    'books/american/page (394).png',
    'books/american/page (395).png',
    'books/american/page (396).png',
    'books/american/page (397).png',
    'books/american/page (398).png',
    'books/american/page (399).png',
    'books/american/page (400).png',
    'books/american/page (401).png',
    'books/american/page (402).png',
    'books/american/page (403).png',
    'books/american/page (404).png',
    'books/american/page (405).png',
    'books/american/page (406).png',
    'books/american/page (407).png',
    'books/american/page (408).png',
    'books/american/page (409).png',
    'books/american/page (410).png',
    'books/american/page (411).png',
    'books/american/page (412).png',
    'books/american/page (413).png',
    'books/american/page (414).png',
    'books/american/page (415).png',
    'books/american/page (416).png',
    'books/american/page (417).png',
    'books/american/page (418).png',
    'books/american/page (419).png',
    'books/american/page (420).png',
    'books/american/page (421).png',
    'books/american/page (422).png',
    'books/american/page (423).png',
    'books/american/page (424).png',
    'books/american/page (425).png',
    'books/american/page (426).png',
    'books/american/page (427).png',
    'books/american/page (428).png',
    'books/american/page (429).png',
    'books/american/page (430).png',
    'books/american/page (431).png',
    'books/american/page (432).png',
    'books/american/page (433).png',
    'books/american/page (434).png',
    'books/american/page (435).png',
    'books/american/page (436).png',
    'books/american/page (437).png',
    'books/american/page (438).png',
    'books/american/page (439).png',
    'books/american/page (440).png',
    'books/american/page (441).png',
    'books/american/page (442).png',
    'books/american/page (443).png',
    'books/american/page (444).png',
    'books/american/page (445).png',
    'books/american/page (446).png',
    'books/american/page (447).png',
    'books/american/page (448).png',
    'books/american/page (449).png',
    'books/american/page (450).png',
    'books/american/page (451).png',

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
