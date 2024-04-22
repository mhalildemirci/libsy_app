import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class odysey extends StatefulWidget {
  const odysey({Key? key}) : super(key: key);

  @override
  State<odysey> createState() => _odyseyState();
}

class _odyseyState extends State<odysey> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/odysey/page (1).png',
    'books/odysey/page (2).png',
    'books/odysey/page (3).png',
    'books/odysey/page (4).png',
    'books/odysey/page (5).png',
    'books/odysey/page (6).png',
    'books/odysey/page (7).png',
    'books/odysey/page (8).png',
    'books/odysey/page (9).png',
    'books/odysey/page (10).png',
    'books/odysey/page (11).png',
    'books/odysey/page (12).png',
    'books/odysey/page (13).png',
    'books/odysey/page (14).png',
    'books/odysey/page (15).png',
    'books/odysey/page (16).png',
    'books/odysey/page (17).png',
    'books/odysey/page (18).png',
    'books/odysey/page (19).png',
    'books/odysey/page (20).png',
    'books/odysey/page (21).png',
    'books/odysey/page (22).png',
    'books/odysey/page (23).png',
    'books/odysey/page (24).png',
    'books/odysey/page (25).png',
    'books/odysey/page (26).png',
    'books/odysey/page (27).png',
    'books/odysey/page (28).png',
    'books/odysey/page (29).png',
    'books/odysey/page (30).png',
    'books/odysey/page (31).png',
    'books/odysey/page (32).png',
    'books/odysey/page (33).png',
    'books/odysey/page (34).png',
    'books/odysey/page (35).png',
    'books/odysey/page (36).png',
    'books/odysey/page (37).png',
    'books/odysey/page (38).png',
    'books/odysey/page (39).png',
    'books/odysey/page (40).png',
    'books/odysey/page (41).png',
    'books/odysey/page (42).png',
    'books/odysey/page (43).png',
    'books/odysey/page (44).png',
    'books/odysey/page (45).png',
    'books/odysey/page (46).png',
    'books/odysey/page (47).png',
    'books/odysey/page (48).png',
    'books/odysey/page (49).png',
    'books/odysey/page (50).png',
    'books/odysey/page (51).png',
    'books/odysey/page (52).png',
    'books/odysey/page (53).png',
    'books/odysey/page (54).png',
    'books/odysey/page (55).png',
    'books/odysey/page (56).png',
    'books/odysey/page (57).png',
    'books/odysey/page (58).png',
    'books/odysey/page (59).png',
    'books/odysey/page (60).png',
    'books/odysey/page (61).png',
    'books/odysey/page (62).png',
    'books/odysey/page (63).png',
    'books/odysey/page (64).png',
    'books/odysey/page (65).png',
    'books/odysey/page (66).png',
    'books/odysey/page (67).png',
    'books/odysey/page (68).png',
    'books/odysey/page (69).png',
    'books/odysey/page (70).png',
    'books/odysey/page (71).png',
    'books/odysey/page (72).png',
    'books/odysey/page (73).png',
    'books/odysey/page (74).png',
    'books/odysey/page (75).png',
    'books/odysey/page (76).png',
    'books/odysey/page (77).png',
    'books/odysey/page (78).png',
    'books/odysey/page (79).png',
    'books/odysey/page (80).png',
    'books/odysey/page (81).png',
    'books/odysey/page (82).png',
    'books/odysey/page (83).png',
    'books/odysey/page (84).png',
    'books/odysey/page (85).png',
    'books/odysey/page (86).png',
    'books/odysey/page (87).png',
    'books/odysey/page (88).png',
    'books/odysey/page (89).png',
    'books/odysey/page (90).png',
    'books/odysey/page (91).png',
    'books/odysey/page (92).png',
    'books/odysey/page (93).png',
    'books/odysey/page (94).png',
    'books/odysey/page (95).png',
    'books/odysey/page (96).png',
    'books/odysey/page (97).png',
    'books/odysey/page (98).png',
    'books/odysey/page (99).png',
    'books/odysey/page (100).png',
    'books/odysey/page (101).png',
    'books/odysey/page (102).png',
    'books/odysey/page (103).png',
    'books/odysey/page (104).png',
    'books/odysey/page (105).png',
    'books/odysey/page (106).png',
    'books/odysey/page (107).png',
    'books/odysey/page (108).png',
    'books/odysey/page (109).png',
    'books/odysey/page (110).png',
    'books/odysey/page (111).png',
    'books/odysey/page (112).png',
    'books/odysey/page (113).png',
    'books/odysey/page (114).png',
    'books/odysey/page (115).png',
    'books/odysey/page (116).png',
    'books/odysey/page (117).png',
    'books/odysey/page (118).png',
    'books/odysey/page (119).png',
    'books/odysey/page (120).png',
    'books/odysey/page (121).png',
    'books/odysey/page (122).png',
    'books/odysey/page (123).png',
    'books/odysey/page (124).png',
    'books/odysey/page (125).png',
    'books/odysey/page (126).png',
    'books/odysey/page (127).png',
    'books/odysey/page (128).png',
    'books/odysey/page (129).png',
    'books/odysey/page (130).png',
    'books/odysey/page (131).png',
    'books/odysey/page (132).png',
    'books/odysey/page (133).png',
    'books/odysey/page (134).png',
    'books/odysey/page (135).png',
    'books/odysey/page (136).png',
    'books/odysey/page (137).png',
    'books/odysey/page (138).png',
    'books/odysey/page (139).png',
    'books/odysey/page (140).png',
    'books/odysey/page (141).png',
    'books/odysey/page (142).png',
    'books/odysey/page (143).png',
    'books/odysey/page (144).png',
    'books/odysey/page (145).png',
    'books/odysey/page (146).png',
    'books/odysey/page (147).png',
    'books/odysey/page (148).png',
    'books/odysey/page (149).png',
    'books/odysey/page (150).png',
    'books/odysey/page (151).png',
    'books/odysey/page (152).png',
    'books/odysey/page (153).png',
    'books/odysey/page (154).png',
    'books/odysey/page (155).png',
    'books/odysey/page (156).png',
    'books/odysey/page (157).png',
    'books/odysey/page (158).png',
    'books/odysey/page (159).png',
    'books/odysey/page (160).png',
    'books/odysey/page (161).png',
    'books/odysey/page (162).png',
    'books/odysey/page (163).png',
    'books/odysey/page (164).png',
    'books/odysey/page (165).png',
    'books/odysey/page (166).png',
    'books/odysey/page (167).png',
    'books/odysey/page (168).png',
    'books/odysey/page (169).png',
    'books/odysey/page (170).png',
    'books/odysey/page (171).png',
    'books/odysey/page (172).png',
    'books/odysey/page (173).png',
    'books/odysey/page (174).png',
    'books/odysey/page (175).png',
    'books/odysey/page (176).png',
    'books/odysey/page (177).png',
    'books/odysey/page (178).png',
    'books/odysey/page (179).png',
    'books/odysey/page (180).png',
    'books/odysey/page (181).png',
    'books/odysey/page (182).png',
    'books/odysey/page (183).png',
    'books/odysey/page (184).png',
    'books/odysey/page (185).png',
    'books/odysey/page (186).png',
    'books/odysey/page (187).png',
    'books/odysey/page (188).png',
    'books/odysey/page (189).png',
    'books/odysey/page (190).png',
    'books/odysey/page (191).png',
    'books/odysey/page (192).png',
    'books/odysey/page (193).png',
    'books/odysey/page (194).png',
    'books/odysey/page (195).png',
    'books/odysey/page (196).png',
    'books/odysey/page (197).png',
    'books/odysey/page (198).png',
    'books/odysey/page (199).png',
    'books/odysey/page (200).png',
    'books/odysey/page (201).png',
    'books/odysey/page (202).png',
    'books/odysey/page (203).png',
    'books/odysey/page (204).png',
    'books/odysey/page (205).png',
    'books/odysey/page (206).png',
    'books/odysey/page (207).png',
    'books/odysey/page (208).png',
    'books/odysey/page (209).png',
    'books/odysey/page (210).png',
    'books/odysey/page (211).png',
    'books/odysey/page (212).png',
    'books/odysey/page (213).png',
    'books/odysey/page (214).png',
    'books/odysey/page (215).png',
    'books/odysey/page (216).png',
    'books/odysey/page (217).png',
    'books/odysey/page (218).png',
    'books/odysey/page (219).png',
    'books/odysey/page (220).png',
    'books/odysey/page (221).png',
    'books/odysey/page (222).png',
    'books/odysey/page (223).png',
    'books/odysey/page (224).png',
    'books/odysey/page (225).png',
    'books/odysey/page (226).png',
    'books/odysey/page (227).png',
    'books/odysey/page (228).png',
    'books/odysey/page (229).png',
    'books/odysey/page (230).png',
    'books/odysey/page (231).png',
    'books/odysey/page (232).png',
    'books/odysey/page (233).png',
    'books/odysey/page (234).png',
    'books/odysey/page (235).png',
    'books/odysey/page (236).png',
    'books/odysey/page (237).png',
    'books/odysey/page (238).png',
    'books/odysey/page (239).png',
    'books/odysey/page (240).png',
    'books/odysey/page (241).png',
    'books/odysey/page (242).png',
    'books/odysey/page (243).png',
    'books/odysey/page (244).png',
    'books/odysey/page (245).png',
    'books/odysey/page (246).png',
    'books/odysey/page (247).png',
    'books/odysey/page (248).png',
    'books/odysey/page (249).png',
    'books/odysey/page (250).png',
    'books/odysey/page (251).png',
    'books/odysey/page (252).png',
    'books/odysey/page (253).png',
    'books/odysey/page (254).png',
    'books/odysey/page (255).png',
    'books/odysey/page (256).png',
    'books/odysey/page (257).png',
    'books/odysey/page (258).png',
    'books/odysey/page (259).png',
    'books/odysey/page (260).png',
    'books/odysey/page (261).png',
    'books/odysey/page (262).png',
    'books/odysey/page (263).png',
    'books/odysey/page (264).png',
    'books/odysey/page (265).png',
    'books/odysey/page (266).png',
    'books/odysey/page (267).png',
    'books/odysey/page (268).png',
    'books/odysey/page (269).png',
    'books/odysey/page (270).png',
    'books/odysey/page (271).png',
    'books/odysey/page (272).png',
    'books/odysey/page (273).png',
    'books/odysey/page (274).png',
    'books/odysey/page (275).png',
    'books/odysey/page (276).png',
    'books/odysey/page (277).png',
    'books/odysey/page (278).png',
    'books/odysey/page (279).png',
    'books/odysey/page (280).png',
    'books/odysey/page (281).png',
    'books/odysey/page (282).png',
    'books/odysey/page (283).png',
    'books/odysey/page (284).png',
    'books/odysey/page (285).png',
    'books/odysey/page (286).png',
    'books/odysey/page (287).png',
    'books/odysey/page (288).png',

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
