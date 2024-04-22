import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bluetrain extends StatefulWidget {
  const bluetrain({Key? key}) : super(key: key);

  @override
  State<bluetrain> createState() => _bluetrainState();
}

class _bluetrainState extends State<bluetrain> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/blue train/page (1).png',
    'books/blue train/page (2).png',
    'books/blue train/page (3).png',
    'books/blue train/page (4).png',
    'books/blue train/page (5).png',
    'books/blue train/page (6).png',
    'books/blue train/page (7).png',
    'books/blue train/page (8).png',
    'books/blue train/page (9).png',
    'books/blue train/page (10).png',
    'books/blue train/page (11).png',
    'books/blue train/page (12).png',
    'books/blue train/page (13).png',
    'books/blue train/page (14).png',
    'books/blue train/page (15).png',
    'books/blue train/page (16).png',
    'books/blue train/page (17).png',
    'books/blue train/page (18).png',
    'books/blue train/page (19).png',
    'books/blue train/page (20).png',
    'books/blue train/page (21).png',
    'books/blue train/page (22).png',
    'books/blue train/page (23).png',
    'books/blue train/page (24).png',
    'books/blue train/page (25).png',
    'books/blue train/page (26).png',
    'books/blue train/page (27).png',
    'books/blue train/page (28).png',
    'books/blue train/page (29).png',
    'books/blue train/page (30).png',
    'books/blue train/page (31).png',
    'books/blue train/page (32).png',
    'books/blue train/page (33).png',
    'books/blue train/page (34).png',
    'books/blue train/page (35).png',
    'books/blue train/page (36).png',
    'books/blue train/page (37).png',
    'books/blue train/page (38).png',
    'books/blue train/page (39).png',
    'books/blue train/page (40).png',
    'books/blue train/page (41).png',
    'books/blue train/page (42).png',
    'books/blue train/page (43).png',
    'books/blue train/page (44).png',
    'books/blue train/page (45).png',
    'books/blue train/page (46).png',
    'books/blue train/page (47).png',
    'books/blue train/page (48).png',
    'books/blue train/page (49).png',
    'books/blue train/page (50).png',
    'books/blue train/page (51).png',
    'books/blue train/page (52).png',
    'books/blue train/page (53).png',
    'books/blue train/page (54).png',
    'books/blue train/page (55).png',
    'books/blue train/page (56).png',
    'books/blue train/page (57).png',
    'books/blue train/page (58).png',
    'books/blue train/page (59).png',
    'books/blue train/page (60).png',
    'books/blue train/page (61).png',
    'books/blue train/page (62).png',
    'books/blue train/page (63).png',
    'books/blue train/page (64).png',
    'books/blue train/page (65).png',
    'books/blue train/page (66).png',
    'books/blue train/page (67).png',
    'books/blue train/page (68).png',
    'books/blue train/page (69).png',
    'books/blue train/page (70).png',
    'books/blue train/page (71).png',
    'books/blue train/page (72).png',
    'books/blue train/page (73).png',
    'books/blue train/page (74).png',
    'books/blue train/page (75).png',
    'books/blue train/page (76).png',
    'books/blue train/page (77).png',
    'books/blue train/page (78).png',
    'books/blue train/page (79).png',
    'books/blue train/page (80).png',
    'books/blue train/page (81).png',
    'books/blue train/page (82).png',
    'books/blue train/page (83).png',
    'books/blue train/page (84).png',
    'books/blue train/page (85).png',
    'books/blue train/page (86).png',
    'books/blue train/page (87).png',
    'books/blue train/page (88).png',
    'books/blue train/page (89).png',
    'books/blue train/page (90).png',
    'books/blue train/page (91).png',
    'books/blue train/page (92).png',
    'books/blue train/page (93).png',
    'books/blue train/page (94).png',
    'books/blue train/page (95).png',
    'books/blue train/page (96).png',
    'books/blue train/page (97).png',
    'books/blue train/page (98).png',
    'books/blue train/page (99).png',
    'books/blue train/page (100).png',
    'books/blue train/page (101).png',
    'books/blue train/page (102).png',
    'books/blue train/page (103).png',
    'books/blue train/page (104).png',
    'books/blue train/page (105).png',
    'books/blue train/page (106).png',
    'books/blue train/page (107).png',
    'books/blue train/page (108).png',
    'books/blue train/page (109).png',
    'books/blue train/page (110).png',
    'books/blue train/page (111).png',
    'books/blue train/page (112).png',
    'books/blue train/page (113).png',
    'books/blue train/page (114).png',
    'books/blue train/page (115).png',
    'books/blue train/page (116).png',
    'books/blue train/page (117).png',
    'books/blue train/page (118).png',
    'books/blue train/page (119).png',
    'books/blue train/page (120).png',
    'books/blue train/page (121).png',
    'books/blue train/page (122).png',
    'books/blue train/page (123).png',
    'books/blue train/page (124).png',
    'books/blue train/page (125).png',
    'books/blue train/page (126).png',
    'books/blue train/page (127).png',
    'books/blue train/page (128).png',
    'books/blue train/page (129).png',
    'books/blue train/page (130).png',
    'books/blue train/page (131).png',
    'books/blue train/page (132).png',
    'books/blue train/page (133).png',
    'books/blue train/page (134).png',
    'books/blue train/page (135).png',
    'books/blue train/page (136).png',
    'books/blue train/page (137).png',
    'books/blue train/page (138).png',
    'books/blue train/page (139).png',
    'books/blue train/page (140).png',
    'books/blue train/page (141).png',
    'books/blue train/page (142).png',
    'books/blue train/page (143).png',
    'books/blue train/page (144).png',
    'books/blue train/page (145).png',
    'books/blue train/page (146).png',
    'books/blue train/page (147).png',
    'books/blue train/page (148).png',
    'books/blue train/page (149).png',
    'books/blue train/page (150).png',
    'books/blue train/page (151).png',
    'books/blue train/page (152).png',
    'books/blue train/page (153).png',
    'books/blue train/page (154).png',
    'books/blue train/page (155).png',
    'books/blue train/page (156).png',
    'books/blue train/page (157).png',
    'books/blue train/page (158).png',
    'books/blue train/page (159).png',
    'books/blue train/page (160).png',
    'books/blue train/page (161).png',
    'books/blue train/page (162).png',
    'books/blue train/page (163).png',
    'books/blue train/page (164).png',
    'books/blue train/page (165).png',
    'books/blue train/page (166).png',
    'books/blue train/page (167).png',
    'books/blue train/page (168).png',
    'books/blue train/page (169).png',
    'books/blue train/page (170).png',
    'books/blue train/page (171).png',
    'books/blue train/page (172).png',
    'books/blue train/page (173).png',
    'books/blue train/page (174).png',
    'books/blue train/page (175).png',
    'books/blue train/page (176).png',
    'books/blue train/page (177).png',
    'books/blue train/page (178).png',
    'books/blue train/page (179).png',
    'books/blue train/page (180).png',
    'books/blue train/page (181).png',
    'books/blue train/page (182).png',
    'books/blue train/page (183).png',
    'books/blue train/page (184).png',
    'books/blue train/page (185).png',
    'books/blue train/page (186).png',
    'books/blue train/page (187).png',
    'books/blue train/page (188).png',
    'books/blue train/page (189).png',
    'books/blue train/page (190).png',
    'books/blue train/page (191).png',
    'books/blue train/page (192).png',
    'books/blue train/page (193).png',
    'books/blue train/page (194).png',
    'books/blue train/page (195).png',
    'books/blue train/page (196).png',
    'books/blue train/page (197).png',
    'books/blue train/page (198).png',
    'books/blue train/page (199).png',
    'books/blue train/page (200).png',
    'books/blue train/page (201).png',
    'books/blue train/page (202).png',
    'books/blue train/page (203).png',
    'books/blue train/page (204).png',
    'books/blue train/page (205).png',
    'books/blue train/page (206).png',
    'books/blue train/page (207).png',
    'books/blue train/page (208).png',
    'books/blue train/page (209).png',
    'books/blue train/page (210).png',
    'books/blue train/page (211).png',
    'books/blue train/page (212).png',
    'books/blue train/page (213).png',
    'books/blue train/page (214).png',
    'books/blue train/page (215).png',
    'books/blue train/page (216).png',
    'books/blue train/page (217).png',
    'books/blue train/page (218).png',
    'books/blue train/page (219).png',
    'books/blue train/page (220).png',
    'books/blue train/page (221).png',
    'books/blue train/page (222).png',
    'books/blue train/page (223).png',
    'books/blue train/page (224).png',
    'books/blue train/page (225).png',
    'books/blue train/page (226).png',
    'books/blue train/page (227).png',
    'books/blue train/page (228).png',
    'books/blue train/page (229).png',
    'books/blue train/page (230).png',
    'books/blue train/page (231).png',
    'books/blue train/page (232).png',
    'books/blue train/page (233).png',
    'books/blue train/page (234).png',
    'books/blue train/page (235).png',
    'books/blue train/page (236).png',
    'books/blue train/page (237).png',
    'books/blue train/page (238).png',
    'books/blue train/page (239).png',
    'books/blue train/page (240).png',
    'books/blue train/page (241).png',
    'books/blue train/page (242).png',
    'books/blue train/page (243).png',
    'books/blue train/page (244).png',
    'books/blue train/page (245).png',
    'books/blue train/page (246).png',
    'books/blue train/page (247).png',
    'books/blue train/page (248).png',
    'books/blue train/page (249).png',
    'books/blue train/page (250).png',
    'books/blue train/page (251).png',
    'books/blue train/page (252).png',
    'books/blue train/page (253).png',
    'books/blue train/page (254).png',
    'books/blue train/page (255).png',
    'books/blue train/page (256).png',
    'books/blue train/page (257).png',
    'books/blue train/page (258).png',
    'books/blue train/page (259).png',
    'books/blue train/page (260).png',
    'books/blue train/page (261).png',
    'books/blue train/page (262).png',
    'books/blue train/page (263).png',
    'books/blue train/page (264).png',
    'books/blue train/page (265).png',
    'books/blue train/page (266).png',
    'books/blue train/page (267).png',
    'books/blue train/page (268).png',
    'books/blue train/page (269).png',
    'books/blue train/page (270).png',
    'books/blue train/page (271).png',
    'books/blue train/page (272).png',
    'books/blue train/page (273).png',
    'books/blue train/page (274).png',
    'books/blue train/page (275).png',
    'books/blue train/page (276).png',
    'books/blue train/page (277).png',
    'books/blue train/page (278).png',
    'books/blue train/page (279).png',
    'books/blue train/page (280).png',
    'books/blue train/page (281).png',
    'books/blue train/page (282).png',
    'books/blue train/page (283).png',
    'books/blue train/page (284).png',
    'books/blue train/page (285).png',
    'books/blue train/page (286).png',
    'books/blue train/page (287).png',
    'books/blue train/page (288).png',
    'books/blue train/page (289).png',
    'books/blue train/page (290).png',
    'books/blue train/page (291).png',
    'books/blue train/page (292).png',
    'books/blue train/page (293).png',
    'books/blue train/page (294).png',
    'books/blue train/page (295).png',
    'books/blue train/page (296).png',
    'books/blue train/page (297).png',
    'books/blue train/page (298).png',
    'books/blue train/page (299).png',
    'books/blue train/page (300).png',
    'books/blue train/page (301).png',
    'books/blue train/page (302).png',
    'books/blue train/page (303).png',
    'books/blue train/page (304).png',
    'books/blue train/page (305).png',
    'books/blue train/page (306).png',
    'books/blue train/page (307).png',
    'books/blue train/page (308).png',
    'books/blue train/page (309).png',
    'books/blue train/page (310).png',
    'books/blue train/page (311).png',
    'books/blue train/page (312).png',
    'books/blue train/page (313).png',
    'books/blue train/page (314).png',
    'books/blue train/page (315).png',
    'books/blue train/page (316).png',
    'books/blue train/page (317).png',
    'books/blue train/page (318).png',
    'books/blue train/page (319).png',
    'books/blue train/page (320).png',
    'books/blue train/page (321).png',
    'books/blue train/page (322).png',
    'books/blue train/page (323).png',
    'books/blue train/page (324).png',
    'books/blue train/page (325).png',
    'books/blue train/page (326).png',
    'books/blue train/page (327).png',
    'books/blue train/page (328).png',
    'books/blue train/page (329).png',
    'books/blue train/page (330).png',
    'books/blue train/page (331).png',
    'books/blue train/page (332).png',
    'books/blue train/page (333).png',
    'books/blue train/page (334).png',
    'books/blue train/page (335).png',
    'books/blue train/page (336).png',
    'books/blue train/page (337).png',
    'books/blue train/page (338).png',
    'books/blue train/page (339).png',
    'books/blue train/page (340).png',
    'books/blue train/page (341).png',
    'books/blue train/page (342).png',
    'books/blue train/page (343).png',
    'books/blue train/page (344).png',
    'books/blue train/page (345).png',
    'books/blue train/page (346).png',
    'books/blue train/page (347).png',
    'books/blue train/page (348).png',
    'books/blue train/page (349).png',
    'books/blue train/page (350).png',
    'books/blue train/page (351).png',
    'books/blue train/page (352).png',
    'books/blue train/page (353).png',
    'books/blue train/page (354).png',
    'books/blue train/page (355).png',
    'books/blue train/page (356).png',
    'books/blue train/page (357).png',
    'books/blue train/page (358).png',
    'books/blue train/page (359).png',
    'books/blue train/page (360).png',
    'books/blue train/page (361).png',
    'books/blue train/page (362).png',
    'books/blue train/page (363).png',
    'books/blue train/page (364).png',
    'books/blue train/page (365).png',
    'books/blue train/page (366).png',
    'books/blue train/page (367).png',
    'books/blue train/page (368).png',
    'books/blue train/page (369).png',
    'books/blue train/page (370).png',
    'books/blue train/page (371).png',
    'books/blue train/page (372).png',
    'books/blue train/page (373).png',
    'books/blue train/page (374).png',
    'books/blue train/page (375).png',
    'books/blue train/page (376).png',
    'books/blue train/page (377).png',

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
