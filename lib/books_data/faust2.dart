import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class faust2 extends StatefulWidget {
  const faust2({Key? key}) : super(key: key);

  @override
  State<faust2> createState() => _faust2State();
}

class _faust2State extends State<faust2> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/faust 2/page (1).png',
    'books/faust 2/page (2).png',
    'books/faust 2/page (3).png',
    'books/faust 2/page (4).png',
    'books/faust 2/page (5).png',
    'books/faust 2/page (6).png',
    'books/faust 2/page (7).png',
    'books/faust 2/page (8).png',
    'books/faust 2/page (9).png',
    'books/faust 2/page (10).png',
    'books/faust 2/page (11).png',
    'books/faust 2/page (12).png',
    'books/faust 2/page (13).png',
    'books/faust 2/page (14).png',
    'books/faust 2/page (15).png',
    'books/faust 2/page (16).png',
    'books/faust 2/page (17).png',
    'books/faust 2/page (18).png',
    'books/faust 2/page (19).png',
    'books/faust 2/page (20).png',
    'books/faust 2/page (21).png',
    'books/faust 2/page (22).png',
    'books/faust 2/page (23).png',
    'books/faust 2/page (24).png',
    'books/faust 2/page (25).png',
    'books/faust 2/page (26).png',
    'books/faust 2/page (27).png',
    'books/faust 2/page (28).png',
    'books/faust 2/page (29).png',
    'books/faust 2/page (30).png',
    'books/faust 2/page (31).png',
    'books/faust 2/page (32).png',
    'books/faust 2/page (33).png',
    'books/faust 2/page (34).png',
    'books/faust 2/page (35).png',
    'books/faust 2/page (36).png',
    'books/faust 2/page (37).png',
    'books/faust 2/page (38).png',
    'books/faust 2/page (39).png',
    'books/faust 2/page (40).png',
    'books/faust 2/page (41).png',
    'books/faust 2/page (42).png',
    'books/faust 2/page (43).png',
    'books/faust 2/page (44).png',
    'books/faust 2/page (45).png',
    'books/faust 2/page (46).png',
    'books/faust 2/page (47).png',
    'books/faust 2/page (48).png',
    'books/faust 2/page (49).png',
    'books/faust 2/page (50).png',
    'books/faust 2/page (51).png',
    'books/faust 2/page (52).png',
    'books/faust 2/page (53).png',
    'books/faust 2/page (54).png',
    'books/faust 2/page (55).png',
    'books/faust 2/page (56).png',
    'books/faust 2/page (57).png',
    'books/faust 2/page (58).png',
    'books/faust 2/page (59).png',
    'books/faust 2/page (60).png',
    'books/faust 2/page (61).png',
    'books/faust 2/page (62).png',
    'books/faust 2/page (63).png',
    'books/faust 2/page (64).png',
    'books/faust 2/page (65).png',
    'books/faust 2/page (66).png',
    'books/faust 2/page (67).png',
    'books/faust 2/page (68).png',
    'books/faust 2/page (69).png',
    'books/faust 2/page (70).png',
    'books/faust 2/page (71).png',
    'books/faust 2/page (72).png',
    'books/faust 2/page (73).png',
    'books/faust 2/page (74).png',
    'books/faust 2/page (75).png',
    'books/faust 2/page (76).png',
    'books/faust 2/page (77).png',
    'books/faust 2/page (78).png',
    'books/faust 2/page (79).png',
    'books/faust 2/page (80).png',
    'books/faust 2/page (81).png',
    'books/faust 2/page (82).png',
    'books/faust 2/page (83).png',
    'books/faust 2/page (84).png',
    'books/faust 2/page (85).png',
    'books/faust 2/page (86).png',
    'books/faust 2/page (87).png',
    'books/faust 2/page (88).png',
    'books/faust 2/page (89).png',
    'books/faust 2/page (90).png',
    'books/faust 2/page (91).png',
    'books/faust 2/page (92).png',
    'books/faust 2/page (93).png',
    'books/faust 2/page (94).png',
    'books/faust 2/page (95).png',
    'books/faust 2/page (96).png',
    'books/faust 2/page (97).png',
    'books/faust 2/page (98).png',
    'books/faust 2/page (99).png',
    'books/faust 2/page (100).png',
    'books/faust 2/page (101).png',
    'books/faust 2/page (102).png',
    'books/faust 2/page (103).png',
    'books/faust 2/page (104).png',
    'books/faust 2/page (105).png',
    'books/faust 2/page (106).png',
    'books/faust 2/page (107).png',
    'books/faust 2/page (108).png',
    'books/faust 2/page (109).png',
    'books/faust 2/page (110).png',
    'books/faust 2/page (111).png',
    'books/faust 2/page (112).png',
    'books/faust 2/page (113).png',
    'books/faust 2/page (114).png',
    'books/faust 2/page (115).png',
    'books/faust 2/page (116).png',
    'books/faust 2/page (117).png',
    'books/faust 2/page (118).png',
    'books/faust 2/page (119).png',
    'books/faust 2/page (120).png',
    'books/faust 2/page (121).png',
    'books/faust 2/page (122).png',
    'books/faust 2/page (123).png',
    'books/faust 2/page (124).png',
    'books/faust 2/page (125).png',
    'books/faust 2/page (126).png',
    'books/faust 2/page (127).png',
    'books/faust 2/page (128).png',
    'books/faust 2/page (129).png',
    'books/faust 2/page (130).png',
    'books/faust 2/page (131).png',
    'books/faust 2/page (132).png',
    'books/faust 2/page (133).png',
    'books/faust 2/page (134).png',
    'books/faust 2/page (135).png',
    'books/faust 2/page (136).png',
    'books/faust 2/page (137).png',
    'books/faust 2/page (138).png',
    'books/faust 2/page (139).png',
    'books/faust 2/page (140).png',
    'books/faust 2/page (141).png',
    'books/faust 2/page (142).png',
    'books/faust 2/page (143).png',
    'books/faust 2/page (144).png',
    'books/faust 2/page (145).png',
    'books/faust 2/page (146).png',
    'books/faust 2/page (147).png',
    'books/faust 2/page (148).png',
    'books/faust 2/page (149).png',
    'books/faust 2/page (150).png',
    'books/faust 2/page (151).png',
    'books/faust 2/page (152).png',
    'books/faust 2/page (153).png',
    'books/faust 2/page (154).png',
    'books/faust 2/page (155).png',
    'books/faust 2/page (156).png',
    'books/faust 2/page (157).png',
    'books/faust 2/page (158).png',
    'books/faust 2/page (159).png',
    'books/faust 2/page (160).png',
    'books/faust 2/page (161).png',
    'books/faust 2/page (162).png',
    'books/faust 2/page (163).png',
    'books/faust 2/page (164).png',
    'books/faust 2/page (165).png',
    'books/faust 2/page (166).png',
    'books/faust 2/page (167).png',
    'books/faust 2/page (168).png',
    'books/faust 2/page (169).png',
    'books/faust 2/page (170).png',
    'books/faust 2/page (171).png',
    'books/faust 2/page (172).png',
    'books/faust 2/page (173).png',
    'books/faust 2/page (174).png',
    'books/faust 2/page (175).png',
    'books/faust 2/page (176).png',
    'books/faust 2/page (177).png',
    'books/faust 2/page (178).png',
    'books/faust 2/page (179).png',
    'books/faust 2/page (180).png',
    'books/faust 2/page (181).png',
    'books/faust 2/page (182).png',
    'books/faust 2/page (183).png',
    'books/faust 2/page (184).png',
    'books/faust 2/page (185).png',
    'books/faust 2/page (186).png',
    'books/faust 2/page (187).png',
    'books/faust 2/page (188).png',
    'books/faust 2/page (189).png',
    'books/faust 2/page (190).png',
    'books/faust 2/page (191).png',
    'books/faust 2/page (192).png',
    'books/faust 2/page (193).png',
    'books/faust 2/page (194).png',
    'books/faust 2/page (195).png',
    'books/faust 2/page (196).png',
    'books/faust 2/page (197).png',
    'books/faust 2/page (198).png',
    'books/faust 2/page (199).png',
    'books/faust 2/page (200).png',
    'books/faust 2/page (201).png',
    'books/faust 2/page (202).png',
    'books/faust 2/page (203).png',
    'books/faust 2/page (204).png',
    'books/faust 2/page (205).png',
    'books/faust 2/page (206).png',
    'books/faust 2/page (207).png',
    'books/faust 2/page (208).png',
    'books/faust 2/page (209).png',
    'books/faust 2/page (210).png',
    'books/faust 2/page (211).png',
    'books/faust 2/page (212).png',
    'books/faust 2/page (213).png',
    'books/faust 2/page (214).png',
    'books/faust 2/page (215).png',
    'books/faust 2/page (216).png',
    'books/faust 2/page (217).png',
    'books/faust 2/page (218).png',
    'books/faust 2/page (219).png',
    'books/faust 2/page (220).png',
    'books/faust 2/page (221).png',
    'books/faust 2/page (222).png',
    'books/faust 2/page (223).png',
    'books/faust 2/page (224).png',
    'books/faust 2/page (225).png',
    'books/faust 2/page (226).png',
    'books/faust 2/page (227).png',
    'books/faust 2/page (228).png',
    'books/faust 2/page (229).png',
    'books/faust 2/page (230).png',
    'books/faust 2/page (231).png',
    'books/faust 2/page (232).png',
    'books/faust 2/page (233).png',
    'books/faust 2/page (234).png',
    'books/faust 2/page (235).png',
    'books/faust 2/page (236).png',
    'books/faust 2/page (237).png',
    'books/faust 2/page (238).png',
    'books/faust 2/page (239).png',
    'books/faust 2/page (240).png',
    'books/faust 2/page (241).png',
    'books/faust 2/page (242).png',
    'books/faust 2/page (243).png',
    'books/faust 2/page (244).png',
    'books/faust 2/page (245).png',
    'books/faust 2/page (246).png',
    'books/faust 2/page (247).png',
    'books/faust 2/page (248).png',
    'books/faust 2/page (249).png',
    'books/faust 2/page (250).png',
    'books/faust 2/page (251).png',
    'books/faust 2/page (252).png',
    'books/faust 2/page (253).png',
    'books/faust 2/page (254).png',
    'books/faust 2/page (255).png',
    'books/faust 2/page (256).png',
    'books/faust 2/page (257).png',
    'books/faust 2/page (258).png',
    'books/faust 2/page (259).png',
    'books/faust 2/page (260).png',
    'books/faust 2/page (261).png',
    'books/faust 2/page (262).png',
    'books/faust 2/page (263).png',
    'books/faust 2/page (264).png',
    'books/faust 2/page (265).png',
    'books/faust 2/page (266).png',
    'books/faust 2/page (267).png',
    'books/faust 2/page (268).png',
    'books/faust 2/page (269).png',
    'books/faust 2/page (270).png',
    'books/faust 2/page (271).png',
    'books/faust 2/page (272).png',
    'books/faust 2/page (273).png',
    'books/faust 2/page (274).png',
    'books/faust 2/page (275).png',
    'books/faust 2/page (276).png',
    'books/faust 2/page (277).png',
    'books/faust 2/page (278).png',
    'books/faust 2/page (279).png',
    'books/faust 2/page (280).png',
    'books/faust 2/page (281).png',
    'books/faust 2/page (282).png',
    'books/faust 2/page (283).png',
    'books/faust 2/page (284).png',
    'books/faust 2/page (285).png',
    'books/faust 2/page (286).png',
    'books/faust 2/page (287).png',
    'books/faust 2/page (288).png',
    'books/faust 2/page (289).png',
    'books/faust 2/page (290).png',
    'books/faust 2/page (291).png',
    'books/faust 2/page (292).png',
    'books/faust 2/page (293).png',
    'books/faust 2/page (294).png',
    'books/faust 2/page (295).png',
    'books/faust 2/page (296).png',
    'books/faust 2/page (297).png',
    'books/faust 2/page (298).png',
    'books/faust 2/page (299).png',
    'books/faust 2/page (300).png',
    'books/faust 2/page (301).png',
    'books/faust 2/page (302).png',
    'books/faust 2/page (303).png',
    'books/faust 2/page (304).png',
    'books/faust 2/page (305).png',
    'books/faust 2/page (306).png',
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
