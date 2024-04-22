import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class twilightidols extends StatefulWidget {
  const twilightidols({Key? key}) : super(key: key);

  @override
  State<twilightidols> createState() => _twilightidolsState();
}

class _twilightidolsState extends State<twilightidols> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/twilight idols/page (1).png',
    'books/twilight idols/page (2).png',
    'books/twilight idols/page (3).png',
    'books/twilight idols/page (4).png',
    'books/twilight idols/page (5).png',
    'books/twilight idols/page (6).png',
    'books/twilight idols/page (7).png',
    'books/twilight idols/page (8).png',
    'books/twilight idols/page (9).png',
    'books/twilight idols/page (10).png',
    'books/twilight idols/page (11).png',
    'books/twilight idols/page (12).png',
    'books/twilight idols/page (13).png',
    'books/twilight idols/page (14).png',
    'books/twilight idols/page (15).png',
    'books/twilight idols/page (16).png',
    'books/twilight idols/page (17).png',
    'books/twilight idols/page (18).png',
    'books/twilight idols/page (19).png',
    'books/twilight idols/page (20).png',
    'books/twilight idols/page (21).png',
    'books/twilight idols/page (22).png',
    'books/twilight idols/page (23).png',
    'books/twilight idols/page (24).png',
    'books/twilight idols/page (25).png',
    'books/twilight idols/page (26).png',
    'books/twilight idols/page (27).png',
    'books/twilight idols/page (28).png',
    'books/twilight idols/page (29).png',
    'books/twilight idols/page (30).png',
    'books/twilight idols/page (31).png',
    'books/twilight idols/page (32).png',
    'books/twilight idols/page (33).png',
    'books/twilight idols/page (34).png',
    'books/twilight idols/page (35).png',
    'books/twilight idols/page (36).png',
    'books/twilight idols/page (37).png',
    'books/twilight idols/page (38).png',
    'books/twilight idols/page (39).png',
    'books/twilight idols/page (40).png',
    'books/twilight idols/page (41).png',
    'books/twilight idols/page (42).png',
    'books/twilight idols/page (43).png',
    'books/twilight idols/page (44).png',
    'books/twilight idols/page (45).png',
    'books/twilight idols/page (46).png',
    'books/twilight idols/page (47).png',
    'books/twilight idols/page (48).png',
    'books/twilight idols/page (49).png',
    'books/twilight idols/page (50).png',
    'books/twilight idols/page (51).png',
    'books/twilight idols/page (52).png',
    'books/twilight idols/page (53).png',
    'books/twilight idols/page (54).png',
    'books/twilight idols/page (55).png',
    'books/twilight idols/page (56).png',
    'books/twilight idols/page (57).png',
    'books/twilight idols/page (58).png',
    'books/twilight idols/page (59).png',
    'books/twilight idols/page (60).png',
    'books/twilight idols/page (61).png',
    'books/twilight idols/page (62).png',
    'books/twilight idols/page (63).png',
    'books/twilight idols/page (64).png',
    'books/twilight idols/page (65).png',
    'books/twilight idols/page (66).png',
    'books/twilight idols/page (67).png',
    'books/twilight idols/page (68).png',
    'books/twilight idols/page (69).png',
    'books/twilight idols/page (70).png',
    'books/twilight idols/page (71).png',
    'books/twilight idols/page (72).png',
    'books/twilight idols/page (73).png',
    'books/twilight idols/page (74).png',
    'books/twilight idols/page (75).png',
    'books/twilight idols/page (76).png',
    'books/twilight idols/page (77).png',
    'books/twilight idols/page (78).png',
    'books/twilight idols/page (79).png',
    'books/twilight idols/page (80).png',
    'books/twilight idols/page (81).png',
    'books/twilight idols/page (82).png',
    'books/twilight idols/page (83).png',
    'books/twilight idols/page (84).png',
    'books/twilight idols/page (85).png',
    'books/twilight idols/page (86).png',
    'books/twilight idols/page (87).png',
    'books/twilight idols/page (88).png',
    'books/twilight idols/page (89).png',
    'books/twilight idols/page (90).png',
    'books/twilight idols/page (91).png',
    'books/twilight idols/page (92).png',
    'books/twilight idols/page (93).png',
    'books/twilight idols/page (94).png',
    'books/twilight idols/page (95).png',
    'books/twilight idols/page (96).png',
    'books/twilight idols/page (97).png',
    'books/twilight idols/page (98).png',
    'books/twilight idols/page (99).png',
    'books/twilight idols/page (100).png',
    'books/twilight idols/page (101).png',
    'books/twilight idols/page (102).png',
    'books/twilight idols/page (103).png',
    'books/twilight idols/page (104).png',
    'books/twilight idols/page (105).png',
    'books/twilight idols/page (106).png',
    'books/twilight idols/page (107).png',
    'books/twilight idols/page (108).png',
    'books/twilight idols/page (109).png',
    'books/twilight idols/page (110).png',
    'books/twilight idols/page (111).png',
    'books/twilight idols/page (112).png',
    'books/twilight idols/page (113).png',
    'books/twilight idols/page (114).png',
    'books/twilight idols/page (115).png',
    'books/twilight idols/page (116).png',
    'books/twilight idols/page (117).png',
    'books/twilight idols/page (118).png',
    'books/twilight idols/page (119).png',
    'books/twilight idols/page (120).png',
    'books/twilight idols/page (121).png',
    'books/twilight idols/page (122).png',
    'books/twilight idols/page (123).png',
    'books/twilight idols/page (124).png',
    'books/twilight idols/page (125).png',
    'books/twilight idols/page (126).png',
    'books/twilight idols/page (127).png',
    'books/twilight idols/page (128).png',
    'books/twilight idols/page (129).png',
    'books/twilight idols/page (130).png',
    'books/twilight idols/page (131).png',
    'books/twilight idols/page (132).png',
    'books/twilight idols/page (133).png',
    'books/twilight idols/page (134).png',
    'books/twilight idols/page (135).png',
    'books/twilight idols/page (136).png',
    'books/twilight idols/page (137).png',
    'books/twilight idols/page (138).png',
    'books/twilight idols/page (139).png',
    'books/twilight idols/page (140).png',
    'books/twilight idols/page (141).png',
    'books/twilight idols/page (142).png',
    'books/twilight idols/page (143).png',
    'books/twilight idols/page (144).png',
    'books/twilight idols/page (145).png',
    'books/twilight idols/page (146).png',
    'books/twilight idols/page (147).png',
    'books/twilight idols/page (148).png',
    'books/twilight idols/page (149).png',
    'books/twilight idols/page (150).png',
    'books/twilight idols/page (151).png',
    'books/twilight idols/page (152).png',
    'books/twilight idols/page (153).png',
    'books/twilight idols/page (154).png',
    'books/twilight idols/page (155).png',
    'books/twilight idols/page (156).png',
    'books/twilight idols/page (157).png',
    'books/twilight idols/page (158).png',
    'books/twilight idols/page (159).png',
    'books/twilight idols/page (160).png',
    'books/twilight idols/page (161).png',
    'books/twilight idols/page (162).png',
    'books/twilight idols/page (163).png',
    'books/twilight idols/page (164).png',
    'books/twilight idols/page (165).png',
    'books/twilight idols/page (166).png',
    'books/twilight idols/page (167).png',
    'books/twilight idols/page (168).png',
    'books/twilight idols/page (169).png',
    'books/twilight idols/page (170).png',
    'books/twilight idols/page (171).png',
    'books/twilight idols/page (172).png',
    'books/twilight idols/page (173).png',
    'books/twilight idols/page (174).png',
    'books/twilight idols/page (175).png',
    'books/twilight idols/page (176).png',
    'books/twilight idols/page (177).png',
    'books/twilight idols/page (178).png',
    'books/twilight idols/page (179).png',
    'books/twilight idols/page (180).png',
    'books/twilight idols/page (181).png',
    'books/twilight idols/page (182).png',
    'books/twilight idols/page (183).png',
    'books/twilight idols/page (184).png',
    'books/twilight idols/page (185).png',
    'books/twilight idols/page (186).png',
    'books/twilight idols/page (187).png',
    'books/twilight idols/page (188).png',
    'books/twilight idols/page (189).png',
    'books/twilight idols/page (190).png',
    'books/twilight idols/page (191).png',
    'books/twilight idols/page (192).png',
    'books/twilight idols/page (193).png',
    'books/twilight idols/page (194).png',
    'books/twilight idols/page (195).png',
    'books/twilight idols/page (196).png',
    'books/twilight idols/page (197).png',
    'books/twilight idols/page (198).png',
    'books/twilight idols/page (199).png',
    'books/twilight idols/page (200).png',
    'books/twilight idols/page (201).png',
    'books/twilight idols/page (202).png',
    'books/twilight idols/page (203).png',
    'books/twilight idols/page (204).png',
    'books/twilight idols/page (205).png',
    'books/twilight idols/page (206).png',
    'books/twilight idols/page (207).png',
    'books/twilight idols/page (208).png',
    'books/twilight idols/page (209).png',
    'books/twilight idols/page (210).png',
    'books/twilight idols/page (211).png',
    'books/twilight idols/page (212).png',
    'books/twilight idols/page (213).png',
    'books/twilight idols/page (214).png',
    'books/twilight idols/page (215).png',
    'books/twilight idols/page (216).png',
    'books/twilight idols/page (217).png',
    'books/twilight idols/page (218).png',
    'books/twilight idols/page (219).png',
    'books/twilight idols/page (220).png',
    'books/twilight idols/page (221).png',
    'books/twilight idols/page (222).png',
    'books/twilight idols/page (223).png',
    'books/twilight idols/page (224).png',
    'books/twilight idols/page (225).png',
    'books/twilight idols/page (226).png',
    'books/twilight idols/page (227).png',
    'books/twilight idols/page (228).png',
    'books/twilight idols/page (229).png',
    'books/twilight idols/page (230).png',
    'books/twilight idols/page (231).png',
    'books/twilight idols/page (232).png',
    'books/twilight idols/page (233).png',
    'books/twilight idols/page (234).png',
    'books/twilight idols/page (235).png',
    'books/twilight idols/page (236).png',
    'books/twilight idols/page (237).png',
    'books/twilight idols/page (238).png',
    'books/twilight idols/page (239).png',
    'books/twilight idols/page (240).png',
    'books/twilight idols/page (241).png',
    'books/twilight idols/page (242).png',
    'books/twilight idols/page (243).png',
    'books/twilight idols/page (244).png',
    'books/twilight idols/page (245).png',
    'books/twilight idols/page (246).png',
    'books/twilight idols/page (247).png',
    'books/twilight idols/page (248).png',
    'books/twilight idols/page (249).png',
    'books/twilight idols/page (250).png',
    'books/twilight idols/page (251).png',
    'books/twilight idols/page (252).png',
    'books/twilight idols/page (253).png',
    'books/twilight idols/page (254).png',
    'books/twilight idols/page (255).png',
    'books/twilight idols/page (256).png',
    'books/twilight idols/page (257).png',
    'books/twilight idols/page (258).png',
    'books/twilight idols/page (259).png',
    'books/twilight idols/page (260).png',
    'books/twilight idols/page (261).png',
    'books/twilight idols/page (262).png',
    'books/twilight idols/page (263).png',
    'books/twilight idols/page (264).png',
    'books/twilight idols/page (265).png',
    'books/twilight idols/page (266).png',
    'books/twilight idols/page (267).png',
    'books/twilight idols/page (268).png',
    'books/twilight idols/page (269).png',
    'books/twilight idols/page (270).png',
    'books/twilight idols/page (271).png',
    'books/twilight idols/page (272).png',
    'books/twilight idols/page (273).png',
    'books/twilight idols/page (274).png',
    'books/twilight idols/page (275).png',
    'books/twilight idols/page (276).png',
    'books/twilight idols/page (277).png',
    'books/twilight idols/page (278).png',
    'books/twilight idols/page (279).png',
    'books/twilight idols/page (280).png',
    'books/twilight idols/page (281).png',
    'books/twilight idols/page (282).png',
    'books/twilight idols/page (283).png',
    'books/twilight idols/page (284).png',
    'books/twilight idols/page (285).png',
    'books/twilight idols/page (286).png',
    'books/twilight idols/page (287).png',
    'books/twilight idols/page (288).png',
    'books/twilight idols/page (289).png',
    'books/twilight idols/page (290).png',
    'books/twilight idols/page (291).png',
    'books/twilight idols/page (292).png',
    'books/twilight idols/page (293).png',
    'books/twilight idols/page (294).png',
    'books/twilight idols/page (295).png',
    'books/twilight idols/page (296).png',
    'books/twilight idols/page (297).png',
    'books/twilight idols/page (298).png',
    'books/twilight idols/page (299).png',
    'books/twilight idols/page (300).png',
    'books/twilight idols/page (301).png',
    'books/twilight idols/page (302).png',
    'books/twilight idols/page (303).png',
    'books/twilight idols/page (304).png',
    'books/twilight idols/page (305).png',
    'books/twilight idols/page (306).png',
    'books/twilight idols/page (307).png',
    'books/twilight idols/page (308).png',
    'books/twilight idols/page (309).png',
    'books/twilight idols/page (310).png',
    'books/twilight idols/page (311).png',
    'books/twilight idols/page (312).png',
    'books/twilight idols/page (313).png',
    'books/twilight idols/page (314).png',
    'books/twilight idols/page (315).png',
    'books/twilight idols/page (316).png',
    'books/twilight idols/page (317).png',
    'books/twilight idols/page (318).png',

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
