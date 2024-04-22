import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class twentythousand extends StatefulWidget {
  const twentythousand({Key? key}) : super(key: key);

  @override
  State<twentythousand> createState() => _twentythousandState();
}

class _twentythousandState extends State<twentythousand> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/twenty thousand/page (1).png',
    'books/twenty thousand/page (2).png',
    'books/twenty thousand/page (3).png',
    'books/twenty thousand/page (4).png',
    'books/twenty thousand/page (5).png',
    'books/twenty thousand/page (6).png',
    'books/twenty thousand/page (7).png',
    'books/twenty thousand/page (8).png',
    'books/twenty thousand/page (9).png',
    'books/twenty thousand/page (10).png',
    'books/twenty thousand/page (11).png',
    'books/twenty thousand/page (12).png',
    'books/twenty thousand/page (13).png',
    'books/twenty thousand/page (14).png',
    'books/twenty thousand/page (15).png',
    'books/twenty thousand/page (16).png',
    'books/twenty thousand/page (17).png',
    'books/twenty thousand/page (18).png',
    'books/twenty thousand/page (19).png',
    'books/twenty thousand/page (20).png',
    'books/twenty thousand/page (21).png',
    'books/twenty thousand/page (22).png',
    'books/twenty thousand/page (23).png',
    'books/twenty thousand/page (24).png',
    'books/twenty thousand/page (25).png',
    'books/twenty thousand/page (26).png',
    'books/twenty thousand/page (27).png',
    'books/twenty thousand/page (28).png',
    'books/twenty thousand/page (29).png',
    'books/twenty thousand/page (30).png',
    'books/twenty thousand/page (31).png',
    'books/twenty thousand/page (32).png',
    'books/twenty thousand/page (33).png',
    'books/twenty thousand/page (34).png',
    'books/twenty thousand/page (35).png',
    'books/twenty thousand/page (36).png',
    'books/twenty thousand/page (37).png',
    'books/twenty thousand/page (38).png',
    'books/twenty thousand/page (39).png',
    'books/twenty thousand/page (40).png',
    'books/twenty thousand/page (41).png',
    'books/twenty thousand/page (42).png',
    'books/twenty thousand/page (43).png',
    'books/twenty thousand/page (44).png',
    'books/twenty thousand/page (45).png',
    'books/twenty thousand/page (46).png',
    'books/twenty thousand/page (47).png',
    'books/twenty thousand/page (48).png',
    'books/twenty thousand/page (49).png',
    'books/twenty thousand/page (50).png',
    'books/twenty thousand/page (51).png',
    'books/twenty thousand/page (52).png',
    'books/twenty thousand/page (53).png',
    'books/twenty thousand/page (54).png',
    'books/twenty thousand/page (55).png',
    'books/twenty thousand/page (56).png',
    'books/twenty thousand/page (57).png',
    'books/twenty thousand/page (58).png',
    'books/twenty thousand/page (59).png',
    'books/twenty thousand/page (60).png',
    'books/twenty thousand/page (61).png',
    'books/twenty thousand/page (62).png',
    'books/twenty thousand/page (63).png',
    'books/twenty thousand/page (64).png',
    'books/twenty thousand/page (65).png',
    'books/twenty thousand/page (66).png',
    'books/twenty thousand/page (67).png',
    'books/twenty thousand/page (68).png',
    'books/twenty thousand/page (69).png',
    'books/twenty thousand/page (70).png',
    'books/twenty thousand/page (71).png',
    'books/twenty thousand/page (72).png',
    'books/twenty thousand/page (73).png',
    'books/twenty thousand/page (74).png',
    'books/twenty thousand/page (75).png',
    'books/twenty thousand/page (76).png',
    'books/twenty thousand/page (77).png',
    'books/twenty thousand/page (78).png',
    'books/twenty thousand/page (79).png',
    'books/twenty thousand/page (80).png',
    'books/twenty thousand/page (81).png',
    'books/twenty thousand/page (82).png',
    'books/twenty thousand/page (83).png',
    'books/twenty thousand/page (84).png',
    'books/twenty thousand/page (85).png',
    'books/twenty thousand/page (86).png',
    'books/twenty thousand/page (87).png',
    'books/twenty thousand/page (88).png',
    'books/twenty thousand/page (89).png',
    'books/twenty thousand/page (90).png',
    'books/twenty thousand/page (91).png',
    'books/twenty thousand/page (92).png',
    'books/twenty thousand/page (93).png',
    'books/twenty thousand/page (94).png',
    'books/twenty thousand/page (95).png',
    'books/twenty thousand/page (96).png',
    'books/twenty thousand/page (97).png',
    'books/twenty thousand/page (98).png',
    'books/twenty thousand/page (99).png',
    'books/twenty thousand/page (100).png',
    'books/twenty thousand/page (101).png',
    'books/twenty thousand/page (102).png',
    'books/twenty thousand/page (103).png',
    'books/twenty thousand/page (104).png',
    'books/twenty thousand/page (105).png',
    'books/twenty thousand/page (106).png',
    'books/twenty thousand/page (107).png',
    'books/twenty thousand/page (108).png',
    'books/twenty thousand/page (109).png',
    'books/twenty thousand/page (110).png',
    'books/twenty thousand/page (111).png',
    'books/twenty thousand/page (112).png',
    'books/twenty thousand/page (113).png',
    'books/twenty thousand/page (114).png',
    'books/twenty thousand/page (115).png',
    'books/twenty thousand/page (116).png',
    'books/twenty thousand/page (117).png',
    'books/twenty thousand/page (118).png',
    'books/twenty thousand/page (119).png',
    'books/twenty thousand/page (120).png',
    'books/twenty thousand/page (121).png',
    'books/twenty thousand/page (122).png',
    'books/twenty thousand/page (123).png',
    'books/twenty thousand/page (124).png',
    'books/twenty thousand/page (125).png',
    'books/twenty thousand/page (126).png',
    'books/twenty thousand/page (127).png',
    'books/twenty thousand/page (128).png',
    'books/twenty thousand/page (129).png',
    'books/twenty thousand/page (130).png',
    'books/twenty thousand/page (131).png',
    'books/twenty thousand/page (132).png',
    'books/twenty thousand/page (133).png',
    'books/twenty thousand/page (134).png',
    'books/twenty thousand/page (135).png',
    'books/twenty thousand/page (136).png',
    'books/twenty thousand/page (137).png',
    'books/twenty thousand/page (138).png',
    'books/twenty thousand/page (139).png',
    'books/twenty thousand/page (140).png',
    'books/twenty thousand/page (141).png',
    'books/twenty thousand/page (142).png',
    'books/twenty thousand/page (143).png',
    'books/twenty thousand/page (144).png',
    'books/twenty thousand/page (145).png',
    'books/twenty thousand/page (146).png',
    'books/twenty thousand/page (147).png',
    'books/twenty thousand/page (148).png',
    'books/twenty thousand/page (149).png',
    'books/twenty thousand/page (150).png',
    'books/twenty thousand/page (151).png',
    'books/twenty thousand/page (152).png',
    'books/twenty thousand/page (153).png',
    'books/twenty thousand/page (154).png',
    'books/twenty thousand/page (155).png',
    'books/twenty thousand/page (156).png',
    'books/twenty thousand/page (157).png',
    'books/twenty thousand/page (158).png',
    'books/twenty thousand/page (159).png',
    'books/twenty thousand/page (160).png',
    'books/twenty thousand/page (161).png',
    'books/twenty thousand/page (162).png',
    'books/twenty thousand/page (163).png',
    'books/twenty thousand/page (164).png',
    'books/twenty thousand/page (165).png',
    'books/twenty thousand/page (166).png',
    'books/twenty thousand/page (167).png',
    'books/twenty thousand/page (168).png',
    'books/twenty thousand/page (169).png',
    'books/twenty thousand/page (170).png',
    'books/twenty thousand/page (171).png',
    'books/twenty thousand/page (172).png',
    'books/twenty thousand/page (173).png',
    'books/twenty thousand/page (174).png',
    'books/twenty thousand/page (175).png',
    'books/twenty thousand/page (176).png',
    'books/twenty thousand/page (177).png',
    'books/twenty thousand/page (178).png',
    'books/twenty thousand/page (179).png',
    'books/twenty thousand/page (180).png',
    'books/twenty thousand/page (181).png',
    'books/twenty thousand/page (182).png',
    'books/twenty thousand/page (183).png',
    'books/twenty thousand/page (184).png',
    'books/twenty thousand/page (185).png',
    'books/twenty thousand/page (186).png',
    'books/twenty thousand/page (187).png',
    'books/twenty thousand/page (188).png',
    'books/twenty thousand/page (189).png',
    'books/twenty thousand/page (190).png',
    'books/twenty thousand/page (191).png',
    'books/twenty thousand/page (192).png',
    'books/twenty thousand/page (193).png',
    'books/twenty thousand/page (194).png',
    'books/twenty thousand/page (195).png',
    'books/twenty thousand/page (196).png',
    'books/twenty thousand/page (197).png',
    'books/twenty thousand/page (198).png',
    'books/twenty thousand/page (199).png',
    'books/twenty thousand/page (200).png',
    'books/twenty thousand/page (201).png',
    'books/twenty thousand/page (202).png',
    'books/twenty thousand/page (203).png',
    'books/twenty thousand/page (204).png',
    'books/twenty thousand/page (205).png',
    'books/twenty thousand/page (206).png',
    'books/twenty thousand/page (207).png',
    'books/twenty thousand/page (208).png',
    'books/twenty thousand/page (209).png',
    'books/twenty thousand/page (210).png',
    'books/twenty thousand/page (211).png',
    'books/twenty thousand/page (212).png',
    'books/twenty thousand/page (213).png',
    'books/twenty thousand/page (214).png',
    'books/twenty thousand/page (215).png',
    'books/twenty thousand/page (216).png',
    'books/twenty thousand/page (217).png',
    'books/twenty thousand/page (218).png',
    'books/twenty thousand/page (219).png',
    'books/twenty thousand/page (220).png',
    'books/twenty thousand/page (221).png',
    'books/twenty thousand/page (222).png',
    'books/twenty thousand/page (223).png',
    'books/twenty thousand/page (224).png',
    'books/twenty thousand/page (225).png',
    'books/twenty thousand/page (226).png',
    'books/twenty thousand/page (227).png',
    'books/twenty thousand/page (228).png',
    'books/twenty thousand/page (229).png',
    'books/twenty thousand/page (230).png',
    'books/twenty thousand/page (231).png',
    'books/twenty thousand/page (232).png',
    'books/twenty thousand/page (233).png',
    'books/twenty thousand/page (234).png',
    'books/twenty thousand/page (235).png',
    'books/twenty thousand/page (236).png',
    'books/twenty thousand/page (237).png',
    'books/twenty thousand/page (238).png',
    'books/twenty thousand/page (239).png',
    'books/twenty thousand/page (240).png',
    'books/twenty thousand/page (241).png',
    'books/twenty thousand/page (242).png',
    'books/twenty thousand/page (243).png',
    'books/twenty thousand/page (244).png',
    'books/twenty thousand/page (245).png',
    'books/twenty thousand/page (246).png',
    'books/twenty thousand/page (247).png',
    'books/twenty thousand/page (248).png',
    'books/twenty thousand/page (249).png',
    'books/twenty thousand/page (250).png',
    'books/twenty thousand/page (251).png',
    'books/twenty thousand/page (252).png',
    'books/twenty thousand/page (253).png',
    'books/twenty thousand/page (254).png',
    'books/twenty thousand/page (255).png',
    'books/twenty thousand/page (256).png',
    'books/twenty thousand/page (257).png',
    'books/twenty thousand/page (258).png',
    'books/twenty thousand/page (259).png',
    'books/twenty thousand/page (260).png',
    'books/twenty thousand/page (261).png',
    'books/twenty thousand/page (262).png',
    'books/twenty thousand/page (263).png',
    'books/twenty thousand/page (264).png',
    'books/twenty thousand/page (265).png',
    'books/twenty thousand/page (266).png',
    'books/twenty thousand/page (267).png',
    'books/twenty thousand/page (268).png',
    'books/twenty thousand/page (269).png',
    'books/twenty thousand/page (270).png',
    'books/twenty thousand/page (271).png',
    'books/twenty thousand/page (272).png',
    'books/twenty thousand/page (273).png',
    'books/twenty thousand/page (274).png',
    'books/twenty thousand/page (275).png',
    'books/twenty thousand/page (276).png',
    'books/twenty thousand/page (277).png',
    'books/twenty thousand/page (278).png',
    'books/twenty thousand/page (279).png',
    'books/twenty thousand/page (280).png',
    'books/twenty thousand/page (281).png',
    'books/twenty thousand/page (282).png',
    'books/twenty thousand/page (283).png',
    'books/twenty thousand/page (284).png',
    'books/twenty thousand/page (285).png',
    'books/twenty thousand/page (286).png',
    'books/twenty thousand/page (287).png',
    'books/twenty thousand/page (288).png',
    'books/twenty thousand/page (289).png',
    'books/twenty thousand/page (290).png',
    'books/twenty thousand/page (291).png',
    'books/twenty thousand/page (292).png',
    'books/twenty thousand/page (293).png',
    'books/twenty thousand/page (294).png',
    'books/twenty thousand/page (295).png',
    'books/twenty thousand/page (296).png',
    'books/twenty thousand/page (297).png',
    'books/twenty thousand/page (298).png',
    'books/twenty thousand/page (299).png',
    'books/twenty thousand/page (300).png',
    'books/twenty thousand/page (301).png',
    'books/twenty thousand/page (302).png',
    'books/twenty thousand/page (303).png',
    'books/twenty thousand/page (304).png',
    'books/twenty thousand/page (305).png',
    'books/twenty thousand/page (306).png',
    'books/twenty thousand/page (307).png',
    'books/twenty thousand/page (308).png',
    'books/twenty thousand/page (309).png',
    'books/twenty thousand/page (310).png',
    'books/twenty thousand/page (311).png',
    'books/twenty thousand/page (312).png',
    'books/twenty thousand/page (313).png',
    'books/twenty thousand/page (314).png',
    'books/twenty thousand/page (315).png',
    'books/twenty thousand/page (316).png',
    'books/twenty thousand/page (317).png',
    'books/twenty thousand/page (318).png',
    'books/twenty thousand/page (319).png',
    'books/twenty thousand/page (320).png',
    'books/twenty thousand/page (321).png',
    'books/twenty thousand/page (322).png',
    'books/twenty thousand/page (323).png',
    'books/twenty thousand/page (324).png',
    'books/twenty thousand/page (325).png',
    'books/twenty thousand/page (326).png',
    'books/twenty thousand/page (327).png',
    'books/twenty thousand/page (328).png',
    'books/twenty thousand/page (329).png',
    'books/twenty thousand/page (330).png',
    'books/twenty thousand/page (331).png',
    'books/twenty thousand/page (332).png',
    'books/twenty thousand/page (333).png',
    'books/twenty thousand/page (334).png',
    'books/twenty thousand/page (335).png',
    'books/twenty thousand/page (336).png',
    'books/twenty thousand/page (337).png',
    'books/twenty thousand/page (338).png',
    'books/twenty thousand/page (339).png',
    'books/twenty thousand/page (340).png',
    'books/twenty thousand/page (341).png',
    'books/twenty thousand/page (342).png',
    'books/twenty thousand/page (343).png',
    'books/twenty thousand/page (344).png',
    'books/twenty thousand/page (345).png',
    'books/twenty thousand/page (346).png',
    'books/twenty thousand/page (347).png',
    'books/twenty thousand/page (348).png',

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
