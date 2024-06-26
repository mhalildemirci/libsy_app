import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class voyagebeagle extends StatefulWidget {
  const voyagebeagle({Key? key}) : super(key: key);

  @override
  State<voyagebeagle> createState() => _voyagebeagleState();
}

class _voyagebeagleState extends State<voyagebeagle> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/voyage beagle/page (1).png',
    'books/voyage beagle/page (2).png',
    'books/voyage beagle/page (3).png',
    'books/voyage beagle/page (4).png',
    'books/voyage beagle/page (5).png',
    'books/voyage beagle/page (6).png',
    'books/voyage beagle/page (7).png',
    'books/voyage beagle/page (8).png',
    'books/voyage beagle/page (9).png',
    'books/voyage beagle/page (10).png',
    'books/voyage beagle/page (11).png',
    'books/voyage beagle/page (12).png',
    'books/voyage beagle/page (13).png',
    'books/voyage beagle/page (14).png',
    'books/voyage beagle/page (15).png',
    'books/voyage beagle/page (16).png',
    'books/voyage beagle/page (17).png',
    'books/voyage beagle/page (18).png',
    'books/voyage beagle/page (19).png',
    'books/voyage beagle/page (20).png',
    'books/voyage beagle/page (21).png',
    'books/voyage beagle/page (22).png',
    'books/voyage beagle/page (23).png',
    'books/voyage beagle/page (24).png',
    'books/voyage beagle/page (25).png',
    'books/voyage beagle/page (26).png',
    'books/voyage beagle/page (27).png',
    'books/voyage beagle/page (28).png',
    'books/voyage beagle/page (29).png',
    'books/voyage beagle/page (30).png',
    'books/voyage beagle/page (31).png',
    'books/voyage beagle/page (32).png',
    'books/voyage beagle/page (33).png',
    'books/voyage beagle/page (34).png',
    'books/voyage beagle/page (35).png',
    'books/voyage beagle/page (36).png',
    'books/voyage beagle/page (37).png',
    'books/voyage beagle/page (38).png',
    'books/voyage beagle/page (39).png',
    'books/voyage beagle/page (40).png',
    'books/voyage beagle/page (41).png',
    'books/voyage beagle/page (42).png',
    'books/voyage beagle/page (43).png',
    'books/voyage beagle/page (44).png',
    'books/voyage beagle/page (45).png',
    'books/voyage beagle/page (46).png',
    'books/voyage beagle/page (47).png',
    'books/voyage beagle/page (48).png',
    'books/voyage beagle/page (49).png',
    'books/voyage beagle/page (50).png',
    'books/voyage beagle/page (51).png',
    'books/voyage beagle/page (52).png',
    'books/voyage beagle/page (53).png',
    'books/voyage beagle/page (54).png',
    'books/voyage beagle/page (55).png',
    'books/voyage beagle/page (56).png',
    'books/voyage beagle/page (57).png',
    'books/voyage beagle/page (58).png',
    'books/voyage beagle/page (59).png',
    'books/voyage beagle/page (60).png',
    'books/voyage beagle/page (61).png',
    'books/voyage beagle/page (62).png',
    'books/voyage beagle/page (63).png',
    'books/voyage beagle/page (64).png',
    'books/voyage beagle/page (65).png',
    'books/voyage beagle/page (66).png',
    'books/voyage beagle/page (67).png',
    'books/voyage beagle/page (68).png',
    'books/voyage beagle/page (69).png',
    'books/voyage beagle/page (70).png',
    'books/voyage beagle/page (71).png',
    'books/voyage beagle/page (72).png',
    'books/voyage beagle/page (73).png',
    'books/voyage beagle/page (74).png',
    'books/voyage beagle/page (75).png',
    'books/voyage beagle/page (76).png',
    'books/voyage beagle/page (77).png',
    'books/voyage beagle/page (78).png',
    'books/voyage beagle/page (79).png',
    'books/voyage beagle/page (80).png',
    'books/voyage beagle/page (81).png',
    'books/voyage beagle/page (82).png',
    'books/voyage beagle/page (83).png',
    'books/voyage beagle/page (84).png',
    'books/voyage beagle/page (85).png',
    'books/voyage beagle/page (86).png',
    'books/voyage beagle/page (87).png',
    'books/voyage beagle/page (88).png',
    'books/voyage beagle/page (89).png',
    'books/voyage beagle/page (90).png',
    'books/voyage beagle/page (91).png',
    'books/voyage beagle/page (92).png',
    'books/voyage beagle/page (93).png',
    'books/voyage beagle/page (94).png',
    'books/voyage beagle/page (95).png',
    'books/voyage beagle/page (96).png',
    'books/voyage beagle/page (97).png',
    'books/voyage beagle/page (98).png',
    'books/voyage beagle/page (99).png',
    'books/voyage beagle/page (100).png',
    'books/voyage beagle/page (101).png',
    'books/voyage beagle/page (102).png',
    'books/voyage beagle/page (103).png',
    'books/voyage beagle/page (104).png',
    'books/voyage beagle/page (105).png',
    'books/voyage beagle/page (106).png',
    'books/voyage beagle/page (107).png',
    'books/voyage beagle/page (108).png',
    'books/voyage beagle/page (109).png',
    'books/voyage beagle/page (110).png',
    'books/voyage beagle/page (111).png',
    'books/voyage beagle/page (112).png',
    'books/voyage beagle/page (113).png',
    'books/voyage beagle/page (114).png',
    'books/voyage beagle/page (115).png',
    'books/voyage beagle/page (116).png',
    'books/voyage beagle/page (117).png',
    'books/voyage beagle/page (118).png',
    'books/voyage beagle/page (119).png',
    'books/voyage beagle/page (120).png',
    'books/voyage beagle/page (121).png',
    'books/voyage beagle/page (122).png',
    'books/voyage beagle/page (123).png',
    'books/voyage beagle/page (124).png',
    'books/voyage beagle/page (125).png',
    'books/voyage beagle/page (126).png',
    'books/voyage beagle/page (127).png',
    'books/voyage beagle/page (128).png',
    'books/voyage beagle/page (129).png',
    'books/voyage beagle/page (130).png',
    'books/voyage beagle/page (131).png',
    'books/voyage beagle/page (132).png',
    'books/voyage beagle/page (133).png',
    'books/voyage beagle/page (134).png',
    'books/voyage beagle/page (135).png',
    'books/voyage beagle/page (136).png',
    'books/voyage beagle/page (137).png',
    'books/voyage beagle/page (138).png',
    'books/voyage beagle/page (139).png',
    'books/voyage beagle/page (140).png',
    'books/voyage beagle/page (141).png',
    'books/voyage beagle/page (142).png',
    'books/voyage beagle/page (143).png',
    'books/voyage beagle/page (144).png',
    'books/voyage beagle/page (145).png',
    'books/voyage beagle/page (146).png',
    'books/voyage beagle/page (147).png',
    'books/voyage beagle/page (148).png',
    'books/voyage beagle/page (149).png',
    'books/voyage beagle/page (150).png',
    'books/voyage beagle/page (151).png',
    'books/voyage beagle/page (152).png',
    'books/voyage beagle/page (153).png',
    'books/voyage beagle/page (154).png',
    'books/voyage beagle/page (155).png',
    'books/voyage beagle/page (156).png',
    'books/voyage beagle/page (157).png',
    'books/voyage beagle/page (158).png',
    'books/voyage beagle/page (159).png',
    'books/voyage beagle/page (160).png',
    'books/voyage beagle/page (161).png',
    'books/voyage beagle/page (162).png',
    'books/voyage beagle/page (163).png',
    'books/voyage beagle/page (164).png',
    'books/voyage beagle/page (165).png',
    'books/voyage beagle/page (166).png',
    'books/voyage beagle/page (167).png',
    'books/voyage beagle/page (168).png',
    'books/voyage beagle/page (169).png',
    'books/voyage beagle/page (170).png',
    'books/voyage beagle/page (171).png',
    'books/voyage beagle/page (172).png',
    'books/voyage beagle/page (173).png',
    'books/voyage beagle/page (174).png',
    'books/voyage beagle/page (175).png',
    'books/voyage beagle/page (176).png',
    'books/voyage beagle/page (177).png',
    'books/voyage beagle/page (178).png',
    'books/voyage beagle/page (179).png',
    'books/voyage beagle/page (180).png',
    'books/voyage beagle/page (181).png',
    'books/voyage beagle/page (182).png',
    'books/voyage beagle/page (183).png',
    'books/voyage beagle/page (184).png',
    'books/voyage beagle/page (185).png',
    'books/voyage beagle/page (186).png',
    'books/voyage beagle/page (187).png',
    'books/voyage beagle/page (188).png',
    'books/voyage beagle/page (189).png',
    'books/voyage beagle/page (190).png',
    'books/voyage beagle/page (191).png',
    'books/voyage beagle/page (192).png',
    'books/voyage beagle/page (193).png',
    'books/voyage beagle/page (194).png',
    'books/voyage beagle/page (195).png',
    'books/voyage beagle/page (196).png',
    'books/voyage beagle/page (197).png',
    'books/voyage beagle/page (198).png',
    'books/voyage beagle/page (199).png',
    'books/voyage beagle/page (200).png',
    'books/voyage beagle/page (201).png',
    'books/voyage beagle/page (202).png',
    'books/voyage beagle/page (203).png',
    'books/voyage beagle/page (204).png',
    'books/voyage beagle/page (205).png',
    'books/voyage beagle/page (206).png',
    'books/voyage beagle/page (207).png',
    'books/voyage beagle/page (208).png',
    'books/voyage beagle/page (209).png',
    'books/voyage beagle/page (210).png',
    'books/voyage beagle/page (211).png',
    'books/voyage beagle/page (212).png',
    'books/voyage beagle/page (213).png',
    'books/voyage beagle/page (214).png',
    'books/voyage beagle/page (215).png',
    'books/voyage beagle/page (216).png',
    'books/voyage beagle/page (217).png',
    'books/voyage beagle/page (218).png',
    'books/voyage beagle/page (219).png',
    'books/voyage beagle/page (220).png',
    'books/voyage beagle/page (221).png',
    'books/voyage beagle/page (222).png',
    'books/voyage beagle/page (223).png',
    'books/voyage beagle/page (224).png',
    'books/voyage beagle/page (225).png',
    'books/voyage beagle/page (226).png',
    'books/voyage beagle/page (227).png',
    'books/voyage beagle/page (228).png',
    'books/voyage beagle/page (229).png',
    'books/voyage beagle/page (230).png',
    'books/voyage beagle/page (231).png',
    'books/voyage beagle/page (232).png',
    'books/voyage beagle/page (233).png',
    'books/voyage beagle/page (234).png',
    'books/voyage beagle/page (235).png',
    'books/voyage beagle/page (236).png',
    'books/voyage beagle/page (237).png',
    'books/voyage beagle/page (238).png',
    'books/voyage beagle/page (239).png',
    'books/voyage beagle/page (240).png',
    'books/voyage beagle/page (241).png',
    'books/voyage beagle/page (242).png',
    'books/voyage beagle/page (243).png',
    'books/voyage beagle/page (244).png',
    'books/voyage beagle/page (245).png',
    'books/voyage beagle/page (246).png',
    'books/voyage beagle/page (247).png',
    'books/voyage beagle/page (248).png',
    'books/voyage beagle/page (249).png',
    'books/voyage beagle/page (250).png',
    'books/voyage beagle/page (251).png',
    'books/voyage beagle/page (252).png',
    'books/voyage beagle/page (253).png',
    'books/voyage beagle/page (254).png',
    'books/voyage beagle/page (255).png',
    'books/voyage beagle/page (256).png',
    'books/voyage beagle/page (257).png',
    'books/voyage beagle/page (258).png',
    'books/voyage beagle/page (259).png',
    'books/voyage beagle/page (260).png',
    'books/voyage beagle/page (261).png',
    'books/voyage beagle/page (262).png',
    'books/voyage beagle/page (263).png',
    'books/voyage beagle/page (264).png',
    'books/voyage beagle/page (265).png',
    'books/voyage beagle/page (266).png',
    'books/voyage beagle/page (267).png',
    'books/voyage beagle/page (268).png',
    'books/voyage beagle/page (269).png',
    'books/voyage beagle/page (270).png',
    'books/voyage beagle/page (271).png',
    'books/voyage beagle/page (272).png',
    'books/voyage beagle/page (273).png',
    'books/voyage beagle/page (274).png',
    'books/voyage beagle/page (275).png',
    'books/voyage beagle/page (276).png',
    'books/voyage beagle/page (277).png',
    'books/voyage beagle/page (278).png',
    'books/voyage beagle/page (279).png',
    'books/voyage beagle/page (280).png',
    'books/voyage beagle/page (281).png',
    'books/voyage beagle/page (282).png',
    'books/voyage beagle/page (283).png',
    'books/voyage beagle/page (284).png',
    'books/voyage beagle/page (285).png',
    'books/voyage beagle/page (286).png',
    'books/voyage beagle/page (287).png',
    'books/voyage beagle/page (288).png',
    'books/voyage beagle/page (289).png',
    'books/voyage beagle/page (290).png',
    'books/voyage beagle/page (291).png',
    'books/voyage beagle/page (292).png',
    'books/voyage beagle/page (293).png',
    'books/voyage beagle/page (294).png',
    'books/voyage beagle/page (295).png',
    'books/voyage beagle/page (296).png',
    'books/voyage beagle/page (297).png',
    'books/voyage beagle/page (298).png',
    'books/voyage beagle/page (299).png',
    'books/voyage beagle/page (300).png',
    'books/voyage beagle/page (301).png',
    'books/voyage beagle/page (302).png',
    'books/voyage beagle/page (303).png',
    'books/voyage beagle/page (304).png',
    'books/voyage beagle/page (305).png',
    'books/voyage beagle/page (306).png',
    'books/voyage beagle/page (307).png',
    'books/voyage beagle/page (308).png',
    'books/voyage beagle/page (309).png',
    'books/voyage beagle/page (310).png',
    'books/voyage beagle/page (311).png',
    'books/voyage beagle/page (312).png',
    'books/voyage beagle/page (313).png',
    'books/voyage beagle/page (314).png',
    'books/voyage beagle/page (315).png',
    'books/voyage beagle/page (316).png',
    'books/voyage beagle/page (317).png',
    'books/voyage beagle/page (318).png',
    'books/voyage beagle/page (319).png',
    'books/voyage beagle/page (320).png',
    'books/voyage beagle/page (321).png',
    'books/voyage beagle/page (322).png',
    'books/voyage beagle/page (323).png',
    'books/voyage beagle/page (324).png',
    'books/voyage beagle/page (325).png',
    'books/voyage beagle/page (326).png',
    'books/voyage beagle/page (327).png',
    'books/voyage beagle/page (328).png',
    'books/voyage beagle/page (329).png',
    'books/voyage beagle/page (330).png',
    'books/voyage beagle/page (331).png',
    'books/voyage beagle/page (332).png',
    'books/voyage beagle/page (333).png',
    'books/voyage beagle/page (334).png',
    'books/voyage beagle/page (335).png',
    'books/voyage beagle/page (336).png',
    'books/voyage beagle/page (337).png',
    'books/voyage beagle/page (338).png',
    'books/voyage beagle/page (339).png',
    'books/voyage beagle/page (340).png',
    'books/voyage beagle/page (341).png',
    'books/voyage beagle/page (342).png',
    'books/voyage beagle/page (343).png',
    'books/voyage beagle/page (344).png',
    'books/voyage beagle/page (345).png',
    'books/voyage beagle/page (346).png',
    'books/voyage beagle/page (347).png',
    'books/voyage beagle/page (348).png',
    'books/voyage beagle/page (349).png',
    'books/voyage beagle/page (350).png',
    'books/voyage beagle/page (351).png',
    'books/voyage beagle/page (352).png',
    'books/voyage beagle/page (353).png',
    'books/voyage beagle/page (354).png',
    'books/voyage beagle/page (355).png',
    'books/voyage beagle/page (356).png',
    'books/voyage beagle/page (357).png',
    'books/voyage beagle/page (358).png',
    'books/voyage beagle/page (359).png',
    'books/voyage beagle/page (360).png',
    'books/voyage beagle/page (361).png',
    'books/voyage beagle/page (362).png',
    'books/voyage beagle/page (363).png',
    'books/voyage beagle/page (364).png',
    'books/voyage beagle/page (365).png',
    'books/voyage beagle/page (366).png',
    'books/voyage beagle/page (367).png',
    'books/voyage beagle/page (368).png',
    'books/voyage beagle/page (369).png',
    'books/voyage beagle/page (370).png',
    'books/voyage beagle/page (371).png',
    'books/voyage beagle/page (372).png',
    'books/voyage beagle/page (373).png',
    'books/voyage beagle/page (374).png',
    'books/voyage beagle/page (375).png',
    'books/voyage beagle/page (376).png',
    'books/voyage beagle/page (377).png',
    'books/voyage beagle/page (378).png',
    'books/voyage beagle/page (379).png',
    'books/voyage beagle/page (380).png',
    'books/voyage beagle/page (381).png',
    'books/voyage beagle/page (382).png',
    'books/voyage beagle/page (383).png',
    'books/voyage beagle/page (384).png',
    'books/voyage beagle/page (385).png',
    'books/voyage beagle/page (386).png',
    'books/voyage beagle/page (387).png',
    'books/voyage beagle/page (388).png',
    'books/voyage beagle/page (389).png',
    'books/voyage beagle/page (390).png',
    'books/voyage beagle/page (391).png',
    'books/voyage beagle/page (392).png',
    'books/voyage beagle/page (393).png',
    'books/voyage beagle/page (394).png',
    'books/voyage beagle/page (395).png',
    'books/voyage beagle/page (396).png',
    'books/voyage beagle/page (397).png',
    'books/voyage beagle/page (398).png',
    'books/voyage beagle/page (399).png',
    'books/voyage beagle/page (400).png',
    'books/voyage beagle/page (401).png',
    'books/voyage beagle/page (402).png',
    'books/voyage beagle/page (403).png',
    'books/voyage beagle/page (404).png',
    'books/voyage beagle/page (405).png',
    'books/voyage beagle/page (406).png',
    'books/voyage beagle/page (407).png',
    'books/voyage beagle/page (408).png',
    'books/voyage beagle/page (409).png',
    'books/voyage beagle/page (410).png',
    'books/voyage beagle/page (411).png',
    'books/voyage beagle/page (412).png',
    'books/voyage beagle/page (413).png',
    'books/voyage beagle/page (414).png',
    'books/voyage beagle/page (415).png',
    'books/voyage beagle/page (416).png',
    'books/voyage beagle/page (417).png',
    'books/voyage beagle/page (418).png',
    'books/voyage beagle/page (419).png',
    'books/voyage beagle/page (420).png',
    'books/voyage beagle/page (421).png',
    'books/voyage beagle/page (422).png',
    'books/voyage beagle/page (423).png',
    'books/voyage beagle/page (424).png',
    'books/voyage beagle/page (425).png',
    'books/voyage beagle/page (426).png',
    'books/voyage beagle/page (427).png',
    'books/voyage beagle/page (428).png',
    'books/voyage beagle/page (429).png',
    'books/voyage beagle/page (430).png',
    'books/voyage beagle/page (431).png',
    'books/voyage beagle/page (432).png',
    'books/voyage beagle/page (433).png',
    'books/voyage beagle/page (434).png',
    'books/voyage beagle/page (435).png',
    'books/voyage beagle/page (436).png',
    'books/voyage beagle/page (437).png',
    'books/voyage beagle/page (438).png',
    'books/voyage beagle/page (439).png',
    'books/voyage beagle/page (440).png',
    'books/voyage beagle/page (441).png',
    'books/voyage beagle/page (442).png',
    'books/voyage beagle/page (443).png',
    'books/voyage beagle/page (444).png',
    'books/voyage beagle/page (445).png',
    'books/voyage beagle/page (446).png',
    'books/voyage beagle/page (447).png',
    'books/voyage beagle/page (448).png',

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
