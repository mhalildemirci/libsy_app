import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class notredame extends StatefulWidget {
  const notredame({Key? key}) : super(key: key);

  @override
  State<notredame> createState() => _notredameState();
}

class _notredameState extends State<notredame> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/notre dame/page (1).png',
    'books/notre dame/page (2).png',
    'books/notre dame/page (3).png',
    'books/notre dame/page (4).png',
    'books/notre dame/page (5).png',
    'books/notre dame/page (6).png',
    'books/notre dame/page (7).png',
    'books/notre dame/page (8).png',
    'books/notre dame/page (9).png',
    'books/notre dame/page (10).png',
    'books/notre dame/page (11).png',
    'books/notre dame/page (12).png',
    'books/notre dame/page (13).png',
    'books/notre dame/page (14).png',
    'books/notre dame/page (15).png',
    'books/notre dame/page (16).png',
    'books/notre dame/page (17).png',
    'books/notre dame/page (18).png',
    'books/notre dame/page (19).png',
    'books/notre dame/page (20).png',
    'books/notre dame/page (21).png',
    'books/notre dame/page (22).png',
    'books/notre dame/page (23).png',
    'books/notre dame/page (24).png',
    'books/notre dame/page (25).png',
    'books/notre dame/page (26).png',
    'books/notre dame/page (27).png',
    'books/notre dame/page (28).png',
    'books/notre dame/page (29).png',
    'books/notre dame/page (30).png',
    'books/notre dame/page (31).png',
    'books/notre dame/page (32).png',
    'books/notre dame/page (33).png',
    'books/notre dame/page (34).png',
    'books/notre dame/page (35).png',
    'books/notre dame/page (36).png',
    'books/notre dame/page (37).png',
    'books/notre dame/page (38).png',
    'books/notre dame/page (39).png',
    'books/notre dame/page (40).png',
    'books/notre dame/page (41).png',
    'books/notre dame/page (42).png',
    'books/notre dame/page (43).png',
    'books/notre dame/page (44).png',
    'books/notre dame/page (45).png',
    'books/notre dame/page (46).png',
    'books/notre dame/page (47).png',
    'books/notre dame/page (48).png',
    'books/notre dame/page (49).png',
    'books/notre dame/page (50).png',
    'books/notre dame/page (51).png',
    'books/notre dame/page (52).png',
    'books/notre dame/page (53).png',
    'books/notre dame/page (54).png',
    'books/notre dame/page (55).png',
    'books/notre dame/page (56).png',
    'books/notre dame/page (57).png',
    'books/notre dame/page (58).png',
    'books/notre dame/page (59).png',
    'books/notre dame/page (60).png',
    'books/notre dame/page (61).png',
    'books/notre dame/page (62).png',
    'books/notre dame/page (63).png',
    'books/notre dame/page (64).png',
    'books/notre dame/page (65).png',
    'books/notre dame/page (66).png',
    'books/notre dame/page (67).png',
    'books/notre dame/page (68).png',
    'books/notre dame/page (69).png',
    'books/notre dame/page (70).png',
    'books/notre dame/page (71).png',
    'books/notre dame/page (72).png',
    'books/notre dame/page (73).png',
    'books/notre dame/page (74).png',
    'books/notre dame/page (75).png',
    'books/notre dame/page (76).png',
    'books/notre dame/page (77).png',
    'books/notre dame/page (78).png',
    'books/notre dame/page (79).png',
    'books/notre dame/page (80).png',
    'books/notre dame/page (81).png',
    'books/notre dame/page (82).png',
    'books/notre dame/page (83).png',
    'books/notre dame/page (84).png',
    'books/notre dame/page (85).png',
    'books/notre dame/page (86).png',
    'books/notre dame/page (87).png',
    'books/notre dame/page (88).png',
    'books/notre dame/page (89).png',
    'books/notre dame/page (90).png',
    'books/notre dame/page (91).png',
    'books/notre dame/page (92).png',
    'books/notre dame/page (93).png',
    'books/notre dame/page (94).png',
    'books/notre dame/page (95).png',
    'books/notre dame/page (96).png',
    'books/notre dame/page (97).png',
    'books/notre dame/page (98).png',
    'books/notre dame/page (99).png',
    'books/notre dame/page (100).png',
    'books/notre dame/page (101).png',
    'books/notre dame/page (102).png',
    'books/notre dame/page (103).png',
    'books/notre dame/page (104).png',
    'books/notre dame/page (105).png',
    'books/notre dame/page (106).png',
    'books/notre dame/page (107).png',
    'books/notre dame/page (108).png',
    'books/notre dame/page (109).png',
    'books/notre dame/page (110).png',
    'books/notre dame/page (111).png',
    'books/notre dame/page (112).png',
    'books/notre dame/page (113).png',
    'books/notre dame/page (114).png',
    'books/notre dame/page (115).png',
    'books/notre dame/page (116).png',
    'books/notre dame/page (117).png',
    'books/notre dame/page (118).png',
    'books/notre dame/page (119).png',
    'books/notre dame/page (120).png',
    'books/notre dame/page (121).png',
    'books/notre dame/page (122).png',
    'books/notre dame/page (123).png',
    'books/notre dame/page (124).png',
    'books/notre dame/page (125).png',
    'books/notre dame/page (126).png',
    'books/notre dame/page (127).png',
    'books/notre dame/page (128).png',
    'books/notre dame/page (129).png',
    'books/notre dame/page (130).png',
    'books/notre dame/page (131).png',
    'books/notre dame/page (132).png',
    'books/notre dame/page (133).png',
    'books/notre dame/page (134).png',
    'books/notre dame/page (135).png',
    'books/notre dame/page (136).png',
    'books/notre dame/page (137).png',
    'books/notre dame/page (138).png',
    'books/notre dame/page (139).png',
    'books/notre dame/page (140).png',
    'books/notre dame/page (141).png',
    'books/notre dame/page (142).png',
    'books/notre dame/page (143).png',
    'books/notre dame/page (144).png',
    'books/notre dame/page (145).png',
    'books/notre dame/page (146).png',
    'books/notre dame/page (147).png',
    'books/notre dame/page (148).png',
    'books/notre dame/page (149).png',
    'books/notre dame/page (150).png',
    'books/notre dame/page (151).png',
    'books/notre dame/page (152).png',
    'books/notre dame/page (153).png',
    'books/notre dame/page (154).png',
    'books/notre dame/page (155).png',
    'books/notre dame/page (156).png',
    'books/notre dame/page (157).png',
    'books/notre dame/page (158).png',
    'books/notre dame/page (159).png',
    'books/notre dame/page (160).png',
    'books/notre dame/page (161).png',
    'books/notre dame/page (162).png',
    'books/notre dame/page (163).png',
    'books/notre dame/page (164).png',
    'books/notre dame/page (165).png',
    'books/notre dame/page (166).png',
    'books/notre dame/page (167).png',
    'books/notre dame/page (168).png',
    'books/notre dame/page (169).png',
    'books/notre dame/page (170).png',
    'books/notre dame/page (171).png',
    'books/notre dame/page (172).png',
    'books/notre dame/page (173).png',
    'books/notre dame/page (174).png',
    'books/notre dame/page (175).png',
    'books/notre dame/page (176).png',
    'books/notre dame/page (177).png',
    'books/notre dame/page (178).png',
    'books/notre dame/page (179).png',
    'books/notre dame/page (180).png',
    'books/notre dame/page (181).png',
    'books/notre dame/page (182).png',
    'books/notre dame/page (183).png',
    'books/notre dame/page (184).png',
    'books/notre dame/page (185).png',
    'books/notre dame/page (186).png',
    'books/notre dame/page (187).png',
    'books/notre dame/page (188).png',
    'books/notre dame/page (189).png',
    'books/notre dame/page (190).png',
    'books/notre dame/page (191).png',
    'books/notre dame/page (192).png',
    'books/notre dame/page (193).png',
    'books/notre dame/page (194).png',
    'books/notre dame/page (195).png',
    'books/notre dame/page (196).png',
    'books/notre dame/page (197).png',
    'books/notre dame/page (198).png',
    'books/notre dame/page (199).png',
    'books/notre dame/page (200).png',
    'books/notre dame/page (201).png',
    'books/notre dame/page (202).png',
    'books/notre dame/page (203).png',
    'books/notre dame/page (204).png',
    'books/notre dame/page (205).png',
    'books/notre dame/page (206).png',
    'books/notre dame/page (207).png',
    'books/notre dame/page (208).png',
    'books/notre dame/page (209).png',
    'books/notre dame/page (210).png',
    'books/notre dame/page (211).png',
    'books/notre dame/page (212).png',
    'books/notre dame/page (213).png',
    'books/notre dame/page (214).png',
    'books/notre dame/page (215).png',
    'books/notre dame/page (216).png',
    'books/notre dame/page (217).png',
    'books/notre dame/page (218).png',
    'books/notre dame/page (219).png',
    'books/notre dame/page (220).png',
    'books/notre dame/page (221).png',
    'books/notre dame/page (222).png',
    'books/notre dame/page (223).png',
    'books/notre dame/page (224).png',
    'books/notre dame/page (225).png',
    'books/notre dame/page (226).png',
    'books/notre dame/page (227).png',
    'books/notre dame/page (228).png',
    'books/notre dame/page (229).png',
    'books/notre dame/page (230).png',
    'books/notre dame/page (231).png',
    'books/notre dame/page (232).png',
    'books/notre dame/page (233).png',
    'books/notre dame/page (234).png',
    'books/notre dame/page (235).png',
    'books/notre dame/page (236).png',
    'books/notre dame/page (237).png',
    'books/notre dame/page (238).png',
    'books/notre dame/page (239).png',
    'books/notre dame/page (240).png',
    'books/notre dame/page (241).png',
    'books/notre dame/page (242).png',
    'books/notre dame/page (243).png',
    'books/notre dame/page (244).png',
    'books/notre dame/page (245).png',
    'books/notre dame/page (246).png',
    'books/notre dame/page (247).png',
    'books/notre dame/page (248).png',
    'books/notre dame/page (249).png',
    'books/notre dame/page (250).png',
    'books/notre dame/page (251).png',
    'books/notre dame/page (252).png',
    'books/notre dame/page (253).png',
    'books/notre dame/page (254).png',
    'books/notre dame/page (255).png',
    'books/notre dame/page (256).png',
    'books/notre dame/page (257).png',
    'books/notre dame/page (258).png',
    'books/notre dame/page (259).png',
    'books/notre dame/page (260).png',
    'books/notre dame/page (261).png',
    'books/notre dame/page (262).png',
    'books/notre dame/page (263).png',
    'books/notre dame/page (264).png',
    'books/notre dame/page (265).png',
    'books/notre dame/page (266).png',
    'books/notre dame/page (267).png',
    'books/notre dame/page (268).png',
    'books/notre dame/page (269).png',
    'books/notre dame/page (270).png',
    'books/notre dame/page (271).png',
    'books/notre dame/page (272).png',
    'books/notre dame/page (273).png',
    'books/notre dame/page (274).png',
    'books/notre dame/page (275).png',
    'books/notre dame/page (276).png',
    'books/notre dame/page (277).png',
    'books/notre dame/page (278).png',
    'books/notre dame/page (279).png',
    'books/notre dame/page (280).png',
    'books/notre dame/page (281).png',
    'books/notre dame/page (282).png',
    'books/notre dame/page (283).png',
    'books/notre dame/page (284).png',
    'books/notre dame/page (285).png',
    'books/notre dame/page (286).png',
    'books/notre dame/page (287).png',
    'books/notre dame/page (288).png',
    'books/notre dame/page (289).png',
    'books/notre dame/page (290).png',
    'books/notre dame/page (291).png',
    'books/notre dame/page (292).png',
    'books/notre dame/page (293).png',
    'books/notre dame/page (294).png',
    'books/notre dame/page (295).png',
    'books/notre dame/page (296).png',
    'books/notre dame/page (297).png',
    'books/notre dame/page (298).png',
    'books/notre dame/page (299).png',
    'books/notre dame/page (300).png',
    'books/notre dame/page (301).png',
    'books/notre dame/page (302).png',
    'books/notre dame/page (303).png',
    'books/notre dame/page (304).png',
    'books/notre dame/page (305).png',
    'books/notre dame/page (306).png',
    'books/notre dame/page (307).png',
    'books/notre dame/page (308).png',
    'books/notre dame/page (309).png',
    'books/notre dame/page (310).png',
    'books/notre dame/page (311).png',
    'books/notre dame/page (312).png',
    'books/notre dame/page (313).png',
    'books/notre dame/page (314).png',
    'books/notre dame/page (315).png',
    'books/notre dame/page (316).png',
    'books/notre dame/page (317).png',
    'books/notre dame/page (318).png',
    'books/notre dame/page (319).png',
    'books/notre dame/page (320).png',
    'books/notre dame/page (321).png',
    'books/notre dame/page (322).png',
    'books/notre dame/page (323).png',
    'books/notre dame/page (324).png',
    'books/notre dame/page (325).png',
    'books/notre dame/page (326).png',
    'books/notre dame/page (327).png',
    'books/notre dame/page (328).png',
    'books/notre dame/page (329).png',
    'books/notre dame/page (330).png',
    'books/notre dame/page (331).png',
    'books/notre dame/page (332).png',
    'books/notre dame/page (333).png',
    'books/notre dame/page (334).png',
    'books/notre dame/page (335).png',
    'books/notre dame/page (336).png',
    'books/notre dame/page (337).png',
    'books/notre dame/page (338).png',
    'books/notre dame/page (339).png',
    'books/notre dame/page (340).png',
    'books/notre dame/page (341).png',
    'books/notre dame/page (342).png',
    'books/notre dame/page (343).png',
    'books/notre dame/page (344).png',
    'books/notre dame/page (345).png',
    'books/notre dame/page (346).png',
    'books/notre dame/page (347).png',
    'books/notre dame/page (348).png',
    'books/notre dame/page (349).png',
    'books/notre dame/page (350).png',
    'books/notre dame/page (351).png',
    'books/notre dame/page (352).png',
    'books/notre dame/page (353).png',
    'books/notre dame/page (354).png',
    'books/notre dame/page (355).png',
    'books/notre dame/page (356).png',
    'books/notre dame/page (357).png',
    'books/notre dame/page (358).png',
    'books/notre dame/page (359).png',
    'books/notre dame/page (360).png',
    'books/notre dame/page (361).png',
    'books/notre dame/page (362).png',
    'books/notre dame/page (363).png',
    'books/notre dame/page (364).png',
    'books/notre dame/page (365).png',
    'books/notre dame/page (366).png',
    'books/notre dame/page (367).png',
    'books/notre dame/page (368).png',
    'books/notre dame/page (369).png',
    'books/notre dame/page (370).png',
    'books/notre dame/page (371).png',
    'books/notre dame/page (372).png',
    'books/notre dame/page (373).png',
    'books/notre dame/page (374).png',
    'books/notre dame/page (375).png',
    'books/notre dame/page (376).png',
    'books/notre dame/page (377).png',
    'books/notre dame/page (378).png',
    'books/notre dame/page (379).png',
    'books/notre dame/page (380).png',
    'books/notre dame/page (381).png',
    'books/notre dame/page (382).png',
    'books/notre dame/page (383).png',
    'books/notre dame/page (384).png',
    'books/notre dame/page (385).png',
    'books/notre dame/page (386).png',
    'books/notre dame/page (387).png',
    'books/notre dame/page (388).png',
    'books/notre dame/page (389).png',
    'books/notre dame/page (390).png',
    'books/notre dame/page (391).png',
    'books/notre dame/page (392).png',
    'books/notre dame/page (393).png',
    'books/notre dame/page (394).png',
    'books/notre dame/page (395).png',
    'books/notre dame/page (396).png',
    'books/notre dame/page (397).png',
    'books/notre dame/page (398).png',
    'books/notre dame/page (399).png',
    'books/notre dame/page (400).png',
    'books/notre dame/page (401).png',
    'books/notre dame/page (402).png',
    'books/notre dame/page (403).png',
    'books/notre dame/page (404).png',
    'books/notre dame/page (405).png',
    'books/notre dame/page (406).png',
    'books/notre dame/page (407).png',
    'books/notre dame/page (408).png',
    'books/notre dame/page (409).png',
    'books/notre dame/page (410).png',
    'books/notre dame/page (411).png',
    'books/notre dame/page (412).png',
    'books/notre dame/page (413).png',
    'books/notre dame/page (414).png',
    'books/notre dame/page (415).png',
    'books/notre dame/page (416).png',

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
