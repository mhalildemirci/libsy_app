import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class researchmagnificent extends StatefulWidget {
  const researchmagnificent({Key? key}) : super(key: key);

  @override
  State<researchmagnificent> createState() => _researchmagnificentState();
}

class _researchmagnificentState extends State<researchmagnificent> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/research magnificent/page (1).png',
    'books/research magnificent/page (2).png',
    'books/research magnificent/page (3).png',
    'books/research magnificent/page (4).png',
    'books/research magnificent/page (5).png',
    'books/research magnificent/page (6).png',
    'books/research magnificent/page (7).png',
    'books/research magnificent/page (8).png',
    'books/research magnificent/page (9).png',
    'books/research magnificent/page (10).png',
    'books/research magnificent/page (11).png',
    'books/research magnificent/page (12).png',
    'books/research magnificent/page (13).png',
    'books/research magnificent/page (14).png',
    'books/research magnificent/page (15).png',
    'books/research magnificent/page (16).png',
    'books/research magnificent/page (17).png',
    'books/research magnificent/page (18).png',
    'books/research magnificent/page (19).png',
    'books/research magnificent/page (20).png',
    'books/research magnificent/page (21).png',
    'books/research magnificent/page (22).png',
    'books/research magnificent/page (23).png',
    'books/research magnificent/page (24).png',
    'books/research magnificent/page (25).png',
    'books/research magnificent/page (26).png',
    'books/research magnificent/page (27).png',
    'books/research magnificent/page (28).png',
    'books/research magnificent/page (29).png',
    'books/research magnificent/page (30).png',
    'books/research magnificent/page (31).png',
    'books/research magnificent/page (32).png',
    'books/research magnificent/page (33).png',
    'books/research magnificent/page (34).png',
    'books/research magnificent/page (35).png',
    'books/research magnificent/page (36).png',
    'books/research magnificent/page (37).png',
    'books/research magnificent/page (38).png',
    'books/research magnificent/page (39).png',
    'books/research magnificent/page (40).png',
    'books/research magnificent/page (41).png',
    'books/research magnificent/page (42).png',
    'books/research magnificent/page (43).png',
    'books/research magnificent/page (44).png',
    'books/research magnificent/page (45).png',
    'books/research magnificent/page (46).png',
    'books/research magnificent/page (47).png',
    'books/research magnificent/page (48).png',
    'books/research magnificent/page (49).png',
    'books/research magnificent/page (50).png',
    'books/research magnificent/page (51).png',
    'books/research magnificent/page (52).png',
    'books/research magnificent/page (53).png',
    'books/research magnificent/page (54).png',
    'books/research magnificent/page (55).png',
    'books/research magnificent/page (56).png',
    'books/research magnificent/page (57).png',
    'books/research magnificent/page (58).png',
    'books/research magnificent/page (59).png',
    'books/research magnificent/page (60).png',
    'books/research magnificent/page (61).png',
    'books/research magnificent/page (62).png',
    'books/research magnificent/page (63).png',
    'books/research magnificent/page (64).png',
    'books/research magnificent/page (65).png',
    'books/research magnificent/page (66).png',
    'books/research magnificent/page (67).png',
    'books/research magnificent/page (68).png',
    'books/research magnificent/page (69).png',
    'books/research magnificent/page (70).png',
    'books/research magnificent/page (71).png',
    'books/research magnificent/page (72).png',
    'books/research magnificent/page (73).png',
    'books/research magnificent/page (74).png',
    'books/research magnificent/page (75).png',
    'books/research magnificent/page (76).png',
    'books/research magnificent/page (77).png',
    'books/research magnificent/page (78).png',
    'books/research magnificent/page (79).png',
    'books/research magnificent/page (80).png',
    'books/research magnificent/page (81).png',
    'books/research magnificent/page (82).png',
    'books/research magnificent/page (83).png',
    'books/research magnificent/page (84).png',
    'books/research magnificent/page (85).png',
    'books/research magnificent/page (86).png',
    'books/research magnificent/page (87).png',
    'books/research magnificent/page (88).png',
    'books/research magnificent/page (89).png',
    'books/research magnificent/page (90).png',
    'books/research magnificent/page (91).png',
    'books/research magnificent/page (92).png',
    'books/research magnificent/page (93).png',
    'books/research magnificent/page (94).png',
    'books/research magnificent/page (95).png',
    'books/research magnificent/page (96).png',
    'books/research magnificent/page (97).png',
    'books/research magnificent/page (98).png',
    'books/research magnificent/page (99).png',
    'books/research magnificent/page (100).png',
    'books/research magnificent/page (101).png',
    'books/research magnificent/page (102).png',
    'books/research magnificent/page (103).png',
    'books/research magnificent/page (104).png',
    'books/research magnificent/page (105).png',
    'books/research magnificent/page (106).png',
    'books/research magnificent/page (107).png',
    'books/research magnificent/page (108).png',
    'books/research magnificent/page (109).png',
    'books/research magnificent/page (110).png',
    'books/research magnificent/page (111).png',
    'books/research magnificent/page (112).png',
    'books/research magnificent/page (113).png',
    'books/research magnificent/page (114).png',
    'books/research magnificent/page (115).png',
    'books/research magnificent/page (116).png',
    'books/research magnificent/page (117).png',
    'books/research magnificent/page (118).png',
    'books/research magnificent/page (119).png',
    'books/research magnificent/page (120).png',
    'books/research magnificent/page (121).png',
    'books/research magnificent/page (122).png',
    'books/research magnificent/page (123).png',
    'books/research magnificent/page (124).png',
    'books/research magnificent/page (125).png',
    'books/research magnificent/page (126).png',
    'books/research magnificent/page (127).png',
    'books/research magnificent/page (128).png',
    'books/research magnificent/page (129).png',
    'books/research magnificent/page (130).png',
    'books/research magnificent/page (131).png',
    'books/research magnificent/page (132).png',
    'books/research magnificent/page (133).png',
    'books/research magnificent/page (134).png',
    'books/research magnificent/page (135).png',
    'books/research magnificent/page (136).png',
    'books/research magnificent/page (137).png',
    'books/research magnificent/page (138).png',
    'books/research magnificent/page (139).png',
    'books/research magnificent/page (140).png',
    'books/research magnificent/page (141).png',
    'books/research magnificent/page (142).png',
    'books/research magnificent/page (143).png',
    'books/research magnificent/page (144).png',
    'books/research magnificent/page (145).png',
    'books/research magnificent/page (146).png',
    'books/research magnificent/page (147).png',
    'books/research magnificent/page (148).png',
    'books/research magnificent/page (149).png',
    'books/research magnificent/page (150).png',
    'books/research magnificent/page (151).png',
    'books/research magnificent/page (152).png',
    'books/research magnificent/page (153).png',
    'books/research magnificent/page (154).png',
    'books/research magnificent/page (155).png',
    'books/research magnificent/page (156).png',
    'books/research magnificent/page (157).png',
    'books/research magnificent/page (158).png',
    'books/research magnificent/page (159).png',
    'books/research magnificent/page (160).png',
    'books/research magnificent/page (161).png',
    'books/research magnificent/page (162).png',
    'books/research magnificent/page (163).png',
    'books/research magnificent/page (164).png',
    'books/research magnificent/page (165).png',
    'books/research magnificent/page (166).png',
    'books/research magnificent/page (167).png',
    'books/research magnificent/page (168).png',
    'books/research magnificent/page (169).png',
    'books/research magnificent/page (170).png',
    'books/research magnificent/page (171).png',
    'books/research magnificent/page (172).png',
    'books/research magnificent/page (173).png',
    'books/research magnificent/page (174).png',
    'books/research magnificent/page (175).png',
    'books/research magnificent/page (176).png',
    'books/research magnificent/page (177).png',
    'books/research magnificent/page (178).png',
    'books/research magnificent/page (179).png',
    'books/research magnificent/page (180).png',
    'books/research magnificent/page (181).png',
    'books/research magnificent/page (182).png',
    'books/research magnificent/page (183).png',
    'books/research magnificent/page (184).png',
    'books/research magnificent/page (185).png',
    'books/research magnificent/page (186).png',
    'books/research magnificent/page (187).png',
    'books/research magnificent/page (188).png',
    'books/research magnificent/page (189).png',
    'books/research magnificent/page (190).png',
    'books/research magnificent/page (191).png',
    'books/research magnificent/page (192).png',
    'books/research magnificent/page (193).png',
    'books/research magnificent/page (194).png',
    'books/research magnificent/page (195).png',
    'books/research magnificent/page (196).png',
    'books/research magnificent/page (197).png',
    'books/research magnificent/page (198).png',
    'books/research magnificent/page (199).png',
    'books/research magnificent/page (200).png',
    'books/research magnificent/page (201).png',
    'books/research magnificent/page (202).png',
    'books/research magnificent/page (203).png',
    'books/research magnificent/page (204).png',
    'books/research magnificent/page (205).png',
    'books/research magnificent/page (206).png',
    'books/research magnificent/page (207).png',
    'books/research magnificent/page (208).png',
    'books/research magnificent/page (209).png',
    'books/research magnificent/page (210).png',
    'books/research magnificent/page (211).png',
    'books/research magnificent/page (212).png',
    'books/research magnificent/page (213).png',
    'books/research magnificent/page (214).png',
    'books/research magnificent/page (215).png',
    'books/research magnificent/page (216).png',
    'books/research magnificent/page (217).png',
    'books/research magnificent/page (218).png',
    'books/research magnificent/page (219).png',
    'books/research magnificent/page (220).png',
    'books/research magnificent/page (221).png',
    'books/research magnificent/page (222).png',
    'books/research magnificent/page (223).png',
    'books/research magnificent/page (224).png',
    'books/research magnificent/page (225).png',
    'books/research magnificent/page (226).png',
    'books/research magnificent/page (227).png',
    'books/research magnificent/page (228).png',
    'books/research magnificent/page (229).png',
    'books/research magnificent/page (230).png',
    'books/research magnificent/page (231).png',
    'books/research magnificent/page (232).png',
    'books/research magnificent/page (233).png',
    'books/research magnificent/page (234).png',
    'books/research magnificent/page (235).png',
    'books/research magnificent/page (236).png',
    'books/research magnificent/page (237).png',
    'books/research magnificent/page (238).png',
    'books/research magnificent/page (239).png',
    'books/research magnificent/page (240).png',
    'books/research magnificent/page (241).png',
    'books/research magnificent/page (242).png',
    'books/research magnificent/page (243).png',
    'books/research magnificent/page (244).png',
    'books/research magnificent/page (245).png',
    'books/research magnificent/page (246).png',
    'books/research magnificent/page (247).png',
    'books/research magnificent/page (248).png',
    'books/research magnificent/page (249).png',
    'books/research magnificent/page (250).png',
    'books/research magnificent/page (251).png',
    'books/research magnificent/page (252).png',
    'books/research magnificent/page (253).png',
    'books/research magnificent/page (254).png',
    'books/research magnificent/page (255).png',
    'books/research magnificent/page (256).png',
    'books/research magnificent/page (257).png',
    'books/research magnificent/page (258).png',
    'books/research magnificent/page (259).png',
    'books/research magnificent/page (260).png',
    'books/research magnificent/page (261).png',
    'books/research magnificent/page (262).png',
    'books/research magnificent/page (263).png',
    'books/research magnificent/page (264).png',
    'books/research magnificent/page (265).png',
    'books/research magnificent/page (266).png',
    'books/research magnificent/page (267).png',
    'books/research magnificent/page (268).png',
    'books/research magnificent/page (269).png',
    'books/research magnificent/page (270).png',
    'books/research magnificent/page (271).png',
    'books/research magnificent/page (272).png',
    'books/research magnificent/page (273).png',
    'books/research magnificent/page (274).png',
    'books/research magnificent/page (275).png',
    'books/research magnificent/page (276).png',
    'books/research magnificent/page (277).png',
    'books/research magnificent/page (278).png',
    'books/research magnificent/page (279).png',
    'books/research magnificent/page (280).png',
    'books/research magnificent/page (281).png',
    'books/research magnificent/page (282).png',
    'books/research magnificent/page (283).png',
    'books/research magnificent/page (284).png',
    'books/research magnificent/page (285).png',
    'books/research magnificent/page (286).png',
    'books/research magnificent/page (287).png',
    'books/research magnificent/page (288).png',
    'books/research magnificent/page (289).png',
    'books/research magnificent/page (290).png',
    'books/research magnificent/page (291).png',
    'books/research magnificent/page (292).png',
    'books/research magnificent/page (293).png',
    'books/research magnificent/page (294).png',
    'books/research magnificent/page (295).png',
    'books/research magnificent/page (296).png',
    'books/research magnificent/page (297).png',
    'books/research magnificent/page (298).png',
    'books/research magnificent/page (299).png',
    'books/research magnificent/page (300).png',
    'books/research magnificent/page (301).png',
    'books/research magnificent/page (302).png',
    'books/research magnificent/page (303).png',
    'books/research magnificent/page (304).png',
    'books/research magnificent/page (305).png',
    'books/research magnificent/page (306).png',
    'books/research magnificent/page (307).png',
    'books/research magnificent/page (308).png',
    'books/research magnificent/page (309).png',
    'books/research magnificent/page (310).png',
    'books/research magnificent/page (311).png',
    'books/research magnificent/page (312).png',
    'books/research magnificent/page (313).png',
    'books/research magnificent/page (314).png',

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
