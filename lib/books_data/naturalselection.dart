import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class naturalselection extends StatefulWidget {
  const naturalselection({Key? key}) : super(key: key);

  @override
  State<naturalselection> createState() => _naturalselectionState();
}

class _naturalselectionState extends State<naturalselection> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/natural selection/page (1).png',
    'books/natural selection/page (2).png',
    'books/natural selection/page (3).png',
    'books/natural selection/page (4).png',
    'books/natural selection/page (5).png',
    'books/natural selection/page (6).png',
    'books/natural selection/page (7).png',
    'books/natural selection/page (8).png',
    'books/natural selection/page (9).png',
    'books/natural selection/page (10).png',
    'books/natural selection/page (11).png',
    'books/natural selection/page (12).png',
    'books/natural selection/page (13).png',
    'books/natural selection/page (14).png',
    'books/natural selection/page (15).png',
    'books/natural selection/page (16).png',
    'books/natural selection/page (17).png',
    'books/natural selection/page (18).png',
    'books/natural selection/page (19).png',
    'books/natural selection/page (20).png',
    'books/natural selection/page (21).png',
    'books/natural selection/page (22).png',
    'books/natural selection/page (23).png',
    'books/natural selection/page (24).png',
    'books/natural selection/page (25).png',
    'books/natural selection/page (26).png',
    'books/natural selection/page (27).png',
    'books/natural selection/page (28).png',
    'books/natural selection/page (29).png',
    'books/natural selection/page (30).png',
    'books/natural selection/page (31).png',
    'books/natural selection/page (32).png',
    'books/natural selection/page (33).png',
    'books/natural selection/page (34).png',
    'books/natural selection/page (35).png',
    'books/natural selection/page (36).png',
    'books/natural selection/page (37).png',
    'books/natural selection/page (38).png',
    'books/natural selection/page (39).png',
    'books/natural selection/page (40).png',
    'books/natural selection/page (41).png',
    'books/natural selection/page (42).png',
    'books/natural selection/page (43).png',
    'books/natural selection/page (44).png',
    'books/natural selection/page (45).png',
    'books/natural selection/page (46).png',
    'books/natural selection/page (47).png',
    'books/natural selection/page (48).png',
    'books/natural selection/page (49).png',
    'books/natural selection/page (50).png',
    'books/natural selection/page (51).png',
    'books/natural selection/page (52).png',
    'books/natural selection/page (53).png',
    'books/natural selection/page (54).png',
    'books/natural selection/page (55).png',
    'books/natural selection/page (56).png',
    'books/natural selection/page (57).png',
    'books/natural selection/page (58).png',
    'books/natural selection/page (59).png',
    'books/natural selection/page (60).png',
    'books/natural selection/page (61).png',
    'books/natural selection/page (62).png',
    'books/natural selection/page (63).png',
    'books/natural selection/page (64).png',
    'books/natural selection/page (65).png',
    'books/natural selection/page (66).png',
    'books/natural selection/page (67).png',
    'books/natural selection/page (68).png',
    'books/natural selection/page (69).png',
    'books/natural selection/page (70).png',
    'books/natural selection/page (71).png',
    'books/natural selection/page (72).png',
    'books/natural selection/page (73).png',
    'books/natural selection/page (74).png',
    'books/natural selection/page (75).png',
    'books/natural selection/page (76).png',
    'books/natural selection/page (77).png',
    'books/natural selection/page (78).png',
    'books/natural selection/page (79).png',
    'books/natural selection/page (80).png',
    'books/natural selection/page (81).png',
    'books/natural selection/page (82).png',
    'books/natural selection/page (83).png',
    'books/natural selection/page (84).png',
    'books/natural selection/page (85).png',
    'books/natural selection/page (86).png',
    'books/natural selection/page (87).png',
    'books/natural selection/page (88).png',
    'books/natural selection/page (89).png',
    'books/natural selection/page (90).png',
    'books/natural selection/page (91).png',
    'books/natural selection/page (92).png',
    'books/natural selection/page (93).png',
    'books/natural selection/page (94).png',
    'books/natural selection/page (95).png',
    'books/natural selection/page (96).png',
    'books/natural selection/page (97).png',
    'books/natural selection/page (98).png',
    'books/natural selection/page (99).png',
    'books/natural selection/page (100).png',
    'books/natural selection/page (101).png',
    'books/natural selection/page (102).png',
    'books/natural selection/page (103).png',
    'books/natural selection/page (104).png',
    'books/natural selection/page (105).png',
    'books/natural selection/page (106).png',
    'books/natural selection/page (107).png',
    'books/natural selection/page (108).png',
    'books/natural selection/page (109).png',
    'books/natural selection/page (110).png',
    'books/natural selection/page (111).png',
    'books/natural selection/page (112).png',
    'books/natural selection/page (113).png',
    'books/natural selection/page (114).png',
    'books/natural selection/page (115).png',
    'books/natural selection/page (116).png',
    'books/natural selection/page (117).png',
    'books/natural selection/page (118).png',
    'books/natural selection/page (119).png',
    'books/natural selection/page (120).png',
    'books/natural selection/page (121).png',
    'books/natural selection/page (122).png',
    'books/natural selection/page (123).png',
    'books/natural selection/page (124).png',
    'books/natural selection/page (125).png',
    'books/natural selection/page (126).png',
    'books/natural selection/page (127).png',
    'books/natural selection/page (128).png',
    'books/natural selection/page (129).png',
    'books/natural selection/page (130).png',
    'books/natural selection/page (131).png',
    'books/natural selection/page (132).png',
    'books/natural selection/page (133).png',
    'books/natural selection/page (134).png',
    'books/natural selection/page (135).png',
    'books/natural selection/page (136).png',
    'books/natural selection/page (137).png',
    'books/natural selection/page (138).png',
    'books/natural selection/page (139).png',
    'books/natural selection/page (140).png',
    'books/natural selection/page (141).png',
    'books/natural selection/page (142).png',
    'books/natural selection/page (143).png',
    'books/natural selection/page (144).png',
    'books/natural selection/page (145).png',
    'books/natural selection/page (146).png',
    'books/natural selection/page (147).png',
    'books/natural selection/page (148).png',
    'books/natural selection/page (149).png',
    'books/natural selection/page (150).png',
    'books/natural selection/page (151).png',
    'books/natural selection/page (152).png',
    'books/natural selection/page (153).png',
    'books/natural selection/page (154).png',
    'books/natural selection/page (155).png',
    'books/natural selection/page (156).png',
    'books/natural selection/page (157).png',
    'books/natural selection/page (158).png',
    'books/natural selection/page (159).png',
    'books/natural selection/page (160).png',
    'books/natural selection/page (161).png',
    'books/natural selection/page (162).png',
    'books/natural selection/page (163).png',
    'books/natural selection/page (164).png',
    'books/natural selection/page (165).png',
    'books/natural selection/page (166).png',
    'books/natural selection/page (167).png',
    'books/natural selection/page (168).png',
    'books/natural selection/page (169).png',
    'books/natural selection/page (170).png',
    'books/natural selection/page (171).png',
    'books/natural selection/page (172).png',
    'books/natural selection/page (173).png',
    'books/natural selection/page (174).png',
    'books/natural selection/page (175).png',
    'books/natural selection/page (176).png',
    'books/natural selection/page (177).png',
    'books/natural selection/page (178).png',
    'books/natural selection/page (179).png',
    'books/natural selection/page (180).png',
    'books/natural selection/page (181).png',
    'books/natural selection/page (182).png',
    'books/natural selection/page (183).png',
    'books/natural selection/page (184).png',
    'books/natural selection/page (185).png',
    'books/natural selection/page (186).png',
    'books/natural selection/page (187).png',
    'books/natural selection/page (188).png',
    'books/natural selection/page (189).png',
    'books/natural selection/page (190).png',
    'books/natural selection/page (191).png',
    'books/natural selection/page (192).png',
    'books/natural selection/page (193).png',
    'books/natural selection/page (194).png',
    'books/natural selection/page (195).png',
    'books/natural selection/page (196).png',
    'books/natural selection/page (197).png',
    'books/natural selection/page (198).png',
    'books/natural selection/page (199).png',
    'books/natural selection/page (200).png',
    'books/natural selection/page (201).png',
    'books/natural selection/page (202).png',
    'books/natural selection/page (203).png',
    'books/natural selection/page (204).png',
    'books/natural selection/page (205).png',
    'books/natural selection/page (206).png',
    'books/natural selection/page (207).png',
    'books/natural selection/page (208).png',
    'books/natural selection/page (209).png',
    'books/natural selection/page (210).png',
    'books/natural selection/page (211).png',
    'books/natural selection/page (212).png',
    'books/natural selection/page (213).png',
    'books/natural selection/page (214).png',
    'books/natural selection/page (215).png',
    'books/natural selection/page (216).png',
    'books/natural selection/page (217).png',
    'books/natural selection/page (218).png',
    'books/natural selection/page (219).png',
    'books/natural selection/page (220).png',
    'books/natural selection/page (221).png',
    'books/natural selection/page (222).png',
    'books/natural selection/page (223).png',
    'books/natural selection/page (224).png',
    'books/natural selection/page (225).png',
    'books/natural selection/page (226).png',
    'books/natural selection/page (227).png',
    'books/natural selection/page (228).png',
    'books/natural selection/page (229).png',
    'books/natural selection/page (230).png',
    'books/natural selection/page (231).png',
    'books/natural selection/page (232).png',
    'books/natural selection/page (233).png',
    'books/natural selection/page (234).png',
    'books/natural selection/page (235).png',
    'books/natural selection/page (236).png',
    'books/natural selection/page (237).png',
    'books/natural selection/page (238).png',
    'books/natural selection/page (239).png',
    'books/natural selection/page (240).png',
    'books/natural selection/page (241).png',
    'books/natural selection/page (242).png',
    'books/natural selection/page (243).png',
    'books/natural selection/page (244).png',
    'books/natural selection/page (245).png',
    'books/natural selection/page (246).png',
    'books/natural selection/page (247).png',
    'books/natural selection/page (248).png',
    'books/natural selection/page (249).png',
    'books/natural selection/page (250).png',
    'books/natural selection/page (251).png',
    'books/natural selection/page (252).png',
    'books/natural selection/page (253).png',
    'books/natural selection/page (254).png',
    'books/natural selection/page (255).png',
    'books/natural selection/page (256).png',
    'books/natural selection/page (257).png',
    'books/natural selection/page (258).png',
    'books/natural selection/page (259).png',
    'books/natural selection/page (260).png',
    'books/natural selection/page (261).png',
    'books/natural selection/page (262).png',
    'books/natural selection/page (263).png',
    'books/natural selection/page (264).png',
    'books/natural selection/page (265).png',
    'books/natural selection/page (266).png',
    'books/natural selection/page (267).png',
    'books/natural selection/page (268).png',
    'books/natural selection/page (269).png',
    'books/natural selection/page (270).png',
    'books/natural selection/page (271).png',
    'books/natural selection/page (272).png',
    'books/natural selection/page (273).png',
    'books/natural selection/page (274).png',
    'books/natural selection/page (275).png',
    'books/natural selection/page (276).png',
    'books/natural selection/page (277).png',
    'books/natural selection/page (278).png',
    'books/natural selection/page (279).png',
    'books/natural selection/page (280).png',
    'books/natural selection/page (281).png',
    'books/natural selection/page (282).png',
    'books/natural selection/page (283).png',
    'books/natural selection/page (284).png',
    'books/natural selection/page (285).png',
    'books/natural selection/page (286).png',
    'books/natural selection/page (287).png',
    'books/natural selection/page (288).png',
    'books/natural selection/page (289).png',
    'books/natural selection/page (290).png',
    'books/natural selection/page (291).png',
    'books/natural selection/page (292).png',
    'books/natural selection/page (293).png',
    'books/natural selection/page (294).png',
    'books/natural selection/page (295).png',
    'books/natural selection/page (296).png',
    'books/natural selection/page (297).png',
    'books/natural selection/page (298).png',
    'books/natural selection/page (299).png',
    'books/natural selection/page (300).png',
    'books/natural selection/page (301).png',
    'books/natural selection/page (302).png',
    'books/natural selection/page (303).png',
    'books/natural selection/page (304).png',
    'books/natural selection/page (305).png',
    'books/natural selection/page (306).png',
    'books/natural selection/page (307).png',
    'books/natural selection/page (308).png',
    'books/natural selection/page (309).png',
    'books/natural selection/page (310).png',
    'books/natural selection/page (311).png',
    'books/natural selection/page (312).png',
    'books/natural selection/page (313).png',
    'books/natural selection/page (314).png',
    'books/natural selection/page (315).png',
    'books/natural selection/page (316).png',
    'books/natural selection/page (317).png',
    'books/natural selection/page (318).png',
    'books/natural selection/page (319).png',
    'books/natural selection/page (320).png',
    'books/natural selection/page (321).png',
    'books/natural selection/page (322).png',
    'books/natural selection/page (323).png',
    'books/natural selection/page (324).png',
    'books/natural selection/page (325).png',
    'books/natural selection/page (326).png',
    'books/natural selection/page (327).png',
    'books/natural selection/page (328).png',
    'books/natural selection/page (329).png',
    'books/natural selection/page (330).png',
    'books/natural selection/page (331).png',
    'books/natural selection/page (332).png',
    'books/natural selection/page (333).png',
    'books/natural selection/page (334).png',
    'books/natural selection/page (335).png',
    'books/natural selection/page (336).png',
    'books/natural selection/page (337).png',
    'books/natural selection/page (338).png',
    'books/natural selection/page (339).png',
    'books/natural selection/page (340).png',
    'books/natural selection/page (341).png',
    'books/natural selection/page (342).png',
    'books/natural selection/page (343).png',
    'books/natural selection/page (344).png',
    'books/natural selection/page (345).png',
    'books/natural selection/page (346).png',
    'books/natural selection/page (347).png',
    'books/natural selection/page (348).png',
    'books/natural selection/page (349).png',
    'books/natural selection/page (350).png',
    'books/natural selection/page (351).png',
    'books/natural selection/page (352).png',
    'books/natural selection/page (353).png',
    'books/natural selection/page (354).png',
    'books/natural selection/page (355).png',
    'books/natural selection/page (356).png',
    'books/natural selection/page (357).png',
    'books/natural selection/page (358).png',
    'books/natural selection/page (359).png',
    'books/natural selection/page (360).png',
    'books/natural selection/page (361).png',
    'books/natural selection/page (362).png',
    'books/natural selection/page (363).png',
    'books/natural selection/page (364).png',
    'books/natural selection/page (365).png',
    'books/natural selection/page (366).png',
    'books/natural selection/page (367).png',
    'books/natural selection/page (368).png',

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
