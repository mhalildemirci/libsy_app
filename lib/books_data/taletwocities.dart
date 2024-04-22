import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class taletwocities extends StatefulWidget {
  const taletwocities({Key? key}) : super(key: key);

  @override
  State<taletwocities> createState() => _taletwocitiesState();
}

class _taletwocitiesState extends State<taletwocities> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Tale of Two Cities/page (1).png',
    'books/A Tale of Two Cities/page (2).png',
    'books/A Tale of Two Cities/page (3).png',
    'books/A Tale of Two Cities/page (4).png',
    'books/A Tale of Two Cities/page (5).png',
    'books/A Tale of Two Cities/page (6).png',
    'books/A Tale of Two Cities/page (7).png',
    'books/A Tale of Two Cities/page (8).png',
    'books/A Tale of Two Cities/page (9).png',
    'books/A Tale of Two Cities/page (10).png',
    'books/A Tale of Two Cities/page (11).png',
    'books/A Tale of Two Cities/page (12).png',
    'books/A Tale of Two Cities/page (13).png',
    'books/A Tale of Two Cities/page (14).png',
    'books/A Tale of Two Cities/page (15).png',
    'books/A Tale of Two Cities/page (16).png',
    'books/A Tale of Two Cities/page (17).png',
    'books/A Tale of Two Cities/page (18).png',
    'books/A Tale of Two Cities/page (19).png',
    'books/A Tale of Two Cities/page (20).png',
    'books/A Tale of Two Cities/page (21).png',
    'books/A Tale of Two Cities/page (22).png',
    'books/A Tale of Two Cities/page (23).png',
    'books/A Tale of Two Cities/page (24).png',
    'books/A Tale of Two Cities/page (25).png',
    'books/A Tale of Two Cities/page (26).png',
    'books/A Tale of Two Cities/page (27).png',
    'books/A Tale of Two Cities/page (28).png',
    'books/A Tale of Two Cities/page (29).png',
    'books/A Tale of Two Cities/page (30).png',
    'books/A Tale of Two Cities/page (31).png',
    'books/A Tale of Two Cities/page (32).png',
    'books/A Tale of Two Cities/page (33).png',
    'books/A Tale of Two Cities/page (34).png',
    'books/A Tale of Two Cities/page (35).png',
    'books/A Tale of Two Cities/page (36).png',
    'books/A Tale of Two Cities/page (37).png',
    'books/A Tale of Two Cities/page (38).png',
    'books/A Tale of Two Cities/page (39).png',
    'books/A Tale of Two Cities/page (40).png',
    'books/A Tale of Two Cities/page (41).png',
    'books/A Tale of Two Cities/page (42).png',
    'books/A Tale of Two Cities/page (43).png',
    'books/A Tale of Two Cities/page (44).png',
    'books/A Tale of Two Cities/page (45).png',
    'books/A Tale of Two Cities/page (46).png',
    'books/A Tale of Two Cities/page (47).png',
    'books/A Tale of Two Cities/page (48).png',
    'books/A Tale of Two Cities/page (49).png',
    'books/A Tale of Two Cities/page (50).png',
    'books/A Tale of Two Cities/page (51).png',
    'books/A Tale of Two Cities/page (52).png',
    'books/A Tale of Two Cities/page (53).png',
    'books/A Tale of Two Cities/page (54).png',
    'books/A Tale of Two Cities/page (55).png',
    'books/A Tale of Two Cities/page (56).png',
    'books/A Tale of Two Cities/page (57).png',
    'books/A Tale of Two Cities/page (58).png',
    'books/A Tale of Two Cities/page (59).png',
    'books/A Tale of Two Cities/page (60).png',
    'books/A Tale of Two Cities/page (61).png',
    'books/A Tale of Two Cities/page (62).png',
    'books/A Tale of Two Cities/page (63).png',
    'books/A Tale of Two Cities/page (64).png',
    'books/A Tale of Two Cities/page (65).png',
    'books/A Tale of Two Cities/page (66).png',
    'books/A Tale of Two Cities/page (67).png',
    'books/A Tale of Two Cities/page (68).png',
    'books/A Tale of Two Cities/page (69).png',
    'books/A Tale of Two Cities/page (70).png',
    'books/A Tale of Two Cities/page (71).png',
    'books/A Tale of Two Cities/page (72).png',
    'books/A Tale of Two Cities/page (73).png',
    'books/A Tale of Two Cities/page (74).png',
    'books/A Tale of Two Cities/page (75).png',
    'books/A Tale of Two Cities/page (76).png',
    'books/A Tale of Two Cities/page (77).png',
    'books/A Tale of Two Cities/page (78).png',
    'books/A Tale of Two Cities/page (79).png',
    'books/A Tale of Two Cities/page (80).png',
    'books/A Tale of Two Cities/page (81).png',
    'books/A Tale of Two Cities/page (82).png',
    'books/A Tale of Two Cities/page (83).png',
    'books/A Tale of Two Cities/page (84).png',
    'books/A Tale of Two Cities/page (85).png',
    'books/A Tale of Two Cities/page (86).png',
    'books/A Tale of Two Cities/page (87).png',
    'books/A Tale of Two Cities/page (88).png',
    'books/A Tale of Two Cities/page (89).png',
    'books/A Tale of Two Cities/page (90).png',
    'books/A Tale of Two Cities/page (91).png',
    'books/A Tale of Two Cities/page (92).png',
    'books/A Tale of Two Cities/page (93).png',
    'books/A Tale of Two Cities/page (94).png',
    'books/A Tale of Two Cities/page (95).png',
    'books/A Tale of Two Cities/page (96).png',
    'books/A Tale of Two Cities/page (97).png',
    'books/A Tale of Two Cities/page (98).png',
    'books/A Tale of Two Cities/page (99).png',
    'books/A Tale of Two Cities/page (100).png',
    'books/A Tale of Two Cities/page (101).png',
    'books/A Tale of Two Cities/page (102).png',
    'books/A Tale of Two Cities/page (103).png',
    'books/A Tale of Two Cities/page (104).png',
    'books/A Tale of Two Cities/page (105).png',
    'books/A Tale of Two Cities/page (106).png',
    'books/A Tale of Two Cities/page (107).png',
    'books/A Tale of Two Cities/page (108).png',
    'books/A Tale of Two Cities/page (109).png',
    'books/A Tale of Two Cities/page (110).png',
    'books/A Tale of Two Cities/page (111).png',
    'books/A Tale of Two Cities/page (112).png',
    'books/A Tale of Two Cities/page (113).png',
    'books/A Tale of Two Cities/page (114).png',
    'books/A Tale of Two Cities/page (115).png',
    'books/A Tale of Two Cities/page (116).png',
    'books/A Tale of Two Cities/page (117).png',
    'books/A Tale of Two Cities/page (118).png',
    'books/A Tale of Two Cities/page (119).png',
    'books/A Tale of Two Cities/page (120).png',
    'books/A Tale of Two Cities/page (121).png',
    'books/A Tale of Two Cities/page (122).png',
    'books/A Tale of Two Cities/page (123).png',
    'books/A Tale of Two Cities/page (124).png',
    'books/A Tale of Two Cities/page (125).png',
    'books/A Tale of Two Cities/page (126).png',
    'books/A Tale of Two Cities/page (127).png',
    'books/A Tale of Two Cities/page (128).png',
    'books/A Tale of Two Cities/page (129).png',
    'books/A Tale of Two Cities/page (130).png',
    'books/A Tale of Two Cities/page (131).png',
    'books/A Tale of Two Cities/page (132).png',
    'books/A Tale of Two Cities/page (133).png',
    'books/A Tale of Two Cities/page (134).png',
    'books/A Tale of Two Cities/page (135).png',
    'books/A Tale of Two Cities/page (136).png',
    'books/A Tale of Two Cities/page (137).png',
    'books/A Tale of Two Cities/page (138).png',
    'books/A Tale of Two Cities/page (139).png',
    'books/A Tale of Two Cities/page (140).png',
    'books/A Tale of Two Cities/page (141).png',
    'books/A Tale of Two Cities/page (142).png',
    'books/A Tale of Two Cities/page (143).png',
    'books/A Tale of Two Cities/page (144).png',
    'books/A Tale of Two Cities/page (145).png',
    'books/A Tale of Two Cities/page (146).png',
    'books/A Tale of Two Cities/page (147).png',
    'books/A Tale of Two Cities/page (148).png',
    'books/A Tale of Two Cities/page (149).png',
    'books/A Tale of Two Cities/page (150).png',
    'books/A Tale of Two Cities/page (151).png',
    'books/A Tale of Two Cities/page (152).png',
    'books/A Tale of Two Cities/page (153).png',
    'books/A Tale of Two Cities/page (154).png',
    'books/A Tale of Two Cities/page (155).png',
    'books/A Tale of Two Cities/page (156).png',
    'books/A Tale of Two Cities/page (157).png',
    'books/A Tale of Two Cities/page (158).png',
    'books/A Tale of Two Cities/page (159).png',
    'books/A Tale of Two Cities/page (160).png',
    'books/A Tale of Two Cities/page (161).png',
    'books/A Tale of Two Cities/page (162).png',
    'books/A Tale of Two Cities/page (163).png',
    'books/A Tale of Two Cities/page (164).png',
    'books/A Tale of Two Cities/page (165).png',
    'books/A Tale of Two Cities/page (166).png',
    'books/A Tale of Two Cities/page (167).png',
    'books/A Tale of Two Cities/page (168).png',
    'books/A Tale of Two Cities/page (169).png',
    'books/A Tale of Two Cities/page (170).png',
    'books/A Tale of Two Cities/page (171).png',
    'books/A Tale of Two Cities/page (172).png',
    'books/A Tale of Two Cities/page (173).png',
    'books/A Tale of Two Cities/page (174).png',
    'books/A Tale of Two Cities/page (175).png',
    'books/A Tale of Two Cities/page (176).png',
    'books/A Tale of Two Cities/page (177).png',
    'books/A Tale of Two Cities/page (178).png',
    'books/A Tale of Two Cities/page (179).png',
    'books/A Tale of Two Cities/page (180).png',
    'books/A Tale of Two Cities/page (181).png',
    'books/A Tale of Two Cities/page (182).png',
    'books/A Tale of Two Cities/page (183).png',
    'books/A Tale of Two Cities/page (184).png',
    'books/A Tale of Two Cities/page (185).png',
    'books/A Tale of Two Cities/page (186).png',
    'books/A Tale of Two Cities/page (187).png',
    'books/A Tale of Two Cities/page (188).png',
    'books/A Tale of Two Cities/page (189).png',
    'books/A Tale of Two Cities/page (190).png',
    'books/A Tale of Two Cities/page (191).png',
    'books/A Tale of Two Cities/page (192).png',
    'books/A Tale of Two Cities/page (193).png',
    'books/A Tale of Two Cities/page (194).png',
    'books/A Tale of Two Cities/page (195).png',
    'books/A Tale of Two Cities/page (196).png',
    'books/A Tale of Two Cities/page (197).png',
    'books/A Tale of Two Cities/page (198).png',
    'books/A Tale of Two Cities/page (199).png',
    'books/A Tale of Two Cities/page (200).png',
    'books/A Tale of Two Cities/page (201).png',
    'books/A Tale of Two Cities/page (202).png',
    'books/A Tale of Two Cities/page (203).png',
    'books/A Tale of Two Cities/page (204).png',
    'books/A Tale of Two Cities/page (205).png',
    'books/A Tale of Two Cities/page (206).png',
    'books/A Tale of Two Cities/page (207).png',
    'books/A Tale of Two Cities/page (208).png',
    'books/A Tale of Two Cities/page (209).png',
    'books/A Tale of Two Cities/page (210).png',
    'books/A Tale of Two Cities/page (211).png',
    'books/A Tale of Two Cities/page (212).png',
    'books/A Tale of Two Cities/page (213).png',
    'books/A Tale of Two Cities/page (214).png',
    'books/A Tale of Two Cities/page (215).png',
    'books/A Tale of Two Cities/page (216).png',
    'books/A Tale of Two Cities/page (217).png',
    'books/A Tale of Two Cities/page (218).png',
    'books/A Tale of Two Cities/page (219).png',
    'books/A Tale of Two Cities/page (220).png',
    'books/A Tale of Two Cities/page (221).png',
    'books/A Tale of Two Cities/page (222).png',
    'books/A Tale of Two Cities/page (223).png',
    'books/A Tale of Two Cities/page (224).png',
    'books/A Tale of Two Cities/page (225).png',
    'books/A Tale of Two Cities/page (226).png',
    'books/A Tale of Two Cities/page (227).png',
    'books/A Tale of Two Cities/page (228).png',
    'books/A Tale of Two Cities/page (229).png',
    'books/A Tale of Two Cities/page (230).png',
    'books/A Tale of Two Cities/page (231).png',
    'books/A Tale of Two Cities/page (232).png',
    'books/A Tale of Two Cities/page (233).png',
    'books/A Tale of Two Cities/page (234).png',
    'books/A Tale of Two Cities/page (235).png',
    'books/A Tale of Two Cities/page (236).png',
    'books/A Tale of Two Cities/page (237).png',
    'books/A Tale of Two Cities/page (238).png',
    'books/A Tale of Two Cities/page (239).png',
    'books/A Tale of Two Cities/page (240).png',
    'books/A Tale of Two Cities/page (241).png',
    'books/A Tale of Two Cities/page (242).png',
    'books/A Tale of Two Cities/page (243).png',
    'books/A Tale of Two Cities/page (244).png',
    'books/A Tale of Two Cities/page (245).png',
    'books/A Tale of Two Cities/page (246).png',
    'books/A Tale of Two Cities/page (247).png',
    'books/A Tale of Two Cities/page (248).png',
    'books/A Tale of Two Cities/page (249).png',
    'books/A Tale of Two Cities/page (250).png',
    'books/A Tale of Two Cities/page (251).png',
    'books/A Tale of Two Cities/page (252).png',
    'books/A Tale of Two Cities/page (253).png',
    'books/A Tale of Two Cities/page (254).png',
    'books/A Tale of Two Cities/page (255).png',
    'books/A Tale of Two Cities/page (256).png',
    'books/A Tale of Two Cities/page (257).png',
    'books/A Tale of Two Cities/page (258).png',
    'books/A Tale of Two Cities/page (259).png',
    'books/A Tale of Two Cities/page (260).png',
    'books/A Tale of Two Cities/page (261).png',
    'books/A Tale of Two Cities/page (262).png',
    'books/A Tale of Two Cities/page (263).png',
    'books/A Tale of Two Cities/page (264).png',
    'books/A Tale of Two Cities/page (265).png',
    'books/A Tale of Two Cities/page (266).png',
    'books/A Tale of Two Cities/page (267).png',
    'books/A Tale of Two Cities/page (268).png',
    'books/A Tale of Two Cities/page (269).png',
    'books/A Tale of Two Cities/page (270).png',
    'books/A Tale of Two Cities/page (271).png',
    'books/A Tale of Two Cities/page (272).png',
    'books/A Tale of Two Cities/page (273).png',
    'books/A Tale of Two Cities/page (274).png',
    'books/A Tale of Two Cities/page (275).png',
    'books/A Tale of Two Cities/page (276).png',
    'books/A Tale of Two Cities/page (277).png',
    'books/A Tale of Two Cities/page (278).png',
    'books/A Tale of Two Cities/page (279).png',
    'books/A Tale of Two Cities/page (280).png',
    'books/A Tale of Two Cities/page (281).png',
    'books/A Tale of Two Cities/page (282).png',
    'books/A Tale of Two Cities/page (283).png',
    'books/A Tale of Two Cities/page (284).png',
    'books/A Tale of Two Cities/page (285).png',
    'books/A Tale of Two Cities/page (286).png',
    'books/A Tale of Two Cities/page (287).png',
    'books/A Tale of Two Cities/page (288).png',
    'books/A Tale of Two Cities/page (289).png',
    'books/A Tale of Two Cities/page (290).png',
    'books/A Tale of Two Cities/page (291).png',
    'books/A Tale of Two Cities/page (292).png',
    'books/A Tale of Two Cities/page (293).png',
    'books/A Tale of Two Cities/page (294).png',
    'books/A Tale of Two Cities/page (295).png',
    'books/A Tale of Two Cities/page (296).png',
    'books/A Tale of Two Cities/page (297).png',
    'books/A Tale of Two Cities/page (298).png',
    'books/A Tale of Two Cities/page (299).png',
    'books/A Tale of Two Cities/page (300).png',
    'books/A Tale of Two Cities/page (301).png',
    'books/A Tale of Two Cities/page (302).png',
    'books/A Tale of Two Cities/page (303).png',
    'books/A Tale of Two Cities/page (304).png',
    'books/A Tale of Two Cities/page (305).png',
    'books/A Tale of Two Cities/page (306).png',
    'books/A Tale of Two Cities/page (307).png',
    'books/A Tale of Two Cities/page (308).png',
    'books/A Tale of Two Cities/page (309).png',
    'books/A Tale of Two Cities/page (310).png',
    'books/A Tale of Two Cities/page (311).png',
    'books/A Tale of Two Cities/page (312).png',
    'books/A Tale of Two Cities/page (313).png',
    'books/A Tale of Two Cities/page (314).png',
    'books/A Tale of Two Cities/page (315).png',
    'books/A Tale of Two Cities/page (316).png',
    'books/A Tale of Two Cities/page (317).png',
    'books/A Tale of Two Cities/page (318).png',
    'books/A Tale of Two Cities/page (319).png',
    'books/A Tale of Two Cities/page (320).png',
    'books/A Tale of Two Cities/page (321).png',
    'books/A Tale of Two Cities/page (322).png',
    'books/A Tale of Two Cities/page (323).png',
    'books/A Tale of Two Cities/page (324).png',
    'books/A Tale of Two Cities/page (325).png',
    'books/A Tale of Two Cities/page (326).png',
    'books/A Tale of Two Cities/page (327).png',
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
