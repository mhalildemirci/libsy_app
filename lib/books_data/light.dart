import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class light extends StatefulWidget {
  const light({Key? key}) : super(key: key);

  @override
  State<light> createState() => _lightState();
}

class _lightState extends State<light> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/light/page (1).png',
    'books/light/page (2).png',
    'books/light/page (3).png',
    'books/light/page (4).png',
    'books/light/page (5).png',
    'books/light/page (6).png',
    'books/light/page (7).png',
    'books/light/page (8).png',
    'books/light/page (9).png',
    'books/light/page (10).png',
    'books/light/page (11).png',
    'books/light/page (12).png',
    'books/light/page (13).png',
    'books/light/page (14).png',
    'books/light/page (15).png',
    'books/light/page (16).png',
    'books/light/page (17).png',
    'books/light/page (18).png',
    'books/light/page (19).png',
    'books/light/page (20).png',
    'books/light/page (21).png',
    'books/light/page (22).png',
    'books/light/page (23).png',
    'books/light/page (24).png',
    'books/light/page (25).png',
    'books/light/page (26).png',
    'books/light/page (27).png',
    'books/light/page (28).png',
    'books/light/page (29).png',
    'books/light/page (30).png',
    'books/light/page (31).png',
    'books/light/page (32).png',
    'books/light/page (33).png',
    'books/light/page (34).png',
    'books/light/page (35).png',
    'books/light/page (36).png',
    'books/light/page (37).png',
    'books/light/page (38).png',
    'books/light/page (39).png',
    'books/light/page (40).png',
    'books/light/page (41).png',
    'books/light/page (42).png',
    'books/light/page (43).png',
    'books/light/page (44).png',
    'books/light/page (45).png',
    'books/light/page (46).png',
    'books/light/page (47).png',
    'books/light/page (48).png',
    'books/light/page (49).png',
    'books/light/page (50).png',
    'books/light/page (51).png',
    'books/light/page (52).png',
    'books/light/page (53).png',
    'books/light/page (54).png',
    'books/light/page (55).png',
    'books/light/page (56).png',
    'books/light/page (57).png',
    'books/light/page (58).png',
    'books/light/page (59).png',
    'books/light/page (60).png',
    'books/light/page (61).png',
    'books/light/page (62).png',
    'books/light/page (63).png',
    'books/light/page (64).png',
    'books/light/page (65).png',
    'books/light/page (66).png',
    'books/light/page (67).png',
    'books/light/page (68).png',
    'books/light/page (69).png',
    'books/light/page (70).png',
    'books/light/page (71).png',
    'books/light/page (72).png',
    'books/light/page (73).png',
    'books/light/page (74).png',
    'books/light/page (75).png',
    'books/light/page (76).png',
    'books/light/page (77).png',
    'books/light/page (78).png',
    'books/light/page (79).png',
    'books/light/page (80).png',
    'books/light/page (81).png',
    'books/light/page (82).png',
    'books/light/page (83).png',
    'books/light/page (84).png',
    'books/light/page (85).png',
    'books/light/page (86).png',
    'books/light/page (87).png',
    'books/light/page (88).png',
    'books/light/page (89).png',
    'books/light/page (90).png',
    'books/light/page (91).png',
    'books/light/page (92).png',
    'books/light/page (93).png',
    'books/light/page (94).png',
    'books/light/page (95).png',
    'books/light/page (96).png',
    'books/light/page (97).png',
    'books/light/page (98).png',
    'books/light/page (99).png',
    'books/light/page (100).png',
    'books/light/page (101).png',
    'books/light/page (102).png',
    'books/light/page (103).png',
    'books/light/page (104).png',
    'books/light/page (105).png',
    'books/light/page (106).png',
    'books/light/page (107).png',
    'books/light/page (108).png',
    'books/light/page (109).png',
    'books/light/page (110).png',
    'books/light/page (111).png',
    'books/light/page (112).png',
    'books/light/page (113).png',
    'books/light/page (114).png',
    'books/light/page (115).png',
    'books/light/page (116).png',
    'books/light/page (117).png',
    'books/light/page (118).png',
    'books/light/page (119).png',
    'books/light/page (120).png',
    'books/light/page (121).png',
    'books/light/page (122).png',
    'books/light/page (123).png',
    'books/light/page (124).png',
    'books/light/page (125).png',
    'books/light/page (126).png',
    'books/light/page (127).png',
    'books/light/page (128).png',
    'books/light/page (129).png',
    'books/light/page (130).png',
    'books/light/page (131).png',
    'books/light/page (132).png',
    'books/light/page (133).png',
    'books/light/page (134).png',
    'books/light/page (135).png',
    'books/light/page (136).png',
    'books/light/page (137).png',
    'books/light/page (138).png',
    'books/light/page (139).png',
    'books/light/page (140).png',
    'books/light/page (141).png',
    'books/light/page (142).png',
    'books/light/page (143).png',
    'books/light/page (144).png',
    'books/light/page (145).png',
    'books/light/page (146).png',
    'books/light/page (147).png',
    'books/light/page (148).png',
    'books/light/page (149).png',
    'books/light/page (150).png',
    'books/light/page (151).png',
    'books/light/page (152).png',
    'books/light/page (153).png',
    'books/light/page (154).png',
    'books/light/page (155).png',
    'books/light/page (156).png',
    'books/light/page (157).png',
    'books/light/page (158).png',
    'books/light/page (159).png',
    'books/light/page (160).png',
    'books/light/page (161).png',
    'books/light/page (162).png',
    'books/light/page (163).png',
    'books/light/page (164).png',
    'books/light/page (165).png',
    'books/light/page (166).png',
    'books/light/page (167).png',
    'books/light/page (168).png',
    'books/light/page (169).png',
    'books/light/page (170).png',
    'books/light/page (171).png',
    'books/light/page (172).png',
    'books/light/page (173).png',
    'books/light/page (174).png',
    'books/light/page (175).png',
    'books/light/page (176).png',
    'books/light/page (177).png',
    'books/light/page (178).png',
    'books/light/page (179).png',
    'books/light/page (180).png',
    'books/light/page (181).png',
    'books/light/page (182).png',
    'books/light/page (183).png',
    'books/light/page (184).png',
    'books/light/page (185).png',
    'books/light/page (186).png',
    'books/light/page (187).png',
    'books/light/page (188).png',
    'books/light/page (189).png',
    'books/light/page (190).png',
    'books/light/page (191).png',
    'books/light/page (192).png',
    'books/light/page (193).png',
    'books/light/page (194).png',
    'books/light/page (195).png',
    'books/light/page (196).png',
    'books/light/page (197).png',
    'books/light/page (198).png',
    'books/light/page (199).png',
    'books/light/page (200).png',
    'books/light/page (201).png',
    'books/light/page (202).png',
    'books/light/page (203).png',
    'books/light/page (204).png',
    'books/light/page (205).png',
    'books/light/page (206).png',
    'books/light/page (207).png',
    'books/light/page (208).png',
    'books/light/page (209).png',
    'books/light/page (210).png',
    'books/light/page (211).png',
    'books/light/page (212).png',
    'books/light/page (213).png',
    'books/light/page (214).png',
    'books/light/page (215).png',
    'books/light/page (216).png',
    'books/light/page (217).png',
    'books/light/page (218).png',
    'books/light/page (219).png',
    'books/light/page (220).png',
    'books/light/page (221).png',
    'books/light/page (222).png',
    'books/light/page (223).png',
    'books/light/page (224).png',
    'books/light/page (225).png',
    'books/light/page (226).png',
    'books/light/page (227).png',
    'books/light/page (228).png',
    'books/light/page (229).png',
    'books/light/page (230).png',
    'books/light/page (231).png',
    'books/light/page (232).png',
    'books/light/page (233).png',
    'books/light/page (234).png',
    'books/light/page (235).png',
    'books/light/page (236).png',
    'books/light/page (237).png',
    'books/light/page (238).png',
    'books/light/page (239).png',
    'books/light/page (240).png',
    'books/light/page (241).png',
    'books/light/page (242).png',
    'books/light/page (243).png',
    'books/light/page (244).png',
    'books/light/page (245).png',
    'books/light/page (246).png',
    'books/light/page (247).png',
    'books/light/page (248).png',
    'books/light/page (249).png',
    'books/light/page (250).png',
    'books/light/page (251).png',
    'books/light/page (252).png',
    'books/light/page (253).png',
    'books/light/page (254).png',
    'books/light/page (255).png',
    'books/light/page (256).png',
    'books/light/page (257).png',
    'books/light/page (258).png',
    'books/light/page (259).png',
    'books/light/page (260).png',
    'books/light/page (261).png',
    'books/light/page (262).png',
    'books/light/page (263).png',
    'books/light/page (264).png',
    'books/light/page (265).png',
    'books/light/page (266).png',
    'books/light/page (267).png',
    'books/light/page (268).png',
    'books/light/page (269).png',
    'books/light/page (270).png',
    'books/light/page (271).png',
    'books/light/page (272).png',
    'books/light/page (273).png',
    'books/light/page (274).png',
    'books/light/page (275).png',
    'books/light/page (276).png',
    'books/light/page (277).png',
    'books/light/page (278).png',
    'books/light/page (279).png',
    'books/light/page (280).png',
    'books/light/page (281).png',
    'books/light/page (282).png',
    'books/light/page (283).png',
    'books/light/page (284).png',
    'books/light/page (285).png',
    'books/light/page (286).png',
    'books/light/page (287).png',
    'books/light/page (288).png',
    'books/light/page (289).png',
    'books/light/page (290).png',
    'books/light/page (291).png',
    'books/light/page (292).png',
    'books/light/page (293).png',
    'books/light/page (294).png',
    'books/light/page (295).png',
    'books/light/page (296).png',
    'books/light/page (297).png',
    'books/light/page (298).png',
    'books/light/page (299).png',
    'books/light/page (300).png',
    'books/light/page (301).png',
    'books/light/page (302).png',
    'books/light/page (303).png',
    'books/light/page (304).png',
    'books/light/page (305).png',
    'books/light/page (306).png',
    'books/light/page (307).png',
    'books/light/page (308).png',
    'books/light/page (309).png',
    'books/light/page (310).png',
    'books/light/page (311).png',
    'books/light/page (312).png',
    'books/light/page (313).png',
    'books/light/page (314).png',
    'books/light/page (315).png',
    'books/light/page (316).png',
    'books/light/page (317).png',
    'books/light/page (318).png',
    'books/light/page (319).png',
    'books/light/page (320).png',
    'books/light/page (321).png',
    'books/light/page (322).png',
    'books/light/page (323).png',

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
