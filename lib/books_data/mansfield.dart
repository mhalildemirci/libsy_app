import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mansfield extends StatefulWidget {
  const mansfield({Key? key}) : super(key: key);

  @override
  State<mansfield> createState() => _mansfieldState();
}

class _mansfieldState extends State<mansfield> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mansfield/page (1).png',
    'books/mansfield/page (2).png',
    'books/mansfield/page (3).png',
    'books/mansfield/page (4).png',
    'books/mansfield/page (5).png',
    'books/mansfield/page (6).png',
    'books/mansfield/page (7).png',
    'books/mansfield/page (8).png',
    'books/mansfield/page (9).png',
    'books/mansfield/page (10).png',
    'books/mansfield/page (11).png',
    'books/mansfield/page (12).png',
    'books/mansfield/page (13).png',
    'books/mansfield/page (14).png',
    'books/mansfield/page (15).png',
    'books/mansfield/page (16).png',
    'books/mansfield/page (17).png',
    'books/mansfield/page (18).png',
    'books/mansfield/page (19).png',
    'books/mansfield/page (20).png',
    'books/mansfield/page (21).png',
    'books/mansfield/page (22).png',
    'books/mansfield/page (23).png',
    'books/mansfield/page (24).png',
    'books/mansfield/page (25).png',
    'books/mansfield/page (26).png',
    'books/mansfield/page (27).png',
    'books/mansfield/page (28).png',
    'books/mansfield/page (29).png',
    'books/mansfield/page (30).png',
    'books/mansfield/page (31).png',
    'books/mansfield/page (32).png',
    'books/mansfield/page (33).png',
    'books/mansfield/page (34).png',
    'books/mansfield/page (35).png',
    'books/mansfield/page (36).png',
    'books/mansfield/page (37).png',
    'books/mansfield/page (38).png',
    'books/mansfield/page (39).png',
    'books/mansfield/page (40).png',
    'books/mansfield/page (41).png',
    'books/mansfield/page (42).png',
    'books/mansfield/page (43).png',
    'books/mansfield/page (44).png',
    'books/mansfield/page (45).png',
    'books/mansfield/page (46).png',
    'books/mansfield/page (47).png',
    'books/mansfield/page (48).png',
    'books/mansfield/page (49).png',
    'books/mansfield/page (50).png',
    'books/mansfield/page (51).png',
    'books/mansfield/page (52).png',
    'books/mansfield/page (53).png',
    'books/mansfield/page (54).png',
    'books/mansfield/page (55).png',
    'books/mansfield/page (56).png',
    'books/mansfield/page (57).png',
    'books/mansfield/page (58).png',
    'books/mansfield/page (59).png',
    'books/mansfield/page (60).png',
    'books/mansfield/page (61).png',
    'books/mansfield/page (62).png',
    'books/mansfield/page (63).png',
    'books/mansfield/page (64).png',
    'books/mansfield/page (65).png',
    'books/mansfield/page (66).png',
    'books/mansfield/page (67).png',
    'books/mansfield/page (68).png',
    'books/mansfield/page (69).png',
    'books/mansfield/page (70).png',
    'books/mansfield/page (71).png',
    'books/mansfield/page (72).png',
    'books/mansfield/page (73).png',
    'books/mansfield/page (74).png',
    'books/mansfield/page (75).png',
    'books/mansfield/page (76).png',
    'books/mansfield/page (77).png',
    'books/mansfield/page (78).png',
    'books/mansfield/page (79).png',
    'books/mansfield/page (80).png',
    'books/mansfield/page (81).png',
    'books/mansfield/page (82).png',
    'books/mansfield/page (83).png',
    'books/mansfield/page (84).png',
    'books/mansfield/page (85).png',
    'books/mansfield/page (86).png',
    'books/mansfield/page (87).png',
    'books/mansfield/page (88).png',
    'books/mansfield/page (89).png',
    'books/mansfield/page (90).png',
    'books/mansfield/page (91).png',
    'books/mansfield/page (92).png',
    'books/mansfield/page (93).png',
    'books/mansfield/page (94).png',
    'books/mansfield/page (95).png',
    'books/mansfield/page (96).png',
    'books/mansfield/page (97).png',
    'books/mansfield/page (98).png',
    'books/mansfield/page (99).png',
    'books/mansfield/page (100).png',
    'books/mansfield/page (101).png',
    'books/mansfield/page (102).png',
    'books/mansfield/page (103).png',
    'books/mansfield/page (104).png',
    'books/mansfield/page (105).png',
    'books/mansfield/page (106).png',
    'books/mansfield/page (107).png',
    'books/mansfield/page (108).png',
    'books/mansfield/page (109).png',
    'books/mansfield/page (110).png',
    'books/mansfield/page (111).png',
    'books/mansfield/page (112).png',
    'books/mansfield/page (113).png',
    'books/mansfield/page (114).png',
    'books/mansfield/page (115).png',
    'books/mansfield/page (116).png',
    'books/mansfield/page (117).png',
    'books/mansfield/page (118).png',
    'books/mansfield/page (119).png',
    'books/mansfield/page (120).png',
    'books/mansfield/page (121).png',
    'books/mansfield/page (122).png',
    'books/mansfield/page (123).png',
    'books/mansfield/page (124).png',
    'books/mansfield/page (125).png',
    'books/mansfield/page (126).png',
    'books/mansfield/page (127).png',
    'books/mansfield/page (128).png',
    'books/mansfield/page (129).png',
    'books/mansfield/page (130).png',
    'books/mansfield/page (131).png',
    'books/mansfield/page (132).png',
    'books/mansfield/page (133).png',
    'books/mansfield/page (134).png',
    'books/mansfield/page (135).png',
    'books/mansfield/page (136).png',
    'books/mansfield/page (137).png',
    'books/mansfield/page (138).png',
    'books/mansfield/page (139).png',
    'books/mansfield/page (140).png',
    'books/mansfield/page (141).png',
    'books/mansfield/page (142).png',
    'books/mansfield/page (143).png',
    'books/mansfield/page (144).png',
    'books/mansfield/page (145).png',
    'books/mansfield/page (146).png',
    'books/mansfield/page (147).png',
    'books/mansfield/page (148).png',
    'books/mansfield/page (149).png',
    'books/mansfield/page (150).png',
    'books/mansfield/page (151).png',
    'books/mansfield/page (152).png',
    'books/mansfield/page (153).png',
    'books/mansfield/page (154).png',
    'books/mansfield/page (155).png',
    'books/mansfield/page (156).png',
    'books/mansfield/page (157).png',
    'books/mansfield/page (158).png',
    'books/mansfield/page (159).png',
    'books/mansfield/page (160).png',
    'books/mansfield/page (161).png',
    'books/mansfield/page (162).png',
    'books/mansfield/page (163).png',
    'books/mansfield/page (164).png',
    'books/mansfield/page (165).png',
    'books/mansfield/page (166).png',
    'books/mansfield/page (167).png',
    'books/mansfield/page (168).png',
    'books/mansfield/page (169).png',
    'books/mansfield/page (170).png',
    'books/mansfield/page (171).png',
    'books/mansfield/page (172).png',
    'books/mansfield/page (173).png',
    'books/mansfield/page (174).png',
    'books/mansfield/page (175).png',
    'books/mansfield/page (176).png',
    'books/mansfield/page (177).png',
    'books/mansfield/page (178).png',
    'books/mansfield/page (179).png',
    'books/mansfield/page (180).png',
    'books/mansfield/page (181).png',
    'books/mansfield/page (182).png',
    'books/mansfield/page (183).png',
    'books/mansfield/page (184).png',
    'books/mansfield/page (185).png',
    'books/mansfield/page (186).png',
    'books/mansfield/page (187).png',
    'books/mansfield/page (188).png',
    'books/mansfield/page (189).png',
    'books/mansfield/page (190).png',
    'books/mansfield/page (191).png',
    'books/mansfield/page (192).png',
    'books/mansfield/page (193).png',
    'books/mansfield/page (194).png',
    'books/mansfield/page (195).png',
    'books/mansfield/page (196).png',
    'books/mansfield/page (197).png',
    'books/mansfield/page (198).png',
    'books/mansfield/page (199).png',
    'books/mansfield/page (200).png',
    'books/mansfield/page (201).png',
    'books/mansfield/page (202).png',
    'books/mansfield/page (203).png',
    'books/mansfield/page (204).png',
    'books/mansfield/page (205).png',
    'books/mansfield/page (206).png',
    'books/mansfield/page (207).png',
    'books/mansfield/page (208).png',
    'books/mansfield/page (209).png',
    'books/mansfield/page (210).png',
    'books/mansfield/page (211).png',
    'books/mansfield/page (212).png',
    'books/mansfield/page (213).png',
    'books/mansfield/page (214).png',
    'books/mansfield/page (215).png',
    'books/mansfield/page (216).png',
    'books/mansfield/page (217).png',
    'books/mansfield/page (218).png',
    'books/mansfield/page (219).png',
    'books/mansfield/page (220).png',
    'books/mansfield/page (221).png',
    'books/mansfield/page (222).png',
    'books/mansfield/page (223).png',
    'books/mansfield/page (224).png',
    'books/mansfield/page (225).png',
    'books/mansfield/page (226).png',
    'books/mansfield/page (227).png',
    'books/mansfield/page (228).png',
    'books/mansfield/page (229).png',
    'books/mansfield/page (230).png',
    'books/mansfield/page (231).png',
    'books/mansfield/page (232).png',
    'books/mansfield/page (233).png',
    'books/mansfield/page (234).png',
    'books/mansfield/page (235).png',
    'books/mansfield/page (236).png',
    'books/mansfield/page (237).png',
    'books/mansfield/page (238).png',
    'books/mansfield/page (239).png',
    'books/mansfield/page (240).png',
    'books/mansfield/page (241).png',
    'books/mansfield/page (242).png',
    'books/mansfield/page (243).png',
    'books/mansfield/page (244).png',
    'books/mansfield/page (245).png',
    'books/mansfield/page (246).png',
    'books/mansfield/page (247).png',
    'books/mansfield/page (248).png',
    'books/mansfield/page (249).png',
    'books/mansfield/page (250).png',
    'books/mansfield/page (251).png',
    'books/mansfield/page (252).png',
    'books/mansfield/page (253).png',
    'books/mansfield/page (254).png',
    'books/mansfield/page (255).png',
    'books/mansfield/page (256).png',
    'books/mansfield/page (257).png',
    'books/mansfield/page (258).png',
    'books/mansfield/page (259).png',
    'books/mansfield/page (260).png',
    'books/mansfield/page (261).png',
    'books/mansfield/page (262).png',
    'books/mansfield/page (263).png',
    'books/mansfield/page (264).png',
    'books/mansfield/page (265).png',
    'books/mansfield/page (266).png',
    'books/mansfield/page (267).png',
    'books/mansfield/page (268).png',
    'books/mansfield/page (269).png',
    'books/mansfield/page (270).png',
    'books/mansfield/page (271).png',
    'books/mansfield/page (272).png',
    'books/mansfield/page (273).png',
    'books/mansfield/page (274).png',
    'books/mansfield/page (275).png',
    'books/mansfield/page (276).png',
    'books/mansfield/page (277).png',
    'books/mansfield/page (278).png',
    'books/mansfield/page (279).png',
    'books/mansfield/page (280).png',
    'books/mansfield/page (281).png',
    'books/mansfield/page (282).png',
    'books/mansfield/page (283).png',
    'books/mansfield/page (284).png',
    'books/mansfield/page (285).png',
    'books/mansfield/page (286).png',
    'books/mansfield/page (287).png',
    'books/mansfield/page (288).png',
    'books/mansfield/page (289).png',
    'books/mansfield/page (290).png',
    'books/mansfield/page (291).png',
    'books/mansfield/page (292).png',
    'books/mansfield/page (293).png',
    'books/mansfield/page (294).png',
    'books/mansfield/page (295).png',
    'books/mansfield/page (296).png',
    'books/mansfield/page (297).png',
    'books/mansfield/page (298).png',
    'books/mansfield/page (299).png',
    'books/mansfield/page (300).png',
    'books/mansfield/page (301).png',
    'books/mansfield/page (302).png',
    'books/mansfield/page (303).png',
    'books/mansfield/page (304).png',
    'books/mansfield/page (305).png',
    'books/mansfield/page (306).png',
    'books/mansfield/page (307).png',
    'books/mansfield/page (308).png',
    'books/mansfield/page (309).png',
    'books/mansfield/page (310).png',
    'books/mansfield/page (311).png',
    'books/mansfield/page (312).png',
    'books/mansfield/page (313).png',
    'books/mansfield/page (314).png',
    'books/mansfield/page (315).png',
    'books/mansfield/page (316).png',
    'books/mansfield/page (317).png',
    'books/mansfield/page (318).png',
    'books/mansfield/page (319).png',
    'books/mansfield/page (320).png',
    'books/mansfield/page (321).png',
    'books/mansfield/page (322).png',
    'books/mansfield/page (323).png',
    'books/mansfield/page (324).png',
    'books/mansfield/page (325).png',
    'books/mansfield/page (326).png',
    'books/mansfield/page (327).png',
    'books/mansfield/page (328).png',
    'books/mansfield/page (329).png',
    'books/mansfield/page (330).png',
    'books/mansfield/page (331).png',
    'books/mansfield/page (332).png',
    'books/mansfield/page (333).png',
    'books/mansfield/page (334).png',
    'books/mansfield/page (335).png',
    'books/mansfield/page (336).png',
    'books/mansfield/page (337).png',
    'books/mansfield/page (338).png',
    'books/mansfield/page (339).png',
    'books/mansfield/page (340).png',
    'books/mansfield/page (341).png',
    'books/mansfield/page (342).png',
    'books/mansfield/page (343).png',
    'books/mansfield/page (344).png',
    'books/mansfield/page (345).png',
    'books/mansfield/page (346).png',
    'books/mansfield/page (347).png',
    'books/mansfield/page (348).png',
    'books/mansfield/page (349).png',
    'books/mansfield/page (350).png',
    'books/mansfield/page (351).png',
    'books/mansfield/page (352).png',
    'books/mansfield/page (353).png',
    'books/mansfield/page (354).png',
    'books/mansfield/page (355).png',
    'books/mansfield/page (356).png',
    'books/mansfield/page (357).png',
    'books/mansfield/page (358).png',
    'books/mansfield/page (359).png',
    'books/mansfield/page (360).png',
    'books/mansfield/page (361).png',
    'books/mansfield/page (362).png',
    'books/mansfield/page (363).png',
    'books/mansfield/page (364).png',
    'books/mansfield/page (365).png',
    'books/mansfield/page (366).png',
    'books/mansfield/page (367).png',
    'books/mansfield/page (368).png',
    'books/mansfield/page (369).png',
    'books/mansfield/page (370).png',
    'books/mansfield/page (371).png',
    'books/mansfield/page (372).png',
    'books/mansfield/page (373).png',
    'books/mansfield/page (374).png',
    'books/mansfield/page (375).png',
    'books/mansfield/page (376).png',
    'books/mansfield/page (377).png',
    'books/mansfield/page (378).png',
    'books/mansfield/page (379).png',
    'books/mansfield/page (380).png',
    'books/mansfield/page (381).png',
    'books/mansfield/page (382).png',
    'books/mansfield/page (383).png',
    'books/mansfield/page (384).png',
    'books/mansfield/page (385).png',
    'books/mansfield/page (386).png',
    'books/mansfield/page (387).png',
    'books/mansfield/page (388).png',
    'books/mansfield/page (389).png',
    'books/mansfield/page (390).png',
    'books/mansfield/page (391).png',
    'books/mansfield/page (392).png',
    'books/mansfield/page (393).png',
    'books/mansfield/page (394).png',
    'books/mansfield/page (395).png',
    'books/mansfield/page (396).png',
    'books/mansfield/page (397).png',
    'books/mansfield/page (398).png',
    'books/mansfield/page (399).png',
    'books/mansfield/page (400).png',
    'books/mansfield/page (401).png',
    'books/mansfield/page (402).png',
    'books/mansfield/page (403).png',
    'books/mansfield/page (404).png',
    'books/mansfield/page (405).png',
    'books/mansfield/page (406).png',
    'books/mansfield/page (407).png',
    'books/mansfield/page (408).png',
    'books/mansfield/page (409).png',

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
