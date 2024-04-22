import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class olivertwist extends StatefulWidget {
  const olivertwist({Key? key}) : super(key: key);

  @override
  State<olivertwist> createState() => _olivertwistState();
}

class _olivertwistState extends State<olivertwist> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/oliver twist/page (1).png',
    'books/oliver twist/page (2).png',
    'books/oliver twist/page (3).png',
    'books/oliver twist/page (4).png',
    'books/oliver twist/page (5).png',
    'books/oliver twist/page (6).png',
    'books/oliver twist/page (7).png',
    'books/oliver twist/page (8).png',
    'books/oliver twist/page (9).png',
    'books/oliver twist/page (10).png',
    'books/oliver twist/page (11).png',
    'books/oliver twist/page (12).png',
    'books/oliver twist/page (13).png',
    'books/oliver twist/page (14).png',
    'books/oliver twist/page (15).png',
    'books/oliver twist/page (16).png',
    'books/oliver twist/page (17).png',
    'books/oliver twist/page (18).png',
    'books/oliver twist/page (19).png',
    'books/oliver twist/page (20).png',
    'books/oliver twist/page (21).png',
    'books/oliver twist/page (22).png',
    'books/oliver twist/page (23).png',
    'books/oliver twist/page (24).png',
    'books/oliver twist/page (25).png',
    'books/oliver twist/page (26).png',
    'books/oliver twist/page (27).png',
    'books/oliver twist/page (28).png',
    'books/oliver twist/page (29).png',
    'books/oliver twist/page (30).png',
    'books/oliver twist/page (31).png',
    'books/oliver twist/page (32).png',
    'books/oliver twist/page (33).png',
    'books/oliver twist/page (34).png',
    'books/oliver twist/page (35).png',
    'books/oliver twist/page (36).png',
    'books/oliver twist/page (37).png',
    'books/oliver twist/page (38).png',
    'books/oliver twist/page (39).png',
    'books/oliver twist/page (40).png',
    'books/oliver twist/page (41).png',
    'books/oliver twist/page (42).png',
    'books/oliver twist/page (43).png',
    'books/oliver twist/page (44).png',
    'books/oliver twist/page (45).png',
    'books/oliver twist/page (46).png',
    'books/oliver twist/page (47).png',
    'books/oliver twist/page (48).png',
    'books/oliver twist/page (49).png',
    'books/oliver twist/page (50).png',
    'books/oliver twist/page (51).png',
    'books/oliver twist/page (52).png',
    'books/oliver twist/page (53).png',
    'books/oliver twist/page (54).png',
    'books/oliver twist/page (55).png',
    'books/oliver twist/page (56).png',
    'books/oliver twist/page (57).png',
    'books/oliver twist/page (58).png',
    'books/oliver twist/page (59).png',
    'books/oliver twist/page (60).png',
    'books/oliver twist/page (61).png',
    'books/oliver twist/page (62).png',
    'books/oliver twist/page (63).png',
    'books/oliver twist/page (64).png',
    'books/oliver twist/page (65).png',
    'books/oliver twist/page (66).png',
    'books/oliver twist/page (67).png',
    'books/oliver twist/page (68).png',
    'books/oliver twist/page (69).png',
    'books/oliver twist/page (70).png',
    'books/oliver twist/page (71).png',
    'books/oliver twist/page (72).png',
    'books/oliver twist/page (73).png',
    'books/oliver twist/page (74).png',
    'books/oliver twist/page (75).png',
    'books/oliver twist/page (76).png',
    'books/oliver twist/page (77).png',
    'books/oliver twist/page (78).png',
    'books/oliver twist/page (79).png',
    'books/oliver twist/page (80).png',
    'books/oliver twist/page (81).png',
    'books/oliver twist/page (82).png',
    'books/oliver twist/page (83).png',
    'books/oliver twist/page (84).png',
    'books/oliver twist/page (85).png',
    'books/oliver twist/page (86).png',
    'books/oliver twist/page (87).png',
    'books/oliver twist/page (88).png',
    'books/oliver twist/page (89).png',
    'books/oliver twist/page (90).png',
    'books/oliver twist/page (91).png',
    'books/oliver twist/page (92).png',
    'books/oliver twist/page (93).png',
    'books/oliver twist/page (94).png',
    'books/oliver twist/page (95).png',
    'books/oliver twist/page (96).png',
    'books/oliver twist/page (97).png',
    'books/oliver twist/page (98).png',
    'books/oliver twist/page (99).png',
    'books/oliver twist/page (100).png',
    'books/oliver twist/page (101).png',
    'books/oliver twist/page (102).png',
    'books/oliver twist/page (103).png',
    'books/oliver twist/page (104).png',
    'books/oliver twist/page (105).png',
    'books/oliver twist/page (106).png',
    'books/oliver twist/page (107).png',
    'books/oliver twist/page (108).png',
    'books/oliver twist/page (109).png',
    'books/oliver twist/page (110).png',
    'books/oliver twist/page (111).png',
    'books/oliver twist/page (112).png',
    'books/oliver twist/page (113).png',
    'books/oliver twist/page (114).png',
    'books/oliver twist/page (115).png',
    'books/oliver twist/page (116).png',
    'books/oliver twist/page (117).png',
    'books/oliver twist/page (118).png',
    'books/oliver twist/page (119).png',
    'books/oliver twist/page (120).png',
    'books/oliver twist/page (121).png',
    'books/oliver twist/page (122).png',
    'books/oliver twist/page (123).png',
    'books/oliver twist/page (124).png',
    'books/oliver twist/page (125).png',
    'books/oliver twist/page (126).png',
    'books/oliver twist/page (127).png',
    'books/oliver twist/page (128).png',
    'books/oliver twist/page (129).png',
    'books/oliver twist/page (130).png',
    'books/oliver twist/page (131).png',
    'books/oliver twist/page (132).png',
    'books/oliver twist/page (133).png',
    'books/oliver twist/page (134).png',
    'books/oliver twist/page (135).png',
    'books/oliver twist/page (136).png',
    'books/oliver twist/page (137).png',
    'books/oliver twist/page (138).png',
    'books/oliver twist/page (139).png',
    'books/oliver twist/page (140).png',
    'books/oliver twist/page (141).png',
    'books/oliver twist/page (142).png',
    'books/oliver twist/page (143).png',
    'books/oliver twist/page (144).png',
    'books/oliver twist/page (145).png',
    'books/oliver twist/page (146).png',
    'books/oliver twist/page (147).png',
    'books/oliver twist/page (148).png',
    'books/oliver twist/page (149).png',
    'books/oliver twist/page (150).png',
    'books/oliver twist/page (151).png',
    'books/oliver twist/page (152).png',
    'books/oliver twist/page (153).png',
    'books/oliver twist/page (154).png',
    'books/oliver twist/page (155).png',
    'books/oliver twist/page (156).png',
    'books/oliver twist/page (157).png',
    'books/oliver twist/page (158).png',
    'books/oliver twist/page (159).png',
    'books/oliver twist/page (160).png',
    'books/oliver twist/page (161).png',
    'books/oliver twist/page (162).png',
    'books/oliver twist/page (163).png',
    'books/oliver twist/page (164).png',
    'books/oliver twist/page (165).png',
    'books/oliver twist/page (166).png',
    'books/oliver twist/page (167).png',
    'books/oliver twist/page (168).png',
    'books/oliver twist/page (169).png',
    'books/oliver twist/page (170).png',
    'books/oliver twist/page (171).png',
    'books/oliver twist/page (172).png',
    'books/oliver twist/page (173).png',
    'books/oliver twist/page (174).png',
    'books/oliver twist/page (175).png',
    'books/oliver twist/page (176).png',
    'books/oliver twist/page (177).png',
    'books/oliver twist/page (178).png',
    'books/oliver twist/page (179).png',
    'books/oliver twist/page (180).png',
    'books/oliver twist/page (181).png',
    'books/oliver twist/page (182).png',
    'books/oliver twist/page (183).png',
    'books/oliver twist/page (184).png',
    'books/oliver twist/page (185).png',
    'books/oliver twist/page (186).png',
    'books/oliver twist/page (187).png',
    'books/oliver twist/page (188).png',
    'books/oliver twist/page (189).png',
    'books/oliver twist/page (190).png',
    'books/oliver twist/page (191).png',
    'books/oliver twist/page (192).png',
    'books/oliver twist/page (193).png',
    'books/oliver twist/page (194).png',
    'books/oliver twist/page (195).png',
    'books/oliver twist/page (196).png',
    'books/oliver twist/page (197).png',
    'books/oliver twist/page (198).png',
    'books/oliver twist/page (199).png',
    'books/oliver twist/page (200).png',
    'books/oliver twist/page (201).png',
    'books/oliver twist/page (202).png',
    'books/oliver twist/page (203).png',
    'books/oliver twist/page (204).png',
    'books/oliver twist/page (205).png',
    'books/oliver twist/page (206).png',
    'books/oliver twist/page (207).png',
    'books/oliver twist/page (208).png',
    'books/oliver twist/page (209).png',
    'books/oliver twist/page (210).png',
    'books/oliver twist/page (211).png',
    'books/oliver twist/page (212).png',
    'books/oliver twist/page (213).png',
    'books/oliver twist/page (214).png',
    'books/oliver twist/page (215).png',
    'books/oliver twist/page (216).png',
    'books/oliver twist/page (217).png',
    'books/oliver twist/page (218).png',
    'books/oliver twist/page (219).png',
    'books/oliver twist/page (220).png',
    'books/oliver twist/page (221).png',
    'books/oliver twist/page (222).png',
    'books/oliver twist/page (223).png',
    'books/oliver twist/page (224).png',
    'books/oliver twist/page (225).png',
    'books/oliver twist/page (226).png',
    'books/oliver twist/page (227).png',
    'books/oliver twist/page (228).png',
    'books/oliver twist/page (229).png',
    'books/oliver twist/page (230).png',
    'books/oliver twist/page (231).png',
    'books/oliver twist/page (232).png',
    'books/oliver twist/page (233).png',
    'books/oliver twist/page (234).png',
    'books/oliver twist/page (235).png',
    'books/oliver twist/page (236).png',
    'books/oliver twist/page (237).png',
    'books/oliver twist/page (238).png',
    'books/oliver twist/page (239).png',
    'books/oliver twist/page (240).png',
    'books/oliver twist/page (241).png',
    'books/oliver twist/page (242).png',
    'books/oliver twist/page (243).png',
    'books/oliver twist/page (244).png',
    'books/oliver twist/page (245).png',
    'books/oliver twist/page (246).png',
    'books/oliver twist/page (247).png',
    'books/oliver twist/page (248).png',
    'books/oliver twist/page (249).png',
    'books/oliver twist/page (250).png',
    'books/oliver twist/page (251).png',
    'books/oliver twist/page (252).png',
    'books/oliver twist/page (253).png',
    'books/oliver twist/page (254).png',
    'books/oliver twist/page (255).png',
    'books/oliver twist/page (256).png',
    'books/oliver twist/page (257).png',
    'books/oliver twist/page (258).png',
    'books/oliver twist/page (259).png',
    'books/oliver twist/page (260).png',
    'books/oliver twist/page (261).png',
    'books/oliver twist/page (262).png',
    'books/oliver twist/page (263).png',
    'books/oliver twist/page (264).png',
    'books/oliver twist/page (265).png',
    'books/oliver twist/page (266).png',
    'books/oliver twist/page (267).png',
    'books/oliver twist/page (268).png',
    'books/oliver twist/page (269).png',
    'books/oliver twist/page (270).png',
    'books/oliver twist/page (271).png',
    'books/oliver twist/page (272).png',
    'books/oliver twist/page (273).png',
    'books/oliver twist/page (274).png',
    'books/oliver twist/page (275).png',
    'books/oliver twist/page (276).png',
    'books/oliver twist/page (277).png',
    'books/oliver twist/page (278).png',
    'books/oliver twist/page (279).png',
    'books/oliver twist/page (280).png',
    'books/oliver twist/page (281).png',
    'books/oliver twist/page (282).png',
    'books/oliver twist/page (283).png',
    'books/oliver twist/page (284).png',
    'books/oliver twist/page (285).png',
    'books/oliver twist/page (286).png',
    'books/oliver twist/page (287).png',
    'books/oliver twist/page (288).png',
    'books/oliver twist/page (289).png',
    'books/oliver twist/page (290).png',
    'books/oliver twist/page (291).png',
    'books/oliver twist/page (292).png',
    'books/oliver twist/page (293).png',
    'books/oliver twist/page (294).png',
    'books/oliver twist/page (295).png',
    'books/oliver twist/page (296).png',
    'books/oliver twist/page (297).png',
    'books/oliver twist/page (298).png',
    'books/oliver twist/page (299).png',
    'books/oliver twist/page (300).png',
    'books/oliver twist/page (301).png',
    'books/oliver twist/page (302).png',
    'books/oliver twist/page (303).png',
    'books/oliver twist/page (304).png',
    'books/oliver twist/page (305).png',
    'books/oliver twist/page (306).png',
    'books/oliver twist/page (307).png',
    'books/oliver twist/page (308).png',
    'books/oliver twist/page (309).png',
    'books/oliver twist/page (310).png',
    'books/oliver twist/page (311).png',
    'books/oliver twist/page (312).png',
    'books/oliver twist/page (313).png',
    'books/oliver twist/page (314).png',
    'books/oliver twist/page (315).png',
    'books/oliver twist/page (316).png',
    'books/oliver twist/page (317).png',
    'books/oliver twist/page (318).png',
    'books/oliver twist/page (319).png',
    'books/oliver twist/page (320).png',
    'books/oliver twist/page (321).png',
    'books/oliver twist/page (322).png',
    'books/oliver twist/page (323).png',
    'books/oliver twist/page (324).png',
    'books/oliver twist/page (325).png',
    'books/oliver twist/page (326).png',
    'books/oliver twist/page (327).png',
    'books/oliver twist/page (328).png',
    'books/oliver twist/page (329).png',
    'books/oliver twist/page (330).png',
    'books/oliver twist/page (331).png',
    'books/oliver twist/page (332).png',
    'books/oliver twist/page (333).png',
    'books/oliver twist/page (334).png',
    'books/oliver twist/page (335).png',
    'books/oliver twist/page (336).png',
    'books/oliver twist/page (337).png',
    'books/oliver twist/page (338).png',
    'books/oliver twist/page (339).png',
    'books/oliver twist/page (340).png',
    'books/oliver twist/page (341).png',
    'books/oliver twist/page (342).png',
    'books/oliver twist/page (343).png',
    'books/oliver twist/page (344).png',
    'books/oliver twist/page (345).png',
    'books/oliver twist/page (346).png',
    'books/oliver twist/page (347).png',
    'books/oliver twist/page (348).png',
    'books/oliver twist/page (349).png',
    'books/oliver twist/page (350).png',
    'books/oliver twist/page (351).png',
    'books/oliver twist/page (352).png',
    'books/oliver twist/page (353).png',
    'books/oliver twist/page (354).png',
    'books/oliver twist/page (355).png',
    'books/oliver twist/page (356).png',
    'books/oliver twist/page (357).png',
    'books/oliver twist/page (358).png',
    'books/oliver twist/page (359).png',
    'books/oliver twist/page (360).png',
    'books/oliver twist/page (361).png',
    'books/oliver twist/page (362).png',
    'books/oliver twist/page (363).png',
    'books/oliver twist/page (364).png',
    'books/oliver twist/page (365).png',
    'books/oliver twist/page (366).png',
    'books/oliver twist/page (367).png',
    'books/oliver twist/page (368).png',
    'books/oliver twist/page (369).png',
    'books/oliver twist/page (370).png',

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
