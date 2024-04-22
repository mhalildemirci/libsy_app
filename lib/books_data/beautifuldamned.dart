import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class beautifuldamned extends StatefulWidget {
  const beautifuldamned({Key? key}) : super(key: key);

  @override
  State<beautifuldamned> createState() => _beautifuldamnedState();
}

class _beautifuldamnedState extends State<beautifuldamned> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/beautiful damned/page (1).png',
    'books/beautiful damned/page (2).png',
    'books/beautiful damned/page (3).png',
    'books/beautiful damned/page (4).png',
    'books/beautiful damned/page (5).png',
    'books/beautiful damned/page (6).png',
    'books/beautiful damned/page (7).png',
    'books/beautiful damned/page (8).png',
    'books/beautiful damned/page (9).png',
    'books/beautiful damned/page (10).png',
    'books/beautiful damned/page (11).png',
    'books/beautiful damned/page (12).png',
    'books/beautiful damned/page (13).png',
    'books/beautiful damned/page (14).png',
    'books/beautiful damned/page (15).png',
    'books/beautiful damned/page (16).png',
    'books/beautiful damned/page (17).png',
    'books/beautiful damned/page (18).png',
    'books/beautiful damned/page (19).png',
    'books/beautiful damned/page (20).png',
    'books/beautiful damned/page (21).png',
    'books/beautiful damned/page (22).png',
    'books/beautiful damned/page (23).png',
    'books/beautiful damned/page (24).png',
    'books/beautiful damned/page (25).png',
    'books/beautiful damned/page (26).png',
    'books/beautiful damned/page (27).png',
    'books/beautiful damned/page (28).png',
    'books/beautiful damned/page (29).png',
    'books/beautiful damned/page (30).png',
    'books/beautiful damned/page (31).png',
    'books/beautiful damned/page (32).png',
    'books/beautiful damned/page (33).png',
    'books/beautiful damned/page (34).png',
    'books/beautiful damned/page (35).png',
    'books/beautiful damned/page (36).png',
    'books/beautiful damned/page (37).png',
    'books/beautiful damned/page (38).png',
    'books/beautiful damned/page (39).png',
    'books/beautiful damned/page (40).png',
    'books/beautiful damned/page (41).png',
    'books/beautiful damned/page (42).png',
    'books/beautiful damned/page (43).png',
    'books/beautiful damned/page (44).png',
    'books/beautiful damned/page (45).png',
    'books/beautiful damned/page (46).png',
    'books/beautiful damned/page (47).png',
    'books/beautiful damned/page (48).png',
    'books/beautiful damned/page (49).png',
    'books/beautiful damned/page (50).png',
    'books/beautiful damned/page (51).png',
    'books/beautiful damned/page (52).png',
    'books/beautiful damned/page (53).png',
    'books/beautiful damned/page (54).png',
    'books/beautiful damned/page (55).png',
    'books/beautiful damned/page (56).png',
    'books/beautiful damned/page (57).png',
    'books/beautiful damned/page (58).png',
    'books/beautiful damned/page (59).png',
    'books/beautiful damned/page (60).png',
    'books/beautiful damned/page (61).png',
    'books/beautiful damned/page (62).png',
    'books/beautiful damned/page (63).png',
    'books/beautiful damned/page (64).png',
    'books/beautiful damned/page (65).png',
    'books/beautiful damned/page (66).png',
    'books/beautiful damned/page (67).png',
    'books/beautiful damned/page (68).png',
    'books/beautiful damned/page (69).png',
    'books/beautiful damned/page (70).png',
    'books/beautiful damned/page (71).png',
    'books/beautiful damned/page (72).png',
    'books/beautiful damned/page (73).png',
    'books/beautiful damned/page (74).png',
    'books/beautiful damned/page (75).png',
    'books/beautiful damned/page (76).png',
    'books/beautiful damned/page (77).png',
    'books/beautiful damned/page (78).png',
    'books/beautiful damned/page (79).png',
    'books/beautiful damned/page (80).png',
    'books/beautiful damned/page (81).png',
    'books/beautiful damned/page (82).png',
    'books/beautiful damned/page (83).png',
    'books/beautiful damned/page (84).png',
    'books/beautiful damned/page (85).png',
    'books/beautiful damned/page (86).png',
    'books/beautiful damned/page (87).png',
    'books/beautiful damned/page (88).png',
    'books/beautiful damned/page (89).png',
    'books/beautiful damned/page (90).png',
    'books/beautiful damned/page (91).png',
    'books/beautiful damned/page (92).png',
    'books/beautiful damned/page (93).png',
    'books/beautiful damned/page (94).png',
    'books/beautiful damned/page (95).png',
    'books/beautiful damned/page (96).png',
    'books/beautiful damned/page (97).png',
    'books/beautiful damned/page (98).png',
    'books/beautiful damned/page (99).png',
    'books/beautiful damned/page (100).png',
    'books/beautiful damned/page (101).png',
    'books/beautiful damned/page (102).png',
    'books/beautiful damned/page (103).png',
    'books/beautiful damned/page (104).png',
    'books/beautiful damned/page (105).png',
    'books/beautiful damned/page (106).png',
    'books/beautiful damned/page (107).png',
    'books/beautiful damned/page (108).png',
    'books/beautiful damned/page (109).png',
    'books/beautiful damned/page (110).png',
    'books/beautiful damned/page (111).png',
    'books/beautiful damned/page (112).png',
    'books/beautiful damned/page (113).png',
    'books/beautiful damned/page (114).png',
    'books/beautiful damned/page (115).png',
    'books/beautiful damned/page (116).png',
    'books/beautiful damned/page (117).png',
    'books/beautiful damned/page (118).png',
    'books/beautiful damned/page (119).png',
    'books/beautiful damned/page (120).png',
    'books/beautiful damned/page (121).png',
    'books/beautiful damned/page (122).png',
    'books/beautiful damned/page (123).png',
    'books/beautiful damned/page (124).png',
    'books/beautiful damned/page (125).png',
    'books/beautiful damned/page (126).png',
    'books/beautiful damned/page (127).png',
    'books/beautiful damned/page (128).png',
    'books/beautiful damned/page (129).png',
    'books/beautiful damned/page (130).png',
    'books/beautiful damned/page (131).png',
    'books/beautiful damned/page (132).png',
    'books/beautiful damned/page (133).png',
    'books/beautiful damned/page (134).png',
    'books/beautiful damned/page (135).png',
    'books/beautiful damned/page (136).png',
    'books/beautiful damned/page (137).png',
    'books/beautiful damned/page (138).png',
    'books/beautiful damned/page (139).png',
    'books/beautiful damned/page (140).png',
    'books/beautiful damned/page (141).png',
    'books/beautiful damned/page (142).png',
    'books/beautiful damned/page (143).png',
    'books/beautiful damned/page (144).png',
    'books/beautiful damned/page (145).png',
    'books/beautiful damned/page (146).png',
    'books/beautiful damned/page (147).png',
    'books/beautiful damned/page (148).png',
    'books/beautiful damned/page (149).png',
    'books/beautiful damned/page (150).png',
    'books/beautiful damned/page (151).png',
    'books/beautiful damned/page (152).png',
    'books/beautiful damned/page (153).png',
    'books/beautiful damned/page (154).png',
    'books/beautiful damned/page (155).png',
    'books/beautiful damned/page (156).png',
    'books/beautiful damned/page (157).png',
    'books/beautiful damned/page (158).png',
    'books/beautiful damned/page (159).png',
    'books/beautiful damned/page (160).png',
    'books/beautiful damned/page (161).png',
    'books/beautiful damned/page (162).png',
    'books/beautiful damned/page (163).png',
    'books/beautiful damned/page (164).png',
    'books/beautiful damned/page (165).png',
    'books/beautiful damned/page (166).png',
    'books/beautiful damned/page (167).png',
    'books/beautiful damned/page (168).png',
    'books/beautiful damned/page (169).png',
    'books/beautiful damned/page (170).png',
    'books/beautiful damned/page (171).png',
    'books/beautiful damned/page (172).png',
    'books/beautiful damned/page (173).png',
    'books/beautiful damned/page (174).png',
    'books/beautiful damned/page (175).png',
    'books/beautiful damned/page (176).png',
    'books/beautiful damned/page (177).png',
    'books/beautiful damned/page (178).png',
    'books/beautiful damned/page (179).png',
    'books/beautiful damned/page (180).png',
    'books/beautiful damned/page (181).png',
    'books/beautiful damned/page (182).png',
    'books/beautiful damned/page (183).png',
    'books/beautiful damned/page (184).png',
    'books/beautiful damned/page (185).png',
    'books/beautiful damned/page (186).png',
    'books/beautiful damned/page (187).png',
    'books/beautiful damned/page (188).png',
    'books/beautiful damned/page (189).png',
    'books/beautiful damned/page (190).png',
    'books/beautiful damned/page (191).png',
    'books/beautiful damned/page (192).png',
    'books/beautiful damned/page (193).png',
    'books/beautiful damned/page (194).png',
    'books/beautiful damned/page (195).png',
    'books/beautiful damned/page (196).png',
    'books/beautiful damned/page (197).png',
    'books/beautiful damned/page (198).png',
    'books/beautiful damned/page (199).png',
    'books/beautiful damned/page (200).png',
    'books/beautiful damned/page (201).png',
    'books/beautiful damned/page (202).png',
    'books/beautiful damned/page (203).png',
    'books/beautiful damned/page (204).png',
    'books/beautiful damned/page (205).png',
    'books/beautiful damned/page (206).png',
    'books/beautiful damned/page (207).png',
    'books/beautiful damned/page (208).png',
    'books/beautiful damned/page (209).png',
    'books/beautiful damned/page (210).png',
    'books/beautiful damned/page (211).png',
    'books/beautiful damned/page (212).png',
    'books/beautiful damned/page (213).png',
    'books/beautiful damned/page (214).png',
    'books/beautiful damned/page (215).png',
    'books/beautiful damned/page (216).png',
    'books/beautiful damned/page (217).png',
    'books/beautiful damned/page (218).png',
    'books/beautiful damned/page (219).png',
    'books/beautiful damned/page (220).png',
    'books/beautiful damned/page (221).png',
    'books/beautiful damned/page (222).png',
    'books/beautiful damned/page (223).png',
    'books/beautiful damned/page (224).png',
    'books/beautiful damned/page (225).png',
    'books/beautiful damned/page (226).png',
    'books/beautiful damned/page (227).png',
    'books/beautiful damned/page (228).png',
    'books/beautiful damned/page (229).png',
    'books/beautiful damned/page (230).png',
    'books/beautiful damned/page (231).png',
    'books/beautiful damned/page (232).png',
    'books/beautiful damned/page (233).png',
    'books/beautiful damned/page (234).png',
    'books/beautiful damned/page (235).png',
    'books/beautiful damned/page (236).png',
    'books/beautiful damned/page (237).png',
    'books/beautiful damned/page (238).png',
    'books/beautiful damned/page (239).png',
    'books/beautiful damned/page (240).png',
    'books/beautiful damned/page (241).png',
    'books/beautiful damned/page (242).png',
    'books/beautiful damned/page (243).png',
    'books/beautiful damned/page (244).png',
    'books/beautiful damned/page (245).png',
    'books/beautiful damned/page (246).png',
    'books/beautiful damned/page (247).png',
    'books/beautiful damned/page (248).png',
    'books/beautiful damned/page (249).png',
    'books/beautiful damned/page (250).png',
    'books/beautiful damned/page (251).png',
    'books/beautiful damned/page (252).png',
    'books/beautiful damned/page (253).png',
    'books/beautiful damned/page (254).png',
    'books/beautiful damned/page (255).png',
    'books/beautiful damned/page (256).png',
    'books/beautiful damned/page (257).png',
    'books/beautiful damned/page (258).png',
    'books/beautiful damned/page (259).png',
    'books/beautiful damned/page (260).png',
    'books/beautiful damned/page (261).png',
    'books/beautiful damned/page (262).png',
    'books/beautiful damned/page (263).png',
    'books/beautiful damned/page (264).png',
    'books/beautiful damned/page (265).png',
    'books/beautiful damned/page (266).png',
    'books/beautiful damned/page (267).png',
    'books/beautiful damned/page (268).png',
    'books/beautiful damned/page (269).png',
    'books/beautiful damned/page (270).png',
    'books/beautiful damned/page (271).png',
    'books/beautiful damned/page (272).png',
    'books/beautiful damned/page (273).png',
    'books/beautiful damned/page (274).png',
    'books/beautiful damned/page (275).png',
    'books/beautiful damned/page (276).png',
    'books/beautiful damned/page (277).png',
    'books/beautiful damned/page (278).png',
    'books/beautiful damned/page (279).png',
    'books/beautiful damned/page (280).png',
    'books/beautiful damned/page (281).png',
    'books/beautiful damned/page (282).png',
    'books/beautiful damned/page (283).png',
    'books/beautiful damned/page (284).png',
    'books/beautiful damned/page (285).png',
    'books/beautiful damned/page (286).png',
    'books/beautiful damned/page (287).png',
    'books/beautiful damned/page (288).png',
    'books/beautiful damned/page (289).png',
    'books/beautiful damned/page (290).png',
    'books/beautiful damned/page (291).png',
    'books/beautiful damned/page (292).png',
    'books/beautiful damned/page (293).png',
    'books/beautiful damned/page (294).png',
    'books/beautiful damned/page (295).png',
    'books/beautiful damned/page (296).png',
    'books/beautiful damned/page (297).png',
    'books/beautiful damned/page (298).png',
    'books/beautiful damned/page (299).png',
    'books/beautiful damned/page (300).png',
    'books/beautiful damned/page (301).png',
    'books/beautiful damned/page (302).png',
    'books/beautiful damned/page (303).png',
    'books/beautiful damned/page (304).png',
    'books/beautiful damned/page (305).png',
    'books/beautiful damned/page (306).png',
    'books/beautiful damned/page (307).png',
    'books/beautiful damned/page (308).png',
    'books/beautiful damned/page (309).png',
    'books/beautiful damned/page (310).png',
    'books/beautiful damned/page (311).png',
    'books/beautiful damned/page (312).png',
    'books/beautiful damned/page (313).png',
    'books/beautiful damned/page (314).png',
    'books/beautiful damned/page (315).png',
    'books/beautiful damned/page (316).png',
    'books/beautiful damned/page (317).png',
    'books/beautiful damned/page (318).png',
    'books/beautiful damned/page (319).png',
    'books/beautiful damned/page (320).png',
    'books/beautiful damned/page (321).png',
    'books/beautiful damned/page (322).png',
    'books/beautiful damned/page (323).png',
    'books/beautiful damned/page (324).png',
    'books/beautiful damned/page (325).png',
    'books/beautiful damned/page (326).png',
    'books/beautiful damned/page (327).png',
    'books/beautiful damned/page (328).png',
    'books/beautiful damned/page (329).png',
    'books/beautiful damned/page (330).png',
    'books/beautiful damned/page (331).png',
    'books/beautiful damned/page (332).png',
    'books/beautiful damned/page (333).png',
    'books/beautiful damned/page (334).png',
    'books/beautiful damned/page (335).png',
    'books/beautiful damned/page (336).png',
    'books/beautiful damned/page (337).png',
    'books/beautiful damned/page (338).png',

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
