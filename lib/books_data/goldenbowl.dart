import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class goldenbowl extends StatefulWidget {
  const goldenbowl({Key? key}) : super(key: key);

  @override
  State<goldenbowl> createState() => _goldenbowlState();
}

class _goldenbowlState extends State<goldenbowl> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/golden bowl/page (1).png',
    'books/golden bowl/page (2).png',
    'books/golden bowl/page (3).png',
    'books/golden bowl/page (4).png',
    'books/golden bowl/page (5).png',
    'books/golden bowl/page (6).png',
    'books/golden bowl/page (7).png',
    'books/golden bowl/page (8).png',
    'books/golden bowl/page (9).png',
    'books/golden bowl/page (10).png',
    'books/golden bowl/page (11).png',
    'books/golden bowl/page (12).png',
    'books/golden bowl/page (13).png',
    'books/golden bowl/page (14).png',
    'books/golden bowl/page (15).png',
    'books/golden bowl/page (16).png',
    'books/golden bowl/page (17).png',
    'books/golden bowl/page (18).png',
    'books/golden bowl/page (19).png',
    'books/golden bowl/page (20).png',
    'books/golden bowl/page (21).png',
    'books/golden bowl/page (22).png',
    'books/golden bowl/page (23).png',
    'books/golden bowl/page (24).png',
    'books/golden bowl/page (25).png',
    'books/golden bowl/page (26).png',
    'books/golden bowl/page (27).png',
    'books/golden bowl/page (28).png',
    'books/golden bowl/page (29).png',
    'books/golden bowl/page (30).png',
    'books/golden bowl/page (31).png',
    'books/golden bowl/page (32).png',
    'books/golden bowl/page (33).png',
    'books/golden bowl/page (34).png',
    'books/golden bowl/page (35).png',
    'books/golden bowl/page (36).png',
    'books/golden bowl/page (37).png',
    'books/golden bowl/page (38).png',
    'books/golden bowl/page (39).png',
    'books/golden bowl/page (40).png',
    'books/golden bowl/page (41).png',
    'books/golden bowl/page (42).png',
    'books/golden bowl/page (43).png',
    'books/golden bowl/page (44).png',
    'books/golden bowl/page (45).png',
    'books/golden bowl/page (46).png',
    'books/golden bowl/page (47).png',
    'books/golden bowl/page (48).png',
    'books/golden bowl/page (49).png',
    'books/golden bowl/page (50).png',
    'books/golden bowl/page (51).png',
    'books/golden bowl/page (52).png',
    'books/golden bowl/page (53).png',
    'books/golden bowl/page (54).png',
    'books/golden bowl/page (55).png',
    'books/golden bowl/page (56).png',
    'books/golden bowl/page (57).png',
    'books/golden bowl/page (58).png',
    'books/golden bowl/page (59).png',
    'books/golden bowl/page (60).png',
    'books/golden bowl/page (61).png',
    'books/golden bowl/page (62).png',
    'books/golden bowl/page (63).png',
    'books/golden bowl/page (64).png',
    'books/golden bowl/page (65).png',
    'books/golden bowl/page (66).png',
    'books/golden bowl/page (67).png',
    'books/golden bowl/page (68).png',
    'books/golden bowl/page (69).png',
    'books/golden bowl/page (70).png',
    'books/golden bowl/page (71).png',
    'books/golden bowl/page (72).png',
    'books/golden bowl/page (73).png',
    'books/golden bowl/page (74).png',
    'books/golden bowl/page (75).png',
    'books/golden bowl/page (76).png',
    'books/golden bowl/page (77).png',
    'books/golden bowl/page (78).png',
    'books/golden bowl/page (79).png',
    'books/golden bowl/page (80).png',
    'books/golden bowl/page (81).png',
    'books/golden bowl/page (82).png',
    'books/golden bowl/page (83).png',
    'books/golden bowl/page (84).png',
    'books/golden bowl/page (85).png',
    'books/golden bowl/page (86).png',
    'books/golden bowl/page (87).png',
    'books/golden bowl/page (88).png',
    'books/golden bowl/page (89).png',
    'books/golden bowl/page (90).png',
    'books/golden bowl/page (91).png',
    'books/golden bowl/page (92).png',
    'books/golden bowl/page (93).png',
    'books/golden bowl/page (94).png',
    'books/golden bowl/page (95).png',
    'books/golden bowl/page (96).png',
    'books/golden bowl/page (97).png',
    'books/golden bowl/page (98).png',
    'books/golden bowl/page (99).png',
    'books/golden bowl/page (100).png',
    'books/golden bowl/page (101).png',
    'books/golden bowl/page (102).png',
    'books/golden bowl/page (103).png',
    'books/golden bowl/page (104).png',
    'books/golden bowl/page (105).png',
    'books/golden bowl/page (106).png',
    'books/golden bowl/page (107).png',
    'books/golden bowl/page (108).png',
    'books/golden bowl/page (109).png',
    'books/golden bowl/page (110).png',
    'books/golden bowl/page (111).png',
    'books/golden bowl/page (112).png',
    'books/golden bowl/page (113).png',
    'books/golden bowl/page (114).png',
    'books/golden bowl/page (115).png',
    'books/golden bowl/page (116).png',
    'books/golden bowl/page (117).png',
    'books/golden bowl/page (118).png',
    'books/golden bowl/page (119).png',
    'books/golden bowl/page (120).png',
    'books/golden bowl/page (121).png',
    'books/golden bowl/page (122).png',
    'books/golden bowl/page (123).png',
    'books/golden bowl/page (124).png',
    'books/golden bowl/page (125).png',
    'books/golden bowl/page (126).png',
    'books/golden bowl/page (127).png',
    'books/golden bowl/page (128).png',
    'books/golden bowl/page (129).png',
    'books/golden bowl/page (130).png',
    'books/golden bowl/page (131).png',
    'books/golden bowl/page (132).png',
    'books/golden bowl/page (133).png',
    'books/golden bowl/page (134).png',
    'books/golden bowl/page (135).png',
    'books/golden bowl/page (136).png',
    'books/golden bowl/page (137).png',
    'books/golden bowl/page (138).png',
    'books/golden bowl/page (139).png',
    'books/golden bowl/page (140).png',
    'books/golden bowl/page (141).png',
    'books/golden bowl/page (142).png',
    'books/golden bowl/page (143).png',
    'books/golden bowl/page (144).png',
    'books/golden bowl/page (145).png',
    'books/golden bowl/page (146).png',
    'books/golden bowl/page (147).png',
    'books/golden bowl/page (148).png',
    'books/golden bowl/page (149).png',
    'books/golden bowl/page (150).png',
    'books/golden bowl/page (151).png',
    'books/golden bowl/page (152).png',
    'books/golden bowl/page (153).png',
    'books/golden bowl/page (154).png',
    'books/golden bowl/page (155).png',
    'books/golden bowl/page (156).png',
    'books/golden bowl/page (157).png',
    'books/golden bowl/page (158).png',
    'books/golden bowl/page (159).png',
    'books/golden bowl/page (160).png',
    'books/golden bowl/page (161).png',
    'books/golden bowl/page (162).png',
    'books/golden bowl/page (163).png',
    'books/golden bowl/page (164).png',
    'books/golden bowl/page (165).png',
    'books/golden bowl/page (166).png',
    'books/golden bowl/page (167).png',
    'books/golden bowl/page (168).png',
    'books/golden bowl/page (169).png',
    'books/golden bowl/page (170).png',
    'books/golden bowl/page (171).png',
    'books/golden bowl/page (172).png',
    'books/golden bowl/page (173).png',
    'books/golden bowl/page (174).png',
    'books/golden bowl/page (175).png',
    'books/golden bowl/page (176).png',
    'books/golden bowl/page (177).png',
    'books/golden bowl/page (178).png',
    'books/golden bowl/page (179).png',
    'books/golden bowl/page (180).png',
    'books/golden bowl/page (181).png',
    'books/golden bowl/page (182).png',
    'books/golden bowl/page (183).png',
    'books/golden bowl/page (184).png',
    'books/golden bowl/page (185).png',
    'books/golden bowl/page (186).png',
    'books/golden bowl/page (187).png',
    'books/golden bowl/page (188).png',
    'books/golden bowl/page (189).png',
    'books/golden bowl/page (190).png',
    'books/golden bowl/page (191).png',
    'books/golden bowl/page (192).png',
    'books/golden bowl/page (193).png',
    'books/golden bowl/page (194).png',
    'books/golden bowl/page (195).png',
    'books/golden bowl/page (196).png',
    'books/golden bowl/page (197).png',
    'books/golden bowl/page (198).png',
    'books/golden bowl/page (199).png',
    'books/golden bowl/page (200).png',
    'books/golden bowl/page (201).png',
    'books/golden bowl/page (202).png',
    'books/golden bowl/page (203).png',
    'books/golden bowl/page (204).png',
    'books/golden bowl/page (205).png',
    'books/golden bowl/page (206).png',
    'books/golden bowl/page (207).png',
    'books/golden bowl/page (208).png',
    'books/golden bowl/page (209).png',
    'books/golden bowl/page (210).png',
    'books/golden bowl/page (211).png',
    'books/golden bowl/page (212).png',
    'books/golden bowl/page (213).png',
    'books/golden bowl/page (214).png',
    'books/golden bowl/page (215).png',
    'books/golden bowl/page (216).png',
    'books/golden bowl/page (217).png',
    'books/golden bowl/page (218).png',
    'books/golden bowl/page (219).png',
    'books/golden bowl/page (220).png',
    'books/golden bowl/page (221).png',
    'books/golden bowl/page (222).png',
    'books/golden bowl/page (223).png',
    'books/golden bowl/page (224).png',
    'books/golden bowl/page (225).png',
    'books/golden bowl/page (226).png',
    'books/golden bowl/page (227).png',
    'books/golden bowl/page (228).png',
    'books/golden bowl/page (229).png',
    'books/golden bowl/page (230).png',
    'books/golden bowl/page (231).png',
    'books/golden bowl/page (232).png',
    'books/golden bowl/page (233).png',
    'books/golden bowl/page (234).png',
    'books/golden bowl/page (235).png',
    'books/golden bowl/page (236).png',
    'books/golden bowl/page (237).png',
    'books/golden bowl/page (238).png',
    'books/golden bowl/page (239).png',
    'books/golden bowl/page (240).png',
    'books/golden bowl/page (241).png',
    'books/golden bowl/page (242).png',
    'books/golden bowl/page (243).png',
    'books/golden bowl/page (244).png',
    'books/golden bowl/page (245).png',
    'books/golden bowl/page (246).png',
    'books/golden bowl/page (247).png',
    'books/golden bowl/page (248).png',
    'books/golden bowl/page (249).png',
    'books/golden bowl/page (250).png',
    'books/golden bowl/page (251).png',
    'books/golden bowl/page (252).png',
    'books/golden bowl/page (253).png',
    'books/golden bowl/page (254).png',
    'books/golden bowl/page (255).png',
    'books/golden bowl/page (256).png',
    'books/golden bowl/page (257).png',
    'books/golden bowl/page (258).png',
    'books/golden bowl/page (259).png',
    'books/golden bowl/page (260).png',
    'books/golden bowl/page (261).png',
    'books/golden bowl/page (262).png',
    'books/golden bowl/page (263).png',
    'books/golden bowl/page (264).png',
    'books/golden bowl/page (265).png',
    'books/golden bowl/page (266).png',
    'books/golden bowl/page (267).png',
    'books/golden bowl/page (268).png',
    'books/golden bowl/page (269).png',
    'books/golden bowl/page (270).png',
    'books/golden bowl/page (271).png',
    'books/golden bowl/page (272).png',
    'books/golden bowl/page (273).png',
    'books/golden bowl/page (274).png',
    'books/golden bowl/page (275).png',
    'books/golden bowl/page (276).png',
    'books/golden bowl/page (277).png',
    'books/golden bowl/page (278).png',
    'books/golden bowl/page (279).png',
    'books/golden bowl/page (280).png',
    'books/golden bowl/page (281).png',
    'books/golden bowl/page (282).png',
    'books/golden bowl/page (283).png',
    'books/golden bowl/page (284).png',
    'books/golden bowl/page (285).png',
    'books/golden bowl/page (286).png',
    'books/golden bowl/page (287).png',
    'books/golden bowl/page (288).png',
    'books/golden bowl/page (289).png',
    'books/golden bowl/page (290).png',
    'books/golden bowl/page (291).png',
    'books/golden bowl/page (292).png',
    'books/golden bowl/page (293).png',
    'books/golden bowl/page (294).png',
    'books/golden bowl/page (295).png',
    'books/golden bowl/page (296).png',
    'books/golden bowl/page (297).png',
    'books/golden bowl/page (298).png',
    'books/golden bowl/page (299).png',
    'books/golden bowl/page (300).png',
    'books/golden bowl/page (301).png',
    'books/golden bowl/page (302).png',
    'books/golden bowl/page (303).png',
    'books/golden bowl/page (304).png',
    'books/golden bowl/page (305).png',
    'books/golden bowl/page (306).png',
    'books/golden bowl/page (307).png',
    'books/golden bowl/page (308).png',
    'books/golden bowl/page (309).png',
    'books/golden bowl/page (310).png',
    'books/golden bowl/page (311).png',
    'books/golden bowl/page (312).png',
    'books/golden bowl/page (313).png',
    'books/golden bowl/page (314).png',
    'books/golden bowl/page (315).png',
    'books/golden bowl/page (316).png',
    'books/golden bowl/page (317).png',
    'books/golden bowl/page (318).png',
    'books/golden bowl/page (319).png',
    'books/golden bowl/page (320).png',
    'books/golden bowl/page (321).png',
    'books/golden bowl/page (322).png',
    'books/golden bowl/page (323).png',
    'books/golden bowl/page (324).png',
    'books/golden bowl/page (325).png',
    'books/golden bowl/page (326).png',
    'books/golden bowl/page (327).png',
    'books/golden bowl/page (328).png',
    'books/golden bowl/page (329).png',
    'books/golden bowl/page (330).png',
    'books/golden bowl/page (331).png',
    'books/golden bowl/page (332).png',
    'books/golden bowl/page (333).png',
    'books/golden bowl/page (334).png',
    'books/golden bowl/page (335).png',
    'books/golden bowl/page (336).png',
    'books/golden bowl/page (337).png',
    'books/golden bowl/page (338).png',
    'books/golden bowl/page (339).png',
    'books/golden bowl/page (340).png',
    'books/golden bowl/page (341).png',
    'books/golden bowl/page (342).png',
    'books/golden bowl/page (343).png',
    'books/golden bowl/page (344).png',
    'books/golden bowl/page (345).png',
    'books/golden bowl/page (346).png',
    'books/golden bowl/page (347).png',
    'books/golden bowl/page (348).png',
    'books/golden bowl/page (349).png',
    'books/golden bowl/page (350).png',
    'books/golden bowl/page (351).png',
    'books/golden bowl/page (352).png',
    'books/golden bowl/page (353).png',
    'books/golden bowl/page (354).png',
    'books/golden bowl/page (355).png',
    'books/golden bowl/page (356).png',
    'books/golden bowl/page (357).png',
    'books/golden bowl/page (358).png',
    'books/golden bowl/page (359).png',
    'books/golden bowl/page (360).png',
    'books/golden bowl/page (361).png',
    'books/golden bowl/page (362).png',
    'books/golden bowl/page (363).png',
    'books/golden bowl/page (364).png',
    'books/golden bowl/page (365).png',
    'books/golden bowl/page (366).png',
    'books/golden bowl/page (367).png',
    'books/golden bowl/page (368).png',
    'books/golden bowl/page (369).png',
    'books/golden bowl/page (370).png',
    'books/golden bowl/page (371).png',
    'books/golden bowl/page (372).png',
    'books/golden bowl/page (373).png',
    'books/golden bowl/page (374).png',
    'books/golden bowl/page (375).png',
    'books/golden bowl/page (376).png',
    'books/golden bowl/page (377).png',
    'books/golden bowl/page (378).png',
    'books/golden bowl/page (379).png',
    'books/golden bowl/page (380).png',
    'books/golden bowl/page (381).png',
    'books/golden bowl/page (382).png',
    'books/golden bowl/page (383).png',
    'books/golden bowl/page (384).png',
    'books/golden bowl/page (385).png',
    'books/golden bowl/page (386).png',
    'books/golden bowl/page (387).png',
    'books/golden bowl/page (388).png',
    'books/golden bowl/page (389).png',
    'books/golden bowl/page (390).png',
    'books/golden bowl/page (391).png',
    'books/golden bowl/page (392).png',
    'books/golden bowl/page (393).png',
    'books/golden bowl/page (394).png',
    'books/golden bowl/page (395).png',
    'books/golden bowl/page (396).png',
    'books/golden bowl/page (397).png',
    'books/golden bowl/page (398).png',
    'books/golden bowl/page (399).png',
    'books/golden bowl/page (400).png',
    'books/golden bowl/page (401).png',
    'books/golden bowl/page (402).png',
    'books/golden bowl/page (403).png',
    'books/golden bowl/page (404).png',
    'books/golden bowl/page (405).png',
    'books/golden bowl/page (406).png',
    'books/golden bowl/page (407).png',
    'books/golden bowl/page (408).png',
    'books/golden bowl/page (409).png',
    'books/golden bowl/page (410).png',
    'books/golden bowl/page (411).png',
    'books/golden bowl/page (412).png',
    'books/golden bowl/page (413).png',
    'books/golden bowl/page (414).png',
    'books/golden bowl/page (415).png',
    'books/golden bowl/page (416).png',

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
