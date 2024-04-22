import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bugununsaraylisi extends StatefulWidget {
  const bugununsaraylisi({Key? key}) : super(key: key);

  @override
  State<bugununsaraylisi> createState() => _bugununsaraylisiState();
}

class _bugununsaraylisiState extends State<bugununsaraylisi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bugununsaraylisi/page (1).png',
    'books/bugununsaraylisi/page (2).png',
    'books/bugununsaraylisi/page (3).png',
    'books/bugununsaraylisi/page (4).png',
    'books/bugununsaraylisi/page (5).png',
    'books/bugununsaraylisi/page (6).png',
    'books/bugununsaraylisi/page (7).png',
    'books/bugununsaraylisi/page (8).png',
    'books/bugununsaraylisi/page (9).png',
    'books/bugununsaraylisi/page (10).png',
    'books/bugununsaraylisi/page (11).png',
    'books/bugununsaraylisi/page (12).png',
    'books/bugununsaraylisi/page (13).png',
    'books/bugununsaraylisi/page (14).png',
    'books/bugununsaraylisi/page (15).png',
    'books/bugununsaraylisi/page (16).png',
    'books/bugununsaraylisi/page (17).png',
    'books/bugununsaraylisi/page (18).png',
    'books/bugununsaraylisi/page (19).png',
    'books/bugununsaraylisi/page (20).png',
    'books/bugununsaraylisi/page (21).png',
    'books/bugununsaraylisi/page (22).png',
    'books/bugununsaraylisi/page (23).png',
    'books/bugununsaraylisi/page (24).png',
    'books/bugununsaraylisi/page (25).png',
    'books/bugununsaraylisi/page (26).png',
    'books/bugununsaraylisi/page (27).png',
    'books/bugununsaraylisi/page (28).png',
    'books/bugununsaraylisi/page (29).png',
    'books/bugununsaraylisi/page (30).png',
    'books/bugununsaraylisi/page (31).png',
    'books/bugununsaraylisi/page (32).png',
    'books/bugununsaraylisi/page (33).png',
    'books/bugununsaraylisi/page (34).png',
    'books/bugununsaraylisi/page (35).png',
    'books/bugununsaraylisi/page (36).png',
    'books/bugununsaraylisi/page (37).png',
    'books/bugununsaraylisi/page (38).png',
    'books/bugununsaraylisi/page (39).png',
    'books/bugununsaraylisi/page (40).png',
    'books/bugununsaraylisi/page (41).png',
    'books/bugununsaraylisi/page (42).png',
    'books/bugununsaraylisi/page (43).png',
    'books/bugununsaraylisi/page (44).png',
    'books/bugununsaraylisi/page (45).png',
    'books/bugununsaraylisi/page (46).png',
    'books/bugununsaraylisi/page (47).png',
    'books/bugununsaraylisi/page (48).png',
    'books/bugununsaraylisi/page (49).png',
    'books/bugununsaraylisi/page (50).png',
    'books/bugununsaraylisi/page (51).png',
    'books/bugununsaraylisi/page (52).png',
    'books/bugununsaraylisi/page (53).png',
    'books/bugununsaraylisi/page (54).png',
    'books/bugununsaraylisi/page (55).png',
    'books/bugununsaraylisi/page (56).png',
    'books/bugununsaraylisi/page (57).png',
    'books/bugununsaraylisi/page (58).png',
    'books/bugununsaraylisi/page (59).png',
    'books/bugununsaraylisi/page (60).png',
    'books/bugununsaraylisi/page (61).png',
    'books/bugununsaraylisi/page (62).png',
    'books/bugununsaraylisi/page (63).png',
    'books/bugununsaraylisi/page (64).png',
    'books/bugununsaraylisi/page (65).png',
    'books/bugununsaraylisi/page (66).png',
    'books/bugununsaraylisi/page (67).png',
    'books/bugununsaraylisi/page (68).png',
    'books/bugununsaraylisi/page (69).png',
    'books/bugununsaraylisi/page (70).png',
    'books/bugununsaraylisi/page (71).png',
    'books/bugununsaraylisi/page (72).png',
    'books/bugununsaraylisi/page (73).png',
    'books/bugununsaraylisi/page (74).png',
    'books/bugununsaraylisi/page (75).png',
    'books/bugununsaraylisi/page (76).png',
    'books/bugununsaraylisi/page (77).png',
    'books/bugununsaraylisi/page (78).png',
    'books/bugununsaraylisi/page (79).png',
    'books/bugununsaraylisi/page (80).png',
    'books/bugununsaraylisi/page (81).png',
    'books/bugununsaraylisi/page (82).png',
    'books/bugununsaraylisi/page (83).png',
    'books/bugununsaraylisi/page (84).png',
    'books/bugununsaraylisi/page (85).png',
    'books/bugununsaraylisi/page (86).png',
    'books/bugununsaraylisi/page (87).png',
    'books/bugununsaraylisi/page (88).png',
    'books/bugununsaraylisi/page (89).png',
    'books/bugununsaraylisi/page (90).png',
    'books/bugununsaraylisi/page (91).png',
    'books/bugununsaraylisi/page (92).png',
    'books/bugununsaraylisi/page (93).png',
    'books/bugununsaraylisi/page (94).png',
    'books/bugununsaraylisi/page (95).png',
    'books/bugununsaraylisi/page (96).png',
    'books/bugununsaraylisi/page (97).png',
    'books/bugununsaraylisi/page (98).png',
    'books/bugununsaraylisi/page (99).png',
    'books/bugununsaraylisi/page (100).png',
    'books/bugununsaraylisi/page (101).png',
    'books/bugununsaraylisi/page (102).png',
    'books/bugununsaraylisi/page (103).png',
    'books/bugununsaraylisi/page (104).png',
    'books/bugununsaraylisi/page (105).png',
    'books/bugununsaraylisi/page (106).png',
    'books/bugununsaraylisi/page (107).png',
    'books/bugununsaraylisi/page (108).png',
    'books/bugununsaraylisi/page (109).png',
    'books/bugununsaraylisi/page (110).png',
    'books/bugununsaraylisi/page (111).png',
    'books/bugununsaraylisi/page (112).png',
    'books/bugununsaraylisi/page (113).png',
    'books/bugununsaraylisi/page (114).png',
    'books/bugununsaraylisi/page (115).png',
    'books/bugununsaraylisi/page (116).png',
    'books/bugununsaraylisi/page (117).png',
    'books/bugununsaraylisi/page (118).png',
    'books/bugununsaraylisi/page (119).png',
    'books/bugununsaraylisi/page (120).png',
    'books/bugununsaraylisi/page (121).png',
    'books/bugununsaraylisi/page (122).png',
    'books/bugununsaraylisi/page (123).png',
    'books/bugununsaraylisi/page (124).png',
    'books/bugununsaraylisi/page (125).png',
    'books/bugununsaraylisi/page (126).png',
    'books/bugununsaraylisi/page (127).png',
    'books/bugununsaraylisi/page (128).png',
    'books/bugununsaraylisi/page (129).png',
    'books/bugununsaraylisi/page (130).png',
    'books/bugununsaraylisi/page (131).png',
    'books/bugununsaraylisi/page (132).png',
    'books/bugununsaraylisi/page (133).png',
    'books/bugununsaraylisi/page (134).png',
    'books/bugununsaraylisi/page (135).png',
    'books/bugununsaraylisi/page (136).png',
    'books/bugununsaraylisi/page (137).png',
    'books/bugununsaraylisi/page (138).png',
    'books/bugununsaraylisi/page (139).png',
    'books/bugununsaraylisi/page (140).png',
    'books/bugununsaraylisi/page (141).png',
    'books/bugununsaraylisi/page (142).png',
    'books/bugununsaraylisi/page (143).png',
    'books/bugununsaraylisi/page (144).png',
    'books/bugununsaraylisi/page (145).png',
    'books/bugununsaraylisi/page (146).png',
    'books/bugununsaraylisi/page (147).png',
    'books/bugununsaraylisi/page (148).png',
    'books/bugununsaraylisi/page (149).png',
    'books/bugununsaraylisi/page (150).png',
    'books/bugununsaraylisi/page (151).png',
    'books/bugununsaraylisi/page (152).png',
    'books/bugununsaraylisi/page (153).png',
    'books/bugununsaraylisi/page (154).png',
    'books/bugununsaraylisi/page (155).png',
    'books/bugununsaraylisi/page (156).png',
    'books/bugununsaraylisi/page (157).png',
    'books/bugununsaraylisi/page (158).png',
    'books/bugununsaraylisi/page (159).png',
    'books/bugununsaraylisi/page (160).png',
    'books/bugununsaraylisi/page (161).png',
    'books/bugununsaraylisi/page (162).png',
    'books/bugununsaraylisi/page (163).png',
    'books/bugununsaraylisi/page (164).png',
    'books/bugununsaraylisi/page (165).png',
    'books/bugununsaraylisi/page (166).png',
    'books/bugununsaraylisi/page (167).png',
    'books/bugununsaraylisi/page (168).png',
    'books/bugununsaraylisi/page (169).png',
    'books/bugununsaraylisi/page (170).png',
    'books/bugununsaraylisi/page (171).png',
    'books/bugununsaraylisi/page (172).png',
    'books/bugununsaraylisi/page (173).png',
    'books/bugununsaraylisi/page (174).png',
    'books/bugununsaraylisi/page (175).png',
    'books/bugununsaraylisi/page (176).png',
    'books/bugununsaraylisi/page (177).png',
    'books/bugununsaraylisi/page (178).png',
    'books/bugununsaraylisi/page (179).png',
    'books/bugununsaraylisi/page (180).png',
    'books/bugununsaraylisi/page (181).png',
    'books/bugununsaraylisi/page (182).png',
    'books/bugununsaraylisi/page (183).png',
    'books/bugununsaraylisi/page (184).png',
    'books/bugununsaraylisi/page (185).png',
    'books/bugununsaraylisi/page (186).png',
    'books/bugununsaraylisi/page (187).png',
    'books/bugununsaraylisi/page (188).png',
    'books/bugununsaraylisi/page (189).png',
    'books/bugununsaraylisi/page (190).png',
    'books/bugununsaraylisi/page (191).png',
    'books/bugununsaraylisi/page (192).png',
    'books/bugununsaraylisi/page (193).png',
    'books/bugununsaraylisi/page (194).png',
    'books/bugununsaraylisi/page (195).png',
    'books/bugununsaraylisi/page (196).png',
    'books/bugununsaraylisi/page (197).png',
    'books/bugununsaraylisi/page (198).png',
    'books/bugununsaraylisi/page (199).png',
    'books/bugununsaraylisi/page (200).png',
    'books/bugununsaraylisi/page (201).png',
    'books/bugununsaraylisi/page (202).png',
    'books/bugununsaraylisi/page (203).png',
    'books/bugununsaraylisi/page (204).png',
    'books/bugununsaraylisi/page (205).png',
    'books/bugununsaraylisi/page (206).png',
    'books/bugununsaraylisi/page (207).png',
    'books/bugununsaraylisi/page (208).png',
    'books/bugununsaraylisi/page (209).png',
    'books/bugununsaraylisi/page (210).png',
    'books/bugununsaraylisi/page (211).png',
    'books/bugununsaraylisi/page (212).png',
    'books/bugununsaraylisi/page (213).png',
    'books/bugununsaraylisi/page (214).png',
    'books/bugununsaraylisi/page (215).png',
    'books/bugununsaraylisi/page (216).png',
    'books/bugununsaraylisi/page (217).png',
    'books/bugununsaraylisi/page (218).png',
    'books/bugununsaraylisi/page (219).png',
    'books/bugununsaraylisi/page (220).png',
    'books/bugununsaraylisi/page (221).png',
    'books/bugununsaraylisi/page (222).png',
    'books/bugununsaraylisi/page (223).png',
    'books/bugununsaraylisi/page (224).png',
    'books/bugununsaraylisi/page (225).png',
    'books/bugununsaraylisi/page (226).png',
    'books/bugununsaraylisi/page (227).png',
    'books/bugununsaraylisi/page (228).png',
    'books/bugununsaraylisi/page (229).png',
    'books/bugununsaraylisi/page (230).png',
    'books/bugununsaraylisi/page (231).png',
    'books/bugununsaraylisi/page (232).png',
    'books/bugununsaraylisi/page (233).png',
    'books/bugununsaraylisi/page (234).png',
    'books/bugununsaraylisi/page (235).png',
    'books/bugununsaraylisi/page (236).png',
    'books/bugununsaraylisi/page (237).png',
    'books/bugununsaraylisi/page (238).png',
    'books/bugununsaraylisi/page (239).png',
    'books/bugununsaraylisi/page (240).png',
    'books/bugununsaraylisi/page (241).png',
    'books/bugununsaraylisi/page (242).png',
    'books/bugununsaraylisi/page (243).png',
    'books/bugununsaraylisi/page (244).png',
    'books/bugununsaraylisi/page (245).png',
    'books/bugununsaraylisi/page (246).png',
    'books/bugununsaraylisi/page (247).png',
    'books/bugununsaraylisi/page (248).png',
    'books/bugununsaraylisi/page (249).png',
    'books/bugununsaraylisi/page (250).png',
    'books/bugununsaraylisi/page (251).png',
    'books/bugununsaraylisi/page (252).png',
    'books/bugununsaraylisi/page (253).png',
    'books/bugununsaraylisi/page (254).png',
    'books/bugununsaraylisi/page (255).png',
    'books/bugununsaraylisi/page (256).png',
    'books/bugununsaraylisi/page (257).png',
    'books/bugununsaraylisi/page (258).png',
    'books/bugununsaraylisi/page (259).png',
    'books/bugununsaraylisi/page (260).png',
    'books/bugununsaraylisi/page (261).png',
    'books/bugununsaraylisi/page (262).png',
    'books/bugununsaraylisi/page (263).png',
    'books/bugununsaraylisi/page (264).png',
    'books/bugununsaraylisi/page (265).png',
    'books/bugununsaraylisi/page (266).png',
    'books/bugununsaraylisi/page (267).png',
    'books/bugununsaraylisi/page (268).png',
    'books/bugununsaraylisi/page (269).png',
    'books/bugununsaraylisi/page (270).png',
    'books/bugununsaraylisi/page (271).png',
    'books/bugununsaraylisi/page (272).png',
    'books/bugununsaraylisi/page (273).png',
    'books/bugununsaraylisi/page (274).png',
    'books/bugununsaraylisi/page (275).png',
    'books/bugununsaraylisi/page (276).png',
    'books/bugununsaraylisi/page (277).png',
    'books/bugununsaraylisi/page (278).png',
    'books/bugununsaraylisi/page (279).png',
    'books/bugununsaraylisi/page (280).png',
    'books/bugununsaraylisi/page (281).png',
    'books/bugununsaraylisi/page (282).png',
    'books/bugununsaraylisi/page (283).png',
    'books/bugununsaraylisi/page (284).png',
    'books/bugununsaraylisi/page (285).png',
    'books/bugununsaraylisi/page (286).png',
    'books/bugununsaraylisi/page (287).png',
    'books/bugununsaraylisi/page (288).png',
    'books/bugununsaraylisi/page (289).png',
    'books/bugununsaraylisi/page (290).png',
    'books/bugununsaraylisi/page (291).png',
    'books/bugununsaraylisi/page (292).png',
    'books/bugununsaraylisi/page (293).png',
    'books/bugununsaraylisi/page (294).png',
    'books/bugununsaraylisi/page (295).png',
    'books/bugununsaraylisi/page (296).png',
    'books/bugununsaraylisi/page (297).png',
    'books/bugununsaraylisi/page (298).png',
    'books/bugununsaraylisi/page (299).png',
    'books/bugununsaraylisi/page (300).png',
    'books/bugununsaraylisi/page (301).png',
    'books/bugununsaraylisi/page (302).png',
    'books/bugununsaraylisi/page (303).png',
    'books/bugununsaraylisi/page (304).png',
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
