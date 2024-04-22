import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class greatexpectation extends StatefulWidget {
  const greatexpectation({Key? key}) : super(key: key);

  @override
  State<greatexpectation> createState() => _greatexpectationState();
}

class _greatexpectationState extends State<greatexpectation> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Great Expectations/page (1).png',
    'books/Great Expectations/page (2).png',
    'books/Great Expectations/page (3).png',
    'books/Great Expectations/page (4).png',
    'books/Great Expectations/page (5).png',
    'books/Great Expectations/page (6).png',
    'books/Great Expectations/page (7).png',
    'books/Great Expectations/page (8).png',
    'books/Great Expectations/page (9).png',
    'books/Great Expectations/page (10).png',
    'books/Great Expectations/page (11).png',
    'books/Great Expectations/page (12).png',
    'books/Great Expectations/page (13).png',
    'books/Great Expectations/page (14).png',
    'books/Great Expectations/page (15).png',
    'books/Great Expectations/page (16).png',
    'books/Great Expectations/page (17).png',
    'books/Great Expectations/page (18).png',
    'books/Great Expectations/page (19).png',
    'books/Great Expectations/page (20).png',
    'books/Great Expectations/page (21).png',
    'books/Great Expectations/page (22).png',
    'books/Great Expectations/page (23).png',
    'books/Great Expectations/page (24).png',
    'books/Great Expectations/page (25).png',
    'books/Great Expectations/page (26).png',
    'books/Great Expectations/page (27).png',
    'books/Great Expectations/page (28).png',
    'books/Great Expectations/page (29).png',
    'books/Great Expectations/page (30).png',
    'books/Great Expectations/page (31).png',
    'books/Great Expectations/page (32).png',
    'books/Great Expectations/page (33).png',
    'books/Great Expectations/page (34).png',
    'books/Great Expectations/page (35).png',
    'books/Great Expectations/page (36).png',
    'books/Great Expectations/page (37).png',
    'books/Great Expectations/page (38).png',
    'books/Great Expectations/page (39).png',
    'books/Great Expectations/page (40).png',
    'books/Great Expectations/page (41).png',
    'books/Great Expectations/page (42).png',
    'books/Great Expectations/page (43).png',
    'books/Great Expectations/page (44).png',
    'books/Great Expectations/page (45).png',
    'books/Great Expectations/page (46).png',
    'books/Great Expectations/page (47).png',
    'books/Great Expectations/page (48).png',
    'books/Great Expectations/page (49).png',
    'books/Great Expectations/page (50).png',
    'books/Great Expectations/page (51).png',
    'books/Great Expectations/page (52).png',
    'books/Great Expectations/page (53).png',
    'books/Great Expectations/page (54).png',
    'books/Great Expectations/page (55).png',
    'books/Great Expectations/page (56).png',
    'books/Great Expectations/page (57).png',
    'books/Great Expectations/page (58).png',
    'books/Great Expectations/page (59).png',
    'books/Great Expectations/page (60).png',
    'books/Great Expectations/page (61).png',
    'books/Great Expectations/page (62).png',
    'books/Great Expectations/page (63).png',
    'books/Great Expectations/page (64).png',
    'books/Great Expectations/page (65).png',
    'books/Great Expectations/page (66).png',
    'books/Great Expectations/page (67).png',
    'books/Great Expectations/page (68).png',
    'books/Great Expectations/page (69).png',
    'books/Great Expectations/page (70).png',
    'books/Great Expectations/page (71).png',
    'books/Great Expectations/page (72).png',
    'books/Great Expectations/page (73).png',
    'books/Great Expectations/page (74).png',
    'books/Great Expectations/page (75).png',
    'books/Great Expectations/page (76).png',
    'books/Great Expectations/page (77).png',
    'books/Great Expectations/page (78).png',
    'books/Great Expectations/page (79).png',
    'books/Great Expectations/page (80).png',
    'books/Great Expectations/page (81).png',
    'books/Great Expectations/page (82).png',
    'books/Great Expectations/page (83).png',
    'books/Great Expectations/page (84).png',
    'books/Great Expectations/page (85).png',
    'books/Great Expectations/page (86).png',
    'books/Great Expectations/page (87).png',
    'books/Great Expectations/page (88).png',
    'books/Great Expectations/page (89).png',
    'books/Great Expectations/page (90).png',
    'books/Great Expectations/page (91).png',
    'books/Great Expectations/page (92).png',
    'books/Great Expectations/page (93).png',
    'books/Great Expectations/page (94).png',
    'books/Great Expectations/page (95).png',
    'books/Great Expectations/page (96).png',
    'books/Great Expectations/page (97).png',
    'books/Great Expectations/page (98).png',
    'books/Great Expectations/page (99).png',
    'books/Great Expectations/page (100).png',
    'books/Great Expectations/page (101).png',
    'books/Great Expectations/page (102).png',
    'books/Great Expectations/page (103).png',
    'books/Great Expectations/page (104).png',
    'books/Great Expectations/page (105).png',
    'books/Great Expectations/page (106).png',
    'books/Great Expectations/page (107).png',
    'books/Great Expectations/page (108).png',
    'books/Great Expectations/page (109).png',
    'books/Great Expectations/page (110).png',
    'books/Great Expectations/page (111).png',
    'books/Great Expectations/page (112).png',
    'books/Great Expectations/page (113).png',
    'books/Great Expectations/page (114).png',
    'books/Great Expectations/page (115).png',
    'books/Great Expectations/page (116).png',
    'books/Great Expectations/page (117).png',
    'books/Great Expectations/page (118).png',
    'books/Great Expectations/page (119).png',
    'books/Great Expectations/page (120).png',
    'books/Great Expectations/page (121).png',
    'books/Great Expectations/page (122).png',
    'books/Great Expectations/page (123).png',
    'books/Great Expectations/page (124).png',
    'books/Great Expectations/page (125).png',
    'books/Great Expectations/page (126).png',
    'books/Great Expectations/page (127).png',
    'books/Great Expectations/page (128).png',
    'books/Great Expectations/page (129).png',
    'books/Great Expectations/page (130).png',
    'books/Great Expectations/page (131).png',
    'books/Great Expectations/page (132).png',
    'books/Great Expectations/page (133).png',
    'books/Great Expectations/page (134).png',
    'books/Great Expectations/page (135).png',
    'books/Great Expectations/page (136).png',
    'books/Great Expectations/page (137).png',
    'books/Great Expectations/page (138).png',
    'books/Great Expectations/page (139).png',
    'books/Great Expectations/page (140).png',
    'books/Great Expectations/page (141).png',
    'books/Great Expectations/page (142).png',
    'books/Great Expectations/page (143).png',
    'books/Great Expectations/page (144).png',
    'books/Great Expectations/page (145).png',
    'books/Great Expectations/page (146).png',
    'books/Great Expectations/page (147).png',
    'books/Great Expectations/page (148).png',
    'books/Great Expectations/page (149).png',
    'books/Great Expectations/page (150).png',
    'books/Great Expectations/page (151).png',
    'books/Great Expectations/page (152).png',
    'books/Great Expectations/page (153).png',
    'books/Great Expectations/page (154).png',
    'books/Great Expectations/page (155).png',
    'books/Great Expectations/page (156).png',
    'books/Great Expectations/page (157).png',
    'books/Great Expectations/page (158).png',
    'books/Great Expectations/page (159).png',
    'books/Great Expectations/page (160).png',
    'books/Great Expectations/page (161).png',
    'books/Great Expectations/page (162).png',
    'books/Great Expectations/page (163).png',
    'books/Great Expectations/page (164).png',
    'books/Great Expectations/page (165).png',
    'books/Great Expectations/page (166).png',
    'books/Great Expectations/page (167).png',
    'books/Great Expectations/page (168).png',
    'books/Great Expectations/page (169).png',
    'books/Great Expectations/page (170).png',
    'books/Great Expectations/page (171).png',
    'books/Great Expectations/page (172).png',
    'books/Great Expectations/page (173).png',
    'books/Great Expectations/page (174).png',
    'books/Great Expectations/page (175).png',
    'books/Great Expectations/page (176).png',
    'books/Great Expectations/page (177).png',
    'books/Great Expectations/page (178).png',
    'books/Great Expectations/page (179).png',
    'books/Great Expectations/page (180).png',
    'books/Great Expectations/page (181).png',
    'books/Great Expectations/page (182).png',
    'books/Great Expectations/page (183).png',
    'books/Great Expectations/page (184).png',
    'books/Great Expectations/page (185).png',
    'books/Great Expectations/page (186).png',
    'books/Great Expectations/page (187).png',
    'books/Great Expectations/page (188).png',
    'books/Great Expectations/page (189).png',
    'books/Great Expectations/page (190).png',
    'books/Great Expectations/page (191).png',
    'books/Great Expectations/page (192).png',
    'books/Great Expectations/page (193).png',
    'books/Great Expectations/page (194).png',
    'books/Great Expectations/page (195).png',
    'books/Great Expectations/page (196).png',
    'books/Great Expectations/page (197).png',
    'books/Great Expectations/page (198).png',
    'books/Great Expectations/page (199).png',
    'books/Great Expectations/page (200).png',
    'books/Great Expectations/page (201).png',
    'books/Great Expectations/page (202).png',
    'books/Great Expectations/page (203).png',
    'books/Great Expectations/page (204).png',
    'books/Great Expectations/page (205).png',
    'books/Great Expectations/page (206).png',
    'books/Great Expectations/page (207).png',
    'books/Great Expectations/page (208).png',
    'books/Great Expectations/page (209).png',
    'books/Great Expectations/page (210).png',
    'books/Great Expectations/page (211).png',
    'books/Great Expectations/page (212).png',
    'books/Great Expectations/page (213).png',
    'books/Great Expectations/page (214).png',
    'books/Great Expectations/page (215).png',
    'books/Great Expectations/page (216).png',
    'books/Great Expectations/page (217).png',
    'books/Great Expectations/page (218).png',
    'books/Great Expectations/page (219).png',
    'books/Great Expectations/page (220).png',
    'books/Great Expectations/page (221).png',
    'books/Great Expectations/page (222).png',
    'books/Great Expectations/page (223).png',
    'books/Great Expectations/page (224).png',
    'books/Great Expectations/page (225).png',
    'books/Great Expectations/page (226).png',
    'books/Great Expectations/page (227).png',
    'books/Great Expectations/page (228).png',
    'books/Great Expectations/page (229).png',
    'books/Great Expectations/page (230).png',
    'books/Great Expectations/page (231).png',
    'books/Great Expectations/page (232).png',
    'books/Great Expectations/page (233).png',
    'books/Great Expectations/page (234).png',
    'books/Great Expectations/page (235).png',
    'books/Great Expectations/page (236).png',
    'books/Great Expectations/page (237).png',
    'books/Great Expectations/page (238).png',
    'books/Great Expectations/page (239).png',
    'books/Great Expectations/page (240).png',
    'books/Great Expectations/page (241).png',
    'books/Great Expectations/page (242).png',
    'books/Great Expectations/page (243).png',
    'books/Great Expectations/page (244).png',
    'books/Great Expectations/page (245).png',
    'books/Great Expectations/page (246).png',
    'books/Great Expectations/page (247).png',
    'books/Great Expectations/page (248).png',
    'books/Great Expectations/page (249).png',
    'books/Great Expectations/page (250).png',
    'books/Great Expectations/page (251).png',
    'books/Great Expectations/page (252).png',
    'books/Great Expectations/page (253).png',
    'books/Great Expectations/page (254).png',
    'books/Great Expectations/page (255).png',
    'books/Great Expectations/page (256).png',
    'books/Great Expectations/page (257).png',
    'books/Great Expectations/page (258).png',
    'books/Great Expectations/page (259).png',
    'books/Great Expectations/page (260).png',
    'books/Great Expectations/page (261).png',
    'books/Great Expectations/page (262).png',
    'books/Great Expectations/page (263).png',
    'books/Great Expectations/page (264).png',
    'books/Great Expectations/page (265).png',
    'books/Great Expectations/page (266).png',
    'books/Great Expectations/page (267).png',
    'books/Great Expectations/page (268).png',
    'books/Great Expectations/page (269).png',
    'books/Great Expectations/page (270).png',
    'books/Great Expectations/page (271).png',
    'books/Great Expectations/page (272).png',
    'books/Great Expectations/page (273).png',
    'books/Great Expectations/page (274).png',
    'books/Great Expectations/page (275).png',
    'books/Great Expectations/page (276).png',
    'books/Great Expectations/page (277).png',
    'books/Great Expectations/page (278).png',
    'books/Great Expectations/page (279).png',
    'books/Great Expectations/page (280).png',
    'books/Great Expectations/page (281).png',
    'books/Great Expectations/page (282).png',
    'books/Great Expectations/page (283).png',
    'books/Great Expectations/page (284).png',
    'books/Great Expectations/page (285).png',
    'books/Great Expectations/page (286).png',
    'books/Great Expectations/page (287).png',
    'books/Great Expectations/page (288).png',
    'books/Great Expectations/page (289).png',
    'books/Great Expectations/page (290).png',
    'books/Great Expectations/page (291).png',
    'books/Great Expectations/page (292).png',
    'books/Great Expectations/page (293).png',
    'books/Great Expectations/page (294).png',
    'books/Great Expectations/page (295).png',
    'books/Great Expectations/page (296).png',
    'books/Great Expectations/page (297).png',
    'books/Great Expectations/page (298).png',
    'books/Great Expectations/page (299).png',
    'books/Great Expectations/page (300).png',
    'books/Great Expectations/page (301).png',
    'books/Great Expectations/page (302).png',
    'books/Great Expectations/page (303).png',
    'books/Great Expectations/page (304).png',
    'books/Great Expectations/page (305).png',
    'books/Great Expectations/page (306).png',
    'books/Great Expectations/page (307).png',
    'books/Great Expectations/page (308).png',
    'books/Great Expectations/page (309).png',
    'books/Great Expectations/page (310).png',
    'books/Great Expectations/page (311).png',
    'books/Great Expectations/page (312).png',
    'books/Great Expectations/page (313).png',
    'books/Great Expectations/page (314).png',
    'books/Great Expectations/page (315).png',
    'books/Great Expectations/page (316).png',
    'books/Great Expectations/page (317).png',
    'books/Great Expectations/page (318).png',
    'books/Great Expectations/page (319).png',
    'books/Great Expectations/page (320).png',
    'books/Great Expectations/page (321).png',
    'books/Great Expectations/page (322).png',
    'books/Great Expectations/page (323).png',
    'books/Great Expectations/page (324).png',
    'books/Great Expectations/page (325).png',
    'books/Great Expectations/page (326).png',
    'books/Great Expectations/page (327).png',
    'books/Great Expectations/page (328).png',
    'books/Great Expectations/page (329).png',
    'books/Great Expectations/page (330).png',
    'books/Great Expectations/page (331).png',
    'books/Great Expectations/page (332).png',
    'books/Great Expectations/page (333).png',
    'books/Great Expectations/page (334).png',
    'books/Great Expectations/page (335).png',
    'books/Great Expectations/page (336).png',
    'books/Great Expectations/page (337).png',
    'books/Great Expectations/page (338).png',
    'books/Great Expectations/page (339).png',
    'books/Great Expectations/page (340).png',
    'books/Great Expectations/page (341).png',
    'books/Great Expectations/page (342).png',
    'books/Great Expectations/page (343).png',
    'books/Great Expectations/page (344).png',
    'books/Great Expectations/page (345).png',
    'books/Great Expectations/page (346).png',
    'books/Great Expectations/page (347).png',
    'books/Great Expectations/page (348).png',
    'books/Great Expectations/page (349).png',
    'books/Great Expectations/page (350).png',
    'books/Great Expectations/page (351).png',
    'books/Great Expectations/page (352).png',
    'books/Great Expectations/page (353).png',
    'books/Great Expectations/page (354).png',
    'books/Great Expectations/page (355).png',
    'books/Great Expectations/page (356).png',
    'books/Great Expectations/page (357).png',
    'books/Great Expectations/page (358).png',
    'books/Great Expectations/page (359).png',
    'books/Great Expectations/page (360).png',
    'books/Great Expectations/page (361).png',
    'books/Great Expectations/page (362).png',
    'books/Great Expectations/page (363).png',
    'books/Great Expectations/page (364).png',
    'books/Great Expectations/page (365).png',
    'books/Great Expectations/page (366).png',
    'books/Great Expectations/page (367).png',
    'books/Great Expectations/page (368).png',
    'books/Great Expectations/page (369).png',
    'books/Great Expectations/page (370).png',
    'books/Great Expectations/page (371).png',
    'books/Great Expectations/page (372).png',
    'books/Great Expectations/page (373).png',
    'books/Great Expectations/page (374).png',
    'books/Great Expectations/page (375).png',
    'books/Great Expectations/page (376).png',
    'books/Great Expectations/page (377).png',
    'books/Great Expectations/page (378).png',
    'books/Great Expectations/page (379).png',
    'books/Great Expectations/page (380).png',
    'books/Great Expectations/page (381).png',
    'books/Great Expectations/page (382).png',
    'books/Great Expectations/page (383).png',
    'books/Great Expectations/page (384).png',
    'books/Great Expectations/page (385).png',
    'books/Great Expectations/page (386).png',
    'books/Great Expectations/page (387).png',
    'books/Great Expectations/page (388).png',
    'books/Great Expectations/page (389).png',
    'books/Great Expectations/page (390).png',
    'books/Great Expectations/page (391).png',
    'books/Great Expectations/page (392).png',
    'books/Great Expectations/page (393).png',
    'books/Great Expectations/page (394).png',
    'books/Great Expectations/page (395).png',
    'books/Great Expectations/page (396).png',
    'books/Great Expectations/page (397).png',
    'books/Great Expectations/page (398).png',
    'books/Great Expectations/page (399).png',
    'books/Great Expectations/page (400).png',
    'books/Great Expectations/page (401).png',
    'books/Great Expectations/page (402).png',

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
