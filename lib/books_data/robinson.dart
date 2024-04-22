import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class robinson extends StatefulWidget {
  const robinson({Key? key}) : super(key: key);

  @override
  State<robinson> createState() => _robinsonState();
}

class _robinsonState extends State<robinson> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/robinson/page (1).png',
    'books/robinson/page (2).png',
    'books/robinson/page (3).png',
    'books/robinson/page (4).png',
    'books/robinson/page (5).png',
    'books/robinson/page (6).png',
    'books/robinson/page (7).png',
    'books/robinson/page (8).png',
    'books/robinson/page (9).png',
    'books/robinson/page (10).png',
    'books/robinson/page (11).png',
    'books/robinson/page (12).png',
    'books/robinson/page (13).png',
    'books/robinson/page (14).png',
    'books/robinson/page (15).png',
    'books/robinson/page (16).png',
    'books/robinson/page (17).png',
    'books/robinson/page (18).png',
    'books/robinson/page (19).png',
    'books/robinson/page (20).png',
    'books/robinson/page (21).png',
    'books/robinson/page (22).png',
    'books/robinson/page (23).png',
    'books/robinson/page (24).png',
    'books/robinson/page (25).png',
    'books/robinson/page (26).png',
    'books/robinson/page (27).png',
    'books/robinson/page (28).png',
    'books/robinson/page (29).png',
    'books/robinson/page (30).png',
    'books/robinson/page (31).png',
    'books/robinson/page (32).png',
    'books/robinson/page (33).png',
    'books/robinson/page (34).png',
    'books/robinson/page (35).png',
    'books/robinson/page (36).png',
    'books/robinson/page (37).png',
    'books/robinson/page (38).png',
    'books/robinson/page (39).png',
    'books/robinson/page (40).png',
    'books/robinson/page (41).png',
    'books/robinson/page (42).png',
    'books/robinson/page (43).png',
    'books/robinson/page (44).png',
    'books/robinson/page (45).png',
    'books/robinson/page (46).png',
    'books/robinson/page (47).png',
    'books/robinson/page (48).png',
    'books/robinson/page (49).png',
    'books/robinson/page (50).png',
    'books/robinson/page (51).png',
    'books/robinson/page (52).png',
    'books/robinson/page (53).png',
    'books/robinson/page (54).png',
    'books/robinson/page (55).png',
    'books/robinson/page (56).png',
    'books/robinson/page (57).png',
    'books/robinson/page (58).png',
    'books/robinson/page (59).png',
    'books/robinson/page (60).png',
    'books/robinson/page (61).png',
    'books/robinson/page (62).png',
    'books/robinson/page (63).png',
    'books/robinson/page (64).png',
    'books/robinson/page (65).png',
    'books/robinson/page (66).png',
    'books/robinson/page (67).png',
    'books/robinson/page (68).png',
    'books/robinson/page (69).png',
    'books/robinson/page (70).png',
    'books/robinson/page (71).png',
    'books/robinson/page (72).png',
    'books/robinson/page (73).png',
    'books/robinson/page (74).png',
    'books/robinson/page (75).png',
    'books/robinson/page (76).png',
    'books/robinson/page (77).png',
    'books/robinson/page (78).png',
    'books/robinson/page (79).png',
    'books/robinson/page (80).png',
    'books/robinson/page (81).png',
    'books/robinson/page (82).png',
    'books/robinson/page (83).png',
    'books/robinson/page (84).png',
    'books/robinson/page (85).png',
    'books/robinson/page (86).png',
    'books/robinson/page (87).png',
    'books/robinson/page (88).png',
    'books/robinson/page (89).png',
    'books/robinson/page (90).png',
    'books/robinson/page (91).png',
    'books/robinson/page (92).png',
    'books/robinson/page (93).png',
    'books/robinson/page (94).png',
    'books/robinson/page (95).png',
    'books/robinson/page (96).png',
    'books/robinson/page (97).png',
    'books/robinson/page (98).png',
    'books/robinson/page (99).png',
    'books/robinson/page (100).png',
    'books/robinson/page (101).png',
    'books/robinson/page (102).png',
    'books/robinson/page (103).png',
    'books/robinson/page (104).png',
    'books/robinson/page (105).png',
    'books/robinson/page (106).png',
    'books/robinson/page (107).png',
    'books/robinson/page (108).png',
    'books/robinson/page (109).png',
    'books/robinson/page (110).png',
    'books/robinson/page (111).png',
    'books/robinson/page (112).png',
    'books/robinson/page (113).png',
    'books/robinson/page (114).png',
    'books/robinson/page (115).png',
    'books/robinson/page (116).png',
    'books/robinson/page (117).png',
    'books/robinson/page (118).png',
    'books/robinson/page (119).png',
    'books/robinson/page (120).png',
    'books/robinson/page (121).png',
    'books/robinson/page (122).png',
    'books/robinson/page (123).png',
    'books/robinson/page (124).png',
    'books/robinson/page (125).png',
    'books/robinson/page (126).png',
    'books/robinson/page (127).png',
    'books/robinson/page (128).png',
    'books/robinson/page (129).png',
    'books/robinson/page (130).png',
    'books/robinson/page (131).png',
    'books/robinson/page (132).png',
    'books/robinson/page (133).png',
    'books/robinson/page (134).png',
    'books/robinson/page (135).png',
    'books/robinson/page (136).png',
    'books/robinson/page (137).png',
    'books/robinson/page (138).png',
    'books/robinson/page (139).png',
    'books/robinson/page (140).png',
    'books/robinson/page (141).png',
    'books/robinson/page (142).png',
    'books/robinson/page (143).png',
    'books/robinson/page (144).png',
    'books/robinson/page (145).png',
    'books/robinson/page (146).png',
    'books/robinson/page (147).png',
    'books/robinson/page (148).png',
    'books/robinson/page (149).png',
    'books/robinson/page (150).png',
    'books/robinson/page (151).png',
    'books/robinson/page (152).png',
    'books/robinson/page (153).png',
    'books/robinson/page (154).png',
    'books/robinson/page (155).png',
    'books/robinson/page (156).png',
    'books/robinson/page (157).png',
    'books/robinson/page (158).png',
    'books/robinson/page (159).png',
    'books/robinson/page (160).png',
    'books/robinson/page (161).png',
    'books/robinson/page (162).png',
    'books/robinson/page (163).png',
    'books/robinson/page (164).png',
    'books/robinson/page (165).png',
    'books/robinson/page (166).png',
    'books/robinson/page (167).png',
    'books/robinson/page (168).png',
    'books/robinson/page (169).png',
    'books/robinson/page (170).png',
    'books/robinson/page (171).png',
    'books/robinson/page (172).png',
    'books/robinson/page (173).png',
    'books/robinson/page (174).png',
    'books/robinson/page (175).png',
    'books/robinson/page (176).png',
    'books/robinson/page (177).png',
    'books/robinson/page (178).png',
    'books/robinson/page (179).png',
    'books/robinson/page (180).png',
    'books/robinson/page (181).png',
    'books/robinson/page (182).png',
    'books/robinson/page (183).png',
    'books/robinson/page (184).png',
    'books/robinson/page (185).png',
    'books/robinson/page (186).png',
    'books/robinson/page (187).png',
    'books/robinson/page (188).png',
    'books/robinson/page (189).png',
    'books/robinson/page (190).png',
    'books/robinson/page (191).png',
    'books/robinson/page (192).png',
    'books/robinson/page (193).png',
    'books/robinson/page (194).png',
    'books/robinson/page (195).png',
    'books/robinson/page (196).png',
    'books/robinson/page (197).png',
    'books/robinson/page (198).png',
    'books/robinson/page (199).png',
    'books/robinson/page (200).png',
    'books/robinson/page (201).png',
    'books/robinson/page (202).png',
    'books/robinson/page (203).png',
    'books/robinson/page (204).png',
    'books/robinson/page (205).png',
    'books/robinson/page (206).png',
    'books/robinson/page (207).png',
    'books/robinson/page (208).png',
    'books/robinson/page (209).png',
    'books/robinson/page (210).png',
    'books/robinson/page (211).png',
    'books/robinson/page (212).png',
    'books/robinson/page (213).png',
    'books/robinson/page (214).png',
    'books/robinson/page (215).png',
    'books/robinson/page (216).png',
    'books/robinson/page (217).png',
    'books/robinson/page (218).png',
    'books/robinson/page (219).png',
    'books/robinson/page (220).png',
    'books/robinson/page (221).png',
    'books/robinson/page (222).png',
    'books/robinson/page (223).png',
    'books/robinson/page (224).png',
    'books/robinson/page (225).png',
    'books/robinson/page (226).png',
    'books/robinson/page (227).png',
    'books/robinson/page (228).png',
    'books/robinson/page (229).png',
    'books/robinson/page (230).png',
    'books/robinson/page (231).png',
    'books/robinson/page (232).png',
    'books/robinson/page (233).png',
    'books/robinson/page (234).png',
    'books/robinson/page (235).png',
    'books/robinson/page (236).png',
    'books/robinson/page (237).png',
    'books/robinson/page (238).png',
    'books/robinson/page (239).png',
    'books/robinson/page (240).png',
    'books/robinson/page (241).png',
    'books/robinson/page (242).png',
    'books/robinson/page (243).png',
    'books/robinson/page (244).png',
    'books/robinson/page (245).png',
    'books/robinson/page (246).png',
    'books/robinson/page (247).png',
    'books/robinson/page (248).png',
    'books/robinson/page (249).png',
    'books/robinson/page (250).png',
    'books/robinson/page (251).png',
    'books/robinson/page (252).png',
    'books/robinson/page (253).png',
    'books/robinson/page (254).png',
    'books/robinson/page (255).png',
    'books/robinson/page (256).png',
    'books/robinson/page (257).png',
    'books/robinson/page (258).png',
    'books/robinson/page (259).png',
    'books/robinson/page (260).png',
    'books/robinson/page (261).png',
    'books/robinson/page (262).png',
    'books/robinson/page (263).png',
    'books/robinson/page (264).png',
    'books/robinson/page (265).png',
    'books/robinson/page (266).png',
    'books/robinson/page (267).png',
    'books/robinson/page (268).png',
    'books/robinson/page (269).png',
    'books/robinson/page (270).png',
    'books/robinson/page (271).png',
    'books/robinson/page (272).png',
    'books/robinson/page (273).png',
    'books/robinson/page (274).png',
    'books/robinson/page (275).png',
    'books/robinson/page (276).png',
    'books/robinson/page (277).png',
    'books/robinson/page (278).png',
    'books/robinson/page (279).png',
    'books/robinson/page (280).png',

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
