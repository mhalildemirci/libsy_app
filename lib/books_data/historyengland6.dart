import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class historyengland6 extends StatefulWidget {
  const historyengland6({Key? key}) : super(key: key);

  @override
  State<historyengland6> createState() => _historyengland6State();
}

class _historyengland6State extends State<historyengland6> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/history england 6/page (1).png',
    'books/history england 6/page (2).png',
    'books/history england 6/page (3).png',
    'books/history england 6/page (4).png',
    'books/history england 6/page (5).png',
    'books/history england 6/page (6).png',
    'books/history england 6/page (7).png',
    'books/history england 6/page (8).png',
    'books/history england 6/page (9).png',
    'books/history england 6/page (10).png',
    'books/history england 6/page (11).png',
    'books/history england 6/page (12).png',
    'books/history england 6/page (13).png',
    'books/history england 6/page (14).png',
    'books/history england 6/page (15).png',
    'books/history england 6/page (16).png',
    'books/history england 6/page (17).png',
    'books/history england 6/page (18).png',
    'books/history england 6/page (19).png',
    'books/history england 6/page (20).png',
    'books/history england 6/page (21).png',
    'books/history england 6/page (22).png',
    'books/history england 6/page (23).png',
    'books/history england 6/page (24).png',
    'books/history england 6/page (25).png',
    'books/history england 6/page (26).png',
    'books/history england 6/page (27).png',
    'books/history england 6/page (28).png',
    'books/history england 6/page (29).png',
    'books/history england 6/page (30).png',
    'books/history england 6/page (31).png',
    'books/history england 6/page (32).png',
    'books/history england 6/page (33).png',
    'books/history england 6/page (34).png',
    'books/history england 6/page (35).png',
    'books/history england 6/page (36).png',
    'books/history england 6/page (37).png',
    'books/history england 6/page (38).png',
    'books/history england 6/page (39).png',
    'books/history england 6/page (40).png',
    'books/history england 6/page (41).png',
    'books/history england 6/page (42).png',
    'books/history england 6/page (43).png',
    'books/history england 6/page (44).png',
    'books/history england 6/page (45).png',
    'books/history england 6/page (46).png',
    'books/history england 6/page (47).png',
    'books/history england 6/page (48).png',
    'books/history england 6/page (49).png',
    'books/history england 6/page (50).png',
    'books/history england 6/page (51).png',
    'books/history england 6/page (52).png',
    'books/history england 6/page (53).png',
    'books/history england 6/page (54).png',
    'books/history england 6/page (55).png',
    'books/history england 6/page (56).png',
    'books/history england 6/page (57).png',
    'books/history england 6/page (58).png',
    'books/history england 6/page (59).png',
    'books/history england 6/page (60).png',
    'books/history england 6/page (61).png',
    'books/history england 6/page (62).png',
    'books/history england 6/page (63).png',
    'books/history england 6/page (64).png',
    'books/history england 6/page (65).png',
    'books/history england 6/page (66).png',
    'books/history england 6/page (67).png',
    'books/history england 6/page (68).png',
    'books/history england 6/page (69).png',
    'books/history england 6/page (70).png',
    'books/history england 6/page (71).png',
    'books/history england 6/page (72).png',
    'books/history england 6/page (73).png',
    'books/history england 6/page (74).png',
    'books/history england 6/page (75).png',
    'books/history england 6/page (76).png',
    'books/history england 6/page (77).png',
    'books/history england 6/page (78).png',
    'books/history england 6/page (79).png',
    'books/history england 6/page (80).png',
    'books/history england 6/page (81).png',
    'books/history england 6/page (82).png',
    'books/history england 6/page (83).png',
    'books/history england 6/page (84).png',
    'books/history england 6/page (85).png',
    'books/history england 6/page (86).png',
    'books/history england 6/page (87).png',
    'books/history england 6/page (88).png',
    'books/history england 6/page (89).png',
    'books/history england 6/page (90).png',
    'books/history england 6/page (91).png',
    'books/history england 6/page (92).png',
    'books/history england 6/page (93).png',
    'books/history england 6/page (94).png',
    'books/history england 6/page (95).png',
    'books/history england 6/page (96).png',
    'books/history england 6/page (97).png',
    'books/history england 6/page (98).png',
    'books/history england 6/page (99).png',
    'books/history england 6/page (100).png',
    'books/history england 6/page (101).png',
    'books/history england 6/page (102).png',
    'books/history england 6/page (103).png',
    'books/history england 6/page (104).png',
    'books/history england 6/page (105).png',
    'books/history england 6/page (106).png',
    'books/history england 6/page (107).png',
    'books/history england 6/page (108).png',
    'books/history england 6/page (109).png',
    'books/history england 6/page (110).png',
    'books/history england 6/page (111).png',
    'books/history england 6/page (112).png',
    'books/history england 6/page (113).png',
    'books/history england 6/page (114).png',
    'books/history england 6/page (115).png',
    'books/history england 6/page (116).png',
    'books/history england 6/page (117).png',
    'books/history england 6/page (118).png',
    'books/history england 6/page (119).png',
    'books/history england 6/page (120).png',
    'books/history england 6/page (121).png',
    'books/history england 6/page (122).png',
    'books/history england 6/page (123).png',
    'books/history england 6/page (124).png',
    'books/history england 6/page (125).png',
    'books/history england 6/page (126).png',
    'books/history england 6/page (127).png',
    'books/history england 6/page (128).png',
    'books/history england 6/page (129).png',
    'books/history england 6/page (130).png',
    'books/history england 6/page (131).png',
    'books/history england 6/page (132).png',
    'books/history england 6/page (133).png',
    'books/history england 6/page (134).png',
    'books/history england 6/page (135).png',
    'books/history england 6/page (136).png',
    'books/history england 6/page (137).png',
    'books/history england 6/page (138).png',
    'books/history england 6/page (139).png',
    'books/history england 6/page (140).png',
    'books/history england 6/page (141).png',
    'books/history england 6/page (142).png',
    'books/history england 6/page (143).png',
    'books/history england 6/page (144).png',
    'books/history england 6/page (145).png',
    'books/history england 6/page (146).png',
    'books/history england 6/page (147).png',
    'books/history england 6/page (148).png',
    'books/history england 6/page (149).png',
    'books/history england 6/page (150).png',
    'books/history england 6/page (151).png',
    'books/history england 6/page (152).png',
    'books/history england 6/page (153).png',
    'books/history england 6/page (154).png',
    'books/history england 6/page (155).png',
    'books/history england 6/page (156).png',
    'books/history england 6/page (157).png',
    'books/history england 6/page (158).png',
    'books/history england 6/page (159).png',
    'books/history england 6/page (160).png',
    'books/history england 6/page (161).png',
    'books/history england 6/page (162).png',
    'books/history england 6/page (163).png',
    'books/history england 6/page (164).png',
    'books/history england 6/page (165).png',
    'books/history england 6/page (166).png',
    'books/history england 6/page (167).png',
    'books/history england 6/page (168).png',
    'books/history england 6/page (169).png',
    'books/history england 6/page (170).png',
    'books/history england 6/page (171).png',
    'books/history england 6/page (172).png',
    'books/history england 6/page (173).png',
    'books/history england 6/page (174).png',
    'books/history england 6/page (175).png',
    'books/history england 6/page (176).png',
    'books/history england 6/page (177).png',
    'books/history england 6/page (178).png',
    'books/history england 6/page (179).png',
    'books/history england 6/page (180).png',
    'books/history england 6/page (181).png',
    'books/history england 6/page (182).png',
    'books/history england 6/page (183).png',
    'books/history england 6/page (184).png',
    'books/history england 6/page (185).png',
    'books/history england 6/page (186).png',
    'books/history england 6/page (187).png',
    'books/history england 6/page (188).png',
    'books/history england 6/page (189).png',
    'books/history england 6/page (190).png',
    'books/history england 6/page (191).png',
    'books/history england 6/page (192).png',
    'books/history england 6/page (193).png',
    'books/history england 6/page (194).png',
    'books/history england 6/page (195).png',
    'books/history england 6/page (196).png',
    'books/history england 6/page (197).png',
    'books/history england 6/page (198).png',
    'books/history england 6/page (199).png',
    'books/history england 6/page (200).png',
    'books/history england 6/page (201).png',
    'books/history england 6/page (202).png',
    'books/history england 6/page (203).png',
    'books/history england 6/page (204).png',
    'books/history england 6/page (205).png',
    'books/history england 6/page (206).png',
    'books/history england 6/page (207).png',
    'books/history england 6/page (208).png',
    'books/history england 6/page (209).png',
    'books/history england 6/page (210).png',
    'books/history england 6/page (211).png',
    'books/history england 6/page (212).png',
    'books/history england 6/page (213).png',
    'books/history england 6/page (214).png',
    'books/history england 6/page (215).png',
    'books/history england 6/page (216).png',
    'books/history england 6/page (217).png',
    'books/history england 6/page (218).png',
    'books/history england 6/page (219).png',
    'books/history england 6/page (220).png',
    'books/history england 6/page (221).png',
    'books/history england 6/page (222).png',
    'books/history england 6/page (223).png',
    'books/history england 6/page (224).png',
    'books/history england 6/page (225).png',
    'books/history england 6/page (226).png',
    'books/history england 6/page (227).png',
    'books/history england 6/page (228).png',
    'books/history england 6/page (229).png',
    'books/history england 6/page (230).png',
    'books/history england 6/page (231).png',
    'books/history england 6/page (232).png',
    'books/history england 6/page (233).png',
    'books/history england 6/page (234).png',
    'books/history england 6/page (235).png',
    'books/history england 6/page (236).png',
    'books/history england 6/page (237).png',
    'books/history england 6/page (238).png',
    'books/history england 6/page (239).png',
    'books/history england 6/page (240).png',
    'books/history england 6/page (241).png',
    'books/history england 6/page (242).png',
    'books/history england 6/page (243).png',
    'books/history england 6/page (244).png',
    'books/history england 6/page (245).png',
    'books/history england 6/page (246).png',
    'books/history england 6/page (247).png',
    'books/history england 6/page (248).png',
    'books/history england 6/page (249).png',
    'books/history england 6/page (250).png',
    'books/history england 6/page (251).png',
    'books/history england 6/page (252).png',
    'books/history england 6/page (253).png',
    'books/history england 6/page (254).png',
    'books/history england 6/page (255).png',
    'books/history england 6/page (256).png',
    'books/history england 6/page (257).png',
    'books/history england 6/page (258).png',
    'books/history england 6/page (259).png',
    'books/history england 6/page (260).png',
    'books/history england 6/page (261).png',
    'books/history england 6/page (262).png',
    'books/history england 6/page (263).png',
    'books/history england 6/page (264).png',
    'books/history england 6/page (265).png',
    'books/history england 6/page (266).png',
    'books/history england 6/page (267).png',
    'books/history england 6/page (268).png',
    'books/history england 6/page (269).png',
    'books/history england 6/page (270).png',
    'books/history england 6/page (271).png',
    'books/history england 6/page (272).png',
    'books/history england 6/page (273).png',
    'books/history england 6/page (274).png',
    'books/history england 6/page (275).png',
    'books/history england 6/page (276).png',
    'books/history england 6/page (277).png',
    'books/history england 6/page (278).png',
    'books/history england 6/page (279).png',
    'books/history england 6/page (280).png',
    'books/history england 6/page (281).png',
    'books/history england 6/page (282).png',
    'books/history england 6/page (283).png',
    'books/history england 6/page (284).png',
    'books/history england 6/page (285).png',
    'books/history england 6/page (286).png',
    'books/history england 6/page (287).png',
    'books/history england 6/page (288).png',
    'books/history england 6/page (289).png',
    'books/history england 6/page (290).png',
    'books/history england 6/page (291).png',
    'books/history england 6/page (292).png',
    'books/history england 6/page (293).png',
    'books/history england 6/page (294).png',
    'books/history england 6/page (295).png',
    'books/history england 6/page (296).png',
    'books/history england 6/page (297).png',
    'books/history england 6/page (298).png',
    'books/history england 6/page (299).png',
    'books/history england 6/page (300).png',
    'books/history england 6/page (301).png',
    'books/history england 6/page (302).png',
    'books/history england 6/page (303).png',
    'books/history england 6/page (304).png',
    'books/history england 6/page (305).png',
    'books/history england 6/page (306).png',
    'books/history england 6/page (307).png',
    'books/history england 6/page (308).png',
    'books/history england 6/page (309).png',
    'books/history england 6/page (310).png',
    'books/history england 6/page (311).png',
    'books/history england 6/page (312).png',
    'books/history england 6/page (313).png',
    'books/history england 6/page (314).png',
    'books/history england 6/page (315).png',
    'books/history england 6/page (316).png',
    'books/history england 6/page (317).png',
    'books/history england 6/page (318).png',
    'books/history england 6/page (319).png',
    'books/history england 6/page (320).png',
    'books/history england 6/page (321).png',
    'books/history england 6/page (322).png',
    'books/history england 6/page (323).png',
    'books/history england 6/page (324).png',
    'books/history england 6/page (325).png',
    'books/history england 6/page (326).png',
    'books/history england 6/page (327).png',
    'books/history england 6/page (328).png',
    'books/history england 6/page (329).png',
    'books/history england 6/page (330).png',
    'books/history england 6/page (331).png',
    'books/history england 6/page (332).png',
    'books/history england 6/page (333).png',
    'books/history england 6/page (334).png',
    'books/history england 6/page (335).png',
    'books/history england 6/page (336).png',
    'books/history england 6/page (337).png',
    'books/history england 6/page (338).png',
    'books/history england 6/page (339).png',
    'books/history england 6/page (340).png',
    'books/history england 6/page (341).png',
    'books/history england 6/page (342).png',
    'books/history england 6/page (343).png',
    'books/history england 6/page (344).png',
    'books/history england 6/page (345).png',
    'books/history england 6/page (346).png',
    'books/history england 6/page (347).png',
    'books/history england 6/page (348).png',
    'books/history england 6/page (349).png',
    'books/history england 6/page (350).png',
    'books/history england 6/page (351).png',
    'books/history england 6/page (352).png',
    'books/history england 6/page (353).png',
    'books/history england 6/page (354).png',
    'books/history england 6/page (355).png',
    'books/history england 6/page (356).png',
    'books/history england 6/page (357).png',
    'books/history england 6/page (358).png',
    'books/history england 6/page (359).png',
    'books/history england 6/page (360).png',
    'books/history england 6/page (361).png',
    'books/history england 6/page (362).png',
    'books/history england 6/page (363).png',
    'books/history england 6/page (364).png',
    'books/history england 6/page (365).png',
    'books/history england 6/page (366).png',
    'books/history england 6/page (367).png',
    'books/history england 6/page (368).png',
    'books/history england 6/page (369).png',
    'books/history england 6/page (370).png',
    'books/history england 6/page (371).png',
    'books/history england 6/page (372).png',
    'books/history england 6/page (373).png',
    'books/history england 6/page (374).png',
    'books/history england 6/page (375).png',
    'books/history england 6/page (376).png',
    'books/history england 6/page (377).png',
    'books/history england 6/page (378).png',
    'books/history england 6/page (379).png',
    'books/history england 6/page (380).png',
    'books/history england 6/page (381).png',
    'books/history england 6/page (382).png',
    'books/history england 6/page (383).png',
    'books/history england 6/page (384).png',

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
