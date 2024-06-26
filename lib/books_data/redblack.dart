import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class redblack extends StatefulWidget {
  const redblack({Key? key}) : super(key: key);

  @override
  State<redblack> createState() => _redblackState();
}

class _redblackState extends State<redblack> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/red and black/page (1).png',
    'books/red and black/page (2).png',
    'books/red and black/page (3).png',
    'books/red and black/page (4).png',
    'books/red and black/page (5).png',
    'books/red and black/page (6).png',
    'books/red and black/page (7).png',
    'books/red and black/page (8).png',
    'books/red and black/page (9).png',
    'books/red and black/page (10).png',
    'books/red and black/page (11).png',
    'books/red and black/page (12).png',
    'books/red and black/page (13).png',
    'books/red and black/page (14).png',
    'books/red and black/page (15).png',
    'books/red and black/page (16).png',
    'books/red and black/page (17).png',
    'books/red and black/page (18).png',
    'books/red and black/page (19).png',
    'books/red and black/page (20).png',
    'books/red and black/page (21).png',
    'books/red and black/page (22).png',
    'books/red and black/page (23).png',
    'books/red and black/page (24).png',
    'books/red and black/page (25).png',
    'books/red and black/page (26).png',
    'books/red and black/page (27).png',
    'books/red and black/page (28).png',
    'books/red and black/page (29).png',
    'books/red and black/page (30).png',
    'books/red and black/page (31).png',
    'books/red and black/page (32).png',
    'books/red and black/page (33).png',
    'books/red and black/page (34).png',
    'books/red and black/page (35).png',
    'books/red and black/page (36).png',
    'books/red and black/page (37).png',
    'books/red and black/page (38).png',
    'books/red and black/page (39).png',
    'books/red and black/page (40).png',
    'books/red and black/page (41).png',
    'books/red and black/page (42).png',
    'books/red and black/page (43).png',
    'books/red and black/page (44).png',
    'books/red and black/page (45).png',
    'books/red and black/page (46).png',
    'books/red and black/page (47).png',
    'books/red and black/page (48).png',
    'books/red and black/page (49).png',
    'books/red and black/page (50).png',
    'books/red and black/page (51).png',
    'books/red and black/page (52).png',
    'books/red and black/page (53).png',
    'books/red and black/page (54).png',
    'books/red and black/page (55).png',
    'books/red and black/page (56).png',
    'books/red and black/page (57).png',
    'books/red and black/page (58).png',
    'books/red and black/page (59).png',
    'books/red and black/page (60).png',
    'books/red and black/page (61).png',
    'books/red and black/page (62).png',
    'books/red and black/page (63).png',
    'books/red and black/page (64).png',
    'books/red and black/page (65).png',
    'books/red and black/page (66).png',
    'books/red and black/page (67).png',
    'books/red and black/page (68).png',
    'books/red and black/page (69).png',
    'books/red and black/page (70).png',
    'books/red and black/page (71).png',
    'books/red and black/page (72).png',
    'books/red and black/page (73).png',
    'books/red and black/page (74).png',
    'books/red and black/page (75).png',
    'books/red and black/page (76).png',
    'books/red and black/page (77).png',
    'books/red and black/page (78).png',
    'books/red and black/page (79).png',
    'books/red and black/page (80).png',
    'books/red and black/page (81).png',
    'books/red and black/page (82).png',
    'books/red and black/page (83).png',
    'books/red and black/page (84).png',
    'books/red and black/page (85).png',
    'books/red and black/page (86).png',
    'books/red and black/page (87).png',
    'books/red and black/page (88).png',
    'books/red and black/page (89).png',
    'books/red and black/page (90).png',
    'books/red and black/page (91).png',
    'books/red and black/page (92).png',
    'books/red and black/page (93).png',
    'books/red and black/page (94).png',
    'books/red and black/page (95).png',
    'books/red and black/page (96).png',
    'books/red and black/page (97).png',
    'books/red and black/page (98).png',
    'books/red and black/page (99).png',
    'books/red and black/page (100).png',
    'books/red and black/page (101).png',
    'books/red and black/page (102).png',
    'books/red and black/page (103).png',
    'books/red and black/page (104).png',
    'books/red and black/page (105).png',
    'books/red and black/page (106).png',
    'books/red and black/page (107).png',
    'books/red and black/page (108).png',
    'books/red and black/page (109).png',
    'books/red and black/page (110).png',
    'books/red and black/page (111).png',
    'books/red and black/page (112).png',
    'books/red and black/page (113).png',
    'books/red and black/page (114).png',
    'books/red and black/page (115).png',
    'books/red and black/page (116).png',
    'books/red and black/page (117).png',
    'books/red and black/page (118).png',
    'books/red and black/page (119).png',
    'books/red and black/page (120).png',
    'books/red and black/page (121).png',
    'books/red and black/page (122).png',
    'books/red and black/page (123).png',
    'books/red and black/page (124).png',
    'books/red and black/page (125).png',
    'books/red and black/page (126).png',
    'books/red and black/page (127).png',
    'books/red and black/page (128).png',
    'books/red and black/page (129).png',
    'books/red and black/page (130).png',
    'books/red and black/page (131).png',
    'books/red and black/page (132).png',
    'books/red and black/page (133).png',
    'books/red and black/page (134).png',
    'books/red and black/page (135).png',
    'books/red and black/page (136).png',
    'books/red and black/page (137).png',
    'books/red and black/page (138).png',
    'books/red and black/page (139).png',
    'books/red and black/page (140).png',
    'books/red and black/page (141).png',
    'books/red and black/page (142).png',
    'books/red and black/page (143).png',
    'books/red and black/page (144).png',
    'books/red and black/page (145).png',
    'books/red and black/page (146).png',
    'books/red and black/page (147).png',
    'books/red and black/page (148).png',
    'books/red and black/page (149).png',
    'books/red and black/page (150).png',
    'books/red and black/page (151).png',
    'books/red and black/page (152).png',
    'books/red and black/page (153).png',
    'books/red and black/page (154).png',
    'books/red and black/page (155).png',
    'books/red and black/page (156).png',
    'books/red and black/page (157).png',
    'books/red and black/page (158).png',
    'books/red and black/page (159).png',
    'books/red and black/page (160).png',
    'books/red and black/page (161).png',
    'books/red and black/page (162).png',
    'books/red and black/page (163).png',
    'books/red and black/page (164).png',
    'books/red and black/page (165).png',
    'books/red and black/page (166).png',
    'books/red and black/page (167).png',
    'books/red and black/page (168).png',
    'books/red and black/page (169).png',
    'books/red and black/page (170).png',
    'books/red and black/page (171).png',
    'books/red and black/page (172).png',
    'books/red and black/page (173).png',
    'books/red and black/page (174).png',
    'books/red and black/page (175).png',
    'books/red and black/page (176).png',
    'books/red and black/page (177).png',
    'books/red and black/page (178).png',
    'books/red and black/page (179).png',
    'books/red and black/page (180).png',
    'books/red and black/page (181).png',
    'books/red and black/page (182).png',
    'books/red and black/page (183).png',
    'books/red and black/page (184).png',
    'books/red and black/page (185).png',
    'books/red and black/page (186).png',
    'books/red and black/page (187).png',
    'books/red and black/page (188).png',
    'books/red and black/page (189).png',
    'books/red and black/page (190).png',
    'books/red and black/page (191).png',
    'books/red and black/page (192).png',
    'books/red and black/page (193).png',
    'books/red and black/page (194).png',
    'books/red and black/page (195).png',
    'books/red and black/page (196).png',
    'books/red and black/page (197).png',
    'books/red and black/page (198).png',
    'books/red and black/page (199).png',
    'books/red and black/page (200).png',
    'books/red and black/page (201).png',
    'books/red and black/page (202).png',
    'books/red and black/page (203).png',
    'books/red and black/page (204).png',
    'books/red and black/page (205).png',
    'books/red and black/page (206).png',
    'books/red and black/page (207).png',
    'books/red and black/page (208).png',
    'books/red and black/page (209).png',
    'books/red and black/page (210).png',
    'books/red and black/page (211).png',
    'books/red and black/page (212).png',
    'books/red and black/page (213).png',
    'books/red and black/page (214).png',
    'books/red and black/page (215).png',
    'books/red and black/page (216).png',
    'books/red and black/page (217).png',
    'books/red and black/page (218).png',
    'books/red and black/page (219).png',
    'books/red and black/page (220).png',
    'books/red and black/page (221).png',
    'books/red and black/page (222).png',
    'books/red and black/page (223).png',
    'books/red and black/page (224).png',
    'books/red and black/page (225).png',
    'books/red and black/page (226).png',
    'books/red and black/page (227).png',
    'books/red and black/page (228).png',
    'books/red and black/page (229).png',
    'books/red and black/page (230).png',
    'books/red and black/page (231).png',
    'books/red and black/page (232).png',
    'books/red and black/page (233).png',
    'books/red and black/page (234).png',
    'books/red and black/page (235).png',
    'books/red and black/page (236).png',
    'books/red and black/page (237).png',
    'books/red and black/page (238).png',
    'books/red and black/page (239).png',
    'books/red and black/page (240).png',
    'books/red and black/page (241).png',
    'books/red and black/page (242).png',
    'books/red and black/page (243).png',
    'books/red and black/page (244).png',
    'books/red and black/page (245).png',
    'books/red and black/page (246).png',
    'books/red and black/page (247).png',
    'books/red and black/page (248).png',
    'books/red and black/page (249).png',
    'books/red and black/page (250).png',
    'books/red and black/page (251).png',
    'books/red and black/page (252).png',
    'books/red and black/page (253).png',
    'books/red and black/page (254).png',
    'books/red and black/page (255).png',
    'books/red and black/page (256).png',
    'books/red and black/page (257).png',
    'books/red and black/page (258).png',
    'books/red and black/page (259).png',
    'books/red and black/page (260).png',
    'books/red and black/page (261).png',
    'books/red and black/page (262).png',
    'books/red and black/page (263).png',
    'books/red and black/page (264).png',
    'books/red and black/page (265).png',
    'books/red and black/page (266).png',
    'books/red and black/page (267).png',
    'books/red and black/page (268).png',
    'books/red and black/page (269).png',
    'books/red and black/page (270).png',
    'books/red and black/page (271).png',
    'books/red and black/page (272).png',
    'books/red and black/page (273).png',
    'books/red and black/page (274).png',
    'books/red and black/page (275).png',
    'books/red and black/page (276).png',
    'books/red and black/page (277).png',
    'books/red and black/page (278).png',
    'books/red and black/page (279).png',
    'books/red and black/page (280).png',
    'books/red and black/page (281).png',
    'books/red and black/page (282).png',
    'books/red and black/page (283).png',
    'books/red and black/page (284).png',
    'books/red and black/page (285).png',
    'books/red and black/page (286).png',
    'books/red and black/page (287).png',
    'books/red and black/page (288).png',
    'books/red and black/page (289).png',
    'books/red and black/page (290).png',
    'books/red and black/page (291).png',
    'books/red and black/page (292).png',
    'books/red and black/page (293).png',
    'books/red and black/page (294).png',
    'books/red and black/page (295).png',
    'books/red and black/page (296).png',
    'books/red and black/page (297).png',
    'books/red and black/page (298).png',
    'books/red and black/page (299).png',
    'books/red and black/page (300).png',
    'books/red and black/page (301).png',
    'books/red and black/page (302).png',
    'books/red and black/page (303).png',
    'books/red and black/page (304).png',
    'books/red and black/page (305).png',
    'books/red and black/page (306).png',
    'books/red and black/page (307).png',
    'books/red and black/page (308).png',
    'books/red and black/page (309).png',
    'books/red and black/page (310).png',
    'books/red and black/page (311).png',
    'books/red and black/page (312).png',
    'books/red and black/page (313).png',
    'books/red and black/page (314).png',
    'books/red and black/page (315).png',
    'books/red and black/page (316).png',
    'books/red and black/page (317).png',
    'books/red and black/page (318).png',
    'books/red and black/page (319).png',
    'books/red and black/page (320).png',
    'books/red and black/page (321).png',
    'books/red and black/page (322).png',
    'books/red and black/page (323).png',
    'books/red and black/page (324).png',
    'books/red and black/page (325).png',
    'books/red and black/page (326).png',
    'books/red and black/page (327).png',
    'books/red and black/page (328).png',
    'books/red and black/page (329).png',
    'books/red and black/page (330).png',
    'books/red and black/page (331).png',
    'books/red and black/page (332).png',
    'books/red and black/page (333).png',
    'books/red and black/page (334).png',
    'books/red and black/page (335).png',
    'books/red and black/page (336).png',
    'books/red and black/page (337).png',
    'books/red and black/page (338).png',
    'books/red and black/page (339).png',
    'books/red and black/page (340).png',
    'books/red and black/page (341).png',
    'books/red and black/page (342).png',
    'books/red and black/page (343).png',
    'books/red and black/page (344).png',
    'books/red and black/page (345).png',
    'books/red and black/page (346).png',
    'books/red and black/page (347).png',
    'books/red and black/page (348).png',
    'books/red and black/page (349).png',
    'books/red and black/page (350).png',
    'books/red and black/page (351).png',
    'books/red and black/page (352).png',
    'books/red and black/page (353).png',
    'books/red and black/page (354).png',
    'books/red and black/page (355).png',
    'books/red and black/page (356).png',
    'books/red and black/page (357).png',
    'books/red and black/page (358).png',
    'books/red and black/page (359).png',
    'books/red and black/page (360).png',
    'books/red and black/page (361).png',
    'books/red and black/page (362).png',
    'books/red and black/page (363).png',
    'books/red and black/page (364).png',
    'books/red and black/page (365).png',
    'books/red and black/page (366).png',
    'books/red and black/page (367).png',
    'books/red and black/page (368).png',
    'books/red and black/page (369).png',
    'books/red and black/page (370).png',
    'books/red and black/page (371).png',
    'books/red and black/page (372).png',
    'books/red and black/page (373).png',
    'books/red and black/page (374).png',
    'books/red and black/page (375).png',
    'books/red and black/page (376).png',
    'books/red and black/page (377).png',
    'books/red and black/page (378).png',
    'books/red and black/page (379).png',
    'books/red and black/page (380).png',
    'books/red and black/page (381).png',
    'books/red and black/page (382).png',
    'books/red and black/page (383).png',
    'books/red and black/page (384).png',
    'books/red and black/page (385).png',
    'books/red and black/page (386).png',
    'books/red and black/page (387).png',
    'books/red and black/page (388).png',
    'books/red and black/page (389).png',
    'books/red and black/page (390).png',
    'books/red and black/page (391).png',
    'books/red and black/page (392).png',
    'books/red and black/page (393).png',
    'books/red and black/page (394).png',
    'books/red and black/page (395).png',
    'books/red and black/page (396).png',
    'books/red and black/page (397).png',
    'books/red and black/page (398).png',
    'books/red and black/page (399).png',
    'books/red and black/page (400).png',
    'books/red and black/page (401).png',
    'books/red and black/page (402).png',
    'books/red and black/page (403).png',
    'books/red and black/page (404).png',
    'books/red and black/page (405).png',
    'books/red and black/page (406).png',
    'books/red and black/page (407).png',
    'books/red and black/page (408).png',
    'books/red and black/page (409).png',
    'books/red and black/page (410).png',
    'books/red and black/page (411).png',
    'books/red and black/page (412).png',
    'books/red and black/page (413).png',
    'books/red and black/page (414).png',
    'books/red and black/page (415).png',
    'books/red and black/page (416).png',
    'books/red and black/page (417).png',
    'books/red and black/page (418).png',
    'books/red and black/page (419).png',
    'books/red and black/page (420).png',
    'books/red and black/page (421).png',
    'books/red and black/page (422).png',
    'books/red and black/page (423).png',
    'books/red and black/page (424).png',
    'books/red and black/page (425).png',
    'books/red and black/page (426).png',
    'books/red and black/page (427).png',
    'books/red and black/page (428).png',
    'books/red and black/page (429).png',
    'books/red and black/page (430).png',
    'books/red and black/page (431).png',
    'books/red and black/page (432).png',
    'books/red and black/page (433).png',
    'books/red and black/page (434).png',
    'books/red and black/page (435).png',
    'books/red and black/page (436).png',
    'books/red and black/page (437).png',
    'books/red and black/page (438).png',
    'books/red and black/page (439).png',
    'books/red and black/page (440).png',
    'books/red and black/page (441).png',
    'books/red and black/page (442).png',
    'books/red and black/page (443).png',
    'books/red and black/page (444).png',
    'books/red and black/page (445).png',
    'books/red and black/page (446).png',
    'books/red and black/page (447).png',
    'books/red and black/page (448).png',
    'books/red and black/page (449).png',
    'books/red and black/page (450).png',
    'books/red and black/page (451).png',
    'books/red and black/page (452).png',
    'books/red and black/page (453).png',
    'books/red and black/page (454).png',
    'books/red and black/page (455).png',
    'books/red and black/page (456).png',
    'books/red and black/page (457).png',
    'books/red and black/page (458).png',
    'books/red and black/page (459).png',
    'books/red and black/page (460).png',
    'books/red and black/page (461).png',
    'books/red and black/page (462).png',
    'books/red and black/page (463).png',
    'books/red and black/page (464).png',
    'books/red and black/page (465).png',
    'books/red and black/page (466).png',
    'books/red and black/page (467).png',
    'books/red and black/page (468).png',
    'books/red and black/page (469).png',
    'books/red and black/page (470).png',
    'books/red and black/page (471).png',
    'books/red and black/page (472).png',
    'books/red and black/page (473).png',
    'books/red and black/page (474).png',
    'books/red and black/page (475).png',
    'books/red and black/page (476).png',
    'books/red and black/page (477).png',
    'books/red and black/page (478).png',
    'books/red and black/page (479).png',

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
