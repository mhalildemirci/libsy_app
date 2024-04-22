import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class whitenights extends StatefulWidget {
  const whitenights({Key? key}) : super(key: key);

  @override
  State<whitenights> createState() => _whitenightsState();
}

class _whitenightsState extends State<whitenights> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/white nights/page (1).png',
    'books/white nights/page (2).png',
    'books/white nights/page (3).png',
    'books/white nights/page (4).png',
    'books/white nights/page (5).png',
    'books/white nights/page (6).png',
    'books/white nights/page (7).png',
    'books/white nights/page (8).png',
    'books/white nights/page (9).png',
    'books/white nights/page (10).png',
    'books/white nights/page (11).png',
    'books/white nights/page (12).png',
    'books/white nights/page (13).png',
    'books/white nights/page (14).png',
    'books/white nights/page (15).png',
    'books/white nights/page (16).png',
    'books/white nights/page (17).png',
    'books/white nights/page (18).png',
    'books/white nights/page (19).png',
    'books/white nights/page (20).png',
    'books/white nights/page (21).png',
    'books/white nights/page (22).png',
    'books/white nights/page (23).png',
    'books/white nights/page (24).png',
    'books/white nights/page (25).png',
    'books/white nights/page (26).png',
    'books/white nights/page (27).png',
    'books/white nights/page (28).png',
    'books/white nights/page (29).png',
    'books/white nights/page (30).png',
    'books/white nights/page (31).png',
    'books/white nights/page (32).png',
    'books/white nights/page (33).png',
    'books/white nights/page (34).png',
    'books/white nights/page (35).png',
    'books/white nights/page (36).png',
    'books/white nights/page (37).png',
    'books/white nights/page (38).png',
    'books/white nights/page (39).png',
    'books/white nights/page (40).png',
    'books/white nights/page (41).png',
    'books/white nights/page (42).png',
    'books/white nights/page (43).png',
    'books/white nights/page (44).png',
    'books/white nights/page (45).png',
    'books/white nights/page (46).png',
    'books/white nights/page (47).png',
    'books/white nights/page (48).png',
    'books/white nights/page (49).png',
    'books/white nights/page (50).png',
    'books/white nights/page (51).png',
    'books/white nights/page (52).png',
    'books/white nights/page (53).png',
    'books/white nights/page (54).png',
    'books/white nights/page (55).png',
    'books/white nights/page (56).png',
    'books/white nights/page (57).png',
    'books/white nights/page (58).png',
    'books/white nights/page (59).png',
    'books/white nights/page (60).png',
    'books/white nights/page (61).png',
    'books/white nights/page (62).png',
    'books/white nights/page (63).png',
    'books/white nights/page (64).png',
    'books/white nights/page (65).png',
    'books/white nights/page (66).png',
    'books/white nights/page (67).png',
    'books/white nights/page (68).png',
    'books/white nights/page (69).png',
    'books/white nights/page (70).png',
    'books/white nights/page (71).png',
    'books/white nights/page (72).png',
    'books/white nights/page (73).png',
    'books/white nights/page (74).png',
    'books/white nights/page (75).png',
    'books/white nights/page (76).png',
    'books/white nights/page (77).png',
    'books/white nights/page (78).png',
    'books/white nights/page (79).png',
    'books/white nights/page (80).png',
    'books/white nights/page (81).png',
    'books/white nights/page (82).png',
    'books/white nights/page (83).png',
    'books/white nights/page (84).png',
    'books/white nights/page (85).png',
    'books/white nights/page (86).png',
    'books/white nights/page (87).png',
    'books/white nights/page (88).png',
    'books/white nights/page (89).png',
    'books/white nights/page (90).png',
    'books/white nights/page (91).png',
    'books/white nights/page (92).png',
    'books/white nights/page (93).png',
    'books/white nights/page (94).png',
    'books/white nights/page (95).png',
    'books/white nights/page (96).png',
    'books/white nights/page (97).png',
    'books/white nights/page (98).png',
    'books/white nights/page (99).png',
    'books/white nights/page (100).png',
    'books/white nights/page (101).png',
    'books/white nights/page (102).png',
    'books/white nights/page (103).png',
    'books/white nights/page (104).png',
    'books/white nights/page (105).png',
    'books/white nights/page (106).png',
    'books/white nights/page (107).png',
    'books/white nights/page (108).png',
    'books/white nights/page (109).png',
    'books/white nights/page (110).png',
    'books/white nights/page (111).png',
    'books/white nights/page (112).png',
    'books/white nights/page (113).png',
    'books/white nights/page (114).png',
    'books/white nights/page (115).png',
    'books/white nights/page (116).png',
    'books/white nights/page (117).png',
    'books/white nights/page (118).png',
    'books/white nights/page (119).png',
    'books/white nights/page (120).png',
    'books/white nights/page (121).png',
    'books/white nights/page (122).png',
    'books/white nights/page (123).png',
    'books/white nights/page (124).png',
    'books/white nights/page (125).png',
    'books/white nights/page (126).png',
    'books/white nights/page (127).png',
    'books/white nights/page (128).png',
    'books/white nights/page (129).png',
    'books/white nights/page (130).png',
    'books/white nights/page (131).png',
    'books/white nights/page (132).png',
    'books/white nights/page (133).png',
    'books/white nights/page (134).png',
    'books/white nights/page (135).png',
    'books/white nights/page (136).png',
    'books/white nights/page (137).png',
    'books/white nights/page (138).png',
    'books/white nights/page (139).png',
    'books/white nights/page (140).png',
    'books/white nights/page (141).png',
    'books/white nights/page (142).png',
    'books/white nights/page (143).png',
    'books/white nights/page (144).png',
    'books/white nights/page (145).png',
    'books/white nights/page (146).png',
    'books/white nights/page (147).png',
    'books/white nights/page (148).png',
    'books/white nights/page (149).png',
    'books/white nights/page (150).png',
    'books/white nights/page (151).png',
    'books/white nights/page (152).png',
    'books/white nights/page (153).png',
    'books/white nights/page (154).png',
    'books/white nights/page (155).png',
    'books/white nights/page (156).png',
    'books/white nights/page (157).png',
    'books/white nights/page (158).png',
    'books/white nights/page (159).png',
    'books/white nights/page (160).png',
    'books/white nights/page (161).png',
    'books/white nights/page (162).png',
    'books/white nights/page (163).png',
    'books/white nights/page (164).png',
    'books/white nights/page (165).png',
    'books/white nights/page (166).png',
    'books/white nights/page (167).png',
    'books/white nights/page (168).png',
    'books/white nights/page (169).png',
    'books/white nights/page (170).png',
    'books/white nights/page (171).png',
    'books/white nights/page (172).png',
    'books/white nights/page (173).png',
    'books/white nights/page (174).png',
    'books/white nights/page (175).png',
    'books/white nights/page (176).png',
    'books/white nights/page (177).png',
    'books/white nights/page (178).png',
    'books/white nights/page (179).png',
    'books/white nights/page (180).png',
    'books/white nights/page (181).png',
    'books/white nights/page (182).png',
    'books/white nights/page (183).png',
    'books/white nights/page (184).png',
    'books/white nights/page (185).png',
    'books/white nights/page (186).png',
    'books/white nights/page (187).png',
    'books/white nights/page (188).png',
    'books/white nights/page (189).png',
    'books/white nights/page (190).png',
    'books/white nights/page (191).png',
    'books/white nights/page (192).png',
    'books/white nights/page (193).png',
    'books/white nights/page (194).png',
    'books/white nights/page (195).png',
    'books/white nights/page (196).png',
    'books/white nights/page (197).png',
    'books/white nights/page (198).png',
    'books/white nights/page (199).png',
    'books/white nights/page (200).png',
    'books/white nights/page (201).png',
    'books/white nights/page (202).png',
    'books/white nights/page (203).png',
    'books/white nights/page (204).png',
    'books/white nights/page (205).png',
    'books/white nights/page (206).png',
    'books/white nights/page (207).png',
    'books/white nights/page (208).png',
    'books/white nights/page (209).png',
    'books/white nights/page (210).png',
    'books/white nights/page (211).png',
    'books/white nights/page (212).png',
    'books/white nights/page (213).png',
    'books/white nights/page (214).png',
    'books/white nights/page (215).png',
    'books/white nights/page (216).png',
    'books/white nights/page (217).png',
    'books/white nights/page (218).png',
    'books/white nights/page (219).png',
    'books/white nights/page (220).png',
    'books/white nights/page (221).png',
    'books/white nights/page (222).png',
    'books/white nights/page (223).png',
    'books/white nights/page (224).png',
    'books/white nights/page (225).png',
    'books/white nights/page (226).png',
    'books/white nights/page (227).png',
    'books/white nights/page (228).png',
    'books/white nights/page (229).png',
    'books/white nights/page (230).png',
    'books/white nights/page (231).png',
    'books/white nights/page (232).png',
    'books/white nights/page (233).png',
    'books/white nights/page (234).png',
    'books/white nights/page (235).png',
    'books/white nights/page (236).png',
    'books/white nights/page (237).png',
    'books/white nights/page (238).png',
    'books/white nights/page (239).png',
    'books/white nights/page (240).png',
    'books/white nights/page (241).png',
    'books/white nights/page (242).png',
    'books/white nights/page (243).png',
    'books/white nights/page (244).png',
    'books/white nights/page (245).png',
    'books/white nights/page (246).png',
    'books/white nights/page (247).png',
    'books/white nights/page (248).png',
    'books/white nights/page (249).png',
    'books/white nights/page (250).png',
    'books/white nights/page (251).png',
    'books/white nights/page (252).png',
    'books/white nights/page (253).png',
    'books/white nights/page (254).png',
    'books/white nights/page (255).png',
    'books/white nights/page (256).png',
    'books/white nights/page (257).png',
    'books/white nights/page (258).png',
    'books/white nights/page (259).png',
    'books/white nights/page (260).png',
    'books/white nights/page (261).png',
    'books/white nights/page (262).png',
    'books/white nights/page (263).png',
    'books/white nights/page (264).png',
    'books/white nights/page (265).png',
    'books/white nights/page (266).png',
    'books/white nights/page (267).png',
    'books/white nights/page (268).png',
    'books/white nights/page (269).png',
    'books/white nights/page (270).png',
    'books/white nights/page (271).png',
    'books/white nights/page (272).png',
    'books/white nights/page (273).png',
    'books/white nights/page (274).png',
    'books/white nights/page (275).png',
    'books/white nights/page (276).png',
    'books/white nights/page (277).png',
    'books/white nights/page (278).png',
    'books/white nights/page (279).png',
    'books/white nights/page (280).png',
    'books/white nights/page (281).png',
    'books/white nights/page (282).png',
    'books/white nights/page (283).png',
    'books/white nights/page (284).png',
    'books/white nights/page (285).png',
    'books/white nights/page (286).png',
    'books/white nights/page (287).png',
    'books/white nights/page (288).png',
    'books/white nights/page (289).png',
    'books/white nights/page (290).png',
    'books/white nights/page (291).png',
    'books/white nights/page (292).png',
    'books/white nights/page (293).png',
    'books/white nights/page (294).png',
    'books/white nights/page (295).png',
    'books/white nights/page (296).png',
    'books/white nights/page (297).png',
    'books/white nights/page (298).png',
    'books/white nights/page (299).png',
    'books/white nights/page (300).png',
    'books/white nights/page (301).png',
    'books/white nights/page (302).png',
    'books/white nights/page (303).png',
    'books/white nights/page (304).png',
    'books/white nights/page (305).png',
    'books/white nights/page (306).png',

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
