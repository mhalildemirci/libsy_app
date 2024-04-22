import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ambassadors extends StatefulWidget {
  const ambassadors({Key? key}) : super(key: key);

  @override
  State<ambassadors> createState() => _ambassadorsState();
}

class _ambassadorsState extends State<ambassadors> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/ambassadors/page (1).png',
    'books/ambassadors/page (2).png',
    'books/ambassadors/page (3).png',
    'books/ambassadors/page (4).png',
    'books/ambassadors/page (5).png',
    'books/ambassadors/page (6).png',
    'books/ambassadors/page (7).png',
    'books/ambassadors/page (8).png',
    'books/ambassadors/page (9).png',
    'books/ambassadors/page (10).png',
    'books/ambassadors/page (11).png',
    'books/ambassadors/page (12).png',
    'books/ambassadors/page (13).png',
    'books/ambassadors/page (14).png',
    'books/ambassadors/page (15).png',
    'books/ambassadors/page (16).png',
    'books/ambassadors/page (17).png',
    'books/ambassadors/page (18).png',
    'books/ambassadors/page (19).png',
    'books/ambassadors/page (20).png',
    'books/ambassadors/page (21).png',
    'books/ambassadors/page (22).png',
    'books/ambassadors/page (23).png',
    'books/ambassadors/page (24).png',
    'books/ambassadors/page (25).png',
    'books/ambassadors/page (26).png',
    'books/ambassadors/page (27).png',
    'books/ambassadors/page (28).png',
    'books/ambassadors/page (29).png',
    'books/ambassadors/page (30).png',
    'books/ambassadors/page (31).png',
    'books/ambassadors/page (32).png',
    'books/ambassadors/page (33).png',
    'books/ambassadors/page (34).png',
    'books/ambassadors/page (35).png',
    'books/ambassadors/page (36).png',
    'books/ambassadors/page (37).png',
    'books/ambassadors/page (38).png',
    'books/ambassadors/page (39).png',
    'books/ambassadors/page (40).png',
    'books/ambassadors/page (41).png',
    'books/ambassadors/page (42).png',
    'books/ambassadors/page (43).png',
    'books/ambassadors/page (44).png',
    'books/ambassadors/page (45).png',
    'books/ambassadors/page (46).png',
    'books/ambassadors/page (47).png',
    'books/ambassadors/page (48).png',
    'books/ambassadors/page (49).png',
    'books/ambassadors/page (50).png',
    'books/ambassadors/page (51).png',
    'books/ambassadors/page (52).png',
    'books/ambassadors/page (53).png',
    'books/ambassadors/page (54).png',
    'books/ambassadors/page (55).png',
    'books/ambassadors/page (56).png',
    'books/ambassadors/page (57).png',
    'books/ambassadors/page (58).png',
    'books/ambassadors/page (59).png',
    'books/ambassadors/page (60).png',
    'books/ambassadors/page (61).png',
    'books/ambassadors/page (62).png',
    'books/ambassadors/page (63).png',
    'books/ambassadors/page (64).png',
    'books/ambassadors/page (65).png',
    'books/ambassadors/page (66).png',
    'books/ambassadors/page (67).png',
    'books/ambassadors/page (68).png',
    'books/ambassadors/page (69).png',
    'books/ambassadors/page (70).png',
    'books/ambassadors/page (71).png',
    'books/ambassadors/page (72).png',
    'books/ambassadors/page (73).png',
    'books/ambassadors/page (74).png',
    'books/ambassadors/page (75).png',
    'books/ambassadors/page (76).png',
    'books/ambassadors/page (77).png',
    'books/ambassadors/page (78).png',
    'books/ambassadors/page (79).png',
    'books/ambassadors/page (80).png',
    'books/ambassadors/page (81).png',
    'books/ambassadors/page (82).png',
    'books/ambassadors/page (83).png',
    'books/ambassadors/page (84).png',
    'books/ambassadors/page (85).png',
    'books/ambassadors/page (86).png',
    'books/ambassadors/page (87).png',
    'books/ambassadors/page (88).png',
    'books/ambassadors/page (89).png',
    'books/ambassadors/page (90).png',
    'books/ambassadors/page (91).png',
    'books/ambassadors/page (92).png',
    'books/ambassadors/page (93).png',
    'books/ambassadors/page (94).png',
    'books/ambassadors/page (95).png',
    'books/ambassadors/page (96).png',
    'books/ambassadors/page (97).png',
    'books/ambassadors/page (98).png',
    'books/ambassadors/page (99).png',
    'books/ambassadors/page (100).png',
    'books/ambassadors/page (101).png',
    'books/ambassadors/page (102).png',
    'books/ambassadors/page (103).png',
    'books/ambassadors/page (104).png',
    'books/ambassadors/page (105).png',
    'books/ambassadors/page (106).png',
    'books/ambassadors/page (107).png',
    'books/ambassadors/page (108).png',
    'books/ambassadors/page (109).png',
    'books/ambassadors/page (110).png',
    'books/ambassadors/page (111).png',
    'books/ambassadors/page (112).png',
    'books/ambassadors/page (113).png',
    'books/ambassadors/page (114).png',
    'books/ambassadors/page (115).png',
    'books/ambassadors/page (116).png',
    'books/ambassadors/page (117).png',
    'books/ambassadors/page (118).png',
    'books/ambassadors/page (119).png',
    'books/ambassadors/page (120).png',
    'books/ambassadors/page (121).png',
    'books/ambassadors/page (122).png',
    'books/ambassadors/page (123).png',
    'books/ambassadors/page (124).png',
    'books/ambassadors/page (125).png',
    'books/ambassadors/page (126).png',
    'books/ambassadors/page (127).png',
    'books/ambassadors/page (128).png',
    'books/ambassadors/page (129).png',
    'books/ambassadors/page (130).png',
    'books/ambassadors/page (131).png',
    'books/ambassadors/page (132).png',
    'books/ambassadors/page (133).png',
    'books/ambassadors/page (134).png',
    'books/ambassadors/page (135).png',
    'books/ambassadors/page (136).png',
    'books/ambassadors/page (137).png',
    'books/ambassadors/page (138).png',
    'books/ambassadors/page (139).png',
    'books/ambassadors/page (140).png',
    'books/ambassadors/page (141).png',
    'books/ambassadors/page (142).png',
    'books/ambassadors/page (143).png',
    'books/ambassadors/page (144).png',
    'books/ambassadors/page (145).png',
    'books/ambassadors/page (146).png',
    'books/ambassadors/page (147).png',
    'books/ambassadors/page (148).png',
    'books/ambassadors/page (149).png',
    'books/ambassadors/page (150).png',
    'books/ambassadors/page (151).png',
    'books/ambassadors/page (152).png',
    'books/ambassadors/page (153).png',
    'books/ambassadors/page (154).png',
    'books/ambassadors/page (155).png',
    'books/ambassadors/page (156).png',
    'books/ambassadors/page (157).png',
    'books/ambassadors/page (158).png',
    'books/ambassadors/page (159).png',
    'books/ambassadors/page (160).png',
    'books/ambassadors/page (161).png',
    'books/ambassadors/page (162).png',
    'books/ambassadors/page (163).png',
    'books/ambassadors/page (164).png',
    'books/ambassadors/page (165).png',
    'books/ambassadors/page (166).png',
    'books/ambassadors/page (167).png',
    'books/ambassadors/page (168).png',
    'books/ambassadors/page (169).png',
    'books/ambassadors/page (170).png',
    'books/ambassadors/page (171).png',
    'books/ambassadors/page (172).png',
    'books/ambassadors/page (173).png',
    'books/ambassadors/page (174).png',
    'books/ambassadors/page (175).png',
    'books/ambassadors/page (176).png',
    'books/ambassadors/page (177).png',
    'books/ambassadors/page (178).png',
    'books/ambassadors/page (179).png',
    'books/ambassadors/page (180).png',
    'books/ambassadors/page (181).png',
    'books/ambassadors/page (182).png',
    'books/ambassadors/page (183).png',
    'books/ambassadors/page (184).png',
    'books/ambassadors/page (185).png',
    'books/ambassadors/page (186).png',
    'books/ambassadors/page (187).png',
    'books/ambassadors/page (188).png',
    'books/ambassadors/page (189).png',
    'books/ambassadors/page (190).png',
    'books/ambassadors/page (191).png',
    'books/ambassadors/page (192).png',
    'books/ambassadors/page (193).png',
    'books/ambassadors/page (194).png',
    'books/ambassadors/page (195).png',
    'books/ambassadors/page (196).png',
    'books/ambassadors/page (197).png',
    'books/ambassadors/page (198).png',
    'books/ambassadors/page (199).png',
    'books/ambassadors/page (200).png',
    'books/ambassadors/page (201).png',
    'books/ambassadors/page (202).png',
    'books/ambassadors/page (203).png',
    'books/ambassadors/page (204).png',
    'books/ambassadors/page (205).png',
    'books/ambassadors/page (206).png',
    'books/ambassadors/page (207).png',
    'books/ambassadors/page (208).png',
    'books/ambassadors/page (209).png',
    'books/ambassadors/page (210).png',
    'books/ambassadors/page (211).png',
    'books/ambassadors/page (212).png',
    'books/ambassadors/page (213).png',
    'books/ambassadors/page (214).png',
    'books/ambassadors/page (215).png',
    'books/ambassadors/page (216).png',
    'books/ambassadors/page (217).png',
    'books/ambassadors/page (218).png',
    'books/ambassadors/page (219).png',
    'books/ambassadors/page (220).png',
    'books/ambassadors/page (221).png',
    'books/ambassadors/page (222).png',
    'books/ambassadors/page (223).png',
    'books/ambassadors/page (224).png',
    'books/ambassadors/page (225).png',
    'books/ambassadors/page (226).png',
    'books/ambassadors/page (227).png',
    'books/ambassadors/page (228).png',
    'books/ambassadors/page (229).png',
    'books/ambassadors/page (230).png',
    'books/ambassadors/page (231).png',
    'books/ambassadors/page (232).png',
    'books/ambassadors/page (233).png',
    'books/ambassadors/page (234).png',
    'books/ambassadors/page (235).png',
    'books/ambassadors/page (236).png',
    'books/ambassadors/page (237).png',
    'books/ambassadors/page (238).png',
    'books/ambassadors/page (239).png',
    'books/ambassadors/page (240).png',
    'books/ambassadors/page (241).png',
    'books/ambassadors/page (242).png',
    'books/ambassadors/page (243).png',
    'books/ambassadors/page (244).png',
    'books/ambassadors/page (245).png',
    'books/ambassadors/page (246).png',
    'books/ambassadors/page (247).png',
    'books/ambassadors/page (248).png',
    'books/ambassadors/page (249).png',
    'books/ambassadors/page (250).png',
    'books/ambassadors/page (251).png',
    'books/ambassadors/page (252).png',
    'books/ambassadors/page (253).png',
    'books/ambassadors/page (254).png',
    'books/ambassadors/page (255).png',
    'books/ambassadors/page (256).png',
    'books/ambassadors/page (257).png',
    'books/ambassadors/page (258).png',
    'books/ambassadors/page (259).png',
    'books/ambassadors/page (260).png',
    'books/ambassadors/page (261).png',
    'books/ambassadors/page (262).png',
    'books/ambassadors/page (263).png',
    'books/ambassadors/page (264).png',
    'books/ambassadors/page (265).png',
    'books/ambassadors/page (266).png',
    'books/ambassadors/page (267).png',
    'books/ambassadors/page (268).png',
    'books/ambassadors/page (269).png',
    'books/ambassadors/page (270).png',
    'books/ambassadors/page (271).png',
    'books/ambassadors/page (272).png',
    'books/ambassadors/page (273).png',
    'books/ambassadors/page (274).png',
    'books/ambassadors/page (275).png',
    'books/ambassadors/page (276).png',
    'books/ambassadors/page (277).png',
    'books/ambassadors/page (278).png',
    'books/ambassadors/page (279).png',
    'books/ambassadors/page (280).png',
    'books/ambassadors/page (281).png',
    'books/ambassadors/page (282).png',
    'books/ambassadors/page (283).png',
    'books/ambassadors/page (284).png',
    'books/ambassadors/page (285).png',
    'books/ambassadors/page (286).png',
    'books/ambassadors/page (287).png',
    'books/ambassadors/page (288).png',
    'books/ambassadors/page (289).png',
    'books/ambassadors/page (290).png',
    'books/ambassadors/page (291).png',
    'books/ambassadors/page (292).png',
    'books/ambassadors/page (293).png',
    'books/ambassadors/page (294).png',
    'books/ambassadors/page (295).png',
    'books/ambassadors/page (296).png',
    'books/ambassadors/page (297).png',
    'books/ambassadors/page (298).png',
    'books/ambassadors/page (299).png',
    'books/ambassadors/page (300).png',
    'books/ambassadors/page (301).png',
    'books/ambassadors/page (302).png',
    'books/ambassadors/page (303).png',
    'books/ambassadors/page (304).png',
    'books/ambassadors/page (305).png',
    'books/ambassadors/page (306).png',
    'books/ambassadors/page (307).png',
    'books/ambassadors/page (308).png',
    'books/ambassadors/page (309).png',
    'books/ambassadors/page (310).png',
    'books/ambassadors/page (311).png',
    'books/ambassadors/page (312).png',
    'books/ambassadors/page (313).png',
    'books/ambassadors/page (314).png',
    'books/ambassadors/page (315).png',
    'books/ambassadors/page (316).png',
    'books/ambassadors/page (317).png',
    'books/ambassadors/page (318).png',
    'books/ambassadors/page (319).png',
    'books/ambassadors/page (320).png',
    'books/ambassadors/page (321).png',
    'books/ambassadors/page (322).png',
    'books/ambassadors/page (323).png',
    'books/ambassadors/page (324).png',
    'books/ambassadors/page (325).png',
    'books/ambassadors/page (326).png',
    'books/ambassadors/page (327).png',
    'books/ambassadors/page (328).png',
    'books/ambassadors/page (329).png',
    'books/ambassadors/page (330).png',
    'books/ambassadors/page (331).png',
    'books/ambassadors/page (332).png',
    'books/ambassadors/page (333).png',
    'books/ambassadors/page (334).png',
    'books/ambassadors/page (335).png',
    'books/ambassadors/page (336).png',
    'books/ambassadors/page (337).png',
    'books/ambassadors/page (338).png',
    'books/ambassadors/page (339).png',
    'books/ambassadors/page (340).png',
    'books/ambassadors/page (341).png',
    'books/ambassadors/page (342).png',
    'books/ambassadors/page (343).png',
    'books/ambassadors/page (344).png',

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
