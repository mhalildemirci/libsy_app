import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class saatleriayarlama extends StatefulWidget {
  const saatleriayarlama({Key? key}) : super(key: key);

  @override
  State<saatleriayarlama> createState() => _saatleriayarlamaState();
}

class _saatleriayarlamaState extends State<saatleriayarlama> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/saatleri ayarlama/page (1).png',
    'books/saatleri ayarlama/page (2).png',
    'books/saatleri ayarlama/page (3).png',
    'books/saatleri ayarlama/page (4).png',
    'books/saatleri ayarlama/page (5).png',
    'books/saatleri ayarlama/page (6).png',
    'books/saatleri ayarlama/page (7).png',
    'books/saatleri ayarlama/page (8).png',
    'books/saatleri ayarlama/page (9).png',
    'books/saatleri ayarlama/page (10).png',
    'books/saatleri ayarlama/page (11).png',
    'books/saatleri ayarlama/page (12).png',
    'books/saatleri ayarlama/page (13).png',
    'books/saatleri ayarlama/page (14).png',
    'books/saatleri ayarlama/page (15).png',
    'books/saatleri ayarlama/page (16).png',
    'books/saatleri ayarlama/page (17).png',
    'books/saatleri ayarlama/page (18).png',
    'books/saatleri ayarlama/page (19).png',
    'books/saatleri ayarlama/page (20).png',
    'books/saatleri ayarlama/page (21).png',
    'books/saatleri ayarlama/page (22).png',
    'books/saatleri ayarlama/page (23).png',
    'books/saatleri ayarlama/page (24).png',
    'books/saatleri ayarlama/page (25).png',
    'books/saatleri ayarlama/page (26).png',
    'books/saatleri ayarlama/page (27).png',
    'books/saatleri ayarlama/page (28).png',
    'books/saatleri ayarlama/page (29).png',
    'books/saatleri ayarlama/page (30).png',
    'books/saatleri ayarlama/page (31).png',
    'books/saatleri ayarlama/page (32).png',
    'books/saatleri ayarlama/page (33).png',
    'books/saatleri ayarlama/page (34).png',
    'books/saatleri ayarlama/page (35).png',
    'books/saatleri ayarlama/page (36).png',
    'books/saatleri ayarlama/page (37).png',
    'books/saatleri ayarlama/page (38).png',
    'books/saatleri ayarlama/page (39).png',
    'books/saatleri ayarlama/page (40).png',
    'books/saatleri ayarlama/page (41).png',
    'books/saatleri ayarlama/page (42).png',
    'books/saatleri ayarlama/page (43).png',
    'books/saatleri ayarlama/page (44).png',
    'books/saatleri ayarlama/page (45).png',
    'books/saatleri ayarlama/page (46).png',
    'books/saatleri ayarlama/page (47).png',
    'books/saatleri ayarlama/page (48).png',
    'books/saatleri ayarlama/page (49).png',
    'books/saatleri ayarlama/page (50).png',
    'books/saatleri ayarlama/page (51).png',
    'books/saatleri ayarlama/page (52).png',
    'books/saatleri ayarlama/page (53).png',
    'books/saatleri ayarlama/page (54).png',
    'books/saatleri ayarlama/page (55).png',
    'books/saatleri ayarlama/page (56).png',
    'books/saatleri ayarlama/page (57).png',
    'books/saatleri ayarlama/page (58).png',
    'books/saatleri ayarlama/page (59).png',
    'books/saatleri ayarlama/page (60).png',
    'books/saatleri ayarlama/page (61).png',
    'books/saatleri ayarlama/page (62).png',
    'books/saatleri ayarlama/page (63).png',
    'books/saatleri ayarlama/page (64).png',
    'books/saatleri ayarlama/page (65).png',
    'books/saatleri ayarlama/page (66).png',
    'books/saatleri ayarlama/page (67).png',
    'books/saatleri ayarlama/page (68).png',
    'books/saatleri ayarlama/page (69).png',
    'books/saatleri ayarlama/page (70).png',
    'books/saatleri ayarlama/page (71).png',
    'books/saatleri ayarlama/page (72).png',
    'books/saatleri ayarlama/page (73).png',
    'books/saatleri ayarlama/page (74).png',
    'books/saatleri ayarlama/page (75).png',
    'books/saatleri ayarlama/page (76).png',
    'books/saatleri ayarlama/page (77).png',
    'books/saatleri ayarlama/page (78).png',
    'books/saatleri ayarlama/page (79).png',
    'books/saatleri ayarlama/page (80).png',
    'books/saatleri ayarlama/page (81).png',
    'books/saatleri ayarlama/page (82).png',
    'books/saatleri ayarlama/page (83).png',
    'books/saatleri ayarlama/page (84).png',
    'books/saatleri ayarlama/page (85).png',
    'books/saatleri ayarlama/page (86).png',
    'books/saatleri ayarlama/page (87).png',
    'books/saatleri ayarlama/page (88).png',
    'books/saatleri ayarlama/page (89).png',
    'books/saatleri ayarlama/page (90).png',
    'books/saatleri ayarlama/page (91).png',
    'books/saatleri ayarlama/page (92).png',
    'books/saatleri ayarlama/page (93).png',
    'books/saatleri ayarlama/page (94).png',
    'books/saatleri ayarlama/page (95).png',
    'books/saatleri ayarlama/page (96).png',
    'books/saatleri ayarlama/page (97).png',
    'books/saatleri ayarlama/page (98).png',
    'books/saatleri ayarlama/page (99).png',
    'books/saatleri ayarlama/page (100).png',
    'books/saatleri ayarlama/page (101).png',
    'books/saatleri ayarlama/page (102).png',
    'books/saatleri ayarlama/page (103).png',
    'books/saatleri ayarlama/page (104).png',
    'books/saatleri ayarlama/page (105).png',
    'books/saatleri ayarlama/page (106).png',
    'books/saatleri ayarlama/page (107).png',
    'books/saatleri ayarlama/page (108).png',
    'books/saatleri ayarlama/page (109).png',
    'books/saatleri ayarlama/page (110).png',
    'books/saatleri ayarlama/page (111).png',
    'books/saatleri ayarlama/page (112).png',
    'books/saatleri ayarlama/page (113).png',
    'books/saatleri ayarlama/page (114).png',
    'books/saatleri ayarlama/page (115).png',
    'books/saatleri ayarlama/page (116).png',
    'books/saatleri ayarlama/page (117).png',
    'books/saatleri ayarlama/page (118).png',
    'books/saatleri ayarlama/page (119).png',
    'books/saatleri ayarlama/page (120).png',
    'books/saatleri ayarlama/page (121).png',
    'books/saatleri ayarlama/page (122).png',
    'books/saatleri ayarlama/page (123).png',
    'books/saatleri ayarlama/page (124).png',
    'books/saatleri ayarlama/page (125).png',
    'books/saatleri ayarlama/page (126).png',
    'books/saatleri ayarlama/page (127).png',
    'books/saatleri ayarlama/page (128).png',
    'books/saatleri ayarlama/page (129).png',
    'books/saatleri ayarlama/page (130).png',
    'books/saatleri ayarlama/page (131).png',
    'books/saatleri ayarlama/page (132).png',
    'books/saatleri ayarlama/page (133).png',
    'books/saatleri ayarlama/page (134).png',
    'books/saatleri ayarlama/page (135).png',
    'books/saatleri ayarlama/page (136).png',
    'books/saatleri ayarlama/page (137).png',
    'books/saatleri ayarlama/page (138).png',
    'books/saatleri ayarlama/page (139).png',
    'books/saatleri ayarlama/page (140).png',
    'books/saatleri ayarlama/page (141).png',
    'books/saatleri ayarlama/page (142).png',
    'books/saatleri ayarlama/page (143).png',
    'books/saatleri ayarlama/page (144).png',
    'books/saatleri ayarlama/page (145).png',
    'books/saatleri ayarlama/page (146).png',
    'books/saatleri ayarlama/page (147).png',
    'books/saatleri ayarlama/page (148).png',
    'books/saatleri ayarlama/page (149).png',
    'books/saatleri ayarlama/page (150).png',
    'books/saatleri ayarlama/page (151).png',
    'books/saatleri ayarlama/page (152).png',
    'books/saatleri ayarlama/page (153).png',
    'books/saatleri ayarlama/page (154).png',
    'books/saatleri ayarlama/page (155).png',
    'books/saatleri ayarlama/page (156).png',
    'books/saatleri ayarlama/page (157).png',
    'books/saatleri ayarlama/page (158).png',
    'books/saatleri ayarlama/page (159).png',
    'books/saatleri ayarlama/page (160).png',
    'books/saatleri ayarlama/page (161).png',
    'books/saatleri ayarlama/page (162).png',
    'books/saatleri ayarlama/page (163).png',
    'books/saatleri ayarlama/page (164).png',
    'books/saatleri ayarlama/page (165).png',
    'books/saatleri ayarlama/page (166).png',
    'books/saatleri ayarlama/page (167).png',
    'books/saatleri ayarlama/page (168).png',
    'books/saatleri ayarlama/page (169).png',
    'books/saatleri ayarlama/page (170).png',
    'books/saatleri ayarlama/page (171).png',
    'books/saatleri ayarlama/page (172).png',
    'books/saatleri ayarlama/page (173).png',
    'books/saatleri ayarlama/page (174).png',
    'books/saatleri ayarlama/page (175).png',
    'books/saatleri ayarlama/page (176).png',
    'books/saatleri ayarlama/page (177).png',
    'books/saatleri ayarlama/page (178).png',
    'books/saatleri ayarlama/page (179).png',
    'books/saatleri ayarlama/page (180).png',
    'books/saatleri ayarlama/page (181).png',
    'books/saatleri ayarlama/page (182).png',
    'books/saatleri ayarlama/page (183).png',
    'books/saatleri ayarlama/page (184).png',
    'books/saatleri ayarlama/page (185).png',
    'books/saatleri ayarlama/page (186).png',
    'books/saatleri ayarlama/page (187).png',
    'books/saatleri ayarlama/page (188).png',
    'books/saatleri ayarlama/page (189).png',
    'books/saatleri ayarlama/page (190).png',
    'books/saatleri ayarlama/page (191).png',
    'books/saatleri ayarlama/page (192).png',
    'books/saatleri ayarlama/page (193).png',
    'books/saatleri ayarlama/page (194).png',
    'books/saatleri ayarlama/page (195).png',
    'books/saatleri ayarlama/page (196).png',
    'books/saatleri ayarlama/page (197).png',
    'books/saatleri ayarlama/page (198).png',
    'books/saatleri ayarlama/page (199).png',
    'books/saatleri ayarlama/page (200).png',
    'books/saatleri ayarlama/page (201).png',
    'books/saatleri ayarlama/page (202).png',
    'books/saatleri ayarlama/page (203).png',
    'books/saatleri ayarlama/page (204).png',
    'books/saatleri ayarlama/page (205).png',
    'books/saatleri ayarlama/page (206).png',
    'books/saatleri ayarlama/page (207).png',
    'books/saatleri ayarlama/page (208).png',
    'books/saatleri ayarlama/page (209).png',
    'books/saatleri ayarlama/page (210).png',
    'books/saatleri ayarlama/page (211).png',
    'books/saatleri ayarlama/page (212).png',
    'books/saatleri ayarlama/page (213).png',
    'books/saatleri ayarlama/page (214).png',
    'books/saatleri ayarlama/page (215).png',
    'books/saatleri ayarlama/page (216).png',
    'books/saatleri ayarlama/page (217).png',
    'books/saatleri ayarlama/page (218).png',
    'books/saatleri ayarlama/page (219).png',
    'books/saatleri ayarlama/page (220).png',
    'books/saatleri ayarlama/page (221).png',
    'books/saatleri ayarlama/page (222).png',
    'books/saatleri ayarlama/page (223).png',
    'books/saatleri ayarlama/page (224).png',
    'books/saatleri ayarlama/page (225).png',
    'books/saatleri ayarlama/page (226).png',
    'books/saatleri ayarlama/page (227).png',
    'books/saatleri ayarlama/page (228).png',
    'books/saatleri ayarlama/page (229).png',
    'books/saatleri ayarlama/page (230).png',
    'books/saatleri ayarlama/page (231).png',
    'books/saatleri ayarlama/page (232).png',
    'books/saatleri ayarlama/page (233).png',
    'books/saatleri ayarlama/page (234).png',
    'books/saatleri ayarlama/page (235).png',
    'books/saatleri ayarlama/page (236).png',
    'books/saatleri ayarlama/page (237).png',
    'books/saatleri ayarlama/page (238).png',
    'books/saatleri ayarlama/page (239).png',
    'books/saatleri ayarlama/page (240).png',
    'books/saatleri ayarlama/page (241).png',
    'books/saatleri ayarlama/page (242).png',
    'books/saatleri ayarlama/page (243).png',
    'books/saatleri ayarlama/page (244).png',
    'books/saatleri ayarlama/page (245).png',
    'books/saatleri ayarlama/page (246).png',
    'books/saatleri ayarlama/page (247).png',
    'books/saatleri ayarlama/page (248).png',
    'books/saatleri ayarlama/page (249).png',
    'books/saatleri ayarlama/page (250).png',
    'books/saatleri ayarlama/page (251).png',
    'books/saatleri ayarlama/page (252).png',
    'books/saatleri ayarlama/page (253).png',
    'books/saatleri ayarlama/page (254).png',
    'books/saatleri ayarlama/page (255).png',
    'books/saatleri ayarlama/page (256).png',
    'books/saatleri ayarlama/page (257).png',
    'books/saatleri ayarlama/page (258).png',
    'books/saatleri ayarlama/page (259).png',
    'books/saatleri ayarlama/page (260).png',
    'books/saatleri ayarlama/page (261).png',
    'books/saatleri ayarlama/page (262).png',
    'books/saatleri ayarlama/page (263).png',
    'books/saatleri ayarlama/page (264).png',
    'books/saatleri ayarlama/page (265).png',
    'books/saatleri ayarlama/page (266).png',
    'books/saatleri ayarlama/page (267).png',
    'books/saatleri ayarlama/page (268).png',
    'books/saatleri ayarlama/page (269).png',
    'books/saatleri ayarlama/page (270).png',
    'books/saatleri ayarlama/page (271).png',
    'books/saatleri ayarlama/page (272).png',
    'books/saatleri ayarlama/page (273).png',
    'books/saatleri ayarlama/page (274).png',
    'books/saatleri ayarlama/page (275).png',
    'books/saatleri ayarlama/page (276).png',
    'books/saatleri ayarlama/page (277).png',
    'books/saatleri ayarlama/page (278).png',
    'books/saatleri ayarlama/page (279).png',
    'books/saatleri ayarlama/page (280).png',
    'books/saatleri ayarlama/page (281).png',
    'books/saatleri ayarlama/page (282).png',
    'books/saatleri ayarlama/page (283).png',
    'books/saatleri ayarlama/page (284).png',
    'books/saatleri ayarlama/page (285).png',
    'books/saatleri ayarlama/page (286).png',
    'books/saatleri ayarlama/page (287).png',
    'books/saatleri ayarlama/page (288).png',
    'books/saatleri ayarlama/page (289).png',
    'books/saatleri ayarlama/page (290).png',
    'books/saatleri ayarlama/page (291).png',
    'books/saatleri ayarlama/page (292).png',
    'books/saatleri ayarlama/page (293).png',
    'books/saatleri ayarlama/page (294).png',
    'books/saatleri ayarlama/page (295).png',
    'books/saatleri ayarlama/page (296).png',
    'books/saatleri ayarlama/page (297).png',
    'books/saatleri ayarlama/page (298).png',
    'books/saatleri ayarlama/page (299).png',
    'books/saatleri ayarlama/page (300).png',
    'books/saatleri ayarlama/page (301).png',
    'books/saatleri ayarlama/page (302).png',
    'books/saatleri ayarlama/page (303).png',
    'books/saatleri ayarlama/page (304).png',
    'books/saatleri ayarlama/page (305).png',
    'books/saatleri ayarlama/page (306).png',
    'books/saatleri ayarlama/page (307).png',
    'books/saatleri ayarlama/page (308).png',
    'books/saatleri ayarlama/page (309).png',
    'books/saatleri ayarlama/page (310).png',
    'books/saatleri ayarlama/page (311).png',
    'books/saatleri ayarlama/page (312).png',
    'books/saatleri ayarlama/page (313).png',
    'books/saatleri ayarlama/page (314).png',
    'books/saatleri ayarlama/page (315).png',
    'books/saatleri ayarlama/page (316).png',
    'books/saatleri ayarlama/page (317).png',
    'books/saatleri ayarlama/page (318).png',
    'books/saatleri ayarlama/page (319).png',
    'books/saatleri ayarlama/page (320).png',
    'books/saatleri ayarlama/page (321).png',
    'books/saatleri ayarlama/page (322).png',
    'books/saatleri ayarlama/page (323).png',
    'books/saatleri ayarlama/page (324).png',
    'books/saatleri ayarlama/page (325).png',
    'books/saatleri ayarlama/page (326).png',
    'books/saatleri ayarlama/page (327).png',
    'books/saatleri ayarlama/page (328).png',
    'books/saatleri ayarlama/page (329).png',
    'books/saatleri ayarlama/page (330).png',
    'books/saatleri ayarlama/page (331).png',
    'books/saatleri ayarlama/page (332).png',
    'books/saatleri ayarlama/page (333).png',
    'books/saatleri ayarlama/page (334).png',
    'books/saatleri ayarlama/page (335).png',

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
