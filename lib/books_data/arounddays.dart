import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class arounddays extends StatefulWidget {
  const arounddays({Key? key}) : super(key: key);

  @override
  State<arounddays> createState() => _arounddaysState();
}

class _arounddaysState extends State<arounddays> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Around 80 Days/page (1).png',
    'books/Around 80 Days/page (2).png',
    'books/Around 80 Days/page (3).png',
    'books/Around 80 Days/page (4).png',
    'books/Around 80 Days/page (5).png',
    'books/Around 80 Days/page (6).png',
    'books/Around 80 Days/page (7).png',
    'books/Around 80 Days/page (8).png',
    'books/Around 80 Days/page (9).png',
    'books/Around 80 Days/page (10).png',
    'books/Around 80 Days/page (11).png',
    'books/Around 80 Days/page (12).png',
    'books/Around 80 Days/page (13).png',
    'books/Around 80 Days/page (14).png',
    'books/Around 80 Days/page (15).png',
    'books/Around 80 Days/page (16).png',
    'books/Around 80 Days/page (17).png',
    'books/Around 80 Days/page (18).png',
    'books/Around 80 Days/page (19).png',
    'books/Around 80 Days/page (20).png',
    'books/Around 80 Days/page (21).png',
    'books/Around 80 Days/page (22).png',
    'books/Around 80 Days/page (23).png',
    'books/Around 80 Days/page (24).png',
    'books/Around 80 Days/page (25).png',
    'books/Around 80 Days/page (26).png',
    'books/Around 80 Days/page (27).png',
    'books/Around 80 Days/page (28).png',
    'books/Around 80 Days/page (29).png',
    'books/Around 80 Days/page (30).png',
    'books/Around 80 Days/page (31).png',
    'books/Around 80 Days/page (32).png',
    'books/Around 80 Days/page (33).png',
    'books/Around 80 Days/page (34).png',
    'books/Around 80 Days/page (35).png',
    'books/Around 80 Days/page (36).png',
    'books/Around 80 Days/page (37).png',
    'books/Around 80 Days/page (38).png',
    'books/Around 80 Days/page (39).png',
    'books/Around 80 Days/page (40).png',
    'books/Around 80 Days/page (41).png',
    'books/Around 80 Days/page (42).png',
    'books/Around 80 Days/page (43).png',
    'books/Around 80 Days/page (44).png',
    'books/Around 80 Days/page (45).png',
    'books/Around 80 Days/page (46).png',
    'books/Around 80 Days/page (47).png',
    'books/Around 80 Days/page (48).png',
    'books/Around 80 Days/page (49).png',
    'books/Around 80 Days/page (50).png',
    'books/Around 80 Days/page (51).png',
    'books/Around 80 Days/page (52).png',
    'books/Around 80 Days/page (53).png',
    'books/Around 80 Days/page (54).png',
    'books/Around 80 Days/page (55).png',
    'books/Around 80 Days/page (56).png',
    'books/Around 80 Days/page (57).png',
    'books/Around 80 Days/page (58).png',
    'books/Around 80 Days/page (59).png',
    'books/Around 80 Days/page (60).png',
    'books/Around 80 Days/page (61).png',
    'books/Around 80 Days/page (62).png',
    'books/Around 80 Days/page (63).png',
    'books/Around 80 Days/page (64).png',
    'books/Around 80 Days/page (65).png',
    'books/Around 80 Days/page (66).png',
    'books/Around 80 Days/page (67).png',
    'books/Around 80 Days/page (68).png',
    'books/Around 80 Days/page (69).png',
    'books/Around 80 Days/page (70).png',
    'books/Around 80 Days/page (71).png',
    'books/Around 80 Days/page (72).png',
    'books/Around 80 Days/page (73).png',
    'books/Around 80 Days/page (74).png',
    'books/Around 80 Days/page (75).png',
    'books/Around 80 Days/page (76).png',
    'books/Around 80 Days/page (77).png',
    'books/Around 80 Days/page (78).png',
    'books/Around 80 Days/page (79).png',
    'books/Around 80 Days/page (80).png',
    'books/Around 80 Days/page (81).png',
    'books/Around 80 Days/page (82).png',
    'books/Around 80 Days/page (83).png',
    'books/Around 80 Days/page (84).png',
    'books/Around 80 Days/page (85).png',
    'books/Around 80 Days/page (86).png',
    'books/Around 80 Days/page (87).png',
    'books/Around 80 Days/page (88).png',
    'books/Around 80 Days/page (89).png',
    'books/Around 80 Days/page (90).png',
    'books/Around 80 Days/page (91).png',
    'books/Around 80 Days/page (92).png',
    'books/Around 80 Days/page (93).png',
    'books/Around 80 Days/page (94).png',
    'books/Around 80 Days/page (95).png',
    'books/Around 80 Days/page (96).png',
    'books/Around 80 Days/page (97).png',
    'books/Around 80 Days/page (98).png',
    'books/Around 80 Days/page (99).png',
    'books/Around 80 Days/page (100).png',
    'books/Around 80 Days/page (101).png',
    'books/Around 80 Days/page (102).png',
    'books/Around 80 Days/page (103).png',
    'books/Around 80 Days/page (104).png',
    'books/Around 80 Days/page (105).png',
    'books/Around 80 Days/page (106).png',
    'books/Around 80 Days/page (107).png',
    'books/Around 80 Days/page (108).png',
    'books/Around 80 Days/page (109).png',
    'books/Around 80 Days/page (110).png',
    'books/Around 80 Days/page (111).png',
    'books/Around 80 Days/page (112).png',
    'books/Around 80 Days/page (113).png',
    'books/Around 80 Days/page (114).png',
    'books/Around 80 Days/page (115).png',
    'books/Around 80 Days/page (116).png',
    'books/Around 80 Days/page (117).png',
    'books/Around 80 Days/page (118).png',
    'books/Around 80 Days/page (119).png',
    'books/Around 80 Days/page (120).png',
    'books/Around 80 Days/page (121).png',
    'books/Around 80 Days/page (122).png',
    'books/Around 80 Days/page (123).png',
    'books/Around 80 Days/page (124).png',
    'books/Around 80 Days/page (125).png',
    'books/Around 80 Days/page (126).png',
    'books/Around 80 Days/page (127).png',
    'books/Around 80 Days/page (128).png',
    'books/Around 80 Days/page (129).png',
    'books/Around 80 Days/page (130).png',
    'books/Around 80 Days/page (131).png',
    'books/Around 80 Days/page (132).png',
    'books/Around 80 Days/page (133).png',
    'books/Around 80 Days/page (134).png',
    'books/Around 80 Days/page (135).png',
    'books/Around 80 Days/page (136).png',
    'books/Around 80 Days/page (137).png',
    'books/Around 80 Days/page (138).png',
    'books/Around 80 Days/page (139).png',
    'books/Around 80 Days/page (140).png',
    'books/Around 80 Days/page (141).png',
    'books/Around 80 Days/page (142).png',
    'books/Around 80 Days/page (143).png',
    'books/Around 80 Days/page (144).png',
    'books/Around 80 Days/page (145).png',
    'books/Around 80 Days/page (146).png',
    'books/Around 80 Days/page (147).png',
    'books/Around 80 Days/page (148).png',
    'books/Around 80 Days/page (149).png',
    'books/Around 80 Days/page (150).png',
    'books/Around 80 Days/page (151).png',
    'books/Around 80 Days/page (152).png',
    'books/Around 80 Days/page (153).png',
    'books/Around 80 Days/page (154).png',
    'books/Around 80 Days/page (155).png',
    'books/Around 80 Days/page (156).png',
    'books/Around 80 Days/page (157).png',
    'books/Around 80 Days/page (158).png',
    'books/Around 80 Days/page (159).png',
    'books/Around 80 Days/page (160).png',
    'books/Around 80 Days/page (161).png',
    'books/Around 80 Days/page (162).png',
    'books/Around 80 Days/page (163).png',
    'books/Around 80 Days/page (164).png',
    'books/Around 80 Days/page (165).png',
    'books/Around 80 Days/page (166).png',
    'books/Around 80 Days/page (167).png',
    'books/Around 80 Days/page (168).png',
    'books/Around 80 Days/page (169).png',
    'books/Around 80 Days/page (170).png',
    'books/Around 80 Days/page (171).png',
    'books/Around 80 Days/page (172).png',
    'books/Around 80 Days/page (173).png',
    'books/Around 80 Days/page (174).png',
    'books/Around 80 Days/page (175).png',
    'books/Around 80 Days/page (176).png',
    'books/Around 80 Days/page (177).png',
    'books/Around 80 Days/page (178).png',
    'books/Around 80 Days/page (179).png',
    'books/Around 80 Days/page (180).png',
    'books/Around 80 Days/page (181).png',
    'books/Around 80 Days/page (182).png',
    'books/Around 80 Days/page (183).png',
    'books/Around 80 Days/page (184).png',
    'books/Around 80 Days/page (185).png',
    'books/Around 80 Days/page (186).png',
    'books/Around 80 Days/page (187).png',
    'books/Around 80 Days/page (188).png',
    'books/Around 80 Days/page (189).png',
    'books/Around 80 Days/page (190).png',
    'books/Around 80 Days/page (191).png',
    'books/Around 80 Days/page (192).png',
    'books/Around 80 Days/page (193).png',
    'books/Around 80 Days/page (194).png',
    'books/Around 80 Days/page (195).png',
    'books/Around 80 Days/page (196).png',
    'books/Around 80 Days/page (197).png',
    'books/Around 80 Days/page (198).png',
    'books/Around 80 Days/page (199).png',
    'books/Around 80 Days/page (200).png',
    'books/Around 80 Days/page (201).png',
    'books/Around 80 Days/page (202).png',
    'books/Around 80 Days/page (203).png',
    'books/Around 80 Days/page (204).png',
    'books/Around 80 Days/page (205).png',
    'books/Around 80 Days/page (206).png',
    'books/Around 80 Days/page (207).png',
    'books/Around 80 Days/page (208).png',
    'books/Around 80 Days/page (209).png',
    'books/Around 80 Days/page (210).png',
    'books/Around 80 Days/page (211).png',
    'books/Around 80 Days/page (212).png',
    'books/Around 80 Days/page (213).png',
    'books/Around 80 Days/page (214).png',
    'books/Around 80 Days/page (215).png',
    'books/Around 80 Days/page (216).png',
    'books/Around 80 Days/page (217).png',
    'books/Around 80 Days/page (218).png',
    'books/Around 80 Days/page (219).png',
    'books/Around 80 Days/page (220).png',
    'books/Around 80 Days/page (221).png',
    'books/Around 80 Days/page (222).png',
    'books/Around 80 Days/page (223).png',
    'books/Around 80 Days/page (224).png',
    'books/Around 80 Days/page (225).png',
    'books/Around 80 Days/page (226).png',
    'books/Around 80 Days/page (227).png',
    'books/Around 80 Days/page (228).png',
    'books/Around 80 Days/page (229).png',
    'books/Around 80 Days/page (230).png',
    'books/Around 80 Days/page (231).png',
    'books/Around 80 Days/page (232).png',
    'books/Around 80 Days/page (233).png',
    'books/Around 80 Days/page (234).png',
    'books/Around 80 Days/page (235).png',
    'books/Around 80 Days/page (236).png',
    'books/Around 80 Days/page (237).png',
    'books/Around 80 Days/page (238).png',
    'books/Around 80 Days/page (239).png',
    'books/Around 80 Days/page (240).png',
    'books/Around 80 Days/page (241).png',
    'books/Around 80 Days/page (242).png',
    'books/Around 80 Days/page (243).png',
    'books/Around 80 Days/page (244).png',
    'books/Around 80 Days/page (245).png',
    'books/Around 80 Days/page (246).png',
    'books/Around 80 Days/page (247).png',
    'books/Around 80 Days/page (248).png',
    'books/Around 80 Days/page (249).png',
    'books/Around 80 Days/page (250).png',
    'books/Around 80 Days/page (251).png',
    'books/Around 80 Days/page (252).png',
    'books/Around 80 Days/page (253).png',
    'books/Around 80 Days/page (254).png',
    'books/Around 80 Days/page (255).png',
    'books/Around 80 Days/page (256).png',
    'books/Around 80 Days/page (257).png',
    'books/Around 80 Days/page (258).png',
    'books/Around 80 Days/page (259).png',
    'books/Around 80 Days/page (260).png',
    'books/Around 80 Days/page (261).png',
    'books/Around 80 Days/page (262).png',
    'books/Around 80 Days/page (263).png',
    'books/Around 80 Days/page (264).png',
    'books/Around 80 Days/page (265).png',
    'books/Around 80 Days/page (266).png',
    'books/Around 80 Days/page (267).png',
    'books/Around 80 Days/page (268).png',
    'books/Around 80 Days/page (269).png',
    'books/Around 80 Days/page (270).png',
    'books/Around 80 Days/page (271).png',
    'books/Around 80 Days/page (272).png',
    'books/Around 80 Days/page (273).png',
    'books/Around 80 Days/page (274).png',
    'books/Around 80 Days/page (275).png',
    'books/Around 80 Days/page (276).png',
    'books/Around 80 Days/page (277).png',
    'books/Around 80 Days/page (278).png',
    'books/Around 80 Days/page (279).png',
    'books/Around 80 Days/page (280).png',
    'books/Around 80 Days/page (281).png',
    'books/Around 80 Days/page (282).png',
    'books/Around 80 Days/page (283).png',
    'books/Around 80 Days/page (284).png',
    'books/Around 80 Days/page (285).png',
    'books/Around 80 Days/page (286).png',
    'books/Around 80 Days/page (287).png',
    'books/Around 80 Days/page (288).png',
    'books/Around 80 Days/page (289).png',
    'books/Around 80 Days/page (290).png',
    'books/Around 80 Days/page (291).png',
    'books/Around 80 Days/page (292).png',
    'books/Around 80 Days/page (293).png',
    'books/Around 80 Days/page (294).png',
    'books/Around 80 Days/page (295).png',
    'books/Around 80 Days/page (296).png',
    'books/Around 80 Days/page (297).png',
    'books/Around 80 Days/page (298).png',
    'books/Around 80 Days/page (299).png',
    'books/Around 80 Days/page (300).png',
    'books/Around 80 Days/page (301).png',
    'books/Around 80 Days/page (302).png',
    'books/Around 80 Days/page (303).png',
    'books/Around 80 Days/page (304).png',
    'books/Around 80 Days/page (305).png',
    'books/Around 80 Days/page (306).png',
    'books/Around 80 Days/page (307).png',
    'books/Around 80 Days/page (308).png',
    'books/Around 80 Days/page (309).png',
    'books/Around 80 Days/page (310).png',
    'books/Around 80 Days/page (311).png',
    'books/Around 80 Days/page (312).png',
    'books/Around 80 Days/page (313).png',
    'books/Around 80 Days/page (314).png',
    'books/Around 80 Days/page (315).png',
    'books/Around 80 Days/page (316).png',
    'books/Around 80 Days/page (317).png',
    'books/Around 80 Days/page (318).png',
    'books/Around 80 Days/page (319).png',
    'books/Around 80 Days/page (320).png',
    'books/Around 80 Days/page (321).png',
    'books/Around 80 Days/page (322).png',
    'books/Around 80 Days/page (323).png',
    'books/Around 80 Days/page (324).png',
    'books/Around 80 Days/page (325).png',
    'books/Around 80 Days/page (326).png',
    'books/Around 80 Days/page (327).png',
    'books/Around 80 Days/page (328).png',
    'books/Around 80 Days/page (329).png',
    'books/Around 80 Days/page (330).png',
    'books/Around 80 Days/page (331).png',
    'books/Around 80 Days/page (332).png',
    'books/Around 80 Days/page (333).png',
    'books/Around 80 Days/page (334).png',
    'books/Around 80 Days/page (335).png',
    'books/Around 80 Days/page (336).png',
    'books/Around 80 Days/page (337).png',
    'books/Around 80 Days/page (338).png',
    'books/Around 80 Days/page (339).png',
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
