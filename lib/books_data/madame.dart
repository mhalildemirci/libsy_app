import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class madame extends StatefulWidget {
  const madame({Key? key}) : super(key: key);

  @override
  State<madame> createState() => _madameState();
}

class _madameState extends State<madame> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/madame/page (1).png',
    'books/madame/page (2).png',
    'books/madame/page (3).png',
    'books/madame/page (4).png',
    'books/madame/page (5).png',
    'books/madame/page (6).png',
    'books/madame/page (7).png',
    'books/madame/page (8).png',
    'books/madame/page (9).png',
    'books/madame/page (10).png',
    'books/madame/page (11).png',
    'books/madame/page (12).png',
    'books/madame/page (13).png',
    'books/madame/page (14).png',
    'books/madame/page (15).png',
    'books/madame/page (16).png',
    'books/madame/page (17).png',
    'books/madame/page (18).png',
    'books/madame/page (19).png',
    'books/madame/page (20).png',
    'books/madame/page (21).png',
    'books/madame/page (22).png',
    'books/madame/page (23).png',
    'books/madame/page (24).png',
    'books/madame/page (25).png',
    'books/madame/page (26).png',
    'books/madame/page (27).png',
    'books/madame/page (28).png',
    'books/madame/page (29).png',
    'books/madame/page (30).png',
    'books/madame/page (31).png',
    'books/madame/page (32).png',
    'books/madame/page (33).png',
    'books/madame/page (34).png',
    'books/madame/page (35).png',
    'books/madame/page (36).png',
    'books/madame/page (37).png',
    'books/madame/page (38).png',
    'books/madame/page (39).png',
    'books/madame/page (40).png',
    'books/madame/page (41).png',
    'books/madame/page (42).png',
    'books/madame/page (43).png',
    'books/madame/page (44).png',
    'books/madame/page (45).png',
    'books/madame/page (46).png',
    'books/madame/page (47).png',
    'books/madame/page (48).png',
    'books/madame/page (49).png',
    'books/madame/page (50).png',
    'books/madame/page (51).png',
    'books/madame/page (52).png',
    'books/madame/page (53).png',
    'books/madame/page (54).png',
    'books/madame/page (55).png',
    'books/madame/page (56).png',
    'books/madame/page (57).png',
    'books/madame/page (58).png',
    'books/madame/page (59).png',
    'books/madame/page (60).png',
    'books/madame/page (61).png',
    'books/madame/page (62).png',
    'books/madame/page (63).png',
    'books/madame/page (64).png',
    'books/madame/page (65).png',
    'books/madame/page (66).png',
    'books/madame/page (67).png',
    'books/madame/page (68).png',
    'books/madame/page (69).png',
    'books/madame/page (70).png',
    'books/madame/page (71).png',
    'books/madame/page (72).png',
    'books/madame/page (73).png',
    'books/madame/page (74).png',
    'books/madame/page (75).png',
    'books/madame/page (76).png',
    'books/madame/page (77).png',
    'books/madame/page (78).png',
    'books/madame/page (79).png',
    'books/madame/page (80).png',
    'books/madame/page (81).png',
    'books/madame/page (82).png',
    'books/madame/page (83).png',
    'books/madame/page (84).png',
    'books/madame/page (85).png',
    'books/madame/page (86).png',
    'books/madame/page (87).png',
    'books/madame/page (88).png',
    'books/madame/page (89).png',
    'books/madame/page (90).png',
    'books/madame/page (91).png',
    'books/madame/page (92).png',
    'books/madame/page (93).png',
    'books/madame/page (94).png',
    'books/madame/page (95).png',
    'books/madame/page (96).png',
    'books/madame/page (97).png',
    'books/madame/page (98).png',
    'books/madame/page (99).png',
    'books/madame/page (100).png',
    'books/madame/page (101).png',
    'books/madame/page (102).png',
    'books/madame/page (103).png',
    'books/madame/page (104).png',
    'books/madame/page (105).png',
    'books/madame/page (106).png',
    'books/madame/page (107).png',
    'books/madame/page (108).png',
    'books/madame/page (109).png',
    'books/madame/page (110).png',
    'books/madame/page (111).png',
    'books/madame/page (112).png',
    'books/madame/page (113).png',
    'books/madame/page (114).png',
    'books/madame/page (115).png',
    'books/madame/page (116).png',
    'books/madame/page (117).png',
    'books/madame/page (118).png',
    'books/madame/page (119).png',
    'books/madame/page (120).png',
    'books/madame/page (121).png',
    'books/madame/page (122).png',
    'books/madame/page (123).png',
    'books/madame/page (124).png',
    'books/madame/page (125).png',
    'books/madame/page (126).png',
    'books/madame/page (127).png',
    'books/madame/page (128).png',
    'books/madame/page (129).png',
    'books/madame/page (130).png',
    'books/madame/page (131).png',
    'books/madame/page (132).png',
    'books/madame/page (133).png',
    'books/madame/page (134).png',
    'books/madame/page (135).png',
    'books/madame/page (136).png',
    'books/madame/page (137).png',
    'books/madame/page (138).png',
    'books/madame/page (139).png',
    'books/madame/page (140).png',
    'books/madame/page (141).png',
    'books/madame/page (142).png',
    'books/madame/page (143).png',
    'books/madame/page (144).png',
    'books/madame/page (145).png',
    'books/madame/page (146).png',
    'books/madame/page (147).png',
    'books/madame/page (148).png',
    'books/madame/page (149).png',
    'books/madame/page (150).png',
    'books/madame/page (151).png',
    'books/madame/page (152).png',
    'books/madame/page (153).png',
    'books/madame/page (154).png',
    'books/madame/page (155).png',
    'books/madame/page (156).png',
    'books/madame/page (157).png',
    'books/madame/page (158).png',
    'books/madame/page (159).png',
    'books/madame/page (160).png',
    'books/madame/page (161).png',
    'books/madame/page (162).png',
    'books/madame/page (163).png',
    'books/madame/page (164).png',
    'books/madame/page (165).png',
    'books/madame/page (166).png',
    'books/madame/page (167).png',
    'books/madame/page (168).png',
    'books/madame/page (169).png',
    'books/madame/page (170).png',
    'books/madame/page (171).png',
    'books/madame/page (172).png',
    'books/madame/page (173).png',
    'books/madame/page (174).png',
    'books/madame/page (175).png',
    'books/madame/page (176).png',
    'books/madame/page (177).png',
    'books/madame/page (178).png',
    'books/madame/page (179).png',
    'books/madame/page (180).png',
    'books/madame/page (181).png',
    'books/madame/page (182).png',
    'books/madame/page (183).png',
    'books/madame/page (184).png',
    'books/madame/page (185).png',
    'books/madame/page (186).png',
    'books/madame/page (187).png',
    'books/madame/page (188).png',
    'books/madame/page (189).png',
    'books/madame/page (190).png',
    'books/madame/page (191).png',
    'books/madame/page (192).png',
    'books/madame/page (193).png',
    'books/madame/page (194).png',
    'books/madame/page (195).png',
    'books/madame/page (196).png',
    'books/madame/page (197).png',
    'books/madame/page (198).png',
    'books/madame/page (199).png',
    'books/madame/page (200).png',
    'books/madame/page (201).png',
    'books/madame/page (202).png',
    'books/madame/page (203).png',
    'books/madame/page (204).png',
    'books/madame/page (205).png',
    'books/madame/page (206).png',
    'books/madame/page (207).png',
    'books/madame/page (208).png',
    'books/madame/page (209).png',
    'books/madame/page (210).png',
    'books/madame/page (211).png',
    'books/madame/page (212).png',
    'books/madame/page (213).png',
    'books/madame/page (214).png',
    'books/madame/page (215).png',
    'books/madame/page (216).png',
    'books/madame/page (217).png',
    'books/madame/page (218).png',
    'books/madame/page (219).png',
    'books/madame/page (220).png',
    'books/madame/page (221).png',
    'books/madame/page (222).png',
    'books/madame/page (223).png',
    'books/madame/page (224).png',
    'books/madame/page (225).png',
    'books/madame/page (226).png',
    'books/madame/page (227).png',
    'books/madame/page (228).png',
    'books/madame/page (229).png',
    'books/madame/page (230).png',
    'books/madame/page (231).png',
    'books/madame/page (232).png',
    'books/madame/page (233).png',
    'books/madame/page (234).png',
    'books/madame/page (235).png',
    'books/madame/page (236).png',
    'books/madame/page (237).png',
    'books/madame/page (238).png',
    'books/madame/page (239).png',
    'books/madame/page (240).png',
    'books/madame/page (241).png',
    'books/madame/page (242).png',
    'books/madame/page (243).png',
    'books/madame/page (244).png',
    'books/madame/page (245).png',
    'books/madame/page (246).png',
    'books/madame/page (247).png',
    'books/madame/page (248).png',
    'books/madame/page (249).png',
    'books/madame/page (250).png',
    'books/madame/page (251).png',
    'books/madame/page (252).png',
    'books/madame/page (253).png',
    'books/madame/page (254).png',
    'books/madame/page (255).png',
    'books/madame/page (256).png',
    'books/madame/page (257).png',
    'books/madame/page (258).png',
    'books/madame/page (259).png',
    'books/madame/page (260).png',
    'books/madame/page (261).png',
    'books/madame/page (262).png',
    'books/madame/page (263).png',
    'books/madame/page (264).png',
    'books/madame/page (265).png',
    'books/madame/page (266).png',
    'books/madame/page (267).png',
    'books/madame/page (268).png',
    'books/madame/page (269).png',
    'books/madame/page (270).png',
    'books/madame/page (271).png',
    'books/madame/page (272).png',
    'books/madame/page (273).png',
    'books/madame/page (274).png',
    'books/madame/page (275).png',
    'books/madame/page (276).png',
    'books/madame/page (277).png',
    'books/madame/page (278).png',
    'books/madame/page (279).png',
    'books/madame/page (280).png',
    'books/madame/page (281).png',
    'books/madame/page (282).png',
    'books/madame/page (283).png',
    'books/madame/page (284).png',
    'books/madame/page (285).png',
    'books/madame/page (286).png',
    'books/madame/page (287).png',
    'books/madame/page (288).png',
    'books/madame/page (289).png',
    'books/madame/page (290).png',
    'books/madame/page (291).png',
    'books/madame/page (292).png',
    'books/madame/page (293).png',
    'books/madame/page (294).png',
    'books/madame/page (295).png',
    'books/madame/page (296).png',
    'books/madame/page (297).png',
    'books/madame/page (298).png',
    'books/madame/page (299).png',
    'books/madame/page (300).png',
    'books/madame/page (301).png',
    'books/madame/page (302).png',
    'books/madame/page (303).png',
    'books/madame/page (304).png',
    'books/madame/page (305).png',
    'books/madame/page (306).png',
    'books/madame/page (307).png',
    'books/madame/page (308).png',
    'books/madame/page (309).png',
    'books/madame/page (310).png',
    'books/madame/page (311).png',
    'books/madame/page (312).png',
    'books/madame/page (313).png',
    'books/madame/page (314).png',
    'books/madame/page (315).png',
    'books/madame/page (316).png',
    'books/madame/page (317).png',
    'books/madame/page (318).png',

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
