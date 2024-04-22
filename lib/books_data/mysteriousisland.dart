import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mysteriousisland extends StatefulWidget {
  const mysteriousisland({Key? key}) : super(key: key);

  @override
  State<mysteriousisland> createState() => _mysteriousislandState();
}

class _mysteriousislandState extends State<mysteriousisland> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mysterious island/page (1).png',
    'books/mysterious island/page (2).png',
    'books/mysterious island/page (3).png',
    'books/mysterious island/page (4).png',
    'books/mysterious island/page (5).png',
    'books/mysterious island/page (6).png',
    'books/mysterious island/page (7).png',
    'books/mysterious island/page (8).png',
    'books/mysterious island/page (9).png',
    'books/mysterious island/page (10).png',
    'books/mysterious island/page (11).png',
    'books/mysterious island/page (12).png',
    'books/mysterious island/page (13).png',
    'books/mysterious island/page (14).png',
    'books/mysterious island/page (15).png',
    'books/mysterious island/page (16).png',
    'books/mysterious island/page (17).png',
    'books/mysterious island/page (18).png',
    'books/mysterious island/page (19).png',
    'books/mysterious island/page (20).png',
    'books/mysterious island/page (21).png',
    'books/mysterious island/page (22).png',
    'books/mysterious island/page (23).png',
    'books/mysterious island/page (24).png',
    'books/mysterious island/page (25).png',
    'books/mysterious island/page (26).png',
    'books/mysterious island/page (27).png',
    'books/mysterious island/page (28).png',
    'books/mysterious island/page (29).png',
    'books/mysterious island/page (30).png',
    'books/mysterious island/page (31).png',
    'books/mysterious island/page (32).png',
    'books/mysterious island/page (33).png',
    'books/mysterious island/page (34).png',
    'books/mysterious island/page (35).png',
    'books/mysterious island/page (36).png',
    'books/mysterious island/page (37).png',
    'books/mysterious island/page (38).png',
    'books/mysterious island/page (39).png',
    'books/mysterious island/page (40).png',
    'books/mysterious island/page (41).png',
    'books/mysterious island/page (42).png',
    'books/mysterious island/page (43).png',
    'books/mysterious island/page (44).png',
    'books/mysterious island/page (45).png',
    'books/mysterious island/page (46).png',
    'books/mysterious island/page (47).png',
    'books/mysterious island/page (48).png',
    'books/mysterious island/page (49).png',
    'books/mysterious island/page (50).png',
    'books/mysterious island/page (51).png',
    'books/mysterious island/page (52).png',
    'books/mysterious island/page (53).png',
    'books/mysterious island/page (54).png',
    'books/mysterious island/page (55).png',
    'books/mysterious island/page (56).png',
    'books/mysterious island/page (57).png',
    'books/mysterious island/page (58).png',
    'books/mysterious island/page (59).png',
    'books/mysterious island/page (60).png',
    'books/mysterious island/page (61).png',
    'books/mysterious island/page (62).png',
    'books/mysterious island/page (63).png',
    'books/mysterious island/page (64).png',
    'books/mysterious island/page (65).png',
    'books/mysterious island/page (66).png',
    'books/mysterious island/page (67).png',
    'books/mysterious island/page (68).png',
    'books/mysterious island/page (69).png',
    'books/mysterious island/page (70).png',
    'books/mysterious island/page (71).png',
    'books/mysterious island/page (72).png',
    'books/mysterious island/page (73).png',
    'books/mysterious island/page (74).png',
    'books/mysterious island/page (75).png',
    'books/mysterious island/page (76).png',
    'books/mysterious island/page (77).png',
    'books/mysterious island/page (78).png',
    'books/mysterious island/page (79).png',
    'books/mysterious island/page (80).png',
    'books/mysterious island/page (81).png',
    'books/mysterious island/page (82).png',
    'books/mysterious island/page (83).png',
    'books/mysterious island/page (84).png',
    'books/mysterious island/page (85).png',
    'books/mysterious island/page (86).png',
    'books/mysterious island/page (87).png',
    'books/mysterious island/page (88).png',
    'books/mysterious island/page (89).png',
    'books/mysterious island/page (90).png',
    'books/mysterious island/page (91).png',
    'books/mysterious island/page (92).png',
    'books/mysterious island/page (93).png',
    'books/mysterious island/page (94).png',
    'books/mysterious island/page (95).png',
    'books/mysterious island/page (96).png',
    'books/mysterious island/page (97).png',
    'books/mysterious island/page (98).png',
    'books/mysterious island/page (99).png',
    'books/mysterious island/page (100).png',
    'books/mysterious island/page (101).png',
    'books/mysterious island/page (102).png',
    'books/mysterious island/page (103).png',
    'books/mysterious island/page (104).png',
    'books/mysterious island/page (105).png',
    'books/mysterious island/page (106).png',
    'books/mysterious island/page (107).png',
    'books/mysterious island/page (108).png',
    'books/mysterious island/page (109).png',
    'books/mysterious island/page (110).png',
    'books/mysterious island/page (111).png',
    'books/mysterious island/page (112).png',
    'books/mysterious island/page (113).png',
    'books/mysterious island/page (114).png',
    'books/mysterious island/page (115).png',
    'books/mysterious island/page (116).png',
    'books/mysterious island/page (117).png',
    'books/mysterious island/page (118).png',
    'books/mysterious island/page (119).png',
    'books/mysterious island/page (120).png',
    'books/mysterious island/page (121).png',
    'books/mysterious island/page (122).png',
    'books/mysterious island/page (123).png',
    'books/mysterious island/page (124).png',
    'books/mysterious island/page (125).png',
    'books/mysterious island/page (126).png',
    'books/mysterious island/page (127).png',
    'books/mysterious island/page (128).png',
    'books/mysterious island/page (129).png',
    'books/mysterious island/page (130).png',
    'books/mysterious island/page (131).png',
    'books/mysterious island/page (132).png',
    'books/mysterious island/page (133).png',
    'books/mysterious island/page (134).png',
    'books/mysterious island/page (135).png',
    'books/mysterious island/page (136).png',
    'books/mysterious island/page (137).png',
    'books/mysterious island/page (138).png',
    'books/mysterious island/page (139).png',
    'books/mysterious island/page (140).png',
    'books/mysterious island/page (141).png',
    'books/mysterious island/page (142).png',
    'books/mysterious island/page (143).png',
    'books/mysterious island/page (144).png',
    'books/mysterious island/page (145).png',
    'books/mysterious island/page (146).png',
    'books/mysterious island/page (147).png',
    'books/mysterious island/page (148).png',
    'books/mysterious island/page (149).png',
    'books/mysterious island/page (150).png',
    'books/mysterious island/page (151).png',
    'books/mysterious island/page (152).png',
    'books/mysterious island/page (153).png',
    'books/mysterious island/page (154).png',
    'books/mysterious island/page (155).png',
    'books/mysterious island/page (156).png',
    'books/mysterious island/page (157).png',
    'books/mysterious island/page (158).png',
    'books/mysterious island/page (159).png',
    'books/mysterious island/page (160).png',
    'books/mysterious island/page (161).png',
    'books/mysterious island/page (162).png',
    'books/mysterious island/page (163).png',
    'books/mysterious island/page (164).png',
    'books/mysterious island/page (165).png',
    'books/mysterious island/page (166).png',
    'books/mysterious island/page (167).png',
    'books/mysterious island/page (168).png',
    'books/mysterious island/page (169).png',
    'books/mysterious island/page (170).png',
    'books/mysterious island/page (171).png',
    'books/mysterious island/page (172).png',
    'books/mysterious island/page (173).png',
    'books/mysterious island/page (174).png',
    'books/mysterious island/page (175).png',
    'books/mysterious island/page (176).png',
    'books/mysterious island/page (177).png',
    'books/mysterious island/page (178).png',
    'books/mysterious island/page (179).png',
    'books/mysterious island/page (180).png',
    'books/mysterious island/page (181).png',
    'books/mysterious island/page (182).png',
    'books/mysterious island/page (183).png',
    'books/mysterious island/page (184).png',
    'books/mysterious island/page (185).png',
    'books/mysterious island/page (186).png',
    'books/mysterious island/page (187).png',
    'books/mysterious island/page (188).png',
    'books/mysterious island/page (189).png',
    'books/mysterious island/page (190).png',
    'books/mysterious island/page (191).png',
    'books/mysterious island/page (192).png',
    'books/mysterious island/page (193).png',
    'books/mysterious island/page (194).png',
    'books/mysterious island/page (195).png',
    'books/mysterious island/page (196).png',
    'books/mysterious island/page (197).png',
    'books/mysterious island/page (198).png',
    'books/mysterious island/page (199).png',
    'books/mysterious island/page (200).png',
    'books/mysterious island/page (201).png',
    'books/mysterious island/page (202).png',
    'books/mysterious island/page (203).png',
    'books/mysterious island/page (204).png',
    'books/mysterious island/page (205).png',
    'books/mysterious island/page (206).png',
    'books/mysterious island/page (207).png',
    'books/mysterious island/page (208).png',
    'books/mysterious island/page (209).png',
    'books/mysterious island/page (210).png',
    'books/mysterious island/page (211).png',
    'books/mysterious island/page (212).png',
    'books/mysterious island/page (213).png',
    'books/mysterious island/page (214).png',
    'books/mysterious island/page (215).png',
    'books/mysterious island/page (216).png',
    'books/mysterious island/page (217).png',
    'books/mysterious island/page (218).png',
    'books/mysterious island/page (219).png',
    'books/mysterious island/page (220).png',
    'books/mysterious island/page (221).png',
    'books/mysterious island/page (222).png',
    'books/mysterious island/page (223).png',
    'books/mysterious island/page (224).png',
    'books/mysterious island/page (225).png',
    'books/mysterious island/page (226).png',
    'books/mysterious island/page (227).png',
    'books/mysterious island/page (228).png',
    'books/mysterious island/page (229).png',
    'books/mysterious island/page (230).png',
    'books/mysterious island/page (231).png',
    'books/mysterious island/page (232).png',
    'books/mysterious island/page (233).png',
    'books/mysterious island/page (234).png',
    'books/mysterious island/page (235).png',
    'books/mysterious island/page (236).png',
    'books/mysterious island/page (237).png',
    'books/mysterious island/page (238).png',
    'books/mysterious island/page (239).png',
    'books/mysterious island/page (240).png',
    'books/mysterious island/page (241).png',
    'books/mysterious island/page (242).png',
    'books/mysterious island/page (243).png',
    'books/mysterious island/page (244).png',
    'books/mysterious island/page (245).png',
    'books/mysterious island/page (246).png',
    'books/mysterious island/page (247).png',
    'books/mysterious island/page (248).png',
    'books/mysterious island/page (249).png',
    'books/mysterious island/page (250).png',
    'books/mysterious island/page (251).png',
    'books/mysterious island/page (252).png',
    'books/mysterious island/page (253).png',
    'books/mysterious island/page (254).png',
    'books/mysterious island/page (255).png',
    'books/mysterious island/page (256).png',
    'books/mysterious island/page (257).png',
    'books/mysterious island/page (258).png',
    'books/mysterious island/page (259).png',
    'books/mysterious island/page (260).png',
    'books/mysterious island/page (261).png',
    'books/mysterious island/page (262).png',
    'books/mysterious island/page (263).png',
    'books/mysterious island/page (264).png',
    'books/mysterious island/page (265).png',
    'books/mysterious island/page (266).png',
    'books/mysterious island/page (267).png',
    'books/mysterious island/page (268).png',
    'books/mysterious island/page (269).png',
    'books/mysterious island/page (270).png',
    'books/mysterious island/page (271).png',
    'books/mysterious island/page (272).png',
    'books/mysterious island/page (273).png',
    'books/mysterious island/page (274).png',
    'books/mysterious island/page (275).png',
    'books/mysterious island/page (276).png',
    'books/mysterious island/page (277).png',
    'books/mysterious island/page (278).png',
    'books/mysterious island/page (279).png',
    'books/mysterious island/page (280).png',
    'books/mysterious island/page (281).png',
    'books/mysterious island/page (282).png',
    'books/mysterious island/page (283).png',
    'books/mysterious island/page (284).png',
    'books/mysterious island/page (285).png',

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
