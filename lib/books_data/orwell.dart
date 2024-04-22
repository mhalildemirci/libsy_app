import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class orwell extends StatefulWidget {
  const orwell({Key? key}) : super(key: key);

  @override
  State<orwell> createState() => _orwellState();
}

class _orwellState extends State<orwell> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/1984/page (1).png',
    'books/1984/page (2).png',
    'books/1984/page (3).png',
    'books/1984/page (4).png',
    'books/1984/page (5).png',
    'books/1984/page (6).png',
    'books/1984/page (7).png',
    'books/1984/page (8).png',
    'books/1984/page (9).png',
    'books/1984/page (10).png',
    'books/1984/page (11).png',
    'books/1984/page (12).png',
    'books/1984/page (13).png',
    'books/1984/page (14).png',
    'books/1984/page (15).png',
    'books/1984/page (16).png',
    'books/1984/page (17).png',
    'books/1984/page (18).png',
    'books/1984/page (19).png',
    'books/1984/page (20).png',
    'books/1984/page (21).png',
    'books/1984/page (22).png',
    'books/1984/page (23).png',
    'books/1984/page (24).png',
    'books/1984/page (25).png',
    'books/1984/page (26).png',
    'books/1984/page (27).png',
    'books/1984/page (28).png',
    'books/1984/page (29).png',
    'books/1984/page (30).png',
    'books/1984/page (31).png',
    'books/1984/page (32).png',
    'books/1984/page (33).png',
    'books/1984/page (34).png',
    'books/1984/page (35).png',
    'books/1984/page (36).png',
    'books/1984/page (37).png',
    'books/1984/page (38).png',
    'books/1984/page (39).png',
    'books/1984/page (40).png',
    'books/1984/page (41).png',
    'books/1984/page (42).png',
    'books/1984/page (43).png',
    'books/1984/page (44).png',
    'books/1984/page (45).png',
    'books/1984/page (46).png',
    'books/1984/page (47).png',
    'books/1984/page (48).png',
    'books/1984/page (49).png',
    'books/1984/page (50).png',
    'books/1984/page (51).png',
    'books/1984/page (52).png',
    'books/1984/page (53).png',
    'books/1984/page (54).png',
    'books/1984/page (55).png',
    'books/1984/page (56).png',
    'books/1984/page (57).png',
    'books/1984/page (58).png',
    'books/1984/page (59).png',
    'books/1984/page (60).png',
    'books/1984/page (61).png',
    'books/1984/page (62).png',
    'books/1984/page (63).png',
    'books/1984/page (64).png',
    'books/1984/page (65).png',
    'books/1984/page (66).png',
    'books/1984/page (67).png',
    'books/1984/page (68).png',
    'books/1984/page (69).png',
    'books/1984/page (70).png',
    'books/1984/page (71).png',
    'books/1984/page (72).png',
    'books/1984/page (73).png',
    'books/1984/page (74).png',
    'books/1984/page (75).png',
    'books/1984/page (76).png',
    'books/1984/page (77).png',
    'books/1984/page (78).png',
    'books/1984/page (79).png',
    'books/1984/page (80).png',
    'books/1984/page (81).png',
    'books/1984/page (82).png',
    'books/1984/page (83).png',
    'books/1984/page (84).png',
    'books/1984/page (85).png',
    'books/1984/page (86).png',
    'books/1984/page (87).png',
    'books/1984/page (88).png',
    'books/1984/page (89).png',
    'books/1984/page (90).png',
    'books/1984/page (91).png',
    'books/1984/page (92).png',
    'books/1984/page (93).png',
    'books/1984/page (94).png',
    'books/1984/page (95).png',
    'books/1984/page (96).png',
    'books/1984/page (97).png',
    'books/1984/page (98).png',
    'books/1984/page (99).png',
    'books/1984/page (100).png',
    'books/1984/page (101).png',
    'books/1984/page (102).png',
    'books/1984/page (103).png',
    'books/1984/page (104).png',
    'books/1984/page (105).png',
    'books/1984/page (106).png',
    'books/1984/page (107).png',
    'books/1984/page (108).png',
    'books/1984/page (109).png',
    'books/1984/page (110).png',
    'books/1984/page (111).png',
    'books/1984/page (112).png',
    'books/1984/page (113).png',
    'books/1984/page (114).png',
    'books/1984/page (115).png',
    'books/1984/page (116).png',
    'books/1984/page (117).png',
    'books/1984/page (118).png',
    'books/1984/page (119).png',
    'books/1984/page (120).png',
    'books/1984/page (121).png',
    'books/1984/page (122).png',
    'books/1984/page (123).png',
    'books/1984/page (124).png',
    'books/1984/page (125).png',
    'books/1984/page (126).png',
    'books/1984/page (127).png',
    'books/1984/page (128).png',
    'books/1984/page (129).png',
    'books/1984/page (130).png',
    'books/1984/page (131).png',
    'books/1984/page (132).png',
    'books/1984/page (133).png',
    'books/1984/page (134).png',
    'books/1984/page (135).png',
    'books/1984/page (136).png',
    'books/1984/page (137).png',
    'books/1984/page (138).png',
    'books/1984/page (139).png',
    'books/1984/page (140).png',
    'books/1984/page (141).png',
    'books/1984/page (142).png',
    'books/1984/page (143).png',
    'books/1984/page (144).png',
    'books/1984/page (145).png',
    'books/1984/page (146).png',
    'books/1984/page (147).png',
    'books/1984/page (148).png',
    'books/1984/page (149).png',
    'books/1984/page (150).png',
    'books/1984/page (151).png',
    'books/1984/page (152).png',
    'books/1984/page (153).png',
    'books/1984/page (154).png',
    'books/1984/page (155).png',
    'books/1984/page (156).png',
    'books/1984/page (157).png',
    'books/1984/page (158).png',
    'books/1984/page (159).png',
    'books/1984/page (160).png',
    'books/1984/page (161).png',
    'books/1984/page (162).png',
    'books/1984/page (163).png',
    'books/1984/page (164).png',
    'books/1984/page (165).png',
    'books/1984/page (166).png',
    'books/1984/page (167).png',
    'books/1984/page (168).png',
    'books/1984/page (169).png',
    'books/1984/page (170).png',
    'books/1984/page (171).png',
    'books/1984/page (172).png',
    'books/1984/page (173).png',
    'books/1984/page (174).png',
    'books/1984/page (175).png',
    'books/1984/page (176).png',
    'books/1984/page (177).png',
    'books/1984/page (178).png',
    'books/1984/page (179).png',
    'books/1984/page (180).png',
    'books/1984/page (181).png',
    'books/1984/page (182).png',
    'books/1984/page (183).png',
    'books/1984/page (184).png',
    'books/1984/page (185).png',
    'books/1984/page (186).png',
    'books/1984/page (187).png',
    'books/1984/page (188).png',
    'books/1984/page (189).png',
    'books/1984/page (190).png',
    'books/1984/page (191).png',
    'books/1984/page (192).png',
    'books/1984/page (193).png',
    'books/1984/page (194).png',
    'books/1984/page (195).png',
    'books/1984/page (196).png',
    'books/1984/page (197).png',
    'books/1984/page (198).png',
    'books/1984/page (199).png',
    'books/1984/page (200).png',
    'books/1984/page (201).png',
    'books/1984/page (202).png',
    'books/1984/page (203).png',
    'books/1984/page (204).png',
    'books/1984/page (205).png',
    'books/1984/page (206).png',
    'books/1984/page (207).png',
    'books/1984/page (208).png',
    'books/1984/page (209).png',
    'books/1984/page (210).png',
    'books/1984/page (211).png',
    'books/1984/page (212).png',
    'books/1984/page (213).png',
    'books/1984/page (214).png',
    'books/1984/page (215).png',
    'books/1984/page (216).png',
    'books/1984/page (217).png',
    'books/1984/page (218).png',
    'books/1984/page (219).png',
    'books/1984/page (220).png',
    'books/1984/page (221).png',
    'books/1984/page (222).png',
    'books/1984/page (223).png',
    'books/1984/page (224).png',
    'books/1984/page (225).png',
    'books/1984/page (226).png',
    'books/1984/page (227).png',
    'books/1984/page (228).png',
    'books/1984/page (229).png',
    'books/1984/page (230).png',
    'books/1984/page (231).png',
    'books/1984/page (232).png',
    'books/1984/page (233).png',
    'books/1984/page (234).png',
    'books/1984/page (235).png',
    'books/1984/page (236).png',
    'books/1984/page (237).png',
    'books/1984/page (238).png',
    'books/1984/page (239).png',
    'books/1984/page (240).png',
    'books/1984/page (241).png',
    'books/1984/page (242).png',
    'books/1984/page (243).png',
    'books/1984/page (244).png',
    'books/1984/page (245).png',
    'books/1984/page (246).png',
    'books/1984/page (247).png',
    'books/1984/page (248).png',
    'books/1984/page (249).png',
    'books/1984/page (250).png',
    'books/1984/page (251).png',
    'books/1984/page (252).png',
    'books/1984/page (253).png',
    'books/1984/page (254).png',
    'books/1984/page (255).png',
    'books/1984/page (256).png',
    'books/1984/page (257).png',
    'books/1984/page (258).png',
    'books/1984/page (259).png',
    'books/1984/page (260).png',
    'books/1984/page (261).png',
    'books/1984/page (262).png',
    'books/1984/page (263).png',
    'books/1984/page (264).png',
    'books/1984/page (265).png',
    'books/1984/page (266).png',
    'books/1984/page (267).png',
    'books/1984/page (268).png',
    'books/1984/page (269).png',
    'books/1984/page (270).png',
    'books/1984/page (271).png',
    'books/1984/page (272).png',
    'books/1984/page (273).png',
    'books/1984/page (274).png',
    'books/1984/page (275).png',
    'books/1984/page (276).png',
    'books/1984/page (277).png',
    'books/1984/page (278).png',
    'books/1984/page (279).png',
    'books/1984/page (280).png',
    'books/1984/page (281).png',
    'books/1984/page (282).png',
    'books/1984/page (283).png',
    'books/1984/page (284).png',
    'books/1984/page (285).png',
    'books/1984/page (286).png',
    'books/1984/page (287).png',
    'books/1984/page (288).png',
    'books/1984/page (289).png',
    'books/1984/page (290).png',
    'books/1984/page (291).png',
    'books/1984/page (292).png',
    'books/1984/page (293).png',
    'books/1984/page (294).png',
    'books/1984/page (295).png',
    'books/1984/page (296).png',
    'books/1984/page (297).png',
    'books/1984/page (298).png',
    'books/1984/page (299).png',
    'books/1984/page (300).png',
    'books/1984/page (301).png',
    'books/1984/page (302).png',
    'books/1984/page (303).png',
    'books/1984/page (304).png',
    'books/1984/page (305).png',
    'books/1984/page (306).png',
    'books/1984/page (307).png',
    'books/1984/page (308).png',
    'books/1984/page (309).png',
    'books/1984/page (310).png',
    'books/1984/page (311).png',
    'books/1984/page (312).png',
    'books/1984/page (313).png',
    'books/1984/page (314).png',
    'books/1984/page (315).png',
    'books/1984/page (316).png',
    'books/1984/page (317).png',
    'books/1984/page (318).png',
    'books/1984/page (319).png',
    'books/1984/page (320).png',
    'books/1984/page (321).png',
    'books/1984/page (322).png',
    'books/1984/page (323).png',
    'books/1984/page (324).png',
    'books/1984/page (325).png',
    'books/1984/page (326).png',
    'books/1984/page (327).png',
    'books/1984/page (328).png',
    'books/1984/page (329).png',
    'books/1984/page (330).png',
    'books/1984/page (331).png',
    'books/1984/page (332).png',
    'books/1984/page (333).png',
    'books/1984/page (334).png',
    'books/1984/page (335).png',
    'books/1984/page (336).png',
    'books/1984/page (337).png',
    'books/1984/page (338).png',
    'books/1984/page (339).png',
    'books/1984/page (340).png',
    'books/1984/page (341).png',
    'books/1984/page (342).png',
    'books/1984/page (343).png',
    'books/1984/page (344).png',
    'books/1984/page (345).png',
    'books/1984/page (346).png',
    'books/1984/page (347).png',
    'books/1984/page (348).png',
    'books/1984/page (349).png',
    'books/1984/page (350).png',
    'books/1984/page (351).png',
    'books/1984/page (352).png',
    'books/1984/page (353).png',
    'books/1984/page (354).png',
    'books/1984/page (355).png',
    'books/1984/page (356).png',
    'books/1984/page (357).png',
    'books/1984/page (358).png',
    'books/1984/page (359).png',
    'books/1984/page (360).png',
    'books/1984/page (361).png',
    'books/1984/page (362).png',
    'books/1984/page (363).png',
    'books/1984/page (364).png',
    'books/1984/page (365).png',
    'books/1984/page (366).png',
    'books/1984/page (367).png',
    'books/1984/page (368).png',
    'books/1984/page (369).png',
    'books/1984/page (370).png',
    'books/1984/page (371).png',
    'books/1984/page (372).png',
    'books/1984/page (373).png',
    'books/1984/page (374).png',
    'books/1984/page (375).png',
    'books/1984/page (376).png',
    'books/1984/page (377).png',
    'books/1984/page (378).png',
    'books/1984/page (379).png',
    'books/1984/page (380).png',
    'books/1984/page (381).png',
    'books/1984/page (382).png',
    'books/1984/page (383).png',
    'books/1984/page (384).png',
    'books/1984/page (385).png',
    'books/1984/page (386).png',
    'books/1984/page (387).png',
    'books/1984/page (388).png',
    'books/1984/page (389).png',
    'books/1984/page (390).png',
    'books/1984/page (391).png',
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
