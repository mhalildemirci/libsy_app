import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class thomasjefferson extends StatefulWidget {
  const thomasjefferson({Key? key}) : super(key: key);

  @override
  State<thomasjefferson> createState() => _thomasjeffersonState();
}

class _thomasjeffersonState extends State<thomasjefferson> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/thomas jefferson/page (1).png',
    'books/thomas jefferson/page (2).png',
    'books/thomas jefferson/page (3).png',
    'books/thomas jefferson/page (4).png',
    'books/thomas jefferson/page (5).png',
    'books/thomas jefferson/page (6).png',
    'books/thomas jefferson/page (7).png',
    'books/thomas jefferson/page (8).png',
    'books/thomas jefferson/page (9).png',
    'books/thomas jefferson/page (10).png',
    'books/thomas jefferson/page (11).png',
    'books/thomas jefferson/page (12).png',
    'books/thomas jefferson/page (13).png',
    'books/thomas jefferson/page (14).png',
    'books/thomas jefferson/page (15).png',
    'books/thomas jefferson/page (16).png',
    'books/thomas jefferson/page (17).png',
    'books/thomas jefferson/page (18).png',
    'books/thomas jefferson/page (19).png',
    'books/thomas jefferson/page (20).png',
    'books/thomas jefferson/page (21).png',
    'books/thomas jefferson/page (22).png',
    'books/thomas jefferson/page (23).png',
    'books/thomas jefferson/page (24).png',
    'books/thomas jefferson/page (25).png',
    'books/thomas jefferson/page (26).png',
    'books/thomas jefferson/page (27).png',
    'books/thomas jefferson/page (28).png',
    'books/thomas jefferson/page (29).png',
    'books/thomas jefferson/page (30).png',
    'books/thomas jefferson/page (31).png',
    'books/thomas jefferson/page (32).png',
    'books/thomas jefferson/page (33).png',
    'books/thomas jefferson/page (34).png',
    'books/thomas jefferson/page (35).png',
    'books/thomas jefferson/page (36).png',
    'books/thomas jefferson/page (37).png',
    'books/thomas jefferson/page (38).png',
    'books/thomas jefferson/page (39).png',
    'books/thomas jefferson/page (40).png',
    'books/thomas jefferson/page (41).png',
    'books/thomas jefferson/page (42).png',
    'books/thomas jefferson/page (43).png',
    'books/thomas jefferson/page (44).png',
    'books/thomas jefferson/page (45).png',
    'books/thomas jefferson/page (46).png',
    'books/thomas jefferson/page (47).png',
    'books/thomas jefferson/page (48).png',
    'books/thomas jefferson/page (49).png',
    'books/thomas jefferson/page (50).png',
    'books/thomas jefferson/page (51).png',
    'books/thomas jefferson/page (52).png',
    'books/thomas jefferson/page (53).png',
    'books/thomas jefferson/page (54).png',
    'books/thomas jefferson/page (55).png',
    'books/thomas jefferson/page (56).png',
    'books/thomas jefferson/page (57).png',
    'books/thomas jefferson/page (58).png',
    'books/thomas jefferson/page (59).png',
    'books/thomas jefferson/page (60).png',
    'books/thomas jefferson/page (61).png',
    'books/thomas jefferson/page (62).png',
    'books/thomas jefferson/page (63).png',
    'books/thomas jefferson/page (64).png',
    'books/thomas jefferson/page (65).png',
    'books/thomas jefferson/page (66).png',
    'books/thomas jefferson/page (67).png',
    'books/thomas jefferson/page (68).png',
    'books/thomas jefferson/page (69).png',
    'books/thomas jefferson/page (70).png',
    'books/thomas jefferson/page (71).png',
    'books/thomas jefferson/page (72).png',
    'books/thomas jefferson/page (73).png',
    'books/thomas jefferson/page (74).png',
    'books/thomas jefferson/page (75).png',
    'books/thomas jefferson/page (76).png',
    'books/thomas jefferson/page (77).png',
    'books/thomas jefferson/page (78).png',
    'books/thomas jefferson/page (79).png',
    'books/thomas jefferson/page (80).png',
    'books/thomas jefferson/page (81).png',
    'books/thomas jefferson/page (82).png',
    'books/thomas jefferson/page (83).png',
    'books/thomas jefferson/page (84).png',
    'books/thomas jefferson/page (85).png',
    'books/thomas jefferson/page (86).png',
    'books/thomas jefferson/page (87).png',
    'books/thomas jefferson/page (88).png',
    'books/thomas jefferson/page (89).png',
    'books/thomas jefferson/page (90).png',
    'books/thomas jefferson/page (91).png',
    'books/thomas jefferson/page (92).png',
    'books/thomas jefferson/page (93).png',
    'books/thomas jefferson/page (94).png',
    'books/thomas jefferson/page (95).png',
    'books/thomas jefferson/page (96).png',
    'books/thomas jefferson/page (97).png',
    'books/thomas jefferson/page (98).png',
    'books/thomas jefferson/page (99).png',
    'books/thomas jefferson/page (100).png',
    'books/thomas jefferson/page (101).png',
    'books/thomas jefferson/page (102).png',
    'books/thomas jefferson/page (103).png',
    'books/thomas jefferson/page (104).png',
    'books/thomas jefferson/page (105).png',
    'books/thomas jefferson/page (106).png',
    'books/thomas jefferson/page (107).png',
    'books/thomas jefferson/page (108).png',
    'books/thomas jefferson/page (109).png',
    'books/thomas jefferson/page (110).png',
    'books/thomas jefferson/page (111).png',
    'books/thomas jefferson/page (112).png',
    'books/thomas jefferson/page (113).png',
    'books/thomas jefferson/page (114).png',
    'books/thomas jefferson/page (115).png',
    'books/thomas jefferson/page (116).png',
    'books/thomas jefferson/page (117).png',
    'books/thomas jefferson/page (118).png',
    'books/thomas jefferson/page (119).png',
    'books/thomas jefferson/page (120).png',
    'books/thomas jefferson/page (121).png',
    'books/thomas jefferson/page (122).png',
    'books/thomas jefferson/page (123).png',
    'books/thomas jefferson/page (124).png',
    'books/thomas jefferson/page (125).png',
    'books/thomas jefferson/page (126).png',
    'books/thomas jefferson/page (127).png',
    'books/thomas jefferson/page (128).png',
    'books/thomas jefferson/page (129).png',
    'books/thomas jefferson/page (130).png',
    'books/thomas jefferson/page (131).png',
    'books/thomas jefferson/page (132).png',
    'books/thomas jefferson/page (133).png',
    'books/thomas jefferson/page (134).png',
    'books/thomas jefferson/page (135).png',
    'books/thomas jefferson/page (136).png',
    'books/thomas jefferson/page (137).png',
    'books/thomas jefferson/page (138).png',
    'books/thomas jefferson/page (139).png',
    'books/thomas jefferson/page (140).png',
    'books/thomas jefferson/page (141).png',
    'books/thomas jefferson/page (142).png',
    'books/thomas jefferson/page (143).png',
    'books/thomas jefferson/page (144).png',
    'books/thomas jefferson/page (145).png',
    'books/thomas jefferson/page (146).png',
    'books/thomas jefferson/page (147).png',
    'books/thomas jefferson/page (148).png',
    'books/thomas jefferson/page (149).png',
    'books/thomas jefferson/page (150).png',
    'books/thomas jefferson/page (151).png',
    'books/thomas jefferson/page (152).png',
    'books/thomas jefferson/page (153).png',
    'books/thomas jefferson/page (154).png',
    'books/thomas jefferson/page (155).png',
    'books/thomas jefferson/page (156).png',
    'books/thomas jefferson/page (157).png',
    'books/thomas jefferson/page (158).png',
    'books/thomas jefferson/page (159).png',
    'books/thomas jefferson/page (160).png',
    'books/thomas jefferson/page (161).png',
    'books/thomas jefferson/page (162).png',
    'books/thomas jefferson/page (163).png',
    'books/thomas jefferson/page (164).png',
    'books/thomas jefferson/page (165).png',
    'books/thomas jefferson/page (166).png',
    'books/thomas jefferson/page (167).png',
    'books/thomas jefferson/page (168).png',
    'books/thomas jefferson/page (169).png',
    'books/thomas jefferson/page (170).png',
    'books/thomas jefferson/page (171).png',
    'books/thomas jefferson/page (172).png',
    'books/thomas jefferson/page (173).png',
    'books/thomas jefferson/page (174).png',
    'books/thomas jefferson/page (175).png',
    'books/thomas jefferson/page (176).png',
    'books/thomas jefferson/page (177).png',
    'books/thomas jefferson/page (178).png',
    'books/thomas jefferson/page (179).png',
    'books/thomas jefferson/page (180).png',
    'books/thomas jefferson/page (181).png',
    'books/thomas jefferson/page (182).png',
    'books/thomas jefferson/page (183).png',
    'books/thomas jefferson/page (184).png',
    'books/thomas jefferson/page (185).png',
    'books/thomas jefferson/page (186).png',
    'books/thomas jefferson/page (187).png',
    'books/thomas jefferson/page (188).png',
    'books/thomas jefferson/page (189).png',
    'books/thomas jefferson/page (190).png',
    'books/thomas jefferson/page (191).png',
    'books/thomas jefferson/page (192).png',
    'books/thomas jefferson/page (193).png',
    'books/thomas jefferson/page (194).png',
    'books/thomas jefferson/page (195).png',
    'books/thomas jefferson/page (196).png',
    'books/thomas jefferson/page (197).png',
    'books/thomas jefferson/page (198).png',
    'books/thomas jefferson/page (199).png',
    'books/thomas jefferson/page (200).png',
    'books/thomas jefferson/page (201).png',
    'books/thomas jefferson/page (202).png',
    'books/thomas jefferson/page (203).png',
    'books/thomas jefferson/page (204).png',
    'books/thomas jefferson/page (205).png',
    'books/thomas jefferson/page (206).png',
    'books/thomas jefferson/page (207).png',
    'books/thomas jefferson/page (208).png',
    'books/thomas jefferson/page (209).png',
    'books/thomas jefferson/page (210).png',
    'books/thomas jefferson/page (211).png',
    'books/thomas jefferson/page (212).png',
    'books/thomas jefferson/page (213).png',
    'books/thomas jefferson/page (214).png',
    'books/thomas jefferson/page (215).png',
    'books/thomas jefferson/page (216).png',
    'books/thomas jefferson/page (217).png',
    'books/thomas jefferson/page (218).png',
    'books/thomas jefferson/page (219).png',
    'books/thomas jefferson/page (220).png',
    'books/thomas jefferson/page (221).png',
    'books/thomas jefferson/page (222).png',
    'books/thomas jefferson/page (223).png',
    'books/thomas jefferson/page (224).png',
    'books/thomas jefferson/page (225).png',
    'books/thomas jefferson/page (226).png',
    'books/thomas jefferson/page (227).png',
    'books/thomas jefferson/page (228).png',
    'books/thomas jefferson/page (229).png',
    'books/thomas jefferson/page (230).png',
    'books/thomas jefferson/page (231).png',
    'books/thomas jefferson/page (232).png',
    'books/thomas jefferson/page (233).png',
    'books/thomas jefferson/page (234).png',
    'books/thomas jefferson/page (235).png',
    'books/thomas jefferson/page (236).png',
    'books/thomas jefferson/page (237).png',
    'books/thomas jefferson/page (238).png',
    'books/thomas jefferson/page (239).png',
    'books/thomas jefferson/page (240).png',
    'books/thomas jefferson/page (241).png',
    'books/thomas jefferson/page (242).png',
    'books/thomas jefferson/page (243).png',
    'books/thomas jefferson/page (244).png',
    'books/thomas jefferson/page (245).png',
    'books/thomas jefferson/page (246).png',
    'books/thomas jefferson/page (247).png',
    'books/thomas jefferson/page (248).png',
    'books/thomas jefferson/page (249).png',
    'books/thomas jefferson/page (250).png',
    'books/thomas jefferson/page (251).png',
    'books/thomas jefferson/page (252).png',
    'books/thomas jefferson/page (253).png',
    'books/thomas jefferson/page (254).png',
    'books/thomas jefferson/page (255).png',
    'books/thomas jefferson/page (256).png',
    'books/thomas jefferson/page (257).png',
    'books/thomas jefferson/page (258).png',
    'books/thomas jefferson/page (259).png',
    'books/thomas jefferson/page (260).png',
    'books/thomas jefferson/page (261).png',
    'books/thomas jefferson/page (262).png',
    'books/thomas jefferson/page (263).png',
    'books/thomas jefferson/page (264).png',
    'books/thomas jefferson/page (265).png',
    'books/thomas jefferson/page (266).png',
    'books/thomas jefferson/page (267).png',
    'books/thomas jefferson/page (268).png',
    'books/thomas jefferson/page (269).png',
    'books/thomas jefferson/page (270).png',
    'books/thomas jefferson/page (271).png',
    'books/thomas jefferson/page (272).png',
    'books/thomas jefferson/page (273).png',
    'books/thomas jefferson/page (274).png',
    'books/thomas jefferson/page (275).png',
    'books/thomas jefferson/page (276).png',
    'books/thomas jefferson/page (277).png',
    'books/thomas jefferson/page (278).png',
    'books/thomas jefferson/page (279).png',
    'books/thomas jefferson/page (280).png',
    'books/thomas jefferson/page (281).png',
    'books/thomas jefferson/page (282).png',
    'books/thomas jefferson/page (283).png',
    'books/thomas jefferson/page (284).png',
    'books/thomas jefferson/page (285).png',
    'books/thomas jefferson/page (286).png',
    'books/thomas jefferson/page (287).png',
    'books/thomas jefferson/page (288).png',
    'books/thomas jefferson/page (289).png',
    'books/thomas jefferson/page (290).png',
    'books/thomas jefferson/page (291).png',
    'books/thomas jefferson/page (292).png',
    'books/thomas jefferson/page (293).png',
    'books/thomas jefferson/page (294).png',
    'books/thomas jefferson/page (295).png',
    'books/thomas jefferson/page (296).png',
    'books/thomas jefferson/page (297).png',
    'books/thomas jefferson/page (298).png',
    'books/thomas jefferson/page (299).png',
    'books/thomas jefferson/page (300).png',
    'books/thomas jefferson/page (301).png',
    'books/thomas jefferson/page (302).png',
    'books/thomas jefferson/page (303).png',
    'books/thomas jefferson/page (304).png',
    'books/thomas jefferson/page (305).png',
    'books/thomas jefferson/page (306).png',
    'books/thomas jefferson/page (307).png',
    'books/thomas jefferson/page (308).png',
    'books/thomas jefferson/page (309).png',
    'books/thomas jefferson/page (310).png',
    'books/thomas jefferson/page (311).png',
    'books/thomas jefferson/page (312).png',
    'books/thomas jefferson/page (313).png',
    'books/thomas jefferson/page (314).png',
    'books/thomas jefferson/page (315).png',
    'books/thomas jefferson/page (316).png',
    'books/thomas jefferson/page (317).png',
    'books/thomas jefferson/page (318).png',
    'books/thomas jefferson/page (319).png',
    'books/thomas jefferson/page (320).png',
    'books/thomas jefferson/page (321).png',
    'books/thomas jefferson/page (322).png',
    'books/thomas jefferson/page (323).png',
    'books/thomas jefferson/page (324).png',
    'books/thomas jefferson/page (325).png',
    'books/thomas jefferson/page (326).png',
    'books/thomas jefferson/page (327).png',
    'books/thomas jefferson/page (328).png',
    'books/thomas jefferson/page (329).png',
    'books/thomas jefferson/page (330).png',
    'books/thomas jefferson/page (331).png',

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
