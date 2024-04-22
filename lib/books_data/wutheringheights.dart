import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wutheringheights extends StatefulWidget {
  const wutheringheights({Key? key}) : super(key: key);

  @override
  State<wutheringheights> createState() => _wutheringheightsState();
}

class _wutheringheightsState extends State<wutheringheights> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/wuthering heights/page (1).png',
    'books/wuthering heights/page (2).png',
    'books/wuthering heights/page (3).png',
    'books/wuthering heights/page (4).png',
    'books/wuthering heights/page (5).png',
    'books/wuthering heights/page (6).png',
    'books/wuthering heights/page (7).png',
    'books/wuthering heights/page (8).png',
    'books/wuthering heights/page (9).png',
    'books/wuthering heights/page (10).png',
    'books/wuthering heights/page (11).png',
    'books/wuthering heights/page (12).png',
    'books/wuthering heights/page (13).png',
    'books/wuthering heights/page (14).png',
    'books/wuthering heights/page (15).png',
    'books/wuthering heights/page (16).png',
    'books/wuthering heights/page (17).png',
    'books/wuthering heights/page (18).png',
    'books/wuthering heights/page (19).png',
    'books/wuthering heights/page (20).png',
    'books/wuthering heights/page (21).png',
    'books/wuthering heights/page (22).png',
    'books/wuthering heights/page (23).png',
    'books/wuthering heights/page (24).png',
    'books/wuthering heights/page (25).png',
    'books/wuthering heights/page (26).png',
    'books/wuthering heights/page (27).png',
    'books/wuthering heights/page (28).png',
    'books/wuthering heights/page (29).png',
    'books/wuthering heights/page (30).png',
    'books/wuthering heights/page (31).png',
    'books/wuthering heights/page (32).png',
    'books/wuthering heights/page (33).png',
    'books/wuthering heights/page (34).png',
    'books/wuthering heights/page (35).png',
    'books/wuthering heights/page (36).png',
    'books/wuthering heights/page (37).png',
    'books/wuthering heights/page (38).png',
    'books/wuthering heights/page (39).png',
    'books/wuthering heights/page (40).png',
    'books/wuthering heights/page (41).png',
    'books/wuthering heights/page (42).png',
    'books/wuthering heights/page (43).png',
    'books/wuthering heights/page (44).png',
    'books/wuthering heights/page (45).png',
    'books/wuthering heights/page (46).png',
    'books/wuthering heights/page (47).png',
    'books/wuthering heights/page (48).png',
    'books/wuthering heights/page (49).png',
    'books/wuthering heights/page (50).png',
    'books/wuthering heights/page (51).png',
    'books/wuthering heights/page (52).png',
    'books/wuthering heights/page (53).png',
    'books/wuthering heights/page (54).png',
    'books/wuthering heights/page (55).png',
    'books/wuthering heights/page (56).png',
    'books/wuthering heights/page (57).png',
    'books/wuthering heights/page (58).png',
    'books/wuthering heights/page (59).png',
    'books/wuthering heights/page (60).png',
    'books/wuthering heights/page (61).png',
    'books/wuthering heights/page (62).png',
    'books/wuthering heights/page (63).png',
    'books/wuthering heights/page (64).png',
    'books/wuthering heights/page (65).png',
    'books/wuthering heights/page (66).png',
    'books/wuthering heights/page (67).png',
    'books/wuthering heights/page (68).png',
    'books/wuthering heights/page (69).png',
    'books/wuthering heights/page (70).png',
    'books/wuthering heights/page (71).png',
    'books/wuthering heights/page (72).png',
    'books/wuthering heights/page (73).png',
    'books/wuthering heights/page (74).png',
    'books/wuthering heights/page (75).png',
    'books/wuthering heights/page (76).png',
    'books/wuthering heights/page (77).png',
    'books/wuthering heights/page (78).png',
    'books/wuthering heights/page (79).png',
    'books/wuthering heights/page (80).png',
    'books/wuthering heights/page (81).png',
    'books/wuthering heights/page (82).png',
    'books/wuthering heights/page (83).png',
    'books/wuthering heights/page (84).png',
    'books/wuthering heights/page (85).png',
    'books/wuthering heights/page (86).png',
    'books/wuthering heights/page (87).png',
    'books/wuthering heights/page (88).png',
    'books/wuthering heights/page (89).png',
    'books/wuthering heights/page (90).png',
    'books/wuthering heights/page (91).png',
    'books/wuthering heights/page (92).png',
    'books/wuthering heights/page (93).png',
    'books/wuthering heights/page (94).png',
    'books/wuthering heights/page (95).png',
    'books/wuthering heights/page (96).png',
    'books/wuthering heights/page (97).png',
    'books/wuthering heights/page (98).png',
    'books/wuthering heights/page (99).png',
    'books/wuthering heights/page (100).png',
    'books/wuthering heights/page (101).png',
    'books/wuthering heights/page (102).png',
    'books/wuthering heights/page (103).png',
    'books/wuthering heights/page (104).png',
    'books/wuthering heights/page (105).png',
    'books/wuthering heights/page (106).png',
    'books/wuthering heights/page (107).png',
    'books/wuthering heights/page (108).png',
    'books/wuthering heights/page (109).png',
    'books/wuthering heights/page (110).png',
    'books/wuthering heights/page (111).png',
    'books/wuthering heights/page (112).png',
    'books/wuthering heights/page (113).png',
    'books/wuthering heights/page (114).png',
    'books/wuthering heights/page (115).png',
    'books/wuthering heights/page (116).png',
    'books/wuthering heights/page (117).png',
    'books/wuthering heights/page (118).png',
    'books/wuthering heights/page (119).png',
    'books/wuthering heights/page (120).png',
    'books/wuthering heights/page (121).png',
    'books/wuthering heights/page (122).png',
    'books/wuthering heights/page (123).png',
    'books/wuthering heights/page (124).png',
    'books/wuthering heights/page (125).png',
    'books/wuthering heights/page (126).png',
    'books/wuthering heights/page (127).png',
    'books/wuthering heights/page (128).png',
    'books/wuthering heights/page (129).png',
    'books/wuthering heights/page (130).png',
    'books/wuthering heights/page (131).png',
    'books/wuthering heights/page (132).png',
    'books/wuthering heights/page (133).png',
    'books/wuthering heights/page (134).png',
    'books/wuthering heights/page (135).png',
    'books/wuthering heights/page (136).png',
    'books/wuthering heights/page (137).png',
    'books/wuthering heights/page (138).png',
    'books/wuthering heights/page (139).png',
    'books/wuthering heights/page (140).png',
    'books/wuthering heights/page (141).png',
    'books/wuthering heights/page (142).png',
    'books/wuthering heights/page (143).png',
    'books/wuthering heights/page (144).png',
    'books/wuthering heights/page (145).png',
    'books/wuthering heights/page (146).png',
    'books/wuthering heights/page (147).png',
    'books/wuthering heights/page (148).png',
    'books/wuthering heights/page (149).png',
    'books/wuthering heights/page (150).png',
    'books/wuthering heights/page (151).png',
    'books/wuthering heights/page (152).png',
    'books/wuthering heights/page (153).png',
    'books/wuthering heights/page (154).png',
    'books/wuthering heights/page (155).png',
    'books/wuthering heights/page (156).png',
    'books/wuthering heights/page (157).png',
    'books/wuthering heights/page (158).png',
    'books/wuthering heights/page (159).png',
    'books/wuthering heights/page (160).png',
    'books/wuthering heights/page (161).png',
    'books/wuthering heights/page (162).png',
    'books/wuthering heights/page (163).png',
    'books/wuthering heights/page (164).png',
    'books/wuthering heights/page (165).png',
    'books/wuthering heights/page (166).png',
    'books/wuthering heights/page (167).png',
    'books/wuthering heights/page (168).png',
    'books/wuthering heights/page (169).png',
    'books/wuthering heights/page (170).png',
    'books/wuthering heights/page (171).png',
    'books/wuthering heights/page (172).png',
    'books/wuthering heights/page (173).png',
    'books/wuthering heights/page (174).png',
    'books/wuthering heights/page (175).png',
    'books/wuthering heights/page (176).png',
    'books/wuthering heights/page (177).png',
    'books/wuthering heights/page (178).png',
    'books/wuthering heights/page (179).png',
    'books/wuthering heights/page (180).png',
    'books/wuthering heights/page (181).png',
    'books/wuthering heights/page (182).png',
    'books/wuthering heights/page (183).png',
    'books/wuthering heights/page (184).png',
    'books/wuthering heights/page (185).png',
    'books/wuthering heights/page (186).png',
    'books/wuthering heights/page (187).png',
    'books/wuthering heights/page (188).png',
    'books/wuthering heights/page (189).png',
    'books/wuthering heights/page (190).png',
    'books/wuthering heights/page (191).png',
    'books/wuthering heights/page (192).png',
    'books/wuthering heights/page (193).png',
    'books/wuthering heights/page (194).png',
    'books/wuthering heights/page (195).png',
    'books/wuthering heights/page (196).png',
    'books/wuthering heights/page (197).png',
    'books/wuthering heights/page (198).png',
    'books/wuthering heights/page (199).png',
    'books/wuthering heights/page (200).png',
    'books/wuthering heights/page (201).png',
    'books/wuthering heights/page (202).png',
    'books/wuthering heights/page (203).png',
    'books/wuthering heights/page (204).png',
    'books/wuthering heights/page (205).png',
    'books/wuthering heights/page (206).png',
    'books/wuthering heights/page (207).png',
    'books/wuthering heights/page (208).png',
    'books/wuthering heights/page (209).png',
    'books/wuthering heights/page (210).png',
    'books/wuthering heights/page (211).png',
    'books/wuthering heights/page (212).png',
    'books/wuthering heights/page (213).png',
    'books/wuthering heights/page (214).png',
    'books/wuthering heights/page (215).png',
    'books/wuthering heights/page (216).png',
    'books/wuthering heights/page (217).png',
    'books/wuthering heights/page (218).png',
    'books/wuthering heights/page (219).png',
    'books/wuthering heights/page (220).png',
    'books/wuthering heights/page (221).png',
    'books/wuthering heights/page (222).png',
    'books/wuthering heights/page (223).png',
    'books/wuthering heights/page (224).png',
    'books/wuthering heights/page (225).png',
    'books/wuthering heights/page (226).png',
    'books/wuthering heights/page (227).png',
    'books/wuthering heights/page (228).png',
    'books/wuthering heights/page (229).png',
    'books/wuthering heights/page (230).png',
    'books/wuthering heights/page (231).png',
    'books/wuthering heights/page (232).png',
    'books/wuthering heights/page (233).png',
    'books/wuthering heights/page (234).png',
    'books/wuthering heights/page (235).png',
    'books/wuthering heights/page (236).png',
    'books/wuthering heights/page (237).png',
    'books/wuthering heights/page (238).png',
    'books/wuthering heights/page (239).png',
    'books/wuthering heights/page (240).png',
    'books/wuthering heights/page (241).png',
    'books/wuthering heights/page (242).png',
    'books/wuthering heights/page (243).png',
    'books/wuthering heights/page (244).png',
    'books/wuthering heights/page (245).png',
    'books/wuthering heights/page (246).png',
    'books/wuthering heights/page (247).png',
    'books/wuthering heights/page (248).png',
    'books/wuthering heights/page (249).png',
    'books/wuthering heights/page (250).png',
    'books/wuthering heights/page (251).png',
    'books/wuthering heights/page (252).png',
    'books/wuthering heights/page (253).png',
    'books/wuthering heights/page (254).png',
    'books/wuthering heights/page (255).png',
    'books/wuthering heights/page (256).png',
    'books/wuthering heights/page (257).png',
    'books/wuthering heights/page (258).png',
    'books/wuthering heights/page (259).png',
    'books/wuthering heights/page (260).png',
    'books/wuthering heights/page (261).png',
    'books/wuthering heights/page (262).png',
    'books/wuthering heights/page (263).png',
    'books/wuthering heights/page (264).png',
    'books/wuthering heights/page (265).png',
    'books/wuthering heights/page (266).png',
    'books/wuthering heights/page (267).png',
    'books/wuthering heights/page (268).png',
    'books/wuthering heights/page (269).png',
    'books/wuthering heights/page (270).png',
    'books/wuthering heights/page (271).png',
    'books/wuthering heights/page (272).png',
    'books/wuthering heights/page (273).png',
    'books/wuthering heights/page (274).png',
    'books/wuthering heights/page (275).png',
    'books/wuthering heights/page (276).png',
    'books/wuthering heights/page (277).png',
    'books/wuthering heights/page (278).png',
    'books/wuthering heights/page (279).png',
    'books/wuthering heights/page (280).png',
    'books/wuthering heights/page (281).png',
    'books/wuthering heights/page (282).png',
    'books/wuthering heights/page (283).png',
    'books/wuthering heights/page (284).png',
    'books/wuthering heights/page (285).png',
    'books/wuthering heights/page (286).png',
    'books/wuthering heights/page (287).png',
    'books/wuthering heights/page (288).png',
    'books/wuthering heights/page (289).png',
    'books/wuthering heights/page (290).png',
    'books/wuthering heights/page (291).png',
    'books/wuthering heights/page (292).png',
    'books/wuthering heights/page (293).png',
    'books/wuthering heights/page (294).png',
    'books/wuthering heights/page (295).png',

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
