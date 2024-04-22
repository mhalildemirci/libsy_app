import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class underfire extends StatefulWidget {
  const underfire({Key? key}) : super(key: key);

  @override
  State<underfire> createState() => _underfireState();
}

class _underfireState extends State<underfire> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/under fire/page (1).png',
    'books/under fire/page (2).png',
    'books/under fire/page (3).png',
    'books/under fire/page (4).png',
    'books/under fire/page (5).png',
    'books/under fire/page (6).png',
    'books/under fire/page (7).png',
    'books/under fire/page (8).png',
    'books/under fire/page (9).png',
    'books/under fire/page (10).png',
    'books/under fire/page (11).png',
    'books/under fire/page (12).png',
    'books/under fire/page (13).png',
    'books/under fire/page (14).png',
    'books/under fire/page (15).png',
    'books/under fire/page (16).png',
    'books/under fire/page (17).png',
    'books/under fire/page (18).png',
    'books/under fire/page (19).png',
    'books/under fire/page (20).png',
    'books/under fire/page (21).png',
    'books/under fire/page (22).png',
    'books/under fire/page (23).png',
    'books/under fire/page (24).png',
    'books/under fire/page (25).png',
    'books/under fire/page (26).png',
    'books/under fire/page (27).png',
    'books/under fire/page (28).png',
    'books/under fire/page (29).png',
    'books/under fire/page (30).png',
    'books/under fire/page (31).png',
    'books/under fire/page (32).png',
    'books/under fire/page (33).png',
    'books/under fire/page (34).png',
    'books/under fire/page (35).png',
    'books/under fire/page (36).png',
    'books/under fire/page (37).png',
    'books/under fire/page (38).png',
    'books/under fire/page (39).png',
    'books/under fire/page (40).png',
    'books/under fire/page (41).png',
    'books/under fire/page (42).png',
    'books/under fire/page (43).png',
    'books/under fire/page (44).png',
    'books/under fire/page (45).png',
    'books/under fire/page (46).png',
    'books/under fire/page (47).png',
    'books/under fire/page (48).png',
    'books/under fire/page (49).png',
    'books/under fire/page (50).png',
    'books/under fire/page (51).png',
    'books/under fire/page (52).png',
    'books/under fire/page (53).png',
    'books/under fire/page (54).png',
    'books/under fire/page (55).png',
    'books/under fire/page (56).png',
    'books/under fire/page (57).png',
    'books/under fire/page (58).png',
    'books/under fire/page (59).png',
    'books/under fire/page (60).png',
    'books/under fire/page (61).png',
    'books/under fire/page (62).png',
    'books/under fire/page (63).png',
    'books/under fire/page (64).png',
    'books/under fire/page (65).png',
    'books/under fire/page (66).png',
    'books/under fire/page (67).png',
    'books/under fire/page (68).png',
    'books/under fire/page (69).png',
    'books/under fire/page (70).png',
    'books/under fire/page (71).png',
    'books/under fire/page (72).png',
    'books/under fire/page (73).png',
    'books/under fire/page (74).png',
    'books/under fire/page (75).png',
    'books/under fire/page (76).png',
    'books/under fire/page (77).png',
    'books/under fire/page (78).png',
    'books/under fire/page (79).png',
    'books/under fire/page (80).png',
    'books/under fire/page (81).png',
    'books/under fire/page (82).png',
    'books/under fire/page (83).png',
    'books/under fire/page (84).png',
    'books/under fire/page (85).png',
    'books/under fire/page (86).png',
    'books/under fire/page (87).png',
    'books/under fire/page (88).png',
    'books/under fire/page (89).png',
    'books/under fire/page (90).png',
    'books/under fire/page (91).png',
    'books/under fire/page (92).png',
    'books/under fire/page (93).png',
    'books/under fire/page (94).png',
    'books/under fire/page (95).png',
    'books/under fire/page (96).png',
    'books/under fire/page (97).png',
    'books/under fire/page (98).png',
    'books/under fire/page (99).png',
    'books/under fire/page (100).png',
    'books/under fire/page (101).png',
    'books/under fire/page (102).png',
    'books/under fire/page (103).png',
    'books/under fire/page (104).png',
    'books/under fire/page (105).png',
    'books/under fire/page (106).png',
    'books/under fire/page (107).png',
    'books/under fire/page (108).png',
    'books/under fire/page (109).png',
    'books/under fire/page (110).png',
    'books/under fire/page (111).png',
    'books/under fire/page (112).png',
    'books/under fire/page (113).png',
    'books/under fire/page (114).png',
    'books/under fire/page (115).png',
    'books/under fire/page (116).png',
    'books/under fire/page (117).png',
    'books/under fire/page (118).png',
    'books/under fire/page (119).png',
    'books/under fire/page (120).png',
    'books/under fire/page (121).png',
    'books/under fire/page (122).png',
    'books/under fire/page (123).png',
    'books/under fire/page (124).png',
    'books/under fire/page (125).png',
    'books/under fire/page (126).png',
    'books/under fire/page (127).png',
    'books/under fire/page (128).png',
    'books/under fire/page (129).png',
    'books/under fire/page (130).png',
    'books/under fire/page (131).png',
    'books/under fire/page (132).png',
    'books/under fire/page (133).png',
    'books/under fire/page (134).png',
    'books/under fire/page (135).png',
    'books/under fire/page (136).png',
    'books/under fire/page (137).png',
    'books/under fire/page (138).png',
    'books/under fire/page (139).png',
    'books/under fire/page (140).png',
    'books/under fire/page (141).png',
    'books/under fire/page (142).png',
    'books/under fire/page (143).png',
    'books/under fire/page (144).png',
    'books/under fire/page (145).png',
    'books/under fire/page (146).png',
    'books/under fire/page (147).png',
    'books/under fire/page (148).png',
    'books/under fire/page (149).png',
    'books/under fire/page (150).png',
    'books/under fire/page (151).png',
    'books/under fire/page (152).png',
    'books/under fire/page (153).png',
    'books/under fire/page (154).png',
    'books/under fire/page (155).png',
    'books/under fire/page (156).png',
    'books/under fire/page (157).png',
    'books/under fire/page (158).png',
    'books/under fire/page (159).png',
    'books/under fire/page (160).png',
    'books/under fire/page (161).png',
    'books/under fire/page (162).png',
    'books/under fire/page (163).png',
    'books/under fire/page (164).png',
    'books/under fire/page (165).png',
    'books/under fire/page (166).png',
    'books/under fire/page (167).png',
    'books/under fire/page (168).png',
    'books/under fire/page (169).png',
    'books/under fire/page (170).png',
    'books/under fire/page (171).png',
    'books/under fire/page (172).png',
    'books/under fire/page (173).png',
    'books/under fire/page (174).png',
    'books/under fire/page (175).png',
    'books/under fire/page (176).png',
    'books/under fire/page (177).png',
    'books/under fire/page (178).png',
    'books/under fire/page (179).png',
    'books/under fire/page (180).png',
    'books/under fire/page (181).png',
    'books/under fire/page (182).png',
    'books/under fire/page (183).png',
    'books/under fire/page (184).png',
    'books/under fire/page (185).png',
    'books/under fire/page (186).png',
    'books/under fire/page (187).png',
    'books/under fire/page (188).png',
    'books/under fire/page (189).png',
    'books/under fire/page (190).png',
    'books/under fire/page (191).png',
    'books/under fire/page (192).png',
    'books/under fire/page (193).png',
    'books/under fire/page (194).png',
    'books/under fire/page (195).png',
    'books/under fire/page (196).png',
    'books/under fire/page (197).png',
    'books/under fire/page (198).png',
    'books/under fire/page (199).png',
    'books/under fire/page (200).png',
    'books/under fire/page (201).png',
    'books/under fire/page (202).png',
    'books/under fire/page (203).png',
    'books/under fire/page (204).png',
    'books/under fire/page (205).png',
    'books/under fire/page (206).png',
    'books/under fire/page (207).png',
    'books/under fire/page (208).png',
    'books/under fire/page (209).png',
    'books/under fire/page (210).png',
    'books/under fire/page (211).png',
    'books/under fire/page (212).png',
    'books/under fire/page (213).png',
    'books/under fire/page (214).png',
    'books/under fire/page (215).png',
    'books/under fire/page (216).png',
    'books/under fire/page (217).png',
    'books/under fire/page (218).png',
    'books/under fire/page (219).png',
    'books/under fire/page (220).png',
    'books/under fire/page (221).png',
    'books/under fire/page (222).png',
    'books/under fire/page (223).png',
    'books/under fire/page (224).png',
    'books/under fire/page (225).png',
    'books/under fire/page (226).png',
    'books/under fire/page (227).png',
    'books/under fire/page (228).png',
    'books/under fire/page (229).png',
    'books/under fire/page (230).png',
    'books/under fire/page (231).png',
    'books/under fire/page (232).png',
    'books/under fire/page (233).png',
    'books/under fire/page (234).png',
    'books/under fire/page (235).png',
    'books/under fire/page (236).png',
    'books/under fire/page (237).png',
    'books/under fire/page (238).png',
    'books/under fire/page (239).png',
    'books/under fire/page (240).png',
    'books/under fire/page (241).png',
    'books/under fire/page (242).png',
    'books/under fire/page (243).png',
    'books/under fire/page (244).png',
    'books/under fire/page (245).png',
    'books/under fire/page (246).png',
    'books/under fire/page (247).png',
    'books/under fire/page (248).png',
    'books/under fire/page (249).png',
    'books/under fire/page (250).png',
    'books/under fire/page (251).png',
    'books/under fire/page (252).png',
    'books/under fire/page (253).png',
    'books/under fire/page (254).png',
    'books/under fire/page (255).png',
    'books/under fire/page (256).png',
    'books/under fire/page (257).png',
    'books/under fire/page (258).png',
    'books/under fire/page (259).png',
    'books/under fire/page (260).png',
    'books/under fire/page (261).png',
    'books/under fire/page (262).png',
    'books/under fire/page (263).png',
    'books/under fire/page (264).png',
    'books/under fire/page (265).png',
    'books/under fire/page (266).png',
    'books/under fire/page (267).png',
    'books/under fire/page (268).png',
    'books/under fire/page (269).png',
    'books/under fire/page (270).png',
    'books/under fire/page (271).png',
    'books/under fire/page (272).png',
    'books/under fire/page (273).png',
    'books/under fire/page (274).png',
    'books/under fire/page (275).png',
    'books/under fire/page (276).png',
    'books/under fire/page (277).png',
    'books/under fire/page (278).png',
    'books/under fire/page (279).png',
    'books/under fire/page (280).png',
    'books/under fire/page (281).png',
    'books/under fire/page (282).png',
    'books/under fire/page (283).png',
    'books/under fire/page (284).png',
    'books/under fire/page (285).png',
    'books/under fire/page (286).png',
    'books/under fire/page (287).png',
    'books/under fire/page (288).png',
    'books/under fire/page (289).png',
    'books/under fire/page (290).png',
    'books/under fire/page (291).png',
    'books/under fire/page (292).png',
    'books/under fire/page (293).png',
    'books/under fire/page (294).png',
    'books/under fire/page (295).png',
    'books/under fire/page (296).png',
    'books/under fire/page (297).png',
    'books/under fire/page (298).png',
    'books/under fire/page (299).png',
    'books/under fire/page (300).png',
    'books/under fire/page (301).png',
    'books/under fire/page (302).png',
    'books/under fire/page (303).png',
    'books/under fire/page (304).png',
    'books/under fire/page (305).png',
    'books/under fire/page (306).png',
    'books/under fire/page (307).png',
    'books/under fire/page (308).png',
    'books/under fire/page (309).png',
    'books/under fire/page (310).png',
    'books/under fire/page (311).png',
    'books/under fire/page (312).png',
    'books/under fire/page (313).png',
    'books/under fire/page (314).png',
    'books/under fire/page (315).png',
    'books/under fire/page (316).png',
    'books/under fire/page (317).png',
    'books/under fire/page (318).png',
    'books/under fire/page (319).png',
    'books/under fire/page (320).png',
    'books/under fire/page (321).png',
    'books/under fire/page (322).png',
    'books/under fire/page (323).png',
    'books/under fire/page (324).png',
    'books/under fire/page (325).png',

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
