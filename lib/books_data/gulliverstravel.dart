import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class gulliverstravel extends StatefulWidget {
  const gulliverstravel({Key? key}) : super(key: key);

  @override
  State<gulliverstravel> createState() => _gulliverstravelState();
}

class _gulliverstravelState extends State<gulliverstravel> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Gullivers Travel/page (1).png',
    'books/Gullivers Travel/page (2).png',
    'books/Gullivers Travel/page (3).png',
    'books/Gullivers Travel/page (4).png',
    'books/Gullivers Travel/page (5).png',
    'books/Gullivers Travel/page (6).png',
    'books/Gullivers Travel/page (7).png',
    'books/Gullivers Travel/page (8).png',
    'books/Gullivers Travel/page (9).png',
    'books/Gullivers Travel/page (10).png',
    'books/Gullivers Travel/page (11).png',
    'books/Gullivers Travel/page (12).png',
    'books/Gullivers Travel/page (13).png',
    'books/Gullivers Travel/page (14).png',
    'books/Gullivers Travel/page (15).png',
    'books/Gullivers Travel/page (16).png',
    'books/Gullivers Travel/page (17).png',
    'books/Gullivers Travel/page (18).png',
    'books/Gullivers Travel/page (19).png',
    'books/Gullivers Travel/page (20).png',
    'books/Gullivers Travel/page (21).png',
    'books/Gullivers Travel/page (22).png',
    'books/Gullivers Travel/page (23).png',
    'books/Gullivers Travel/page (24).png',
    'books/Gullivers Travel/page (25).png',
    'books/Gullivers Travel/page (26).png',
    'books/Gullivers Travel/page (27).png',
    'books/Gullivers Travel/page (28).png',
    'books/Gullivers Travel/page (29).png',
    'books/Gullivers Travel/page (30).png',
    'books/Gullivers Travel/page (31).png',
    'books/Gullivers Travel/page (32).png',
    'books/Gullivers Travel/page (33).png',
    'books/Gullivers Travel/page (34).png',
    'books/Gullivers Travel/page (35).png',
    'books/Gullivers Travel/page (36).png',
    'books/Gullivers Travel/page (37).png',
    'books/Gullivers Travel/page (38).png',
    'books/Gullivers Travel/page (39).png',
    'books/Gullivers Travel/page (40).png',
    'books/Gullivers Travel/page (41).png',
    'books/Gullivers Travel/page (42).png',
    'books/Gullivers Travel/page (43).png',
    'books/Gullivers Travel/page (44).png',
    'books/Gullivers Travel/page (45).png',
    'books/Gullivers Travel/page (46).png',
    'books/Gullivers Travel/page (47).png',
    'books/Gullivers Travel/page (48).png',
    'books/Gullivers Travel/page (49).png',
    'books/Gullivers Travel/page (50).png',
    'books/Gullivers Travel/page (51).png',
    'books/Gullivers Travel/page (52).png',
    'books/Gullivers Travel/page (53).png',
    'books/Gullivers Travel/page (54).png',
    'books/Gullivers Travel/page (55).png',
    'books/Gullivers Travel/page (56).png',
    'books/Gullivers Travel/page (57).png',
    'books/Gullivers Travel/page (58).png',
    'books/Gullivers Travel/page (59).png',
    'books/Gullivers Travel/page (60).png',
    'books/Gullivers Travel/page (61).png',
    'books/Gullivers Travel/page (62).png',
    'books/Gullivers Travel/page (63).png',
    'books/Gullivers Travel/page (64).png',
    'books/Gullivers Travel/page (65).png',
    'books/Gullivers Travel/page (66).png',
    'books/Gullivers Travel/page (67).png',
    'books/Gullivers Travel/page (68).png',
    'books/Gullivers Travel/page (69).png',
    'books/Gullivers Travel/page (70).png',
    'books/Gullivers Travel/page (71).png',
    'books/Gullivers Travel/page (72).png',
    'books/Gullivers Travel/page (73).png',
    'books/Gullivers Travel/page (74).png',
    'books/Gullivers Travel/page (75).png',
    'books/Gullivers Travel/page (76).png',
    'books/Gullivers Travel/page (77).png',
    'books/Gullivers Travel/page (78).png',
    'books/Gullivers Travel/page (79).png',
    'books/Gullivers Travel/page (80).png',
    'books/Gullivers Travel/page (81).png',
    'books/Gullivers Travel/page (82).png',
    'books/Gullivers Travel/page (83).png',
    'books/Gullivers Travel/page (84).png',
    'books/Gullivers Travel/page (85).png',
    'books/Gullivers Travel/page (86).png',
    'books/Gullivers Travel/page (87).png',
    'books/Gullivers Travel/page (88).png',
    'books/Gullivers Travel/page (89).png',
    'books/Gullivers Travel/page (90).png',
    'books/Gullivers Travel/page (91).png',
    'books/Gullivers Travel/page (92).png',
    'books/Gullivers Travel/page (93).png',
    'books/Gullivers Travel/page (94).png',
    'books/Gullivers Travel/page (95).png',
    'books/Gullivers Travel/page (96).png',
    'books/Gullivers Travel/page (97).png',
    'books/Gullivers Travel/page (98).png',
    'books/Gullivers Travel/page (99).png',
    'books/Gullivers Travel/page (100).png',
    'books/Gullivers Travel/page (101).png',
    'books/Gullivers Travel/page (102).png',
    'books/Gullivers Travel/page (103).png',
    'books/Gullivers Travel/page (104).png',
    'books/Gullivers Travel/page (105).png',
    'books/Gullivers Travel/page (106).png',
    'books/Gullivers Travel/page (107).png',
    'books/Gullivers Travel/page (108).png',
    'books/Gullivers Travel/page (109).png',
    'books/Gullivers Travel/page (110).png',
    'books/Gullivers Travel/page (111).png',
    'books/Gullivers Travel/page (112).png',
    'books/Gullivers Travel/page (113).png',
    'books/Gullivers Travel/page (114).png',
    'books/Gullivers Travel/page (115).png',
    'books/Gullivers Travel/page (116).png',
    'books/Gullivers Travel/page (117).png',
    'books/Gullivers Travel/page (118).png',
    'books/Gullivers Travel/page (119).png',
    'books/Gullivers Travel/page (120).png',
    'books/Gullivers Travel/page (121).png',
    'books/Gullivers Travel/page (122).png',
    'books/Gullivers Travel/page (123).png',
    'books/Gullivers Travel/page (124).png',
    'books/Gullivers Travel/page (125).png',
    'books/Gullivers Travel/page (126).png',
    'books/Gullivers Travel/page (127).png',
    'books/Gullivers Travel/page (128).png',
    'books/Gullivers Travel/page (129).png',
    'books/Gullivers Travel/page (130).png',
    'books/Gullivers Travel/page (131).png',
    'books/Gullivers Travel/page (132).png',
    'books/Gullivers Travel/page (133).png',
    'books/Gullivers Travel/page (134).png',
    'books/Gullivers Travel/page (135).png',
    'books/Gullivers Travel/page (136).png',
    'books/Gullivers Travel/page (137).png',
    'books/Gullivers Travel/page (138).png',
    'books/Gullivers Travel/page (139).png',
    'books/Gullivers Travel/page (140).png',
    'books/Gullivers Travel/page (141).png',
    'books/Gullivers Travel/page (142).png',
    'books/Gullivers Travel/page (143).png',
    'books/Gullivers Travel/page (144).png',
    'books/Gullivers Travel/page (145).png',
    'books/Gullivers Travel/page (146).png',
    'books/Gullivers Travel/page (147).png',
    'books/Gullivers Travel/page (148).png',
    'books/Gullivers Travel/page (149).png',
    'books/Gullivers Travel/page (150).png',
    'books/Gullivers Travel/page (151).png',
    'books/Gullivers Travel/page (152).png',
    'books/Gullivers Travel/page (153).png',
    'books/Gullivers Travel/page (154).png',
    'books/Gullivers Travel/page (155).png',
    'books/Gullivers Travel/page (156).png',
    'books/Gullivers Travel/page (157).png',
    'books/Gullivers Travel/page (158).png',
    'books/Gullivers Travel/page (159).png',
    'books/Gullivers Travel/page (160).png',
    'books/Gullivers Travel/page (161).png',
    'books/Gullivers Travel/page (162).png',
    'books/Gullivers Travel/page (163).png',
    'books/Gullivers Travel/page (164).png',
    'books/Gullivers Travel/page (165).png',
    'books/Gullivers Travel/page (166).png',
    'books/Gullivers Travel/page (167).png',
    'books/Gullivers Travel/page (168).png',
    'books/Gullivers Travel/page (169).png',
    'books/Gullivers Travel/page (170).png',
    'books/Gullivers Travel/page (171).png',
    'books/Gullivers Travel/page (172).png',
    'books/Gullivers Travel/page (173).png',
    'books/Gullivers Travel/page (174).png',
    'books/Gullivers Travel/page (175).png',
    'books/Gullivers Travel/page (176).png',
    'books/Gullivers Travel/page (177).png',
    'books/Gullivers Travel/page (178).png',
    'books/Gullivers Travel/page (179).png',
    'books/Gullivers Travel/page (180).png',
    'books/Gullivers Travel/page (181).png',
    'books/Gullivers Travel/page (182).png',
    'books/Gullivers Travel/page (183).png',
    'books/Gullivers Travel/page (184).png',
    'books/Gullivers Travel/page (185).png',
    'books/Gullivers Travel/page (186).png',
    'books/Gullivers Travel/page (187).png',
    'books/Gullivers Travel/page (188).png',
    'books/Gullivers Travel/page (189).png',
    'books/Gullivers Travel/page (190).png',
    'books/Gullivers Travel/page (191).png',
    'books/Gullivers Travel/page (192).png',
    'books/Gullivers Travel/page (193).png',
    'books/Gullivers Travel/page (194).png',
    'books/Gullivers Travel/page (195).png',
    'books/Gullivers Travel/page (196).png',
    'books/Gullivers Travel/page (197).png',
    'books/Gullivers Travel/page (198).png',
    'books/Gullivers Travel/page (199).png',
    'books/Gullivers Travel/page (200).png',
    'books/Gullivers Travel/page (201).png',
    'books/Gullivers Travel/page (202).png',
    'books/Gullivers Travel/page (203).png',
    'books/Gullivers Travel/page (204).png',
    'books/Gullivers Travel/page (205).png',
    'books/Gullivers Travel/page (206).png',
    'books/Gullivers Travel/page (207).png',
    'books/Gullivers Travel/page (208).png',
    'books/Gullivers Travel/page (209).png',
    'books/Gullivers Travel/page (210).png',
    'books/Gullivers Travel/page (211).png',
    'books/Gullivers Travel/page (212).png',
    'books/Gullivers Travel/page (213).png',
    'books/Gullivers Travel/page (214).png',
    'books/Gullivers Travel/page (215).png',
    'books/Gullivers Travel/page (216).png',
    'books/Gullivers Travel/page (217).png',
    'books/Gullivers Travel/page (218).png',
    'books/Gullivers Travel/page (219).png',
    'books/Gullivers Travel/page (220).png',
    'books/Gullivers Travel/page (221).png',
    'books/Gullivers Travel/page (222).png',
    'books/Gullivers Travel/page (223).png',
    'books/Gullivers Travel/page (224).png',
    'books/Gullivers Travel/page (225).png',
    'books/Gullivers Travel/page (226).png',
    'books/Gullivers Travel/page (227).png',
    'books/Gullivers Travel/page (228).png',
    'books/Gullivers Travel/page (229).png',
    'books/Gullivers Travel/page (230).png',
    'books/Gullivers Travel/page (231).png',
    'books/Gullivers Travel/page (232).png',
    'books/Gullivers Travel/page (233).png',
    'books/Gullivers Travel/page (234).png',
    'books/Gullivers Travel/page (235).png',
    'books/Gullivers Travel/page (236).png',
    'books/Gullivers Travel/page (237).png',
    'books/Gullivers Travel/page (238).png',
    'books/Gullivers Travel/page (239).png',
    'books/Gullivers Travel/page (240).png',
    'books/Gullivers Travel/page (241).png',
    'books/Gullivers Travel/page (242).png',
    'books/Gullivers Travel/page (243).png',
    'books/Gullivers Travel/page (244).png',
    'books/Gullivers Travel/page (245).png',
    'books/Gullivers Travel/page (246).png',
    'books/Gullivers Travel/page (247).png',
    'books/Gullivers Travel/page (248).png',
    'books/Gullivers Travel/page (249).png',
    'books/Gullivers Travel/page (250).png',
    'books/Gullivers Travel/page (251).png',
    'books/Gullivers Travel/page (252).png',
    'books/Gullivers Travel/page (253).png',
    'books/Gullivers Travel/page (254).png',
    'books/Gullivers Travel/page (255).png',
    'books/Gullivers Travel/page (256).png',
    'books/Gullivers Travel/page (257).png',
    'books/Gullivers Travel/page (258).png',
    'books/Gullivers Travel/page (259).png',
    'books/Gullivers Travel/page (260).png',
    'books/Gullivers Travel/page (261).png',
    'books/Gullivers Travel/page (262).png',
    'books/Gullivers Travel/page (263).png',
    'books/Gullivers Travel/page (264).png',
    'books/Gullivers Travel/page (265).png',
    'books/Gullivers Travel/page (266).png',
    'books/Gullivers Travel/page (267).png',
    'books/Gullivers Travel/page (268).png',
    'books/Gullivers Travel/page (269).png',
    'books/Gullivers Travel/page (270).png',
    'books/Gullivers Travel/page (271).png',
    'books/Gullivers Travel/page (272).png',
    'books/Gullivers Travel/page (273).png',
    'books/Gullivers Travel/page (274).png',
    'books/Gullivers Travel/page (275).png',
    'books/Gullivers Travel/page (276).png',
    'books/Gullivers Travel/page (277).png',
    'books/Gullivers Travel/page (278).png',
    'books/Gullivers Travel/page (279).png',
    'books/Gullivers Travel/page (280).png',
    'books/Gullivers Travel/page (281).png',
    'books/Gullivers Travel/page (282).png',
    'books/Gullivers Travel/page (283).png',
    'books/Gullivers Travel/page (284).png',
    'books/Gullivers Travel/page (285).png',
    'books/Gullivers Travel/page (286).png',
    'books/Gullivers Travel/page (287).png',
    'books/Gullivers Travel/page (288).png',
    'books/Gullivers Travel/page (289).png',
    'books/Gullivers Travel/page (290).png',
    'books/Gullivers Travel/page (291).png',
    'books/Gullivers Travel/page (292).png',
    'books/Gullivers Travel/page (293).png',
    'books/Gullivers Travel/page (294).png',
    'books/Gullivers Travel/page (295).png',
    'books/Gullivers Travel/page (296).png',
    'books/Gullivers Travel/page (297).png',
    'books/Gullivers Travel/page (298).png',
    'books/Gullivers Travel/page (299).png',
    'books/Gullivers Travel/page (300).png',
    'books/Gullivers Travel/page (301).png',
    'books/Gullivers Travel/page (302).png',

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
