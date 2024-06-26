import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class purereason extends StatefulWidget {
  const purereason({Key? key}) : super(key: key);

  @override
  State<purereason> createState() => _purereasonState();
}

class _purereasonState extends State<purereason> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/pure reason/page (1).png',
    'books/pure reason/page (2).png',
    'books/pure reason/page (3).png',
    'books/pure reason/page (4).png',
    'books/pure reason/page (5).png',
    'books/pure reason/page (6).png',
    'books/pure reason/page (7).png',
    'books/pure reason/page (8).png',
    'books/pure reason/page (9).png',
    'books/pure reason/page (10).png',
    'books/pure reason/page (11).png',
    'books/pure reason/page (12).png',
    'books/pure reason/page (13).png',
    'books/pure reason/page (14).png',
    'books/pure reason/page (15).png',
    'books/pure reason/page (16).png',
    'books/pure reason/page (17).png',
    'books/pure reason/page (18).png',
    'books/pure reason/page (19).png',
    'books/pure reason/page (20).png',
    'books/pure reason/page (21).png',
    'books/pure reason/page (22).png',
    'books/pure reason/page (23).png',
    'books/pure reason/page (24).png',
    'books/pure reason/page (25).png',
    'books/pure reason/page (26).png',
    'books/pure reason/page (27).png',
    'books/pure reason/page (28).png',
    'books/pure reason/page (29).png',
    'books/pure reason/page (30).png',
    'books/pure reason/page (31).png',
    'books/pure reason/page (32).png',
    'books/pure reason/page (33).png',
    'books/pure reason/page (34).png',
    'books/pure reason/page (35).png',
    'books/pure reason/page (36).png',
    'books/pure reason/page (37).png',
    'books/pure reason/page (38).png',
    'books/pure reason/page (39).png',
    'books/pure reason/page (40).png',
    'books/pure reason/page (41).png',
    'books/pure reason/page (42).png',
    'books/pure reason/page (43).png',
    'books/pure reason/page (44).png',
    'books/pure reason/page (45).png',
    'books/pure reason/page (46).png',
    'books/pure reason/page (47).png',
    'books/pure reason/page (48).png',
    'books/pure reason/page (49).png',
    'books/pure reason/page (50).png',
    'books/pure reason/page (51).png',
    'books/pure reason/page (52).png',
    'books/pure reason/page (53).png',
    'books/pure reason/page (54).png',
    'books/pure reason/page (55).png',
    'books/pure reason/page (56).png',
    'books/pure reason/page (57).png',
    'books/pure reason/page (58).png',
    'books/pure reason/page (59).png',
    'books/pure reason/page (60).png',
    'books/pure reason/page (61).png',
    'books/pure reason/page (62).png',
    'books/pure reason/page (63).png',
    'books/pure reason/page (64).png',
    'books/pure reason/page (65).png',
    'books/pure reason/page (66).png',
    'books/pure reason/page (67).png',
    'books/pure reason/page (68).png',
    'books/pure reason/page (69).png',
    'books/pure reason/page (70).png',
    'books/pure reason/page (71).png',
    'books/pure reason/page (72).png',
    'books/pure reason/page (73).png',
    'books/pure reason/page (74).png',
    'books/pure reason/page (75).png',
    'books/pure reason/page (76).png',
    'books/pure reason/page (77).png',
    'books/pure reason/page (78).png',
    'books/pure reason/page (79).png',
    'books/pure reason/page (80).png',
    'books/pure reason/page (81).png',
    'books/pure reason/page (82).png',
    'books/pure reason/page (83).png',
    'books/pure reason/page (84).png',
    'books/pure reason/page (85).png',
    'books/pure reason/page (86).png',
    'books/pure reason/page (87).png',
    'books/pure reason/page (88).png',
    'books/pure reason/page (89).png',
    'books/pure reason/page (90).png',
    'books/pure reason/page (91).png',
    'books/pure reason/page (92).png',
    'books/pure reason/page (93).png',
    'books/pure reason/page (94).png',
    'books/pure reason/page (95).png',
    'books/pure reason/page (96).png',
    'books/pure reason/page (97).png',
    'books/pure reason/page (98).png',
    'books/pure reason/page (99).png',
    'books/pure reason/page (100).png',
    'books/pure reason/page (101).png',
    'books/pure reason/page (102).png',
    'books/pure reason/page (103).png',
    'books/pure reason/page (104).png',
    'books/pure reason/page (105).png',
    'books/pure reason/page (106).png',
    'books/pure reason/page (107).png',
    'books/pure reason/page (108).png',
    'books/pure reason/page (109).png',
    'books/pure reason/page (110).png',
    'books/pure reason/page (111).png',
    'books/pure reason/page (112).png',
    'books/pure reason/page (113).png',
    'books/pure reason/page (114).png',
    'books/pure reason/page (115).png',
    'books/pure reason/page (116).png',
    'books/pure reason/page (117).png',
    'books/pure reason/page (118).png',
    'books/pure reason/page (119).png',
    'books/pure reason/page (120).png',
    'books/pure reason/page (121).png',
    'books/pure reason/page (122).png',
    'books/pure reason/page (123).png',
    'books/pure reason/page (124).png',
    'books/pure reason/page (125).png',
    'books/pure reason/page (126).png',
    'books/pure reason/page (127).png',
    'books/pure reason/page (128).png',
    'books/pure reason/page (129).png',
    'books/pure reason/page (130).png',
    'books/pure reason/page (131).png',
    'books/pure reason/page (132).png',
    'books/pure reason/page (133).png',
    'books/pure reason/page (134).png',
    'books/pure reason/page (135).png',
    'books/pure reason/page (136).png',
    'books/pure reason/page (137).png',
    'books/pure reason/page (138).png',
    'books/pure reason/page (139).png',
    'books/pure reason/page (140).png',
    'books/pure reason/page (141).png',
    'books/pure reason/page (142).png',
    'books/pure reason/page (143).png',
    'books/pure reason/page (144).png',
    'books/pure reason/page (145).png',
    'books/pure reason/page (146).png',
    'books/pure reason/page (147).png',
    'books/pure reason/page (148).png',
    'books/pure reason/page (149).png',
    'books/pure reason/page (150).png',
    'books/pure reason/page (151).png',
    'books/pure reason/page (152).png',
    'books/pure reason/page (153).png',
    'books/pure reason/page (154).png',
    'books/pure reason/page (155).png',
    'books/pure reason/page (156).png',
    'books/pure reason/page (157).png',
    'books/pure reason/page (158).png',
    'books/pure reason/page (159).png',
    'books/pure reason/page (160).png',
    'books/pure reason/page (161).png',
    'books/pure reason/page (162).png',
    'books/pure reason/page (163).png',
    'books/pure reason/page (164).png',
    'books/pure reason/page (165).png',
    'books/pure reason/page (166).png',
    'books/pure reason/page (167).png',
    'books/pure reason/page (168).png',
    'books/pure reason/page (169).png',
    'books/pure reason/page (170).png',
    'books/pure reason/page (171).png',
    'books/pure reason/page (172).png',
    'books/pure reason/page (173).png',
    'books/pure reason/page (174).png',
    'books/pure reason/page (175).png',
    'books/pure reason/page (176).png',
    'books/pure reason/page (177).png',
    'books/pure reason/page (178).png',
    'books/pure reason/page (179).png',
    'books/pure reason/page (180).png',
    'books/pure reason/page (181).png',
    'books/pure reason/page (182).png',
    'books/pure reason/page (183).png',
    'books/pure reason/page (184).png',
    'books/pure reason/page (185).png',
    'books/pure reason/page (186).png',
    'books/pure reason/page (187).png',
    'books/pure reason/page (188).png',
    'books/pure reason/page (189).png',
    'books/pure reason/page (190).png',
    'books/pure reason/page (191).png',
    'books/pure reason/page (192).png',
    'books/pure reason/page (193).png',
    'books/pure reason/page (194).png',
    'books/pure reason/page (195).png',
    'books/pure reason/page (196).png',
    'books/pure reason/page (197).png',
    'books/pure reason/page (198).png',
    'books/pure reason/page (199).png',
    'books/pure reason/page (200).png',
    'books/pure reason/page (201).png',
    'books/pure reason/page (202).png',
    'books/pure reason/page (203).png',
    'books/pure reason/page (204).png',
    'books/pure reason/page (205).png',
    'books/pure reason/page (206).png',
    'books/pure reason/page (207).png',
    'books/pure reason/page (208).png',
    'books/pure reason/page (209).png',
    'books/pure reason/page (210).png',
    'books/pure reason/page (211).png',
    'books/pure reason/page (212).png',
    'books/pure reason/page (213).png',
    'books/pure reason/page (214).png',
    'books/pure reason/page (215).png',
    'books/pure reason/page (216).png',
    'books/pure reason/page (217).png',
    'books/pure reason/page (218).png',
    'books/pure reason/page (219).png',
    'books/pure reason/page (220).png',
    'books/pure reason/page (221).png',
    'books/pure reason/page (222).png',
    'books/pure reason/page (223).png',
    'books/pure reason/page (224).png',
    'books/pure reason/page (225).png',
    'books/pure reason/page (226).png',
    'books/pure reason/page (227).png',
    'books/pure reason/page (228).png',
    'books/pure reason/page (229).png',
    'books/pure reason/page (230).png',
    'books/pure reason/page (231).png',
    'books/pure reason/page (232).png',
    'books/pure reason/page (233).png',
    'books/pure reason/page (234).png',
    'books/pure reason/page (235).png',
    'books/pure reason/page (236).png',
    'books/pure reason/page (237).png',
    'books/pure reason/page (238).png',
    'books/pure reason/page (239).png',
    'books/pure reason/page (240).png',
    'books/pure reason/page (241).png',
    'books/pure reason/page (242).png',
    'books/pure reason/page (243).png',
    'books/pure reason/page (244).png',
    'books/pure reason/page (245).png',
    'books/pure reason/page (246).png',
    'books/pure reason/page (247).png',
    'books/pure reason/page (248).png',
    'books/pure reason/page (249).png',
    'books/pure reason/page (250).png',
    'books/pure reason/page (251).png',
    'books/pure reason/page (252).png',
    'books/pure reason/page (253).png',
    'books/pure reason/page (254).png',
    'books/pure reason/page (255).png',
    'books/pure reason/page (256).png',
    'books/pure reason/page (257).png',
    'books/pure reason/page (258).png',
    'books/pure reason/page (259).png',
    'books/pure reason/page (260).png',
    'books/pure reason/page (261).png',
    'books/pure reason/page (262).png',
    'books/pure reason/page (263).png',
    'books/pure reason/page (264).png',
    'books/pure reason/page (265).png',
    'books/pure reason/page (266).png',
    'books/pure reason/page (267).png',
    'books/pure reason/page (268).png',
    'books/pure reason/page (269).png',
    'books/pure reason/page (270).png',
    'books/pure reason/page (271).png',
    'books/pure reason/page (272).png',
    'books/pure reason/page (273).png',
    'books/pure reason/page (274).png',
    'books/pure reason/page (275).png',
    'books/pure reason/page (276).png',
    'books/pure reason/page (277).png',
    'books/pure reason/page (278).png',
    'books/pure reason/page (279).png',
    'books/pure reason/page (280).png',
    'books/pure reason/page (281).png',
    'books/pure reason/page (282).png',
    'books/pure reason/page (283).png',
    'books/pure reason/page (284).png',
    'books/pure reason/page (285).png',
    'books/pure reason/page (286).png',
    'books/pure reason/page (287).png',
    'books/pure reason/page (288).png',
    'books/pure reason/page (289).png',
    'books/pure reason/page (290).png',
    'books/pure reason/page (291).png',
    'books/pure reason/page (292).png',
    'books/pure reason/page (293).png',
    'books/pure reason/page (294).png',
    'books/pure reason/page (295).png',
    'books/pure reason/page (296).png',
    'books/pure reason/page (297).png',
    'books/pure reason/page (298).png',
    'books/pure reason/page (299).png',
    'books/pure reason/page (300).png',
    'books/pure reason/page (301).png',
    'books/pure reason/page (302).png',
    'books/pure reason/page (303).png',
    'books/pure reason/page (304).png',
    'books/pure reason/page (305).png',
    'books/pure reason/page (306).png',
    'books/pure reason/page (307).png',
    'books/pure reason/page (308).png',
    'books/pure reason/page (309).png',
    'books/pure reason/page (310).png',
    'books/pure reason/page (311).png',
    'books/pure reason/page (312).png',
    'books/pure reason/page (313).png',
    'books/pure reason/page (314).png',
    'books/pure reason/page (315).png',
    'books/pure reason/page (316).png',
    'books/pure reason/page (317).png',
    'books/pure reason/page (318).png',
    'books/pure reason/page (319).png',
    'books/pure reason/page (320).png',
    'books/pure reason/page (321).png',
    'books/pure reason/page (322).png',
    'books/pure reason/page (323).png',
    'books/pure reason/page (324).png',
    'books/pure reason/page (325).png',
    'books/pure reason/page (326).png',
    'books/pure reason/page (327).png',
    'books/pure reason/page (328).png',
    'books/pure reason/page (329).png',
    'books/pure reason/page (330).png',
    'books/pure reason/page (331).png',
    'books/pure reason/page (332).png',
    'books/pure reason/page (333).png',
    'books/pure reason/page (334).png',
    'books/pure reason/page (335).png',
    'books/pure reason/page (336).png',
    'books/pure reason/page (337).png',
    'books/pure reason/page (338).png',
    'books/pure reason/page (339).png',
    'books/pure reason/page (340).png',
    'books/pure reason/page (341).png',
    'books/pure reason/page (342).png',
    'books/pure reason/page (343).png',
    'books/pure reason/page (344).png',
    'books/pure reason/page (345).png',
    'books/pure reason/page (346).png',
    'books/pure reason/page (347).png',
    'books/pure reason/page (348).png',
    'books/pure reason/page (349).png',
    'books/pure reason/page (350).png',
    'books/pure reason/page (351).png',
    'books/pure reason/page (352).png',
    'books/pure reason/page (353).png',
    'books/pure reason/page (354).png',
    'books/pure reason/page (355).png',
    'books/pure reason/page (356).png',
    'books/pure reason/page (357).png',
    'books/pure reason/page (358).png',
    'books/pure reason/page (359).png',
    'books/pure reason/page (360).png',
    'books/pure reason/page (361).png',
    'books/pure reason/page (362).png',
    'books/pure reason/page (363).png',
    'books/pure reason/page (364).png',
    'books/pure reason/page (365).png',
    'books/pure reason/page (366).png',
    'books/pure reason/page (367).png',
    'books/pure reason/page (368).png',
    'books/pure reason/page (369).png',
    'books/pure reason/page (370).png',
    'books/pure reason/page (371).png',
    'books/pure reason/page (372).png',
    'books/pure reason/page (373).png',
    'books/pure reason/page (374).png',
    'books/pure reason/page (375).png',
    'books/pure reason/page (376).png',
    'books/pure reason/page (377).png',
    'books/pure reason/page (378).png',
    'books/pure reason/page (379).png',
    'books/pure reason/page (380).png',
    'books/pure reason/page (381).png',
    'books/pure reason/page (382).png',
    'books/pure reason/page (383).png',
    'books/pure reason/page (384).png',
    'books/pure reason/page (385).png',
    'books/pure reason/page (386).png',
    'books/pure reason/page (387).png',
    'books/pure reason/page (388).png',
    'books/pure reason/page (389).png',
    'books/pure reason/page (390).png',
    'books/pure reason/page (391).png',
    'books/pure reason/page (392).png',
    'books/pure reason/page (393).png',
    'books/pure reason/page (394).png',
    'books/pure reason/page (395).png',
    'books/pure reason/page (396).png',
    'books/pure reason/page (397).png',
    'books/pure reason/page (398).png',
    'books/pure reason/page (399).png',
    'books/pure reason/page (400).png',
    'books/pure reason/page (401).png',
    'books/pure reason/page (402).png',
    'books/pure reason/page (403).png',
    'books/pure reason/page (404).png',
    'books/pure reason/page (405).png',
    'books/pure reason/page (406).png',
    'books/pure reason/page (407).png',
    'books/pure reason/page (408).png',
    'books/pure reason/page (409).png',
    'books/pure reason/page (410).png',
    'books/pure reason/page (411).png',
    'books/pure reason/page (412).png',
    'books/pure reason/page (413).png',
    'books/pure reason/page (414).png',
    'books/pure reason/page (415).png',
    'books/pure reason/page (416).png',
    'books/pure reason/page (417).png',
    'books/pure reason/page (418).png',
    'books/pure reason/page (419).png',
    'books/pure reason/page (420).png',
    'books/pure reason/page (421).png',
    'books/pure reason/page (422).png',
    'books/pure reason/page (423).png',
    'books/pure reason/page (424).png',
    'books/pure reason/page (425).png',
    'books/pure reason/page (426).png',
    'books/pure reason/page (427).png',
    'books/pure reason/page (428).png',
    'books/pure reason/page (429).png',
    'books/pure reason/page (430).png',
    'books/pure reason/page (431).png',
    'books/pure reason/page (432).png',
    'books/pure reason/page (433).png',
    'books/pure reason/page (434).png',
    'books/pure reason/page (435).png',
    'books/pure reason/page (436).png',
    'books/pure reason/page (437).png',
    'books/pure reason/page (438).png',
    'books/pure reason/page (439).png',
    'books/pure reason/page (440).png',
    'books/pure reason/page (441).png',
    'books/pure reason/page (442).png',
    'books/pure reason/page (443).png',
    'books/pure reason/page (444).png',
    'books/pure reason/page (445).png',
    'books/pure reason/page (446).png',
    'books/pure reason/page (447).png',
    'books/pure reason/page (448).png',
    'books/pure reason/page (449).png',
    'books/pure reason/page (450).png',
    'books/pure reason/page (451).png',
    'books/pure reason/page (452).png',
    'books/pure reason/page (453).png',
    'books/pure reason/page (454).png',
    'books/pure reason/page (455).png',
    'books/pure reason/page (456).png',
    'books/pure reason/page (457).png',
    'books/pure reason/page (458).png',
    'books/pure reason/page (459).png',
    'books/pure reason/page (460).png',
    'books/pure reason/page (461).png',
    'books/pure reason/page (462).png',
    'books/pure reason/page (463).png',
    'books/pure reason/page (464).png',
    'books/pure reason/page (465).png',
    'books/pure reason/page (466).png',
    'books/pure reason/page (467).png',
    'books/pure reason/page (468).png',
    'books/pure reason/page (469).png',
    'books/pure reason/page (470).png',
    'books/pure reason/page (471).png',
    'books/pure reason/page (472).png',
    'books/pure reason/page (473).png',
    'books/pure reason/page (474).png',
    'books/pure reason/page (475).png',
    'books/pure reason/page (476).png',
    'books/pure reason/page (477).png',
    'books/pure reason/page (478).png',
    'books/pure reason/page (479).png',
    'books/pure reason/page (480).png',
    'books/pure reason/page (481).png',
    'books/pure reason/page (482).png',
    'books/pure reason/page (483).png',
    'books/pure reason/page (484).png',
    'books/pure reason/page (485).png',
    'books/pure reason/page (486).png',
    'books/pure reason/page (487).png',
    'books/pure reason/page (488).png',
    'books/pure reason/page (489).png',
    'books/pure reason/page (490).png',
    'books/pure reason/page (491).png',
    'books/pure reason/page (492).png',
    'books/pure reason/page (493).png',
    'books/pure reason/page (494).png',
    'books/pure reason/page (495).png',
    'books/pure reason/page (496).png',
    'books/pure reason/page (497).png',
    'books/pure reason/page (498).png',
    'books/pure reason/page (499).png',
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
