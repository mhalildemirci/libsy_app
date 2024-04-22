import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sahnenindisindakiler extends StatefulWidget {
  const sahnenindisindakiler({Key? key}) : super(key: key);

  @override
  State<sahnenindisindakiler> createState() => _sahnenindisindakilerState();
}

class _sahnenindisindakilerState extends State<sahnenindisindakiler> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sahnenin disindakiler/page (1).png',
    'books/sahnenin disindakiler/page (2).png',
    'books/sahnenin disindakiler/page (3).png',
    'books/sahnenin disindakiler/page (4).png',
    'books/sahnenin disindakiler/page (5).png',
    'books/sahnenin disindakiler/page (6).png',
    'books/sahnenin disindakiler/page (7).png',
    'books/sahnenin disindakiler/page (8).png',
    'books/sahnenin disindakiler/page (9).png',
    'books/sahnenin disindakiler/page (10).png',
    'books/sahnenin disindakiler/page (11).png',
    'books/sahnenin disindakiler/page (12).png',
    'books/sahnenin disindakiler/page (13).png',
    'books/sahnenin disindakiler/page (14).png',
    'books/sahnenin disindakiler/page (15).png',
    'books/sahnenin disindakiler/page (16).png',
    'books/sahnenin disindakiler/page (17).png',
    'books/sahnenin disindakiler/page (18).png',
    'books/sahnenin disindakiler/page (19).png',
    'books/sahnenin disindakiler/page (20).png',
    'books/sahnenin disindakiler/page (21).png',
    'books/sahnenin disindakiler/page (22).png',
    'books/sahnenin disindakiler/page (23).png',
    'books/sahnenin disindakiler/page (24).png',
    'books/sahnenin disindakiler/page (25).png',
    'books/sahnenin disindakiler/page (26).png',
    'books/sahnenin disindakiler/page (27).png',
    'books/sahnenin disindakiler/page (28).png',
    'books/sahnenin disindakiler/page (29).png',
    'books/sahnenin disindakiler/page (30).png',
    'books/sahnenin disindakiler/page (31).png',
    'books/sahnenin disindakiler/page (32).png',
    'books/sahnenin disindakiler/page (33).png',
    'books/sahnenin disindakiler/page (34).png',
    'books/sahnenin disindakiler/page (35).png',
    'books/sahnenin disindakiler/page (36).png',
    'books/sahnenin disindakiler/page (37).png',
    'books/sahnenin disindakiler/page (38).png',
    'books/sahnenin disindakiler/page (39).png',
    'books/sahnenin disindakiler/page (40).png',
    'books/sahnenin disindakiler/page (41).png',
    'books/sahnenin disindakiler/page (42).png',
    'books/sahnenin disindakiler/page (43).png',
    'books/sahnenin disindakiler/page (44).png',
    'books/sahnenin disindakiler/page (45).png',
    'books/sahnenin disindakiler/page (46).png',
    'books/sahnenin disindakiler/page (47).png',
    'books/sahnenin disindakiler/page (48).png',
    'books/sahnenin disindakiler/page (49).png',
    'books/sahnenin disindakiler/page (50).png',
    'books/sahnenin disindakiler/page (51).png',
    'books/sahnenin disindakiler/page (52).png',
    'books/sahnenin disindakiler/page (53).png',
    'books/sahnenin disindakiler/page (54).png',
    'books/sahnenin disindakiler/page (55).png',
    'books/sahnenin disindakiler/page (56).png',
    'books/sahnenin disindakiler/page (57).png',
    'books/sahnenin disindakiler/page (58).png',
    'books/sahnenin disindakiler/page (59).png',
    'books/sahnenin disindakiler/page (60).png',
    'books/sahnenin disindakiler/page (61).png',
    'books/sahnenin disindakiler/page (62).png',
    'books/sahnenin disindakiler/page (63).png',
    'books/sahnenin disindakiler/page (64).png',
    'books/sahnenin disindakiler/page (65).png',
    'books/sahnenin disindakiler/page (66).png',
    'books/sahnenin disindakiler/page (67).png',
    'books/sahnenin disindakiler/page (68).png',
    'books/sahnenin disindakiler/page (69).png',
    'books/sahnenin disindakiler/page (70).png',
    'books/sahnenin disindakiler/page (71).png',
    'books/sahnenin disindakiler/page (72).png',
    'books/sahnenin disindakiler/page (73).png',
    'books/sahnenin disindakiler/page (74).png',
    'books/sahnenin disindakiler/page (75).png',
    'books/sahnenin disindakiler/page (76).png',
    'books/sahnenin disindakiler/page (77).png',
    'books/sahnenin disindakiler/page (78).png',
    'books/sahnenin disindakiler/page (79).png',
    'books/sahnenin disindakiler/page (80).png',
    'books/sahnenin disindakiler/page (81).png',
    'books/sahnenin disindakiler/page (82).png',
    'books/sahnenin disindakiler/page (83).png',
    'books/sahnenin disindakiler/page (84).png',
    'books/sahnenin disindakiler/page (85).png',
    'books/sahnenin disindakiler/page (86).png',
    'books/sahnenin disindakiler/page (87).png',
    'books/sahnenin disindakiler/page (88).png',
    'books/sahnenin disindakiler/page (89).png',
    'books/sahnenin disindakiler/page (90).png',
    'books/sahnenin disindakiler/page (91).png',
    'books/sahnenin disindakiler/page (92).png',
    'books/sahnenin disindakiler/page (93).png',
    'books/sahnenin disindakiler/page (94).png',
    'books/sahnenin disindakiler/page (95).png',
    'books/sahnenin disindakiler/page (96).png',
    'books/sahnenin disindakiler/page (97).png',
    'books/sahnenin disindakiler/page (98).png',
    'books/sahnenin disindakiler/page (99).png',
    'books/sahnenin disindakiler/page (100).png',
    'books/sahnenin disindakiler/page (101).png',
    'books/sahnenin disindakiler/page (102).png',
    'books/sahnenin disindakiler/page (103).png',
    'books/sahnenin disindakiler/page (104).png',
    'books/sahnenin disindakiler/page (105).png',
    'books/sahnenin disindakiler/page (106).png',
    'books/sahnenin disindakiler/page (107).png',
    'books/sahnenin disindakiler/page (108).png',
    'books/sahnenin disindakiler/page (109).png',
    'books/sahnenin disindakiler/page (110).png',
    'books/sahnenin disindakiler/page (111).png',
    'books/sahnenin disindakiler/page (112).png',
    'books/sahnenin disindakiler/page (113).png',
    'books/sahnenin disindakiler/page (114).png',
    'books/sahnenin disindakiler/page (115).png',
    'books/sahnenin disindakiler/page (116).png',
    'books/sahnenin disindakiler/page (117).png',
    'books/sahnenin disindakiler/page (118).png',
    'books/sahnenin disindakiler/page (119).png',
    'books/sahnenin disindakiler/page (120).png',
    'books/sahnenin disindakiler/page (121).png',
    'books/sahnenin disindakiler/page (122).png',
    'books/sahnenin disindakiler/page (123).png',
    'books/sahnenin disindakiler/page (124).png',
    'books/sahnenin disindakiler/page (125).png',
    'books/sahnenin disindakiler/page (126).png',
    'books/sahnenin disindakiler/page (127).png',
    'books/sahnenin disindakiler/page (128).png',
    'books/sahnenin disindakiler/page (129).png',
    'books/sahnenin disindakiler/page (130).png',
    'books/sahnenin disindakiler/page (131).png',
    'books/sahnenin disindakiler/page (132).png',
    'books/sahnenin disindakiler/page (133).png',
    'books/sahnenin disindakiler/page (134).png',
    'books/sahnenin disindakiler/page (135).png',
    'books/sahnenin disindakiler/page (136).png',
    'books/sahnenin disindakiler/page (137).png',
    'books/sahnenin disindakiler/page (138).png',
    'books/sahnenin disindakiler/page (139).png',
    'books/sahnenin disindakiler/page (140).png',
    'books/sahnenin disindakiler/page (141).png',
    'books/sahnenin disindakiler/page (142).png',
    'books/sahnenin disindakiler/page (143).png',
    'books/sahnenin disindakiler/page (144).png',
    'books/sahnenin disindakiler/page (145).png',
    'books/sahnenin disindakiler/page (146).png',
    'books/sahnenin disindakiler/page (147).png',
    'books/sahnenin disindakiler/page (148).png',
    'books/sahnenin disindakiler/page (149).png',
    'books/sahnenin disindakiler/page (150).png',
    'books/sahnenin disindakiler/page (151).png',
    'books/sahnenin disindakiler/page (152).png',
    'books/sahnenin disindakiler/page (153).png',
    'books/sahnenin disindakiler/page (154).png',
    'books/sahnenin disindakiler/page (155).png',
    'books/sahnenin disindakiler/page (156).png',
    'books/sahnenin disindakiler/page (157).png',
    'books/sahnenin disindakiler/page (158).png',
    'books/sahnenin disindakiler/page (159).png',
    'books/sahnenin disindakiler/page (160).png',
    'books/sahnenin disindakiler/page (161).png',
    'books/sahnenin disindakiler/page (162).png',
    'books/sahnenin disindakiler/page (163).png',
    'books/sahnenin disindakiler/page (164).png',
    'books/sahnenin disindakiler/page (165).png',
    'books/sahnenin disindakiler/page (166).png',
    'books/sahnenin disindakiler/page (167).png',
    'books/sahnenin disindakiler/page (168).png',
    'books/sahnenin disindakiler/page (169).png',
    'books/sahnenin disindakiler/page (170).png',
    'books/sahnenin disindakiler/page (171).png',
    'books/sahnenin disindakiler/page (172).png',
    'books/sahnenin disindakiler/page (173).png',
    'books/sahnenin disindakiler/page (174).png',
    'books/sahnenin disindakiler/page (175).png',
    'books/sahnenin disindakiler/page (176).png',
    'books/sahnenin disindakiler/page (177).png',
    'books/sahnenin disindakiler/page (178).png',
    'books/sahnenin disindakiler/page (179).png',
    'books/sahnenin disindakiler/page (180).png',
    'books/sahnenin disindakiler/page (181).png',
    'books/sahnenin disindakiler/page (182).png',
    'books/sahnenin disindakiler/page (183).png',
    'books/sahnenin disindakiler/page (184).png',
    'books/sahnenin disindakiler/page (185).png',
    'books/sahnenin disindakiler/page (186).png',
    'books/sahnenin disindakiler/page (187).png',
    'books/sahnenin disindakiler/page (188).png',
    'books/sahnenin disindakiler/page (189).png',
    'books/sahnenin disindakiler/page (190).png',
    'books/sahnenin disindakiler/page (191).png',
    'books/sahnenin disindakiler/page (192).png',
    'books/sahnenin disindakiler/page (193).png',
    'books/sahnenin disindakiler/page (194).png',
    'books/sahnenin disindakiler/page (195).png',
    'books/sahnenin disindakiler/page (196).png',
    'books/sahnenin disindakiler/page (197).png',
    'books/sahnenin disindakiler/page (198).png',
    'books/sahnenin disindakiler/page (199).png',
    'books/sahnenin disindakiler/page (200).png',
    'books/sahnenin disindakiler/page (201).png',
    'books/sahnenin disindakiler/page (202).png',
    'books/sahnenin disindakiler/page (203).png',
    'books/sahnenin disindakiler/page (204).png',
    'books/sahnenin disindakiler/page (205).png',
    'books/sahnenin disindakiler/page (206).png',
    'books/sahnenin disindakiler/page (207).png',
    'books/sahnenin disindakiler/page (208).png',
    'books/sahnenin disindakiler/page (209).png',
    'books/sahnenin disindakiler/page (210).png',
    'books/sahnenin disindakiler/page (211).png',
    'books/sahnenin disindakiler/page (212).png',
    'books/sahnenin disindakiler/page (213).png',
    'books/sahnenin disindakiler/page (214).png',
    'books/sahnenin disindakiler/page (215).png',
    'books/sahnenin disindakiler/page (216).png',
    'books/sahnenin disindakiler/page (217).png',
    'books/sahnenin disindakiler/page (218).png',
    'books/sahnenin disindakiler/page (219).png',
    'books/sahnenin disindakiler/page (220).png',
    'books/sahnenin disindakiler/page (221).png',
    'books/sahnenin disindakiler/page (222).png',
    'books/sahnenin disindakiler/page (223).png',
    'books/sahnenin disindakiler/page (224).png',
    'books/sahnenin disindakiler/page (225).png',
    'books/sahnenin disindakiler/page (226).png',
    'books/sahnenin disindakiler/page (227).png',
    'books/sahnenin disindakiler/page (228).png',
    'books/sahnenin disindakiler/page (229).png',
    'books/sahnenin disindakiler/page (230).png',
    'books/sahnenin disindakiler/page (231).png',
    'books/sahnenin disindakiler/page (232).png',
    'books/sahnenin disindakiler/page (233).png',
    'books/sahnenin disindakiler/page (234).png',
    'books/sahnenin disindakiler/page (235).png',
    'books/sahnenin disindakiler/page (236).png',
    'books/sahnenin disindakiler/page (237).png',
    'books/sahnenin disindakiler/page (238).png',
    'books/sahnenin disindakiler/page (239).png',
    'books/sahnenin disindakiler/page (240).png',
    'books/sahnenin disindakiler/page (241).png',
    'books/sahnenin disindakiler/page (242).png',
    'books/sahnenin disindakiler/page (243).png',
    'books/sahnenin disindakiler/page (244).png',
    'books/sahnenin disindakiler/page (245).png',
    'books/sahnenin disindakiler/page (246).png',
    'books/sahnenin disindakiler/page (247).png',
    'books/sahnenin disindakiler/page (248).png',
    'books/sahnenin disindakiler/page (249).png',
    'books/sahnenin disindakiler/page (250).png',
    'books/sahnenin disindakiler/page (251).png',
    'books/sahnenin disindakiler/page (252).png',
    'books/sahnenin disindakiler/page (253).png',
    'books/sahnenin disindakiler/page (254).png',
    'books/sahnenin disindakiler/page (255).png',
    'books/sahnenin disindakiler/page (256).png',
    'books/sahnenin disindakiler/page (257).png',
    'books/sahnenin disindakiler/page (258).png',
    'books/sahnenin disindakiler/page (259).png',
    'books/sahnenin disindakiler/page (260).png',
    'books/sahnenin disindakiler/page (261).png',
    'books/sahnenin disindakiler/page (262).png',
    'books/sahnenin disindakiler/page (263).png',
    'books/sahnenin disindakiler/page (264).png',
    'books/sahnenin disindakiler/page (265).png',
    'books/sahnenin disindakiler/page (266).png',
    'books/sahnenin disindakiler/page (267).png',
    'books/sahnenin disindakiler/page (268).png',
    'books/sahnenin disindakiler/page (269).png',
    'books/sahnenin disindakiler/page (270).png',
    'books/sahnenin disindakiler/page (271).png',
    'books/sahnenin disindakiler/page (272).png',
    'books/sahnenin disindakiler/page (273).png',
    'books/sahnenin disindakiler/page (274).png',
    'books/sahnenin disindakiler/page (275).png',
    'books/sahnenin disindakiler/page (276).png',
    'books/sahnenin disindakiler/page (277).png',
    'books/sahnenin disindakiler/page (278).png',
    'books/sahnenin disindakiler/page (279).png',
    'books/sahnenin disindakiler/page (280).png',
    'books/sahnenin disindakiler/page (281).png',
    'books/sahnenin disindakiler/page (282).png',
    'books/sahnenin disindakiler/page (283).png',
    'books/sahnenin disindakiler/page (284).png',
    'books/sahnenin disindakiler/page (285).png',
    'books/sahnenin disindakiler/page (286).png',
    'books/sahnenin disindakiler/page (287).png',
    'books/sahnenin disindakiler/page (288).png',
    'books/sahnenin disindakiler/page (289).png',
    'books/sahnenin disindakiler/page (290).png',
    'books/sahnenin disindakiler/page (291).png',
    'books/sahnenin disindakiler/page (292).png',
    'books/sahnenin disindakiler/page (293).png',
    'books/sahnenin disindakiler/page (294).png',
    'books/sahnenin disindakiler/page (295).png',
    'books/sahnenin disindakiler/page (296).png',
    'books/sahnenin disindakiler/page (297).png',
    'books/sahnenin disindakiler/page (298).png',
    'books/sahnenin disindakiler/page (299).png',
    'books/sahnenin disindakiler/page (300).png',
    'books/sahnenin disindakiler/page (301).png',
    'books/sahnenin disindakiler/page (302).png',
    'books/sahnenin disindakiler/page (303).png',
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
