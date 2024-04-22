import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class voyageout extends StatefulWidget {
  const voyageout({Key? key}) : super(key: key);

  @override
  State<voyageout> createState() => _voyageoutState();
}

class _voyageoutState extends State<voyageout> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/voyage out/page (1).png',
    'books/voyage out/page (2).png',
    'books/voyage out/page (3).png',
    'books/voyage out/page (4).png',
    'books/voyage out/page (5).png',
    'books/voyage out/page (6).png',
    'books/voyage out/page (7).png',
    'books/voyage out/page (8).png',
    'books/voyage out/page (9).png',
    'books/voyage out/page (10).png',
    'books/voyage out/page (11).png',
    'books/voyage out/page (12).png',
    'books/voyage out/page (13).png',
    'books/voyage out/page (14).png',
    'books/voyage out/page (15).png',
    'books/voyage out/page (16).png',
    'books/voyage out/page (17).png',
    'books/voyage out/page (18).png',
    'books/voyage out/page (19).png',
    'books/voyage out/page (20).png',
    'books/voyage out/page (21).png',
    'books/voyage out/page (22).png',
    'books/voyage out/page (23).png',
    'books/voyage out/page (24).png',
    'books/voyage out/page (25).png',
    'books/voyage out/page (26).png',
    'books/voyage out/page (27).png',
    'books/voyage out/page (28).png',
    'books/voyage out/page (29).png',
    'books/voyage out/page (30).png',
    'books/voyage out/page (31).png',
    'books/voyage out/page (32).png',
    'books/voyage out/page (33).png',
    'books/voyage out/page (34).png',
    'books/voyage out/page (35).png',
    'books/voyage out/page (36).png',
    'books/voyage out/page (37).png',
    'books/voyage out/page (38).png',
    'books/voyage out/page (39).png',
    'books/voyage out/page (40).png',
    'books/voyage out/page (41).png',
    'books/voyage out/page (42).png',
    'books/voyage out/page (43).png',
    'books/voyage out/page (44).png',
    'books/voyage out/page (45).png',
    'books/voyage out/page (46).png',
    'books/voyage out/page (47).png',
    'books/voyage out/page (48).png',
    'books/voyage out/page (49).png',
    'books/voyage out/page (50).png',
    'books/voyage out/page (51).png',
    'books/voyage out/page (52).png',
    'books/voyage out/page (53).png',
    'books/voyage out/page (54).png',
    'books/voyage out/page (55).png',
    'books/voyage out/page (56).png',
    'books/voyage out/page (57).png',
    'books/voyage out/page (58).png',
    'books/voyage out/page (59).png',
    'books/voyage out/page (60).png',
    'books/voyage out/page (61).png',
    'books/voyage out/page (62).png',
    'books/voyage out/page (63).png',
    'books/voyage out/page (64).png',
    'books/voyage out/page (65).png',
    'books/voyage out/page (66).png',
    'books/voyage out/page (67).png',
    'books/voyage out/page (68).png',
    'books/voyage out/page (69).png',
    'books/voyage out/page (70).png',
    'books/voyage out/page (71).png',
    'books/voyage out/page (72).png',
    'books/voyage out/page (73).png',
    'books/voyage out/page (74).png',
    'books/voyage out/page (75).png',
    'books/voyage out/page (76).png',
    'books/voyage out/page (77).png',
    'books/voyage out/page (78).png',
    'books/voyage out/page (79).png',
    'books/voyage out/page (80).png',
    'books/voyage out/page (81).png',
    'books/voyage out/page (82).png',
    'books/voyage out/page (83).png',
    'books/voyage out/page (84).png',
    'books/voyage out/page (85).png',
    'books/voyage out/page (86).png',
    'books/voyage out/page (87).png',
    'books/voyage out/page (88).png',
    'books/voyage out/page (89).png',
    'books/voyage out/page (90).png',
    'books/voyage out/page (91).png',
    'books/voyage out/page (92).png',
    'books/voyage out/page (93).png',
    'books/voyage out/page (94).png',
    'books/voyage out/page (95).png',
    'books/voyage out/page (96).png',
    'books/voyage out/page (97).png',
    'books/voyage out/page (98).png',
    'books/voyage out/page (99).png',
    'books/voyage out/page (100).png',
    'books/voyage out/page (101).png',
    'books/voyage out/page (102).png',
    'books/voyage out/page (103).png',
    'books/voyage out/page (104).png',
    'books/voyage out/page (105).png',
    'books/voyage out/page (106).png',
    'books/voyage out/page (107).png',
    'books/voyage out/page (108).png',
    'books/voyage out/page (109).png',
    'books/voyage out/page (110).png',
    'books/voyage out/page (111).png',
    'books/voyage out/page (112).png',
    'books/voyage out/page (113).png',
    'books/voyage out/page (114).png',
    'books/voyage out/page (115).png',
    'books/voyage out/page (116).png',
    'books/voyage out/page (117).png',
    'books/voyage out/page (118).png',
    'books/voyage out/page (119).png',
    'books/voyage out/page (120).png',
    'books/voyage out/page (121).png',
    'books/voyage out/page (122).png',
    'books/voyage out/page (123).png',
    'books/voyage out/page (124).png',
    'books/voyage out/page (125).png',
    'books/voyage out/page (126).png',
    'books/voyage out/page (127).png',
    'books/voyage out/page (128).png',
    'books/voyage out/page (129).png',
    'books/voyage out/page (130).png',
    'books/voyage out/page (131).png',
    'books/voyage out/page (132).png',
    'books/voyage out/page (133).png',
    'books/voyage out/page (134).png',
    'books/voyage out/page (135).png',
    'books/voyage out/page (136).png',
    'books/voyage out/page (137).png',
    'books/voyage out/page (138).png',
    'books/voyage out/page (139).png',
    'books/voyage out/page (140).png',
    'books/voyage out/page (141).png',
    'books/voyage out/page (142).png',
    'books/voyage out/page (143).png',
    'books/voyage out/page (144).png',
    'books/voyage out/page (145).png',
    'books/voyage out/page (146).png',
    'books/voyage out/page (147).png',
    'books/voyage out/page (148).png',
    'books/voyage out/page (149).png',
    'books/voyage out/page (150).png',
    'books/voyage out/page (151).png',
    'books/voyage out/page (152).png',
    'books/voyage out/page (153).png',
    'books/voyage out/page (154).png',
    'books/voyage out/page (155).png',
    'books/voyage out/page (156).png',
    'books/voyage out/page (157).png',
    'books/voyage out/page (158).png',
    'books/voyage out/page (159).png',
    'books/voyage out/page (160).png',
    'books/voyage out/page (161).png',
    'books/voyage out/page (162).png',
    'books/voyage out/page (163).png',
    'books/voyage out/page (164).png',
    'books/voyage out/page (165).png',
    'books/voyage out/page (166).png',
    'books/voyage out/page (167).png',
    'books/voyage out/page (168).png',
    'books/voyage out/page (169).png',
    'books/voyage out/page (170).png',
    'books/voyage out/page (171).png',
    'books/voyage out/page (172).png',
    'books/voyage out/page (173).png',
    'books/voyage out/page (174).png',
    'books/voyage out/page (175).png',
    'books/voyage out/page (176).png',
    'books/voyage out/page (177).png',
    'books/voyage out/page (178).png',
    'books/voyage out/page (179).png',
    'books/voyage out/page (180).png',
    'books/voyage out/page (181).png',
    'books/voyage out/page (182).png',
    'books/voyage out/page (183).png',
    'books/voyage out/page (184).png',
    'books/voyage out/page (185).png',
    'books/voyage out/page (186).png',
    'books/voyage out/page (187).png',
    'books/voyage out/page (188).png',
    'books/voyage out/page (189).png',
    'books/voyage out/page (190).png',
    'books/voyage out/page (191).png',
    'books/voyage out/page (192).png',
    'books/voyage out/page (193).png',
    'books/voyage out/page (194).png',
    'books/voyage out/page (195).png',
    'books/voyage out/page (196).png',
    'books/voyage out/page (197).png',
    'books/voyage out/page (198).png',
    'books/voyage out/page (199).png',
    'books/voyage out/page (200).png',
    'books/voyage out/page (201).png',
    'books/voyage out/page (202).png',
    'books/voyage out/page (203).png',
    'books/voyage out/page (204).png',
    'books/voyage out/page (205).png',
    'books/voyage out/page (206).png',
    'books/voyage out/page (207).png',
    'books/voyage out/page (208).png',
    'books/voyage out/page (209).png',
    'books/voyage out/page (210).png',
    'books/voyage out/page (211).png',
    'books/voyage out/page (212).png',
    'books/voyage out/page (213).png',
    'books/voyage out/page (214).png',
    'books/voyage out/page (215).png',
    'books/voyage out/page (216).png',
    'books/voyage out/page (217).png',
    'books/voyage out/page (218).png',
    'books/voyage out/page (219).png',
    'books/voyage out/page (220).png',
    'books/voyage out/page (221).png',
    'books/voyage out/page (222).png',
    'books/voyage out/page (223).png',
    'books/voyage out/page (224).png',
    'books/voyage out/page (225).png',
    'books/voyage out/page (226).png',
    'books/voyage out/page (227).png',
    'books/voyage out/page (228).png',
    'books/voyage out/page (229).png',
    'books/voyage out/page (230).png',
    'books/voyage out/page (231).png',
    'books/voyage out/page (232).png',
    'books/voyage out/page (233).png',
    'books/voyage out/page (234).png',
    'books/voyage out/page (235).png',
    'books/voyage out/page (236).png',
    'books/voyage out/page (237).png',
    'books/voyage out/page (238).png',
    'books/voyage out/page (239).png',
    'books/voyage out/page (240).png',
    'books/voyage out/page (241).png',
    'books/voyage out/page (242).png',
    'books/voyage out/page (243).png',
    'books/voyage out/page (244).png',
    'books/voyage out/page (245).png',
    'books/voyage out/page (246).png',
    'books/voyage out/page (247).png',
    'books/voyage out/page (248).png',
    'books/voyage out/page (249).png',
    'books/voyage out/page (250).png',
    'books/voyage out/page (251).png',
    'books/voyage out/page (252).png',
    'books/voyage out/page (253).png',
    'books/voyage out/page (254).png',
    'books/voyage out/page (255).png',
    'books/voyage out/page (256).png',
    'books/voyage out/page (257).png',
    'books/voyage out/page (258).png',
    'books/voyage out/page (259).png',
    'books/voyage out/page (260).png',
    'books/voyage out/page (261).png',
    'books/voyage out/page (262).png',
    'books/voyage out/page (263).png',
    'books/voyage out/page (264).png',
    'books/voyage out/page (265).png',
    'books/voyage out/page (266).png',
    'books/voyage out/page (267).png',
    'books/voyage out/page (268).png',
    'books/voyage out/page (269).png',
    'books/voyage out/page (270).png',
    'books/voyage out/page (271).png',
    'books/voyage out/page (272).png',
    'books/voyage out/page (273).png',
    'books/voyage out/page (274).png',
    'books/voyage out/page (275).png',
    'books/voyage out/page (276).png',
    'books/voyage out/page (277).png',
    'books/voyage out/page (278).png',
    'books/voyage out/page (279).png',
    'books/voyage out/page (280).png',
    'books/voyage out/page (281).png',
    'books/voyage out/page (282).png',
    'books/voyage out/page (283).png',
    'books/voyage out/page (284).png',
    'books/voyage out/page (285).png',
    'books/voyage out/page (286).png',
    'books/voyage out/page (287).png',
    'books/voyage out/page (288).png',
    'books/voyage out/page (289).png',
    'books/voyage out/page (290).png',
    'books/voyage out/page (291).png',
    'books/voyage out/page (292).png',
    'books/voyage out/page (293).png',
    'books/voyage out/page (294).png',
    'books/voyage out/page (295).png',
    'books/voyage out/page (296).png',
    'books/voyage out/page (297).png',
    'books/voyage out/page (298).png',
    'books/voyage out/page (299).png',
    'books/voyage out/page (300).png',
    'books/voyage out/page (301).png',
    'books/voyage out/page (302).png',
    'books/voyage out/page (303).png',
    'books/voyage out/page (304).png',
    'books/voyage out/page (305).png',
    'books/voyage out/page (306).png',
    'books/voyage out/page (307).png',
    'books/voyage out/page (308).png',
    'books/voyage out/page (309).png',
    'books/voyage out/page (310).png',
    'books/voyage out/page (311).png',
    'books/voyage out/page (312).png',
    'books/voyage out/page (313).png',
    'books/voyage out/page (314).png',
    'books/voyage out/page (315).png',
    'books/voyage out/page (316).png',
    'books/voyage out/page (317).png',
    'books/voyage out/page (318).png',
    'books/voyage out/page (319).png',
    'books/voyage out/page (320).png',
    'books/voyage out/page (321).png',
    'books/voyage out/page (322).png',
    'books/voyage out/page (323).png',
    'books/voyage out/page (324).png',
    'books/voyage out/page (325).png',
    'books/voyage out/page (326).png',
    'books/voyage out/page (327).png',
    'books/voyage out/page (328).png',
    'books/voyage out/page (329).png',
    'books/voyage out/page (330).png',
    'books/voyage out/page (331).png',
    'books/voyage out/page (332).png',
    'books/voyage out/page (333).png',
    'books/voyage out/page (334).png',
    'books/voyage out/page (335).png',
    'books/voyage out/page (336).png',
    'books/voyage out/page (337).png',
    'books/voyage out/page (338).png',
    'books/voyage out/page (339).png',
    'books/voyage out/page (340).png',
    'books/voyage out/page (341).png',
    'books/voyage out/page (342).png',
    'books/voyage out/page (343).png',
    'books/voyage out/page (344).png',
    'books/voyage out/page (345).png',
    'books/voyage out/page (346).png',
    'books/voyage out/page (347).png',
    'books/voyage out/page (348).png',

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
