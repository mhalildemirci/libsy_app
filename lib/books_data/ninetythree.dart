import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ninetythree extends StatefulWidget {
  const ninetythree({Key? key}) : super(key: key);

  @override
  State<ninetythree> createState() => _ninetythreeState();
}

class _ninetythreeState extends State<ninetythree> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/ninety three/page (1).png',
    'books/ninety three/page (2).png',
    'books/ninety three/page (3).png',
    'books/ninety three/page (4).png',
    'books/ninety three/page (5).png',
    'books/ninety three/page (6).png',
    'books/ninety three/page (7).png',
    'books/ninety three/page (8).png',
    'books/ninety three/page (9).png',
    'books/ninety three/page (10).png',
    'books/ninety three/page (11).png',
    'books/ninety three/page (12).png',
    'books/ninety three/page (13).png',
    'books/ninety three/page (14).png',
    'books/ninety three/page (15).png',
    'books/ninety three/page (16).png',
    'books/ninety three/page (17).png',
    'books/ninety three/page (18).png',
    'books/ninety three/page (19).png',
    'books/ninety three/page (20).png',
    'books/ninety three/page (21).png',
    'books/ninety three/page (22).png',
    'books/ninety three/page (23).png',
    'books/ninety three/page (24).png',
    'books/ninety three/page (25).png',
    'books/ninety three/page (26).png',
    'books/ninety three/page (27).png',
    'books/ninety three/page (28).png',
    'books/ninety three/page (29).png',
    'books/ninety three/page (30).png',
    'books/ninety three/page (31).png',
    'books/ninety three/page (32).png',
    'books/ninety three/page (33).png',
    'books/ninety three/page (34).png',
    'books/ninety three/page (35).png',
    'books/ninety three/page (36).png',
    'books/ninety three/page (37).png',
    'books/ninety three/page (38).png',
    'books/ninety three/page (39).png',
    'books/ninety three/page (40).png',
    'books/ninety three/page (41).png',
    'books/ninety three/page (42).png',
    'books/ninety three/page (43).png',
    'books/ninety three/page (44).png',
    'books/ninety three/page (45).png',
    'books/ninety three/page (46).png',
    'books/ninety three/page (47).png',
    'books/ninety three/page (48).png',
    'books/ninety three/page (49).png',
    'books/ninety three/page (50).png',
    'books/ninety three/page (51).png',
    'books/ninety three/page (52).png',
    'books/ninety three/page (53).png',
    'books/ninety three/page (54).png',
    'books/ninety three/page (55).png',
    'books/ninety three/page (56).png',
    'books/ninety three/page (57).png',
    'books/ninety three/page (58).png',
    'books/ninety three/page (59).png',
    'books/ninety three/page (60).png',
    'books/ninety three/page (61).png',
    'books/ninety three/page (62).png',
    'books/ninety three/page (63).png',
    'books/ninety three/page (64).png',
    'books/ninety three/page (65).png',
    'books/ninety three/page (66).png',
    'books/ninety three/page (67).png',
    'books/ninety three/page (68).png',
    'books/ninety three/page (69).png',
    'books/ninety three/page (70).png',
    'books/ninety three/page (71).png',
    'books/ninety three/page (72).png',
    'books/ninety three/page (73).png',
    'books/ninety three/page (74).png',
    'books/ninety three/page (75).png',
    'books/ninety three/page (76).png',
    'books/ninety three/page (77).png',
    'books/ninety three/page (78).png',
    'books/ninety three/page (79).png',
    'books/ninety three/page (80).png',
    'books/ninety three/page (81).png',
    'books/ninety three/page (82).png',
    'books/ninety three/page (83).png',
    'books/ninety three/page (84).png',
    'books/ninety three/page (85).png',
    'books/ninety three/page (86).png',
    'books/ninety three/page (87).png',
    'books/ninety three/page (88).png',
    'books/ninety three/page (89).png',
    'books/ninety three/page (90).png',
    'books/ninety three/page (91).png',
    'books/ninety three/page (92).png',
    'books/ninety three/page (93).png',
    'books/ninety three/page (94).png',
    'books/ninety three/page (95).png',
    'books/ninety three/page (96).png',
    'books/ninety three/page (97).png',
    'books/ninety three/page (98).png',
    'books/ninety three/page (99).png',
    'books/ninety three/page (100).png',
    'books/ninety three/page (101).png',
    'books/ninety three/page (102).png',
    'books/ninety three/page (103).png',
    'books/ninety three/page (104).png',
    'books/ninety three/page (105).png',
    'books/ninety three/page (106).png',
    'books/ninety three/page (107).png',
    'books/ninety three/page (108).png',
    'books/ninety three/page (109).png',
    'books/ninety three/page (110).png',
    'books/ninety three/page (111).png',
    'books/ninety three/page (112).png',
    'books/ninety three/page (113).png',
    'books/ninety three/page (114).png',
    'books/ninety three/page (115).png',
    'books/ninety three/page (116).png',
    'books/ninety three/page (117).png',
    'books/ninety three/page (118).png',
    'books/ninety three/page (119).png',
    'books/ninety three/page (120).png',
    'books/ninety three/page (121).png',
    'books/ninety three/page (122).png',
    'books/ninety three/page (123).png',
    'books/ninety three/page (124).png',
    'books/ninety three/page (125).png',
    'books/ninety three/page (126).png',
    'books/ninety three/page (127).png',
    'books/ninety three/page (128).png',
    'books/ninety three/page (129).png',
    'books/ninety three/page (130).png',
    'books/ninety three/page (131).png',
    'books/ninety three/page (132).png',
    'books/ninety three/page (133).png',
    'books/ninety three/page (134).png',
    'books/ninety three/page (135).png',
    'books/ninety three/page (136).png',
    'books/ninety three/page (137).png',
    'books/ninety three/page (138).png',
    'books/ninety three/page (139).png',
    'books/ninety three/page (140).png',
    'books/ninety three/page (141).png',
    'books/ninety three/page (142).png',
    'books/ninety three/page (143).png',
    'books/ninety three/page (144).png',
    'books/ninety three/page (145).png',
    'books/ninety three/page (146).png',
    'books/ninety three/page (147).png',
    'books/ninety three/page (148).png',
    'books/ninety three/page (149).png',
    'books/ninety three/page (150).png',
    'books/ninety three/page (151).png',
    'books/ninety three/page (152).png',
    'books/ninety three/page (153).png',
    'books/ninety three/page (154).png',
    'books/ninety three/page (155).png',
    'books/ninety three/page (156).png',
    'books/ninety three/page (157).png',
    'books/ninety three/page (158).png',
    'books/ninety three/page (159).png',
    'books/ninety three/page (160).png',
    'books/ninety three/page (161).png',
    'books/ninety three/page (162).png',
    'books/ninety three/page (163).png',
    'books/ninety three/page (164).png',
    'books/ninety three/page (165).png',
    'books/ninety three/page (166).png',
    'books/ninety three/page (167).png',
    'books/ninety three/page (168).png',
    'books/ninety three/page (169).png',
    'books/ninety three/page (170).png',
    'books/ninety three/page (171).png',
    'books/ninety three/page (172).png',
    'books/ninety three/page (173).png',
    'books/ninety three/page (174).png',
    'books/ninety three/page (175).png',
    'books/ninety three/page (176).png',
    'books/ninety three/page (177).png',
    'books/ninety three/page (178).png',
    'books/ninety three/page (179).png',
    'books/ninety three/page (180).png',
    'books/ninety three/page (181).png',
    'books/ninety three/page (182).png',
    'books/ninety three/page (183).png',
    'books/ninety three/page (184).png',
    'books/ninety three/page (185).png',
    'books/ninety three/page (186).png',
    'books/ninety three/page (187).png',
    'books/ninety three/page (188).png',
    'books/ninety three/page (189).png',
    'books/ninety three/page (190).png',
    'books/ninety three/page (191).png',
    'books/ninety three/page (192).png',
    'books/ninety three/page (193).png',
    'books/ninety three/page (194).png',
    'books/ninety three/page (195).png',
    'books/ninety three/page (196).png',
    'books/ninety three/page (197).png',
    'books/ninety three/page (198).png',
    'books/ninety three/page (199).png',
    'books/ninety three/page (200).png',
    'books/ninety three/page (201).png',
    'books/ninety three/page (202).png',
    'books/ninety three/page (203).png',
    'books/ninety three/page (204).png',
    'books/ninety three/page (205).png',
    'books/ninety three/page (206).png',
    'books/ninety three/page (207).png',
    'books/ninety three/page (208).png',
    'books/ninety three/page (209).png',
    'books/ninety three/page (210).png',
    'books/ninety three/page (211).png',
    'books/ninety three/page (212).png',
    'books/ninety three/page (213).png',
    'books/ninety three/page (214).png',
    'books/ninety three/page (215).png',
    'books/ninety three/page (216).png',
    'books/ninety three/page (217).png',
    'books/ninety three/page (218).png',
    'books/ninety three/page (219).png',
    'books/ninety three/page (220).png',
    'books/ninety three/page (221).png',
    'books/ninety three/page (222).png',
    'books/ninety three/page (223).png',
    'books/ninety three/page (224).png',
    'books/ninety three/page (225).png',
    'books/ninety three/page (226).png',
    'books/ninety three/page (227).png',
    'books/ninety three/page (228).png',
    'books/ninety three/page (229).png',
    'books/ninety three/page (230).png',
    'books/ninety three/page (231).png',
    'books/ninety three/page (232).png',
    'books/ninety three/page (233).png',
    'books/ninety three/page (234).png',
    'books/ninety three/page (235).png',
    'books/ninety three/page (236).png',
    'books/ninety three/page (237).png',
    'books/ninety three/page (238).png',
    'books/ninety three/page (239).png',
    'books/ninety three/page (240).png',
    'books/ninety three/page (241).png',
    'books/ninety three/page (242).png',
    'books/ninety three/page (243).png',
    'books/ninety three/page (244).png',
    'books/ninety three/page (245).png',
    'books/ninety three/page (246).png',
    'books/ninety three/page (247).png',
    'books/ninety three/page (248).png',
    'books/ninety three/page (249).png',
    'books/ninety three/page (250).png',
    'books/ninety three/page (251).png',
    'books/ninety three/page (252).png',
    'books/ninety three/page (253).png',
    'books/ninety three/page (254).png',
    'books/ninety three/page (255).png',
    'books/ninety three/page (256).png',
    'books/ninety three/page (257).png',
    'books/ninety three/page (258).png',
    'books/ninety three/page (259).png',
    'books/ninety three/page (260).png',
    'books/ninety three/page (261).png',
    'books/ninety three/page (262).png',
    'books/ninety three/page (263).png',
    'books/ninety three/page (264).png',
    'books/ninety three/page (265).png',
    'books/ninety three/page (266).png',
    'books/ninety three/page (267).png',
    'books/ninety three/page (268).png',
    'books/ninety three/page (269).png',
    'books/ninety three/page (270).png',
    'books/ninety three/page (271).png',
    'books/ninety three/page (272).png',
    'books/ninety three/page (273).png',
    'books/ninety three/page (274).png',
    'books/ninety three/page (275).png',
    'books/ninety three/page (276).png',
    'books/ninety three/page (277).png',
    'books/ninety three/page (278).png',
    'books/ninety three/page (279).png',
    'books/ninety three/page (280).png',
    'books/ninety three/page (281).png',
    'books/ninety three/page (282).png',
    'books/ninety three/page (283).png',
    'books/ninety three/page (284).png',
    'books/ninety three/page (285).png',
    'books/ninety three/page (286).png',
    'books/ninety three/page (287).png',
    'books/ninety three/page (288).png',
    'books/ninety three/page (289).png',
    'books/ninety three/page (290).png',
    'books/ninety three/page (291).png',
    'books/ninety three/page (292).png',
    'books/ninety three/page (293).png',
    'books/ninety three/page (294).png',
    'books/ninety three/page (295).png',
    'books/ninety three/page (296).png',
    'books/ninety three/page (297).png',
    'books/ninety three/page (298).png',
    'books/ninety three/page (299).png',
    'books/ninety three/page (300).png',
    'books/ninety three/page (301).png',
    'books/ninety three/page (302).png',
    'books/ninety three/page (303).png',
    'books/ninety three/page (304).png',
    'books/ninety three/page (305).png',
    'books/ninety three/page (306).png',
    'books/ninety three/page (307).png',
    'books/ninety three/page (308).png',
    'books/ninety three/page (309).png',
    'books/ninety three/page (310).png',
    'books/ninety three/page (311).png',
    'books/ninety three/page (312).png',
    'books/ninety three/page (313).png',
    'books/ninety three/page (314).png',
    'books/ninety three/page (315).png',
    'books/ninety three/page (316).png',
    'books/ninety three/page (317).png',
    'books/ninety three/page (318).png',
    'books/ninety three/page (319).png',
    'books/ninety three/page (320).png',

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
