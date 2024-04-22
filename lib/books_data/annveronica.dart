import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class annveronica extends StatefulWidget {
  const annveronica({Key? key}) : super(key: key);

  @override
  State<annveronica> createState() => _annveronicaState();
}

class _annveronicaState extends State<annveronica> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Ann Veronica/page (1).png',
    'books/Ann Veronica/page (2).png',
    'books/Ann Veronica/page (3).png',
    'books/Ann Veronica/page (4).png',
    'books/Ann Veronica/page (5).png',
    'books/Ann Veronica/page (6).png',
    'books/Ann Veronica/page (7).png',
    'books/Ann Veronica/page (8).png',
    'books/Ann Veronica/page (9).png',
    'books/Ann Veronica/page (10).png',
    'books/Ann Veronica/page (11).png',
    'books/Ann Veronica/page (12).png',
    'books/Ann Veronica/page (13).png',
    'books/Ann Veronica/page (14).png',
    'books/Ann Veronica/page (15).png',
    'books/Ann Veronica/page (16).png',
    'books/Ann Veronica/page (17).png',
    'books/Ann Veronica/page (18).png',
    'books/Ann Veronica/page (19).png',
    'books/Ann Veronica/page (20).png',
    'books/Ann Veronica/page (21).png',
    'books/Ann Veronica/page (22).png',
    'books/Ann Veronica/page (23).png',
    'books/Ann Veronica/page (24).png',
    'books/Ann Veronica/page (25).png',
    'books/Ann Veronica/page (26).png',
    'books/Ann Veronica/page (27).png',
    'books/Ann Veronica/page (28).png',
    'books/Ann Veronica/page (29).png',
    'books/Ann Veronica/page (30).png',
    'books/Ann Veronica/page (31).png',
    'books/Ann Veronica/page (32).png',
    'books/Ann Veronica/page (33).png',
    'books/Ann Veronica/page (34).png',
    'books/Ann Veronica/page (35).png',
    'books/Ann Veronica/page (36).png',
    'books/Ann Veronica/page (37).png',
    'books/Ann Veronica/page (38).png',
    'books/Ann Veronica/page (39).png',
    'books/Ann Veronica/page (40).png',
    'books/Ann Veronica/page (41).png',
    'books/Ann Veronica/page (42).png',
    'books/Ann Veronica/page (43).png',
    'books/Ann Veronica/page (44).png',
    'books/Ann Veronica/page (45).png',
    'books/Ann Veronica/page (46).png',
    'books/Ann Veronica/page (47).png',
    'books/Ann Veronica/page (48).png',
    'books/Ann Veronica/page (49).png',
    'books/Ann Veronica/page (50).png',
    'books/Ann Veronica/page (51).png',
    'books/Ann Veronica/page (52).png',
    'books/Ann Veronica/page (53).png',
    'books/Ann Veronica/page (54).png',
    'books/Ann Veronica/page (55).png',
    'books/Ann Veronica/page (56).png',
    'books/Ann Veronica/page (57).png',
    'books/Ann Veronica/page (58).png',
    'books/Ann Veronica/page (59).png',
    'books/Ann Veronica/page (60).png',
    'books/Ann Veronica/page (61).png',
    'books/Ann Veronica/page (62).png',
    'books/Ann Veronica/page (63).png',
    'books/Ann Veronica/page (64).png',
    'books/Ann Veronica/page (65).png',
    'books/Ann Veronica/page (66).png',
    'books/Ann Veronica/page (67).png',
    'books/Ann Veronica/page (68).png',
    'books/Ann Veronica/page (69).png',
    'books/Ann Veronica/page (70).png',
    'books/Ann Veronica/page (71).png',
    'books/Ann Veronica/page (72).png',
    'books/Ann Veronica/page (73).png',
    'books/Ann Veronica/page (74).png',
    'books/Ann Veronica/page (75).png',
    'books/Ann Veronica/page (76).png',
    'books/Ann Veronica/page (77).png',
    'books/Ann Veronica/page (78).png',
    'books/Ann Veronica/page (79).png',
    'books/Ann Veronica/page (80).png',
    'books/Ann Veronica/page (81).png',
    'books/Ann Veronica/page (82).png',
    'books/Ann Veronica/page (83).png',
    'books/Ann Veronica/page (84).png',
    'books/Ann Veronica/page (85).png',
    'books/Ann Veronica/page (86).png',
    'books/Ann Veronica/page (87).png',
    'books/Ann Veronica/page (88).png',
    'books/Ann Veronica/page (89).png',
    'books/Ann Veronica/page (90).png',
    'books/Ann Veronica/page (91).png',
    'books/Ann Veronica/page (92).png',
    'books/Ann Veronica/page (93).png',
    'books/Ann Veronica/page (94).png',
    'books/Ann Veronica/page (95).png',
    'books/Ann Veronica/page (96).png',
    'books/Ann Veronica/page (97).png',
    'books/Ann Veronica/page (98).png',
    'books/Ann Veronica/page (99).png',
    'books/Ann Veronica/page (100).png',
    'books/Ann Veronica/page (101).png',
    'books/Ann Veronica/page (102).png',
    'books/Ann Veronica/page (103).png',
    'books/Ann Veronica/page (104).png',
    'books/Ann Veronica/page (105).png',
    'books/Ann Veronica/page (106).png',
    'books/Ann Veronica/page (107).png',
    'books/Ann Veronica/page (108).png',
    'books/Ann Veronica/page (109).png',
    'books/Ann Veronica/page (110).png',
    'books/Ann Veronica/page (111).png',
    'books/Ann Veronica/page (112).png',
    'books/Ann Veronica/page (113).png',
    'books/Ann Veronica/page (114).png',
    'books/Ann Veronica/page (115).png',
    'books/Ann Veronica/page (116).png',
    'books/Ann Veronica/page (117).png',
    'books/Ann Veronica/page (118).png',
    'books/Ann Veronica/page (119).png',
    'books/Ann Veronica/page (120).png',
    'books/Ann Veronica/page (121).png',
    'books/Ann Veronica/page (122).png',
    'books/Ann Veronica/page (123).png',
    'books/Ann Veronica/page (124).png',
    'books/Ann Veronica/page (125).png',
    'books/Ann Veronica/page (126).png',
    'books/Ann Veronica/page (127).png',
    'books/Ann Veronica/page (128).png',
    'books/Ann Veronica/page (129).png',
    'books/Ann Veronica/page (130).png',
    'books/Ann Veronica/page (131).png',
    'books/Ann Veronica/page (132).png',
    'books/Ann Veronica/page (133).png',
    'books/Ann Veronica/page (134).png',
    'books/Ann Veronica/page (135).png',
    'books/Ann Veronica/page (136).png',
    'books/Ann Veronica/page (137).png',
    'books/Ann Veronica/page (138).png',
    'books/Ann Veronica/page (139).png',
    'books/Ann Veronica/page (140).png',
    'books/Ann Veronica/page (141).png',
    'books/Ann Veronica/page (142).png',
    'books/Ann Veronica/page (143).png',
    'books/Ann Veronica/page (144).png',
    'books/Ann Veronica/page (145).png',
    'books/Ann Veronica/page (146).png',
    'books/Ann Veronica/page (147).png',
    'books/Ann Veronica/page (148).png',
    'books/Ann Veronica/page (149).png',
    'books/Ann Veronica/page (150).png',
    'books/Ann Veronica/page (151).png',
    'books/Ann Veronica/page (152).png',
    'books/Ann Veronica/page (153).png',
    'books/Ann Veronica/page (154).png',
    'books/Ann Veronica/page (155).png',
    'books/Ann Veronica/page (156).png',
    'books/Ann Veronica/page (157).png',
    'books/Ann Veronica/page (158).png',
    'books/Ann Veronica/page (159).png',
    'books/Ann Veronica/page (160).png',
    'books/Ann Veronica/page (161).png',
    'books/Ann Veronica/page (162).png',
    'books/Ann Veronica/page (163).png',
    'books/Ann Veronica/page (164).png',
    'books/Ann Veronica/page (165).png',
    'books/Ann Veronica/page (166).png',
    'books/Ann Veronica/page (167).png',
    'books/Ann Veronica/page (168).png',
    'books/Ann Veronica/page (169).png',
    'books/Ann Veronica/page (170).png',
    'books/Ann Veronica/page (171).png',
    'books/Ann Veronica/page (172).png',
    'books/Ann Veronica/page (173).png',
    'books/Ann Veronica/page (174).png',
    'books/Ann Veronica/page (175).png',
    'books/Ann Veronica/page (176).png',
    'books/Ann Veronica/page (177).png',
    'books/Ann Veronica/page (178).png',
    'books/Ann Veronica/page (179).png',
    'books/Ann Veronica/page (180).png',
    'books/Ann Veronica/page (181).png',
    'books/Ann Veronica/page (182).png',
    'books/Ann Veronica/page (183).png',
    'books/Ann Veronica/page (184).png',
    'books/Ann Veronica/page (185).png',
    'books/Ann Veronica/page (186).png',
    'books/Ann Veronica/page (187).png',
    'books/Ann Veronica/page (188).png',
    'books/Ann Veronica/page (189).png',
    'books/Ann Veronica/page (190).png',
    'books/Ann Veronica/page (191).png',
    'books/Ann Veronica/page (192).png',
    'books/Ann Veronica/page (193).png',
    'books/Ann Veronica/page (194).png',
    'books/Ann Veronica/page (195).png',
    'books/Ann Veronica/page (196).png',
    'books/Ann Veronica/page (197).png',
    'books/Ann Veronica/page (198).png',
    'books/Ann Veronica/page (199).png',
    'books/Ann Veronica/page (200).png',
    'books/Ann Veronica/page (201).png',
    'books/Ann Veronica/page (202).png',
    'books/Ann Veronica/page (203).png',
    'books/Ann Veronica/page (204).png',
    'books/Ann Veronica/page (205).png',
    'books/Ann Veronica/page (206).png',
    'books/Ann Veronica/page (207).png',
    'books/Ann Veronica/page (208).png',
    'books/Ann Veronica/page (209).png',
    'books/Ann Veronica/page (210).png',
    'books/Ann Veronica/page (211).png',
    'books/Ann Veronica/page (212).png',
    'books/Ann Veronica/page (213).png',
    'books/Ann Veronica/page (214).png',
    'books/Ann Veronica/page (215).png',
    'books/Ann Veronica/page (216).png',
    'books/Ann Veronica/page (217).png',
    'books/Ann Veronica/page (218).png',
    'books/Ann Veronica/page (219).png',
    'books/Ann Veronica/page (220).png',
    'books/Ann Veronica/page (221).png',
    'books/Ann Veronica/page (222).png',
    'books/Ann Veronica/page (223).png',
    'books/Ann Veronica/page (224).png',
    'books/Ann Veronica/page (225).png',
    'books/Ann Veronica/page (226).png',
    'books/Ann Veronica/page (227).png',
    'books/Ann Veronica/page (228).png',
    'books/Ann Veronica/page (229).png',
    'books/Ann Veronica/page (230).png',
    'books/Ann Veronica/page (231).png',
    'books/Ann Veronica/page (232).png',
    'books/Ann Veronica/page (233).png',
    'books/Ann Veronica/page (234).png',
    'books/Ann Veronica/page (235).png',
    'books/Ann Veronica/page (236).png',
    'books/Ann Veronica/page (237).png',
    'books/Ann Veronica/page (238).png',
    'books/Ann Veronica/page (239).png',
    'books/Ann Veronica/page (240).png',
    'books/Ann Veronica/page (241).png',
    'books/Ann Veronica/page (242).png',
    'books/Ann Veronica/page (243).png',
    'books/Ann Veronica/page (244).png',
    'books/Ann Veronica/page (245).png',
    'books/Ann Veronica/page (246).png',
    'books/Ann Veronica/page (247).png',
    'books/Ann Veronica/page (248).png',
    'books/Ann Veronica/page (249).png',
    'books/Ann Veronica/page (250).png',
    'books/Ann Veronica/page (251).png',
    'books/Ann Veronica/page (252).png',
    'books/Ann Veronica/page (253).png',
    'books/Ann Veronica/page (254).png',
    'books/Ann Veronica/page (255).png',
    'books/Ann Veronica/page (256).png',
    'books/Ann Veronica/page (257).png',
    'books/Ann Veronica/page (258).png',
    'books/Ann Veronica/page (259).png',
    'books/Ann Veronica/page (260).png',
    'books/Ann Veronica/page (261).png',
    'books/Ann Veronica/page (262).png',
    'books/Ann Veronica/page (263).png',
    'books/Ann Veronica/page (264).png',
    'books/Ann Veronica/page (265).png',
    'books/Ann Veronica/page (266).png',
    'books/Ann Veronica/page (267).png',
    'books/Ann Veronica/page (268).png',
    'books/Ann Veronica/page (269).png',
    'books/Ann Veronica/page (270).png',
    'books/Ann Veronica/page (271).png',
    'books/Ann Veronica/page (272).png',
    'books/Ann Veronica/page (273).png',
    'books/Ann Veronica/page (274).png',
    'books/Ann Veronica/page (275).png',
    'books/Ann Veronica/page (276).png',
    'books/Ann Veronica/page (277).png',
    'books/Ann Veronica/page (278).png',
    'books/Ann Veronica/page (279).png',
    'books/Ann Veronica/page (280).png',
    'books/Ann Veronica/page (281).png',
    'books/Ann Veronica/page (282).png',
    'books/Ann Veronica/page (283).png',
    'books/Ann Veronica/page (284).png',
    'books/Ann Veronica/page (285).png',
    'books/Ann Veronica/page (286).png',
    'books/Ann Veronica/page (287).png',
    'books/Ann Veronica/page (288).png',
    'books/Ann Veronica/page (289).png',
    'books/Ann Veronica/page (290).png',
    'books/Ann Veronica/page (291).png',
    'books/Ann Veronica/page (292).png',
    'books/Ann Veronica/page (293).png',
    'books/Ann Veronica/page (294).png',
    'books/Ann Veronica/page (295).png',
    'books/Ann Veronica/page (296).png',
    'books/Ann Veronica/page (297).png',
    'books/Ann Veronica/page (298).png',
    'books/Ann Veronica/page (299).png',
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
          body: Image.network(
            snapshot.data!,
            fit: BoxFit.cover,
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
