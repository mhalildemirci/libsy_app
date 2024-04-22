import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sensesensblity extends StatefulWidget {
  const sensesensblity({Key? key}) : super(key: key);

  @override
  State<sensesensblity> createState() => _sensesensblityState();
}

class _sensesensblityState extends State<sensesensblity> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sense and sensiblity/page (1).png',
    'books/sense and sensiblity/page (2).png',
    'books/sense and sensiblity/page (3).png',
    'books/sense and sensiblity/page (4).png',
    'books/sense and sensiblity/page (5).png',
    'books/sense and sensiblity/page (6).png',
    'books/sense and sensiblity/page (7).png',
    'books/sense and sensiblity/page (8).png',
    'books/sense and sensiblity/page (9).png',
    'books/sense and sensiblity/page (10).png',
    'books/sense and sensiblity/page (11).png',
    'books/sense and sensiblity/page (12).png',
    'books/sense and sensiblity/page (13).png',
    'books/sense and sensiblity/page (14).png',
    'books/sense and sensiblity/page (15).png',
    'books/sense and sensiblity/page (16).png',
    'books/sense and sensiblity/page (17).png',
    'books/sense and sensiblity/page (18).png',
    'books/sense and sensiblity/page (19).png',
    'books/sense and sensiblity/page (20).png',
    'books/sense and sensiblity/page (21).png',
    'books/sense and sensiblity/page (22).png',
    'books/sense and sensiblity/page (23).png',
    'books/sense and sensiblity/page (24).png',
    'books/sense and sensiblity/page (25).png',
    'books/sense and sensiblity/page (26).png',
    'books/sense and sensiblity/page (27).png',
    'books/sense and sensiblity/page (28).png',
    'books/sense and sensiblity/page (29).png',
    'books/sense and sensiblity/page (30).png',
    'books/sense and sensiblity/page (31).png',
    'books/sense and sensiblity/page (32).png',
    'books/sense and sensiblity/page (33).png',
    'books/sense and sensiblity/page (34).png',
    'books/sense and sensiblity/page (35).png',
    'books/sense and sensiblity/page (36).png',
    'books/sense and sensiblity/page (37).png',
    'books/sense and sensiblity/page (38).png',
    'books/sense and sensiblity/page (39).png',
    'books/sense and sensiblity/page (40).png',
    'books/sense and sensiblity/page (41).png',
    'books/sense and sensiblity/page (42).png',
    'books/sense and sensiblity/page (43).png',
    'books/sense and sensiblity/page (44).png',
    'books/sense and sensiblity/page (45).png',
    'books/sense and sensiblity/page (46).png',
    'books/sense and sensiblity/page (47).png',
    'books/sense and sensiblity/page (48).png',
    'books/sense and sensiblity/page (49).png',
    'books/sense and sensiblity/page (50).png',
    'books/sense and sensiblity/page (51).png',
    'books/sense and sensiblity/page (52).png',
    'books/sense and sensiblity/page (53).png',
    'books/sense and sensiblity/page (54).png',
    'books/sense and sensiblity/page (55).png',
    'books/sense and sensiblity/page (56).png',
    'books/sense and sensiblity/page (57).png',
    'books/sense and sensiblity/page (58).png',
    'books/sense and sensiblity/page (59).png',
    'books/sense and sensiblity/page (60).png',
    'books/sense and sensiblity/page (61).png',
    'books/sense and sensiblity/page (62).png',
    'books/sense and sensiblity/page (63).png',
    'books/sense and sensiblity/page (64).png',
    'books/sense and sensiblity/page (65).png',
    'books/sense and sensiblity/page (66).png',
    'books/sense and sensiblity/page (67).png',
    'books/sense and sensiblity/page (68).png',
    'books/sense and sensiblity/page (69).png',
    'books/sense and sensiblity/page (70).png',
    'books/sense and sensiblity/page (71).png',
    'books/sense and sensiblity/page (72).png',
    'books/sense and sensiblity/page (73).png',
    'books/sense and sensiblity/page (74).png',
    'books/sense and sensiblity/page (75).png',
    'books/sense and sensiblity/page (76).png',
    'books/sense and sensiblity/page (77).png',
    'books/sense and sensiblity/page (78).png',
    'books/sense and sensiblity/page (79).png',
    'books/sense and sensiblity/page (80).png',
    'books/sense and sensiblity/page (81).png',
    'books/sense and sensiblity/page (82).png',
    'books/sense and sensiblity/page (83).png',
    'books/sense and sensiblity/page (84).png',
    'books/sense and sensiblity/page (85).png',
    'books/sense and sensiblity/page (86).png',
    'books/sense and sensiblity/page (87).png',
    'books/sense and sensiblity/page (88).png',
    'books/sense and sensiblity/page (89).png',
    'books/sense and sensiblity/page (90).png',
    'books/sense and sensiblity/page (91).png',
    'books/sense and sensiblity/page (92).png',
    'books/sense and sensiblity/page (93).png',
    'books/sense and sensiblity/page (94).png',
    'books/sense and sensiblity/page (95).png',
    'books/sense and sensiblity/page (96).png',
    'books/sense and sensiblity/page (97).png',
    'books/sense and sensiblity/page (98).png',
    'books/sense and sensiblity/page (99).png',
    'books/sense and sensiblity/page (100).png',
    'books/sense and sensiblity/page (101).png',
    'books/sense and sensiblity/page (102).png',
    'books/sense and sensiblity/page (103).png',
    'books/sense and sensiblity/page (104).png',
    'books/sense and sensiblity/page (105).png',
    'books/sense and sensiblity/page (106).png',
    'books/sense and sensiblity/page (107).png',
    'books/sense and sensiblity/page (108).png',
    'books/sense and sensiblity/page (109).png',
    'books/sense and sensiblity/page (110).png',
    'books/sense and sensiblity/page (111).png',
    'books/sense and sensiblity/page (112).png',
    'books/sense and sensiblity/page (113).png',
    'books/sense and sensiblity/page (114).png',
    'books/sense and sensiblity/page (115).png',
    'books/sense and sensiblity/page (116).png',
    'books/sense and sensiblity/page (117).png',
    'books/sense and sensiblity/page (118).png',
    'books/sense and sensiblity/page (119).png',
    'books/sense and sensiblity/page (120).png',
    'books/sense and sensiblity/page (121).png',
    'books/sense and sensiblity/page (122).png',
    'books/sense and sensiblity/page (123).png',
    'books/sense and sensiblity/page (124).png',
    'books/sense and sensiblity/page (125).png',
    'books/sense and sensiblity/page (126).png',
    'books/sense and sensiblity/page (127).png',
    'books/sense and sensiblity/page (128).png',
    'books/sense and sensiblity/page (129).png',
    'books/sense and sensiblity/page (130).png',
    'books/sense and sensiblity/page (131).png',
    'books/sense and sensiblity/page (132).png',
    'books/sense and sensiblity/page (133).png',
    'books/sense and sensiblity/page (134).png',
    'books/sense and sensiblity/page (135).png',
    'books/sense and sensiblity/page (136).png',
    'books/sense and sensiblity/page (137).png',
    'books/sense and sensiblity/page (138).png',
    'books/sense and sensiblity/page (139).png',
    'books/sense and sensiblity/page (140).png',
    'books/sense and sensiblity/page (141).png',
    'books/sense and sensiblity/page (142).png',
    'books/sense and sensiblity/page (143).png',
    'books/sense and sensiblity/page (144).png',
    'books/sense and sensiblity/page (145).png',
    'books/sense and sensiblity/page (146).png',
    'books/sense and sensiblity/page (147).png',
    'books/sense and sensiblity/page (148).png',
    'books/sense and sensiblity/page (149).png',
    'books/sense and sensiblity/page (150).png',
    'books/sense and sensiblity/page (151).png',
    'books/sense and sensiblity/page (152).png',
    'books/sense and sensiblity/page (153).png',
    'books/sense and sensiblity/page (154).png',
    'books/sense and sensiblity/page (155).png',
    'books/sense and sensiblity/page (156).png',
    'books/sense and sensiblity/page (157).png',
    'books/sense and sensiblity/page (158).png',
    'books/sense and sensiblity/page (159).png',
    'books/sense and sensiblity/page (160).png',
    'books/sense and sensiblity/page (161).png',
    'books/sense and sensiblity/page (162).png',
    'books/sense and sensiblity/page (163).png',
    'books/sense and sensiblity/page (164).png',
    'books/sense and sensiblity/page (165).png',
    'books/sense and sensiblity/page (166).png',
    'books/sense and sensiblity/page (167).png',
    'books/sense and sensiblity/page (168).png',
    'books/sense and sensiblity/page (169).png',
    'books/sense and sensiblity/page (170).png',
    'books/sense and sensiblity/page (171).png',
    'books/sense and sensiblity/page (172).png',
    'books/sense and sensiblity/page (173).png',
    'books/sense and sensiblity/page (174).png',
    'books/sense and sensiblity/page (175).png',
    'books/sense and sensiblity/page (176).png',
    'books/sense and sensiblity/page (177).png',
    'books/sense and sensiblity/page (178).png',
    'books/sense and sensiblity/page (179).png',
    'books/sense and sensiblity/page (180).png',
    'books/sense and sensiblity/page (181).png',
    'books/sense and sensiblity/page (182).png',
    'books/sense and sensiblity/page (183).png',
    'books/sense and sensiblity/page (184).png',
    'books/sense and sensiblity/page (185).png',
    'books/sense and sensiblity/page (186).png',
    'books/sense and sensiblity/page (187).png',
    'books/sense and sensiblity/page (188).png',
    'books/sense and sensiblity/page (189).png',
    'books/sense and sensiblity/page (190).png',
    'books/sense and sensiblity/page (191).png',
    'books/sense and sensiblity/page (192).png',
    'books/sense and sensiblity/page (193).png',
    'books/sense and sensiblity/page (194).png',
    'books/sense and sensiblity/page (195).png',
    'books/sense and sensiblity/page (196).png',
    'books/sense and sensiblity/page (197).png',
    'books/sense and sensiblity/page (198).png',
    'books/sense and sensiblity/page (199).png',
    'books/sense and sensiblity/page (200).png',
    'books/sense and sensiblity/page (201).png',
    'books/sense and sensiblity/page (202).png',
    'books/sense and sensiblity/page (203).png',
    'books/sense and sensiblity/page (204).png',
    'books/sense and sensiblity/page (205).png',
    'books/sense and sensiblity/page (206).png',
    'books/sense and sensiblity/page (207).png',
    'books/sense and sensiblity/page (208).png',
    'books/sense and sensiblity/page (209).png',
    'books/sense and sensiblity/page (210).png',
    'books/sense and sensiblity/page (211).png',
    'books/sense and sensiblity/page (212).png',
    'books/sense and sensiblity/page (213).png',
    'books/sense and sensiblity/page (214).png',
    'books/sense and sensiblity/page (215).png',
    'books/sense and sensiblity/page (216).png',
    'books/sense and sensiblity/page (217).png',
    'books/sense and sensiblity/page (218).png',
    'books/sense and sensiblity/page (219).png',
    'books/sense and sensiblity/page (220).png',
    'books/sense and sensiblity/page (221).png',
    'books/sense and sensiblity/page (222).png',
    'books/sense and sensiblity/page (223).png',
    'books/sense and sensiblity/page (224).png',
    'books/sense and sensiblity/page (225).png',
    'books/sense and sensiblity/page (226).png',
    'books/sense and sensiblity/page (227).png',
    'books/sense and sensiblity/page (228).png',
    'books/sense and sensiblity/page (229).png',
    'books/sense and sensiblity/page (230).png',
    'books/sense and sensiblity/page (231).png',
    'books/sense and sensiblity/page (232).png',
    'books/sense and sensiblity/page (233).png',
    'books/sense and sensiblity/page (234).png',
    'books/sense and sensiblity/page (235).png',
    'books/sense and sensiblity/page (236).png',
    'books/sense and sensiblity/page (237).png',
    'books/sense and sensiblity/page (238).png',
    'books/sense and sensiblity/page (239).png',
    'books/sense and sensiblity/page (240).png',
    'books/sense and sensiblity/page (241).png',
    'books/sense and sensiblity/page (242).png',
    'books/sense and sensiblity/page (243).png',
    'books/sense and sensiblity/page (244).png',
    'books/sense and sensiblity/page (245).png',
    'books/sense and sensiblity/page (246).png',
    'books/sense and sensiblity/page (247).png',
    'books/sense and sensiblity/page (248).png',
    'books/sense and sensiblity/page (249).png',
    'books/sense and sensiblity/page (250).png',
    'books/sense and sensiblity/page (251).png',
    'books/sense and sensiblity/page (252).png',
    'books/sense and sensiblity/page (253).png',
    'books/sense and sensiblity/page (254).png',
    'books/sense and sensiblity/page (255).png',
    'books/sense and sensiblity/page (256).png',
    'books/sense and sensiblity/page (257).png',
    'books/sense and sensiblity/page (258).png',
    'books/sense and sensiblity/page (259).png',
    'books/sense and sensiblity/page (260).png',
    'books/sense and sensiblity/page (261).png',
    'books/sense and sensiblity/page (262).png',
    'books/sense and sensiblity/page (263).png',
    'books/sense and sensiblity/page (264).png',
    'books/sense and sensiblity/page (265).png',
    'books/sense and sensiblity/page (266).png',
    'books/sense and sensiblity/page (267).png',
    'books/sense and sensiblity/page (268).png',
    'books/sense and sensiblity/page (269).png',
    'books/sense and sensiblity/page (270).png',
    'books/sense and sensiblity/page (271).png',
    'books/sense and sensiblity/page (272).png',
    'books/sense and sensiblity/page (273).png',
    'books/sense and sensiblity/page (274).png',
    'books/sense and sensiblity/page (275).png',
    'books/sense and sensiblity/page (276).png',
    'books/sense and sensiblity/page (277).png',
    'books/sense and sensiblity/page (278).png',
    'books/sense and sensiblity/page (279).png',
    'books/sense and sensiblity/page (280).png',
    'books/sense and sensiblity/page (281).png',
    'books/sense and sensiblity/page (282).png',
    'books/sense and sensiblity/page (283).png',
    'books/sense and sensiblity/page (284).png',
    'books/sense and sensiblity/page (285).png',
    'books/sense and sensiblity/page (286).png',
    'books/sense and sensiblity/page (287).png',
    'books/sense and sensiblity/page (288).png',
    'books/sense and sensiblity/page (289).png',
    'books/sense and sensiblity/page (290).png',
    'books/sense and sensiblity/page (291).png',
    'books/sense and sensiblity/page (292).png',
    'books/sense and sensiblity/page (293).png',
    'books/sense and sensiblity/page (294).png',
    'books/sense and sensiblity/page (295).png',
    'books/sense and sensiblity/page (296).png',
    'books/sense and sensiblity/page (297).png',
    'books/sense and sensiblity/page (298).png',
    'books/sense and sensiblity/page (299).png',
    'books/sense and sensiblity/page (300).png',
    'books/sense and sensiblity/page (301).png',
    'books/sense and sensiblity/page (302).png',
    'books/sense and sensiblity/page (303).png',
    'books/sense and sensiblity/page (304).png',
    'books/sense and sensiblity/page (305).png',
    'books/sense and sensiblity/page (306).png',
    'books/sense and sensiblity/page (307).png',
    'books/sense and sensiblity/page (308).png',
    'books/sense and sensiblity/page (309).png',
    'books/sense and sensiblity/page (310).png',
    'books/sense and sensiblity/page (311).png',
    'books/sense and sensiblity/page (312).png',
    'books/sense and sensiblity/page (313).png',
    'books/sense and sensiblity/page (314).png',
    'books/sense and sensiblity/page (315).png',
    'books/sense and sensiblity/page (316).png',
    'books/sense and sensiblity/page (317).png',
    'books/sense and sensiblity/page (318).png',
    'books/sense and sensiblity/page (319).png',
    'books/sense and sensiblity/page (320).png',
    'books/sense and sensiblity/page (321).png',
    'books/sense and sensiblity/page (322).png',
    'books/sense and sensiblity/page (323).png',
    'books/sense and sensiblity/page (324).png',
    'books/sense and sensiblity/page (325).png',
    'books/sense and sensiblity/page (326).png',
    'books/sense and sensiblity/page (327).png',
    'books/sense and sensiblity/page (328).png',
    'books/sense and sensiblity/page (329).png',
    'books/sense and sensiblity/page (330).png',
    'books/sense and sensiblity/page (331).png',
    'books/sense and sensiblity/page (332).png',
    'books/sense and sensiblity/page (333).png',
    'books/sense and sensiblity/page (334).png',
    'books/sense and sensiblity/page (335).png',
    'books/sense and sensiblity/page (336).png',
    'books/sense and sensiblity/page (337).png',

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
