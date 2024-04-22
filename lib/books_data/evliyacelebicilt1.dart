import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class evliyacelebicilt1 extends StatefulWidget {
  const evliyacelebicilt1({Key? key}) : super(key: key);

  @override
  State<evliyacelebicilt1> createState() => _evliyacelebicilt1State();
}

class _evliyacelebicilt1State extends State<evliyacelebicilt1> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/evliva celebi 1cilt/page (1).png',
    'books/evliva celebi 1cilt/page (2).png',
    'books/evliva celebi 1cilt/page (3).png',
    'books/evliva celebi 1cilt/page (4).png',
    'books/evliva celebi 1cilt/page (5).png',
    'books/evliva celebi 1cilt/page (6).png',
    'books/evliva celebi 1cilt/page (7).png',
    'books/evliva celebi 1cilt/page (8).png',
    'books/evliva celebi 1cilt/page (9).png',
    'books/evliva celebi 1cilt/page (10).png',
    'books/evliva celebi 1cilt/page (11).png',
    'books/evliva celebi 1cilt/page (12).png',
    'books/evliva celebi 1cilt/page (13).png',
    'books/evliva celebi 1cilt/page (14).png',
    'books/evliva celebi 1cilt/page (15).png',
    'books/evliva celebi 1cilt/page (16).png',
    'books/evliva celebi 1cilt/page (17).png',
    'books/evliva celebi 1cilt/page (18).png',
    'books/evliva celebi 1cilt/page (19).png',
    'books/evliva celebi 1cilt/page (20).png',
    'books/evliva celebi 1cilt/page (21).png',
    'books/evliva celebi 1cilt/page (22).png',
    'books/evliva celebi 1cilt/page (23).png',
    'books/evliva celebi 1cilt/page (24).png',
    'books/evliva celebi 1cilt/page (25).png',
    'books/evliva celebi 1cilt/page (26).png',
    'books/evliva celebi 1cilt/page (27).png',
    'books/evliva celebi 1cilt/page (28).png',
    'books/evliva celebi 1cilt/page (29).png',
    'books/evliva celebi 1cilt/page (30).png',
    'books/evliva celebi 1cilt/page (31).png',
    'books/evliva celebi 1cilt/page (32).png',
    'books/evliva celebi 1cilt/page (33).png',
    'books/evliva celebi 1cilt/page (34).png',
    'books/evliva celebi 1cilt/page (35).png',
    'books/evliva celebi 1cilt/page (36).png',
    'books/evliva celebi 1cilt/page (37).png',
    'books/evliva celebi 1cilt/page (38).png',
    'books/evliva celebi 1cilt/page (39).png',
    'books/evliva celebi 1cilt/page (40).png',
    'books/evliva celebi 1cilt/page (41).png',
    'books/evliva celebi 1cilt/page (42).png',
    'books/evliva celebi 1cilt/page (43).png',
    'books/evliva celebi 1cilt/page (44).png',
    'books/evliva celebi 1cilt/page (45).png',
    'books/evliva celebi 1cilt/page (46).png',
    'books/evliva celebi 1cilt/page (47).png',
    'books/evliva celebi 1cilt/page (48).png',
    'books/evliva celebi 1cilt/page (49).png',
    'books/evliva celebi 1cilt/page (50).png',
    'books/evliva celebi 1cilt/page (51).png',
    'books/evliva celebi 1cilt/page (52).png',
    'books/evliva celebi 1cilt/page (53).png',
    'books/evliva celebi 1cilt/page (54).png',
    'books/evliva celebi 1cilt/page (55).png',
    'books/evliva celebi 1cilt/page (56).png',
    'books/evliva celebi 1cilt/page (57).png',
    'books/evliva celebi 1cilt/page (58).png',
    'books/evliva celebi 1cilt/page (59).png',
    'books/evliva celebi 1cilt/page (60).png',
    'books/evliva celebi 1cilt/page (61).png',
    'books/evliva celebi 1cilt/page (62).png',
    'books/evliva celebi 1cilt/page (63).png',
    'books/evliva celebi 1cilt/page (64).png',
    'books/evliva celebi 1cilt/page (65).png',
    'books/evliva celebi 1cilt/page (66).png',
    'books/evliva celebi 1cilt/page (67).png',
    'books/evliva celebi 1cilt/page (68).png',
    'books/evliva celebi 1cilt/page (69).png',
    'books/evliva celebi 1cilt/page (70).png',
    'books/evliva celebi 1cilt/page (71).png',
    'books/evliva celebi 1cilt/page (72).png',
    'books/evliva celebi 1cilt/page (73).png',
    'books/evliva celebi 1cilt/page (74).png',
    'books/evliva celebi 1cilt/page (75).png',
    'books/evliva celebi 1cilt/page (76).png',
    'books/evliva celebi 1cilt/page (77).png',
    'books/evliva celebi 1cilt/page (78).png',
    'books/evliva celebi 1cilt/page (79).png',
    'books/evliva celebi 1cilt/page (80).png',
    'books/evliva celebi 1cilt/page (81).png',
    'books/evliva celebi 1cilt/page (82).png',
    'books/evliva celebi 1cilt/page (83).png',
    'books/evliva celebi 1cilt/page (84).png',
    'books/evliva celebi 1cilt/page (85).png',
    'books/evliva celebi 1cilt/page (86).png',
    'books/evliva celebi 1cilt/page (87).png',
    'books/evliva celebi 1cilt/page (88).png',
    'books/evliva celebi 1cilt/page (89).png',
    'books/evliva celebi 1cilt/page (90).png',
    'books/evliva celebi 1cilt/page (91).png',
    'books/evliva celebi 1cilt/page (92).png',
    'books/evliva celebi 1cilt/page (93).png',
    'books/evliva celebi 1cilt/page (94).png',
    'books/evliva celebi 1cilt/page (95).png',
    'books/evliva celebi 1cilt/page (96).png',
    'books/evliva celebi 1cilt/page (97).png',
    'books/evliva celebi 1cilt/page (98).png',
    'books/evliva celebi 1cilt/page (99).png',
    'books/evliva celebi 1cilt/page (100).png',
    'books/evliva celebi 1cilt/page (101).png',
    'books/evliva celebi 1cilt/page (102).png',
    'books/evliva celebi 1cilt/page (103).png',
    'books/evliva celebi 1cilt/page (104).png',
    'books/evliva celebi 1cilt/page (105).png',
    'books/evliva celebi 1cilt/page (106).png',
    'books/evliva celebi 1cilt/page (107).png',
    'books/evliva celebi 1cilt/page (108).png',
    'books/evliva celebi 1cilt/page (109).png',
    'books/evliva celebi 1cilt/page (110).png',
    'books/evliva celebi 1cilt/page (111).png',
    'books/evliva celebi 1cilt/page (112).png',
    'books/evliva celebi 1cilt/page (113).png',
    'books/evliva celebi 1cilt/page (114).png',
    'books/evliva celebi 1cilt/page (115).png',
    'books/evliva celebi 1cilt/page (116).png',
    'books/evliva celebi 1cilt/page (117).png',
    'books/evliva celebi 1cilt/page (118).png',
    'books/evliva celebi 1cilt/page (119).png',
    'books/evliva celebi 1cilt/page (120).png',
    'books/evliva celebi 1cilt/page (121).png',
    'books/evliva celebi 1cilt/page (122).png',
    'books/evliva celebi 1cilt/page (123).png',
    'books/evliva celebi 1cilt/page (124).png',
    'books/evliva celebi 1cilt/page (125).png',
    'books/evliva celebi 1cilt/page (126).png',
    'books/evliva celebi 1cilt/page (127).png',
    'books/evliva celebi 1cilt/page (128).png',
    'books/evliva celebi 1cilt/page (129).png',
    'books/evliva celebi 1cilt/page (130).png',
    'books/evliva celebi 1cilt/page (131).png',
    'books/evliva celebi 1cilt/page (132).png',
    'books/evliva celebi 1cilt/page (133).png',
    'books/evliva celebi 1cilt/page (134).png',
    'books/evliva celebi 1cilt/page (135).png',
    'books/evliva celebi 1cilt/page (136).png',
    'books/evliva celebi 1cilt/page (137).png',
    'books/evliva celebi 1cilt/page (138).png',
    'books/evliva celebi 1cilt/page (139).png',
    'books/evliva celebi 1cilt/page (140).png',
    'books/evliva celebi 1cilt/page (141).png',
    'books/evliva celebi 1cilt/page (142).png',
    'books/evliva celebi 1cilt/page (143).png',
    'books/evliva celebi 1cilt/page (144).png',
    'books/evliva celebi 1cilt/page (145).png',
    'books/evliva celebi 1cilt/page (146).png',
    'books/evliva celebi 1cilt/page (147).png',
    'books/evliva celebi 1cilt/page (148).png',
    'books/evliva celebi 1cilt/page (149).png',
    'books/evliva celebi 1cilt/page (150).png',
    'books/evliva celebi 1cilt/page (151).png',
    'books/evliva celebi 1cilt/page (152).png',
    'books/evliva celebi 1cilt/page (153).png',
    'books/evliva celebi 1cilt/page (154).png',
    'books/evliva celebi 1cilt/page (155).png',
    'books/evliva celebi 1cilt/page (156).png',
    'books/evliva celebi 1cilt/page (157).png',
    'books/evliva celebi 1cilt/page (158).png',
    'books/evliva celebi 1cilt/page (159).png',
    'books/evliva celebi 1cilt/page (160).png',
    'books/evliva celebi 1cilt/page (161).png',
    'books/evliva celebi 1cilt/page (162).png',
    'books/evliva celebi 1cilt/page (163).png',
    'books/evliva celebi 1cilt/page (164).png',
    'books/evliva celebi 1cilt/page (165).png',
    'books/evliva celebi 1cilt/page (166).png',
    'books/evliva celebi 1cilt/page (167).png',
    'books/evliva celebi 1cilt/page (168).png',
    'books/evliva celebi 1cilt/page (169).png',
    'books/evliva celebi 1cilt/page (170).png',
    'books/evliva celebi 1cilt/page (171).png',
    'books/evliva celebi 1cilt/page (172).png',
    'books/evliva celebi 1cilt/page (173).png',
    'books/evliva celebi 1cilt/page (174).png',
    'books/evliva celebi 1cilt/page (175).png',
    'books/evliva celebi 1cilt/page (176).png',
    'books/evliva celebi 1cilt/page (177).png',
    'books/evliva celebi 1cilt/page (178).png',
    'books/evliva celebi 1cilt/page (179).png',
    'books/evliva celebi 1cilt/page (180).png',
    'books/evliva celebi 1cilt/page (181).png',
    'books/evliva celebi 1cilt/page (182).png',
    'books/evliva celebi 1cilt/page (183).png',
    'books/evliva celebi 1cilt/page (184).png',
    'books/evliva celebi 1cilt/page (185).png',
    'books/evliva celebi 1cilt/page (186).png',
    'books/evliva celebi 1cilt/page (187).png',
    'books/evliva celebi 1cilt/page (188).png',
    'books/evliva celebi 1cilt/page (189).png',
    'books/evliva celebi 1cilt/page (190).png',
    'books/evliva celebi 1cilt/page (191).png',
    'books/evliva celebi 1cilt/page (192).png',
    'books/evliva celebi 1cilt/page (193).png',
    'books/evliva celebi 1cilt/page (194).png',
    'books/evliva celebi 1cilt/page (195).png',
    'books/evliva celebi 1cilt/page (196).png',
    'books/evliva celebi 1cilt/page (197).png',
    'books/evliva celebi 1cilt/page (198).png',
    'books/evliva celebi 1cilt/page (199).png',
    'books/evliva celebi 1cilt/page (200).png',
    'books/evliva celebi 1cilt/page (201).png',
    'books/evliva celebi 1cilt/page (202).png',
    'books/evliva celebi 1cilt/page (203).png',
    'books/evliva celebi 1cilt/page (204).png',
    'books/evliva celebi 1cilt/page (205).png',
    'books/evliva celebi 1cilt/page (206).png',
    'books/evliva celebi 1cilt/page (207).png',
    'books/evliva celebi 1cilt/page (208).png',
    'books/evliva celebi 1cilt/page (209).png',
    'books/evliva celebi 1cilt/page (210).png',
    'books/evliva celebi 1cilt/page (211).png',
    'books/evliva celebi 1cilt/page (212).png',
    'books/evliva celebi 1cilt/page (213).png',
    'books/evliva celebi 1cilt/page (214).png',
    'books/evliva celebi 1cilt/page (215).png',
    'books/evliva celebi 1cilt/page (216).png',
    'books/evliva celebi 1cilt/page (217).png',
    'books/evliva celebi 1cilt/page (218).png',
    'books/evliva celebi 1cilt/page (219).png',
    'books/evliva celebi 1cilt/page (220).png',
    'books/evliva celebi 1cilt/page (221).png',
    'books/evliva celebi 1cilt/page (222).png',
    'books/evliva celebi 1cilt/page (223).png',
    'books/evliva celebi 1cilt/page (224).png',
    'books/evliva celebi 1cilt/page (225).png',
    'books/evliva celebi 1cilt/page (226).png',
    'books/evliva celebi 1cilt/page (227).png',
    'books/evliva celebi 1cilt/page (228).png',
    'books/evliva celebi 1cilt/page (229).png',
    'books/evliva celebi 1cilt/page (230).png',
    'books/evliva celebi 1cilt/page (231).png',
    'books/evliva celebi 1cilt/page (232).png',
    'books/evliva celebi 1cilt/page (233).png',
    'books/evliva celebi 1cilt/page (234).png',
    'books/evliva celebi 1cilt/page (235).png',
    'books/evliva celebi 1cilt/page (236).png',
    'books/evliva celebi 1cilt/page (237).png',
    'books/evliva celebi 1cilt/page (238).png',
    'books/evliva celebi 1cilt/page (239).png',
    'books/evliva celebi 1cilt/page (240).png',
    'books/evliva celebi 1cilt/page (241).png',
    'books/evliva celebi 1cilt/page (242).png',
    'books/evliva celebi 1cilt/page (243).png',
    'books/evliva celebi 1cilt/page (244).png',
    'books/evliva celebi 1cilt/page (245).png',
    'books/evliva celebi 1cilt/page (246).png',
    'books/evliva celebi 1cilt/page (247).png',
    'books/evliva celebi 1cilt/page (248).png',
    'books/evliva celebi 1cilt/page (249).png',
    'books/evliva celebi 1cilt/page (250).png',
    'books/evliva celebi 1cilt/page (251).png',
    'books/evliva celebi 1cilt/page (252).png',
    'books/evliva celebi 1cilt/page (253).png',
    'books/evliva celebi 1cilt/page (254).png',
    'books/evliva celebi 1cilt/page (255).png',
    'books/evliva celebi 1cilt/page (256).png',
    'books/evliva celebi 1cilt/page (257).png',
    'books/evliva celebi 1cilt/page (258).png',
    'books/evliva celebi 1cilt/page (259).png',
    'books/evliva celebi 1cilt/page (260).png',
    'books/evliva celebi 1cilt/page (261).png',
    'books/evliva celebi 1cilt/page (262).png',
    'books/evliva celebi 1cilt/page (263).png',
    'books/evliva celebi 1cilt/page (264).png',
    'books/evliva celebi 1cilt/page (265).png',
    'books/evliva celebi 1cilt/page (266).png',
    'books/evliva celebi 1cilt/page (267).png',
    'books/evliva celebi 1cilt/page (268).png',
    'books/evliva celebi 1cilt/page (269).png',
    'books/evliva celebi 1cilt/page (270).png',
    'books/evliva celebi 1cilt/page (271).png',
    'books/evliva celebi 1cilt/page (272).png',
    'books/evliva celebi 1cilt/page (273).png',
    'books/evliva celebi 1cilt/page (274).png',
    'books/evliva celebi 1cilt/page (275).png',
    'books/evliva celebi 1cilt/page (276).png',
    'books/evliva celebi 1cilt/page (277).png',
    'books/evliva celebi 1cilt/page (278).png',
    'books/evliva celebi 1cilt/page (279).png',
    'books/evliva celebi 1cilt/page (280).png',
    'books/evliva celebi 1cilt/page (281).png',
    'books/evliva celebi 1cilt/page (282).png',
    'books/evliva celebi 1cilt/page (283).png',
    'books/evliva celebi 1cilt/page (284).png',
    'books/evliva celebi 1cilt/page (285).png',
    'books/evliva celebi 1cilt/page (286).png',
    'books/evliva celebi 1cilt/page (287).png',

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
