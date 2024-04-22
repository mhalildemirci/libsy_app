import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mrbritling extends StatefulWidget {
  const mrbritling({Key? key}) : super(key: key);

  @override
  State<mrbritling> createState() => _mrbritlingState();
}

class _mrbritlingState extends State<mrbritling> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mr britling/page (1).png',
    'books/mr britling/page (2).png',
    'books/mr britling/page (3).png',
    'books/mr britling/page (4).png',
    'books/mr britling/page (5).png',
    'books/mr britling/page (6).png',
    'books/mr britling/page (7).png',
    'books/mr britling/page (8).png',
    'books/mr britling/page (9).png',
    'books/mr britling/page (10).png',
    'books/mr britling/page (11).png',
    'books/mr britling/page (12).png',
    'books/mr britling/page (13).png',
    'books/mr britling/page (14).png',
    'books/mr britling/page (15).png',
    'books/mr britling/page (16).png',
    'books/mr britling/page (17).png',
    'books/mr britling/page (18).png',
    'books/mr britling/page (19).png',
    'books/mr britling/page (20).png',
    'books/mr britling/page (21).png',
    'books/mr britling/page (22).png',
    'books/mr britling/page (23).png',
    'books/mr britling/page (24).png',
    'books/mr britling/page (25).png',
    'books/mr britling/page (26).png',
    'books/mr britling/page (27).png',
    'books/mr britling/page (28).png',
    'books/mr britling/page (29).png',
    'books/mr britling/page (30).png',
    'books/mr britling/page (31).png',
    'books/mr britling/page (32).png',
    'books/mr britling/page (33).png',
    'books/mr britling/page (34).png',
    'books/mr britling/page (35).png',
    'books/mr britling/page (36).png',
    'books/mr britling/page (37).png',
    'books/mr britling/page (38).png',
    'books/mr britling/page (39).png',
    'books/mr britling/page (40).png',
    'books/mr britling/page (41).png',
    'books/mr britling/page (42).png',
    'books/mr britling/page (43).png',
    'books/mr britling/page (44).png',
    'books/mr britling/page (45).png',
    'books/mr britling/page (46).png',
    'books/mr britling/page (47).png',
    'books/mr britling/page (48).png',
    'books/mr britling/page (49).png',
    'books/mr britling/page (50).png',
    'books/mr britling/page (51).png',
    'books/mr britling/page (52).png',
    'books/mr britling/page (53).png',
    'books/mr britling/page (54).png',
    'books/mr britling/page (55).png',
    'books/mr britling/page (56).png',
    'books/mr britling/page (57).png',
    'books/mr britling/page (58).png',
    'books/mr britling/page (59).png',
    'books/mr britling/page (60).png',
    'books/mr britling/page (61).png',
    'books/mr britling/page (62).png',
    'books/mr britling/page (63).png',
    'books/mr britling/page (64).png',
    'books/mr britling/page (65).png',
    'books/mr britling/page (66).png',
    'books/mr britling/page (67).png',
    'books/mr britling/page (68).png',
    'books/mr britling/page (69).png',
    'books/mr britling/page (70).png',
    'books/mr britling/page (71).png',
    'books/mr britling/page (72).png',
    'books/mr britling/page (73).png',
    'books/mr britling/page (74).png',
    'books/mr britling/page (75).png',
    'books/mr britling/page (76).png',
    'books/mr britling/page (77).png',
    'books/mr britling/page (78).png',
    'books/mr britling/page (79).png',
    'books/mr britling/page (80).png',
    'books/mr britling/page (81).png',
    'books/mr britling/page (82).png',
    'books/mr britling/page (83).png',
    'books/mr britling/page (84).png',
    'books/mr britling/page (85).png',
    'books/mr britling/page (86).png',
    'books/mr britling/page (87).png',
    'books/mr britling/page (88).png',
    'books/mr britling/page (89).png',
    'books/mr britling/page (90).png',
    'books/mr britling/page (91).png',
    'books/mr britling/page (92).png',
    'books/mr britling/page (93).png',
    'books/mr britling/page (94).png',
    'books/mr britling/page (95).png',
    'books/mr britling/page (96).png',
    'books/mr britling/page (97).png',
    'books/mr britling/page (98).png',
    'books/mr britling/page (99).png',
    'books/mr britling/page (100).png',
    'books/mr britling/page (101).png',
    'books/mr britling/page (102).png',
    'books/mr britling/page (103).png',
    'books/mr britling/page (104).png',
    'books/mr britling/page (105).png',
    'books/mr britling/page (106).png',
    'books/mr britling/page (107).png',
    'books/mr britling/page (108).png',
    'books/mr britling/page (109).png',
    'books/mr britling/page (110).png',
    'books/mr britling/page (111).png',
    'books/mr britling/page (112).png',
    'books/mr britling/page (113).png',
    'books/mr britling/page (114).png',
    'books/mr britling/page (115).png',
    'books/mr britling/page (116).png',
    'books/mr britling/page (117).png',
    'books/mr britling/page (118).png',
    'books/mr britling/page (119).png',
    'books/mr britling/page (120).png',
    'books/mr britling/page (121).png',
    'books/mr britling/page (122).png',
    'books/mr britling/page (123).png',
    'books/mr britling/page (124).png',
    'books/mr britling/page (125).png',
    'books/mr britling/page (126).png',
    'books/mr britling/page (127).png',
    'books/mr britling/page (128).png',
    'books/mr britling/page (129).png',
    'books/mr britling/page (130).png',
    'books/mr britling/page (131).png',
    'books/mr britling/page (132).png',
    'books/mr britling/page (133).png',
    'books/mr britling/page (134).png',
    'books/mr britling/page (135).png',
    'books/mr britling/page (136).png',
    'books/mr britling/page (137).png',
    'books/mr britling/page (138).png',
    'books/mr britling/page (139).png',
    'books/mr britling/page (140).png',
    'books/mr britling/page (141).png',
    'books/mr britling/page (142).png',
    'books/mr britling/page (143).png',
    'books/mr britling/page (144).png',
    'books/mr britling/page (145).png',
    'books/mr britling/page (146).png',
    'books/mr britling/page (147).png',
    'books/mr britling/page (148).png',
    'books/mr britling/page (149).png',
    'books/mr britling/page (150).png',
    'books/mr britling/page (151).png',
    'books/mr britling/page (152).png',
    'books/mr britling/page (153).png',
    'books/mr britling/page (154).png',
    'books/mr britling/page (155).png',
    'books/mr britling/page (156).png',
    'books/mr britling/page (157).png',
    'books/mr britling/page (158).png',
    'books/mr britling/page (159).png',
    'books/mr britling/page (160).png',
    'books/mr britling/page (161).png',
    'books/mr britling/page (162).png',
    'books/mr britling/page (163).png',
    'books/mr britling/page (164).png',
    'books/mr britling/page (165).png',
    'books/mr britling/page (166).png',
    'books/mr britling/page (167).png',
    'books/mr britling/page (168).png',
    'books/mr britling/page (169).png',
    'books/mr britling/page (170).png',
    'books/mr britling/page (171).png',
    'books/mr britling/page (172).png',
    'books/mr britling/page (173).png',
    'books/mr britling/page (174).png',
    'books/mr britling/page (175).png',
    'books/mr britling/page (176).png',
    'books/mr britling/page (177).png',
    'books/mr britling/page (178).png',
    'books/mr britling/page (179).png',
    'books/mr britling/page (180).png',
    'books/mr britling/page (181).png',
    'books/mr britling/page (182).png',
    'books/mr britling/page (183).png',
    'books/mr britling/page (184).png',
    'books/mr britling/page (185).png',
    'books/mr britling/page (186).png',
    'books/mr britling/page (187).png',
    'books/mr britling/page (188).png',
    'books/mr britling/page (189).png',
    'books/mr britling/page (190).png',
    'books/mr britling/page (191).png',
    'books/mr britling/page (192).png',
    'books/mr britling/page (193).png',
    'books/mr britling/page (194).png',
    'books/mr britling/page (195).png',
    'books/mr britling/page (196).png',
    'books/mr britling/page (197).png',
    'books/mr britling/page (198).png',
    'books/mr britling/page (199).png',
    'books/mr britling/page (200).png',
    'books/mr britling/page (201).png',
    'books/mr britling/page (202).png',
    'books/mr britling/page (203).png',
    'books/mr britling/page (204).png',
    'books/mr britling/page (205).png',
    'books/mr britling/page (206).png',
    'books/mr britling/page (207).png',
    'books/mr britling/page (208).png',
    'books/mr britling/page (209).png',
    'books/mr britling/page (210).png',
    'books/mr britling/page (211).png',
    'books/mr britling/page (212).png',
    'books/mr britling/page (213).png',
    'books/mr britling/page (214).png',
    'books/mr britling/page (215).png',
    'books/mr britling/page (216).png',
    'books/mr britling/page (217).png',
    'books/mr britling/page (218).png',
    'books/mr britling/page (219).png',
    'books/mr britling/page (220).png',
    'books/mr britling/page (221).png',
    'books/mr britling/page (222).png',
    'books/mr britling/page (223).png',
    'books/mr britling/page (224).png',
    'books/mr britling/page (225).png',
    'books/mr britling/page (226).png',
    'books/mr britling/page (227).png',
    'books/mr britling/page (228).png',
    'books/mr britling/page (229).png',
    'books/mr britling/page (230).png',
    'books/mr britling/page (231).png',
    'books/mr britling/page (232).png',
    'books/mr britling/page (233).png',
    'books/mr britling/page (234).png',
    'books/mr britling/page (235).png',
    'books/mr britling/page (236).png',
    'books/mr britling/page (237).png',
    'books/mr britling/page (238).png',
    'books/mr britling/page (239).png',
    'books/mr britling/page (240).png',
    'books/mr britling/page (241).png',
    'books/mr britling/page (242).png',
    'books/mr britling/page (243).png',
    'books/mr britling/page (244).png',
    'books/mr britling/page (245).png',
    'books/mr britling/page (246).png',
    'books/mr britling/page (247).png',
    'books/mr britling/page (248).png',
    'books/mr britling/page (249).png',
    'books/mr britling/page (250).png',
    'books/mr britling/page (251).png',
    'books/mr britling/page (252).png',
    'books/mr britling/page (253).png',
    'books/mr britling/page (254).png',
    'books/mr britling/page (255).png',
    'books/mr britling/page (256).png',
    'books/mr britling/page (257).png',
    'books/mr britling/page (258).png',
    'books/mr britling/page (259).png',
    'books/mr britling/page (260).png',
    'books/mr britling/page (261).png',
    'books/mr britling/page (262).png',
    'books/mr britling/page (263).png',
    'books/mr britling/page (264).png',
    'books/mr britling/page (265).png',
    'books/mr britling/page (266).png',
    'books/mr britling/page (267).png',
    'books/mr britling/page (268).png',
    'books/mr britling/page (269).png',
    'books/mr britling/page (270).png',
    'books/mr britling/page (271).png',
    'books/mr britling/page (272).png',
    'books/mr britling/page (273).png',
    'books/mr britling/page (274).png',
    'books/mr britling/page (275).png',
    'books/mr britling/page (276).png',
    'books/mr britling/page (277).png',
    'books/mr britling/page (278).png',
    'books/mr britling/page (279).png',
    'books/mr britling/page (280).png',
    'books/mr britling/page (281).png',
    'books/mr britling/page (282).png',
    'books/mr britling/page (283).png',
    'books/mr britling/page (284).png',
    'books/mr britling/page (285).png',
    'books/mr britling/page (286).png',
    'books/mr britling/page (287).png',
    'books/mr britling/page (288).png',
    'books/mr britling/page (289).png',
    'books/mr britling/page (290).png',
    'books/mr britling/page (291).png',
    'books/mr britling/page (292).png',
    'books/mr britling/page (293).png',
    'books/mr britling/page (294).png',
    'books/mr britling/page (295).png',
    'books/mr britling/page (296).png',
    'books/mr britling/page (297).png',
    'books/mr britling/page (298).png',
    'books/mr britling/page (299).png',
    'books/mr britling/page (300).png',
    'books/mr britling/page (301).png',
    'books/mr britling/page (302).png',
    'books/mr britling/page (303).png',
    'books/mr britling/page (304).png',
    'books/mr britling/page (305).png',
    'books/mr britling/page (306).png',
    'books/mr britling/page (307).png',
    'books/mr britling/page (308).png',
    'books/mr britling/page (309).png',
    'books/mr britling/page (310).png',
    'books/mr britling/page (311).png',
    'books/mr britling/page (312).png',
    'books/mr britling/page (313).png',
    'books/mr britling/page (314).png',
    'books/mr britling/page (315).png',
    'books/mr britling/page (316).png',
    'books/mr britling/page (317).png',
    'books/mr britling/page (318).png',
    'books/mr britling/page (319).png',
    'books/mr britling/page (320).png',
    'books/mr britling/page (321).png',
    'books/mr britling/page (322).png',
    'books/mr britling/page (323).png',
    'books/mr britling/page (324).png',
    'books/mr britling/page (325).png',
    'books/mr britling/page (326).png',
    'books/mr britling/page (327).png',
    'books/mr britling/page (328).png',
    'books/mr britling/page (329).png',
    'books/mr britling/page (330).png',
    'books/mr britling/page (331).png',
    'books/mr britling/page (332).png',
    'books/mr britling/page (333).png',
    'books/mr britling/page (334).png',
    'books/mr britling/page (335).png',
    'books/mr britling/page (336).png',
    'books/mr britling/page (337).png',
    'books/mr britling/page (338).png',
    'books/mr britling/page (339).png',
    'books/mr britling/page (340).png',
    'books/mr britling/page (341).png',
    'books/mr britling/page (342).png',
    'books/mr britling/page (343).png',
    'books/mr britling/page (344).png',
    'books/mr britling/page (345).png',
    'books/mr britling/page (346).png',
    'books/mr britling/page (347).png',
    'books/mr britling/page (348).png',
    'books/mr britling/page (349).png',
    'books/mr britling/page (350).png',
    'books/mr britling/page (351).png',
    'books/mr britling/page (352).png',
    'books/mr britling/page (353).png',
    'books/mr britling/page (354).png',
    'books/mr britling/page (355).png',
    'books/mr britling/page (356).png',
    'books/mr britling/page (357).png',
    'books/mr britling/page (358).png',
    'books/mr britling/page (359).png',
    'books/mr britling/page (360).png',
    'books/mr britling/page (361).png',
    'books/mr britling/page (362).png',
    'books/mr britling/page (363).png',
    'books/mr britling/page (364).png',
    'books/mr britling/page (365).png',
    'books/mr britling/page (366).png',
    'books/mr britling/page (367).png',
    'books/mr britling/page (368).png',
    'books/mr britling/page (369).png',
    'books/mr britling/page (370).png',
    'books/mr britling/page (371).png',
    'books/mr britling/page (372).png',
    'books/mr britling/page (373).png',
    'books/mr britling/page (374).png',
    'books/mr britling/page (375).png',
    'books/mr britling/page (376).png',
    'books/mr britling/page (377).png',
    'books/mr britling/page (378).png',
    'books/mr britling/page (379).png',
    'books/mr britling/page (380).png',
    'books/mr britling/page (381).png',
    'books/mr britling/page (382).png',
    'books/mr britling/page (383).png',
    'books/mr britling/page (384).png',
    'books/mr britling/page (385).png',

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
