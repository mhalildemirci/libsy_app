import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mississipi extends StatefulWidget {
  const mississipi({Key? key}) : super(key: key);

  @override
  State<mississipi> createState() => _mississipiState();
}

class _mississipiState extends State<mississipi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mississippi/page (1).png',
    'books/mississippi/page (2).png',
    'books/mississippi/page (3).png',
    'books/mississippi/page (4).png',
    'books/mississippi/page (5).png',
    'books/mississippi/page (6).png',
    'books/mississippi/page (7).png',
    'books/mississippi/page (8).png',
    'books/mississippi/page (9).png',
    'books/mississippi/page (10).png',
    'books/mississippi/page (11).png',
    'books/mississippi/page (12).png',
    'books/mississippi/page (13).png',
    'books/mississippi/page (14).png',
    'books/mississippi/page (15).png',
    'books/mississippi/page (16).png',
    'books/mississippi/page (17).png',
    'books/mississippi/page (18).png',
    'books/mississippi/page (19).png',
    'books/mississippi/page (20).png',
    'books/mississippi/page (21).png',
    'books/mississippi/page (22).png',
    'books/mississippi/page (23).png',
    'books/mississippi/page (24).png',
    'books/mississippi/page (25).png',
    'books/mississippi/page (26).png',
    'books/mississippi/page (27).png',
    'books/mississippi/page (28).png',
    'books/mississippi/page (29).png',
    'books/mississippi/page (30).png',
    'books/mississippi/page (31).png',
    'books/mississippi/page (32).png',
    'books/mississippi/page (33).png',
    'books/mississippi/page (34).png',
    'books/mississippi/page (35).png',
    'books/mississippi/page (36).png',
    'books/mississippi/page (37).png',
    'books/mississippi/page (38).png',
    'books/mississippi/page (39).png',
    'books/mississippi/page (40).png',
    'books/mississippi/page (41).png',
    'books/mississippi/page (42).png',
    'books/mississippi/page (43).png',
    'books/mississippi/page (44).png',
    'books/mississippi/page (45).png',
    'books/mississippi/page (46).png',
    'books/mississippi/page (47).png',
    'books/mississippi/page (48).png',
    'books/mississippi/page (49).png',
    'books/mississippi/page (50).png',
    'books/mississippi/page (51).png',
    'books/mississippi/page (52).png',
    'books/mississippi/page (53).png',
    'books/mississippi/page (54).png',
    'books/mississippi/page (55).png',
    'books/mississippi/page (56).png',
    'books/mississippi/page (57).png',
    'books/mississippi/page (58).png',
    'books/mississippi/page (59).png',
    'books/mississippi/page (60).png',
    'books/mississippi/page (61).png',
    'books/mississippi/page (62).png',
    'books/mississippi/page (63).png',
    'books/mississippi/page (64).png',
    'books/mississippi/page (65).png',
    'books/mississippi/page (66).png',
    'books/mississippi/page (67).png',
    'books/mississippi/page (68).png',
    'books/mississippi/page (69).png',
    'books/mississippi/page (70).png',
    'books/mississippi/page (71).png',
    'books/mississippi/page (72).png',
    'books/mississippi/page (73).png',
    'books/mississippi/page (74).png',
    'books/mississippi/page (75).png',
    'books/mississippi/page (76).png',
    'books/mississippi/page (77).png',
    'books/mississippi/page (78).png',
    'books/mississippi/page (79).png',
    'books/mississippi/page (80).png',
    'books/mississippi/page (81).png',
    'books/mississippi/page (82).png',
    'books/mississippi/page (83).png',
    'books/mississippi/page (84).png',
    'books/mississippi/page (85).png',
    'books/mississippi/page (86).png',
    'books/mississippi/page (87).png',
    'books/mississippi/page (88).png',
    'books/mississippi/page (89).png',
    'books/mississippi/page (90).png',
    'books/mississippi/page (91).png',
    'books/mississippi/page (92).png',
    'books/mississippi/page (93).png',
    'books/mississippi/page (94).png',
    'books/mississippi/page (95).png',
    'books/mississippi/page (96).png',
    'books/mississippi/page (97).png',
    'books/mississippi/page (98).png',
    'books/mississippi/page (99).png',
    'books/mississippi/page (100).png',
    'books/mississippi/page (101).png',
    'books/mississippi/page (102).png',
    'books/mississippi/page (103).png',
    'books/mississippi/page (104).png',
    'books/mississippi/page (105).png',
    'books/mississippi/page (106).png',
    'books/mississippi/page (107).png',
    'books/mississippi/page (108).png',
    'books/mississippi/page (109).png',
    'books/mississippi/page (110).png',
    'books/mississippi/page (111).png',
    'books/mississippi/page (112).png',
    'books/mississippi/page (113).png',
    'books/mississippi/page (114).png',
    'books/mississippi/page (115).png',
    'books/mississippi/page (116).png',
    'books/mississippi/page (117).png',
    'books/mississippi/page (118).png',
    'books/mississippi/page (119).png',
    'books/mississippi/page (120).png',
    'books/mississippi/page (121).png',
    'books/mississippi/page (122).png',
    'books/mississippi/page (123).png',
    'books/mississippi/page (124).png',
    'books/mississippi/page (125).png',
    'books/mississippi/page (126).png',
    'books/mississippi/page (127).png',
    'books/mississippi/page (128).png',
    'books/mississippi/page (129).png',
    'books/mississippi/page (130).png',
    'books/mississippi/page (131).png',
    'books/mississippi/page (132).png',
    'books/mississippi/page (133).png',
    'books/mississippi/page (134).png',
    'books/mississippi/page (135).png',
    'books/mississippi/page (136).png',
    'books/mississippi/page (137).png',
    'books/mississippi/page (138).png',
    'books/mississippi/page (139).png',
    'books/mississippi/page (140).png',
    'books/mississippi/page (141).png',
    'books/mississippi/page (142).png',
    'books/mississippi/page (143).png',
    'books/mississippi/page (144).png',
    'books/mississippi/page (145).png',
    'books/mississippi/page (146).png',
    'books/mississippi/page (147).png',
    'books/mississippi/page (148).png',
    'books/mississippi/page (149).png',
    'books/mississippi/page (150).png',
    'books/mississippi/page (151).png',
    'books/mississippi/page (152).png',
    'books/mississippi/page (153).png',
    'books/mississippi/page (154).png',
    'books/mississippi/page (155).png',
    'books/mississippi/page (156).png',
    'books/mississippi/page (157).png',
    'books/mississippi/page (158).png',
    'books/mississippi/page (159).png',
    'books/mississippi/page (160).png',
    'books/mississippi/page (161).png',
    'books/mississippi/page (162).png',
    'books/mississippi/page (163).png',
    'books/mississippi/page (164).png',
    'books/mississippi/page (165).png',
    'books/mississippi/page (166).png',
    'books/mississippi/page (167).png',
    'books/mississippi/page (168).png',
    'books/mississippi/page (169).png',
    'books/mississippi/page (170).png',
    'books/mississippi/page (171).png',
    'books/mississippi/page (172).png',
    'books/mississippi/page (173).png',
    'books/mississippi/page (174).png',
    'books/mississippi/page (175).png',
    'books/mississippi/page (176).png',
    'books/mississippi/page (177).png',
    'books/mississippi/page (178).png',
    'books/mississippi/page (179).png',
    'books/mississippi/page (180).png',
    'books/mississippi/page (181).png',
    'books/mississippi/page (182).png',
    'books/mississippi/page (183).png',
    'books/mississippi/page (184).png',
    'books/mississippi/page (185).png',
    'books/mississippi/page (186).png',
    'books/mississippi/page (187).png',
    'books/mississippi/page (188).png',
    'books/mississippi/page (189).png',
    'books/mississippi/page (190).png',
    'books/mississippi/page (191).png',
    'books/mississippi/page (192).png',
    'books/mississippi/page (193).png',
    'books/mississippi/page (194).png',
    'books/mississippi/page (195).png',
    'books/mississippi/page (196).png',
    'books/mississippi/page (197).png',
    'books/mississippi/page (198).png',
    'books/mississippi/page (199).png',
    'books/mississippi/page (200).png',
    'books/mississippi/page (201).png',
    'books/mississippi/page (202).png',
    'books/mississippi/page (203).png',
    'books/mississippi/page (204).png',
    'books/mississippi/page (205).png',
    'books/mississippi/page (206).png',
    'books/mississippi/page (207).png',
    'books/mississippi/page (208).png',
    'books/mississippi/page (209).png',
    'books/mississippi/page (210).png',
    'books/mississippi/page (211).png',
    'books/mississippi/page (212).png',
    'books/mississippi/page (213).png',
    'books/mississippi/page (214).png',
    'books/mississippi/page (215).png',
    'books/mississippi/page (216).png',
    'books/mississippi/page (217).png',
    'books/mississippi/page (218).png',
    'books/mississippi/page (219).png',
    'books/mississippi/page (220).png',
    'books/mississippi/page (221).png',
    'books/mississippi/page (222).png',
    'books/mississippi/page (223).png',
    'books/mississippi/page (224).png',
    'books/mississippi/page (225).png',
    'books/mississippi/page (226).png',
    'books/mississippi/page (227).png',
    'books/mississippi/page (228).png',
    'books/mississippi/page (229).png',
    'books/mississippi/page (230).png',
    'books/mississippi/page (231).png',
    'books/mississippi/page (232).png',
    'books/mississippi/page (233).png',
    'books/mississippi/page (234).png',
    'books/mississippi/page (235).png',
    'books/mississippi/page (236).png',
    'books/mississippi/page (237).png',
    'books/mississippi/page (238).png',
    'books/mississippi/page (239).png',
    'books/mississippi/page (240).png',
    'books/mississippi/page (241).png',
    'books/mississippi/page (242).png',
    'books/mississippi/page (243).png',
    'books/mississippi/page (244).png',
    'books/mississippi/page (245).png',
    'books/mississippi/page (246).png',
    'books/mississippi/page (247).png',
    'books/mississippi/page (248).png',
    'books/mississippi/page (249).png',
    'books/mississippi/page (250).png',
    'books/mississippi/page (251).png',
    'books/mississippi/page (252).png',
    'books/mississippi/page (253).png',
    'books/mississippi/page (254).png',
    'books/mississippi/page (255).png',
    'books/mississippi/page (256).png',
    'books/mississippi/page (257).png',
    'books/mississippi/page (258).png',
    'books/mississippi/page (259).png',
    'books/mississippi/page (260).png',
    'books/mississippi/page (261).png',
    'books/mississippi/page (262).png',
    'books/mississippi/page (263).png',
    'books/mississippi/page (264).png',
    'books/mississippi/page (265).png',
    'books/mississippi/page (266).png',
    'books/mississippi/page (267).png',
    'books/mississippi/page (268).png',
    'books/mississippi/page (269).png',
    'books/mississippi/page (270).png',
    'books/mississippi/page (271).png',
    'books/mississippi/page (272).png',
    'books/mississippi/page (273).png',
    'books/mississippi/page (274).png',
    'books/mississippi/page (275).png',
    'books/mississippi/page (276).png',
    'books/mississippi/page (277).png',
    'books/mississippi/page (278).png',
    'books/mississippi/page (279).png',
    'books/mississippi/page (280).png',
    'books/mississippi/page (281).png',
    'books/mississippi/page (282).png',
    'books/mississippi/page (283).png',
    'books/mississippi/page (284).png',
    'books/mississippi/page (285).png',
    'books/mississippi/page (286).png',
    'books/mississippi/page (287).png',
    'books/mississippi/page (288).png',
    'books/mississippi/page (289).png',
    'books/mississippi/page (290).png',
    'books/mississippi/page (291).png',
    'books/mississippi/page (292).png',
    'books/mississippi/page (293).png',
    'books/mississippi/page (294).png',
    'books/mississippi/page (295).png',
    'books/mississippi/page (296).png',
    'books/mississippi/page (297).png',
    'books/mississippi/page (298).png',
    'books/mississippi/page (299).png',
    'books/mississippi/page (300).png',
    'books/mississippi/page (301).png',
    'books/mississippi/page (302).png',
    'books/mississippi/page (303).png',
    'books/mississippi/page (304).png',
    'books/mississippi/page (305).png',
    'books/mississippi/page (306).png',
    'books/mississippi/page (307).png',
    'books/mississippi/page (308).png',
    'books/mississippi/page (309).png',
    'books/mississippi/page (310).png',
    'books/mississippi/page (311).png',
    'books/mississippi/page (312).png',
    'books/mississippi/page (313).png',
    'books/mississippi/page (314).png',
    'books/mississippi/page (315).png',
    'books/mississippi/page (316).png',
    'books/mississippi/page (317).png',
    'books/mississippi/page (318).png',
    'books/mississippi/page (319).png',
    'books/mississippi/page (320).png',
    'books/mississippi/page (321).png',
    'books/mississippi/page (322).png',
    'books/mississippi/page (323).png',
    'books/mississippi/page (324).png',
    'books/mississippi/page (325).png',
    'books/mississippi/page (326).png',
    'books/mississippi/page (327).png',
    'books/mississippi/page (328).png',
    'books/mississippi/page (329).png',
    'books/mississippi/page (330).png',
    'books/mississippi/page (331).png',
    'books/mississippi/page (332).png',
    'books/mississippi/page (333).png',
    'books/mississippi/page (334).png',
    'books/mississippi/page (335).png',
    'books/mississippi/page (336).png',
    'books/mississippi/page (337).png',
    'books/mississippi/page (338).png',
    'books/mississippi/page (339).png',
    'books/mississippi/page (340).png',
    'books/mississippi/page (341).png',
    'books/mississippi/page (342).png',
    'books/mississippi/page (343).png',
    'books/mississippi/page (344).png',
    'books/mississippi/page (345).png',
    'books/mississippi/page (346).png',
    'books/mississippi/page (347).png',
    'books/mississippi/page (348).png',
    'books/mississippi/page (349).png',
    'books/mississippi/page (350).png',
    'books/mississippi/page (351).png',
    'books/mississippi/page (352).png',
    'books/mississippi/page (353).png',
    'books/mississippi/page (354).png',
    'books/mississippi/page (355).png',
    'books/mississippi/page (356).png',
    'books/mississippi/page (357).png',
    'books/mississippi/page (358).png',
    'books/mississippi/page (359).png',
    'books/mississippi/page (360).png',
    'books/mississippi/page (361).png',
    'books/mississippi/page (362).png',
    'books/mississippi/page (363).png',
    'books/mississippi/page (364).png',
    'books/mississippi/page (365).png',
    'books/mississippi/page (366).png',
    'books/mississippi/page (367).png',
    'books/mississippi/page (368).png',
    'books/mississippi/page (369).png',
    'books/mississippi/page (370).png',
    'books/mississippi/page (371).png',
    'books/mississippi/page (372).png',
    'books/mississippi/page (373).png',
    'books/mississippi/page (374).png',
    'books/mississippi/page (375).png',
    'books/mississippi/page (376).png',
    'books/mississippi/page (377).png',
    'books/mississippi/page (378).png',
    'books/mississippi/page (379).png',
    'books/mississippi/page (380).png',
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
