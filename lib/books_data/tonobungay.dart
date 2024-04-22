import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class tonobungay extends StatefulWidget {
  const tonobungay({Key? key}) : super(key: key);

  @override
  State<tonobungay> createState() => _tonobungayState();
}

class _tonobungayState extends State<tonobungay> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/tono bungay/page (1).png',
    'books/tono bungay/page (2).png',
    'books/tono bungay/page (3).png',
    'books/tono bungay/page (4).png',
    'books/tono bungay/page (5).png',
    'books/tono bungay/page (6).png',
    'books/tono bungay/page (7).png',
    'books/tono bungay/page (8).png',
    'books/tono bungay/page (9).png',
    'books/tono bungay/page (10).png',
    'books/tono bungay/page (11).png',
    'books/tono bungay/page (12).png',
    'books/tono bungay/page (13).png',
    'books/tono bungay/page (14).png',
    'books/tono bungay/page (15).png',
    'books/tono bungay/page (16).png',
    'books/tono bungay/page (17).png',
    'books/tono bungay/page (18).png',
    'books/tono bungay/page (19).png',
    'books/tono bungay/page (20).png',
    'books/tono bungay/page (21).png',
    'books/tono bungay/page (22).png',
    'books/tono bungay/page (23).png',
    'books/tono bungay/page (24).png',
    'books/tono bungay/page (25).png',
    'books/tono bungay/page (26).png',
    'books/tono bungay/page (27).png',
    'books/tono bungay/page (28).png',
    'books/tono bungay/page (29).png',
    'books/tono bungay/page (30).png',
    'books/tono bungay/page (31).png',
    'books/tono bungay/page (32).png',
    'books/tono bungay/page (33).png',
    'books/tono bungay/page (34).png',
    'books/tono bungay/page (35).png',
    'books/tono bungay/page (36).png',
    'books/tono bungay/page (37).png',
    'books/tono bungay/page (38).png',
    'books/tono bungay/page (39).png',
    'books/tono bungay/page (40).png',
    'books/tono bungay/page (41).png',
    'books/tono bungay/page (42).png',
    'books/tono bungay/page (43).png',
    'books/tono bungay/page (44).png',
    'books/tono bungay/page (45).png',
    'books/tono bungay/page (46).png',
    'books/tono bungay/page (47).png',
    'books/tono bungay/page (48).png',
    'books/tono bungay/page (49).png',
    'books/tono bungay/page (50).png',
    'books/tono bungay/page (51).png',
    'books/tono bungay/page (52).png',
    'books/tono bungay/page (53).png',
    'books/tono bungay/page (54).png',
    'books/tono bungay/page (55).png',
    'books/tono bungay/page (56).png',
    'books/tono bungay/page (57).png',
    'books/tono bungay/page (58).png',
    'books/tono bungay/page (59).png',
    'books/tono bungay/page (60).png',
    'books/tono bungay/page (61).png',
    'books/tono bungay/page (62).png',
    'books/tono bungay/page (63).png',
    'books/tono bungay/page (64).png',
    'books/tono bungay/page (65).png',
    'books/tono bungay/page (66).png',
    'books/tono bungay/page (67).png',
    'books/tono bungay/page (68).png',
    'books/tono bungay/page (69).png',
    'books/tono bungay/page (70).png',
    'books/tono bungay/page (71).png',
    'books/tono bungay/page (72).png',
    'books/tono bungay/page (73).png',
    'books/tono bungay/page (74).png',
    'books/tono bungay/page (75).png',
    'books/tono bungay/page (76).png',
    'books/tono bungay/page (77).png',
    'books/tono bungay/page (78).png',
    'books/tono bungay/page (79).png',
    'books/tono bungay/page (80).png',
    'books/tono bungay/page (81).png',
    'books/tono bungay/page (82).png',
    'books/tono bungay/page (83).png',
    'books/tono bungay/page (84).png',
    'books/tono bungay/page (85).png',
    'books/tono bungay/page (86).png',
    'books/tono bungay/page (87).png',
    'books/tono bungay/page (88).png',
    'books/tono bungay/page (89).png',
    'books/tono bungay/page (90).png',
    'books/tono bungay/page (91).png',
    'books/tono bungay/page (92).png',
    'books/tono bungay/page (93).png',
    'books/tono bungay/page (94).png',
    'books/tono bungay/page (95).png',
    'books/tono bungay/page (96).png',
    'books/tono bungay/page (97).png',
    'books/tono bungay/page (98).png',
    'books/tono bungay/page (99).png',
    'books/tono bungay/page (100).png',
    'books/tono bungay/page (101).png',
    'books/tono bungay/page (102).png',
    'books/tono bungay/page (103).png',
    'books/tono bungay/page (104).png',
    'books/tono bungay/page (105).png',
    'books/tono bungay/page (106).png',
    'books/tono bungay/page (107).png',
    'books/tono bungay/page (108).png',
    'books/tono bungay/page (109).png',
    'books/tono bungay/page (110).png',
    'books/tono bungay/page (111).png',
    'books/tono bungay/page (112).png',
    'books/tono bungay/page (113).png',
    'books/tono bungay/page (114).png',
    'books/tono bungay/page (115).png',
    'books/tono bungay/page (116).png',
    'books/tono bungay/page (117).png',
    'books/tono bungay/page (118).png',
    'books/tono bungay/page (119).png',
    'books/tono bungay/page (120).png',
    'books/tono bungay/page (121).png',
    'books/tono bungay/page (122).png',
    'books/tono bungay/page (123).png',
    'books/tono bungay/page (124).png',
    'books/tono bungay/page (125).png',
    'books/tono bungay/page (126).png',
    'books/tono bungay/page (127).png',
    'books/tono bungay/page (128).png',
    'books/tono bungay/page (129).png',
    'books/tono bungay/page (130).png',
    'books/tono bungay/page (131).png',
    'books/tono bungay/page (132).png',
    'books/tono bungay/page (133).png',
    'books/tono bungay/page (134).png',
    'books/tono bungay/page (135).png',
    'books/tono bungay/page (136).png',
    'books/tono bungay/page (137).png',
    'books/tono bungay/page (138).png',
    'books/tono bungay/page (139).png',
    'books/tono bungay/page (140).png',
    'books/tono bungay/page (141).png',
    'books/tono bungay/page (142).png',
    'books/tono bungay/page (143).png',
    'books/tono bungay/page (144).png',
    'books/tono bungay/page (145).png',
    'books/tono bungay/page (146).png',
    'books/tono bungay/page (147).png',
    'books/tono bungay/page (148).png',
    'books/tono bungay/page (149).png',
    'books/tono bungay/page (150).png',
    'books/tono bungay/page (151).png',
    'books/tono bungay/page (152).png',
    'books/tono bungay/page (153).png',
    'books/tono bungay/page (154).png',
    'books/tono bungay/page (155).png',
    'books/tono bungay/page (156).png',
    'books/tono bungay/page (157).png',
    'books/tono bungay/page (158).png',
    'books/tono bungay/page (159).png',
    'books/tono bungay/page (160).png',
    'books/tono bungay/page (161).png',
    'books/tono bungay/page (162).png',
    'books/tono bungay/page (163).png',
    'books/tono bungay/page (164).png',
    'books/tono bungay/page (165).png',
    'books/tono bungay/page (166).png',
    'books/tono bungay/page (167).png',
    'books/tono bungay/page (168).png',
    'books/tono bungay/page (169).png',
    'books/tono bungay/page (170).png',
    'books/tono bungay/page (171).png',
    'books/tono bungay/page (172).png',
    'books/tono bungay/page (173).png',
    'books/tono bungay/page (174).png',
    'books/tono bungay/page (175).png',
    'books/tono bungay/page (176).png',
    'books/tono bungay/page (177).png',
    'books/tono bungay/page (178).png',
    'books/tono bungay/page (179).png',
    'books/tono bungay/page (180).png',
    'books/tono bungay/page (181).png',
    'books/tono bungay/page (182).png',
    'books/tono bungay/page (183).png',
    'books/tono bungay/page (184).png',
    'books/tono bungay/page (185).png',
    'books/tono bungay/page (186).png',
    'books/tono bungay/page (187).png',
    'books/tono bungay/page (188).png',
    'books/tono bungay/page (189).png',
    'books/tono bungay/page (190).png',
    'books/tono bungay/page (191).png',
    'books/tono bungay/page (192).png',
    'books/tono bungay/page (193).png',
    'books/tono bungay/page (194).png',
    'books/tono bungay/page (195).png',
    'books/tono bungay/page (196).png',
    'books/tono bungay/page (197).png',
    'books/tono bungay/page (198).png',
    'books/tono bungay/page (199).png',
    'books/tono bungay/page (200).png',
    'books/tono bungay/page (201).png',
    'books/tono bungay/page (202).png',
    'books/tono bungay/page (203).png',
    'books/tono bungay/page (204).png',
    'books/tono bungay/page (205).png',
    'books/tono bungay/page (206).png',
    'books/tono bungay/page (207).png',
    'books/tono bungay/page (208).png',
    'books/tono bungay/page (209).png',
    'books/tono bungay/page (210).png',
    'books/tono bungay/page (211).png',
    'books/tono bungay/page (212).png',
    'books/tono bungay/page (213).png',
    'books/tono bungay/page (214).png',
    'books/tono bungay/page (215).png',
    'books/tono bungay/page (216).png',
    'books/tono bungay/page (217).png',
    'books/tono bungay/page (218).png',
    'books/tono bungay/page (219).png',
    'books/tono bungay/page (220).png',
    'books/tono bungay/page (221).png',
    'books/tono bungay/page (222).png',
    'books/tono bungay/page (223).png',
    'books/tono bungay/page (224).png',
    'books/tono bungay/page (225).png',
    'books/tono bungay/page (226).png',
    'books/tono bungay/page (227).png',
    'books/tono bungay/page (228).png',
    'books/tono bungay/page (229).png',
    'books/tono bungay/page (230).png',
    'books/tono bungay/page (231).png',
    'books/tono bungay/page (232).png',
    'books/tono bungay/page (233).png',
    'books/tono bungay/page (234).png',
    'books/tono bungay/page (235).png',
    'books/tono bungay/page (236).png',
    'books/tono bungay/page (237).png',
    'books/tono bungay/page (238).png',
    'books/tono bungay/page (239).png',
    'books/tono bungay/page (240).png',
    'books/tono bungay/page (241).png',
    'books/tono bungay/page (242).png',
    'books/tono bungay/page (243).png',
    'books/tono bungay/page (244).png',
    'books/tono bungay/page (245).png',
    'books/tono bungay/page (246).png',
    'books/tono bungay/page (247).png',
    'books/tono bungay/page (248).png',
    'books/tono bungay/page (249).png',
    'books/tono bungay/page (250).png',
    'books/tono bungay/page (251).png',
    'books/tono bungay/page (252).png',
    'books/tono bungay/page (253).png',
    'books/tono bungay/page (254).png',
    'books/tono bungay/page (255).png',
    'books/tono bungay/page (256).png',
    'books/tono bungay/page (257).png',
    'books/tono bungay/page (258).png',
    'books/tono bungay/page (259).png',
    'books/tono bungay/page (260).png',
    'books/tono bungay/page (261).png',
    'books/tono bungay/page (262).png',
    'books/tono bungay/page (263).png',
    'books/tono bungay/page (264).png',
    'books/tono bungay/page (265).png',
    'books/tono bungay/page (266).png',
    'books/tono bungay/page (267).png',
    'books/tono bungay/page (268).png',
    'books/tono bungay/page (269).png',
    'books/tono bungay/page (270).png',
    'books/tono bungay/page (271).png',
    'books/tono bungay/page (272).png',
    'books/tono bungay/page (273).png',
    'books/tono bungay/page (274).png',
    'books/tono bungay/page (275).png',
    'books/tono bungay/page (276).png',
    'books/tono bungay/page (277).png',
    'books/tono bungay/page (278).png',
    'books/tono bungay/page (279).png',
    'books/tono bungay/page (280).png',
    'books/tono bungay/page (281).png',
    'books/tono bungay/page (282).png',
    'books/tono bungay/page (283).png',
    'books/tono bungay/page (284).png',
    'books/tono bungay/page (285).png',
    'books/tono bungay/page (286).png',
    'books/tono bungay/page (287).png',
    'books/tono bungay/page (288).png',
    'books/tono bungay/page (289).png',
    'books/tono bungay/page (290).png',
    'books/tono bungay/page (291).png',
    'books/tono bungay/page (292).png',
    'books/tono bungay/page (293).png',
    'books/tono bungay/page (294).png',
    'books/tono bungay/page (295).png',
    'books/tono bungay/page (296).png',
    'books/tono bungay/page (297).png',
    'books/tono bungay/page (298).png',
    'books/tono bungay/page (299).png',
    'books/tono bungay/page (300).png',
    'books/tono bungay/page (301).png',
    'books/tono bungay/page (302).png',
    'books/tono bungay/page (303).png',
    'books/tono bungay/page (304).png',
    'books/tono bungay/page (305).png',
    'books/tono bungay/page (306).png',
    'books/tono bungay/page (307).png',
    'books/tono bungay/page (308).png',
    'books/tono bungay/page (309).png',
    'books/tono bungay/page (310).png',
    'books/tono bungay/page (311).png',
    'books/tono bungay/page (312).png',
    'books/tono bungay/page (313).png',
    'books/tono bungay/page (314).png',
    'books/tono bungay/page (315).png',
    'books/tono bungay/page (316).png',
    'books/tono bungay/page (317).png',
    'books/tono bungay/page (318).png',
    'books/tono bungay/page (319).png',
    'books/tono bungay/page (320).png',
    'books/tono bungay/page (321).png',
    'books/tono bungay/page (322).png',
    'books/tono bungay/page (323).png',
    'books/tono bungay/page (324).png',
    'books/tono bungay/page (325).png',
    'books/tono bungay/page (326).png',
    'books/tono bungay/page (327).png',
    'books/tono bungay/page (328).png',
    'books/tono bungay/page (329).png',
    'books/tono bungay/page (330).png',
    'books/tono bungay/page (331).png',
    'books/tono bungay/page (332).png',
    'books/tono bungay/page (333).png',
    'books/tono bungay/page (334).png',
    'books/tono bungay/page (335).png',
    'books/tono bungay/page (336).png',
    'books/tono bungay/page (337).png',
    'books/tono bungay/page (338).png',
    'books/tono bungay/page (339).png',
    'books/tono bungay/page (340).png',
    'books/tono bungay/page (341).png',
    'books/tono bungay/page (342).png',
    'books/tono bungay/page (343).png',
    'books/tono bungay/page (344).png',
    'books/tono bungay/page (345).png',
    'books/tono bungay/page (346).png',
    'books/tono bungay/page (347).png',
    'books/tono bungay/page (348).png',
    'books/tono bungay/page (349).png',
    'books/tono bungay/page (350).png',
    'books/tono bungay/page (351).png',
    'books/tono bungay/page (352).png',
    'books/tono bungay/page (353).png',
    'books/tono bungay/page (354).png',
    'books/tono bungay/page (355).png',
    'books/tono bungay/page (356).png',
    'books/tono bungay/page (357).png',
    'books/tono bungay/page (358).png',
    'books/tono bungay/page (359).png',
    'books/tono bungay/page (360).png',
    'books/tono bungay/page (361).png',
    'books/tono bungay/page (362).png',
    'books/tono bungay/page (363).png',
    'books/tono bungay/page (364).png',
    'books/tono bungay/page (365).png',
    'books/tono bungay/page (366).png',
    'books/tono bungay/page (367).png',
    'books/tono bungay/page (368).png',
    'books/tono bungay/page (369).png',
    'books/tono bungay/page (370).png',
    'books/tono bungay/page (371).png',
    'books/tono bungay/page (372).png',
    'books/tono bungay/page (373).png',
    'books/tono bungay/page (374).png',
    'books/tono bungay/page (375).png',
    'books/tono bungay/page (376).png',
    'books/tono bungay/page (377).png',
    'books/tono bungay/page (378).png',

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
