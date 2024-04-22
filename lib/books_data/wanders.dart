import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wanders extends StatefulWidget {
  const wanders({Key? key}) : super(key: key);

  @override
  State<wanders> createState() => _wandersState();
}

class _wandersState extends State<wanders> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/wanders/page (1).png',
    'books/wanders/page (2).png',
    'books/wanders/page (3).png',
    'books/wanders/page (4).png',
    'books/wanders/page (5).png',
    'books/wanders/page (6).png',
    'books/wanders/page (7).png',
    'books/wanders/page (8).png',
    'books/wanders/page (9).png',
    'books/wanders/page (10).png',
    'books/wanders/page (11).png',
    'books/wanders/page (12).png',
    'books/wanders/page (13).png',
    'books/wanders/page (14).png',
    'books/wanders/page (15).png',
    'books/wanders/page (16).png',
    'books/wanders/page (17).png',
    'books/wanders/page (18).png',
    'books/wanders/page (19).png',
    'books/wanders/page (20).png',
    'books/wanders/page (21).png',
    'books/wanders/page (22).png',
    'books/wanders/page (23).png',
    'books/wanders/page (24).png',
    'books/wanders/page (25).png',
    'books/wanders/page (26).png',
    'books/wanders/page (27).png',
    'books/wanders/page (28).png',
    'books/wanders/page (29).png',
    'books/wanders/page (30).png',
    'books/wanders/page (31).png',
    'books/wanders/page (32).png',
    'books/wanders/page (33).png',
    'books/wanders/page (34).png',
    'books/wanders/page (35).png',
    'books/wanders/page (36).png',
    'books/wanders/page (37).png',
    'books/wanders/page (38).png',
    'books/wanders/page (39).png',
    'books/wanders/page (40).png',
    'books/wanders/page (41).png',
    'books/wanders/page (42).png',
    'books/wanders/page (43).png',
    'books/wanders/page (44).png',
    'books/wanders/page (45).png',
    'books/wanders/page (46).png',
    'books/wanders/page (47).png',
    'books/wanders/page (48).png',
    'books/wanders/page (49).png',
    'books/wanders/page (50).png',
    'books/wanders/page (51).png',
    'books/wanders/page (52).png',
    'books/wanders/page (53).png',
    'books/wanders/page (54).png',
    'books/wanders/page (55).png',
    'books/wanders/page (56).png',
    'books/wanders/page (57).png',
    'books/wanders/page (58).png',
    'books/wanders/page (59).png',
    'books/wanders/page (60).png',
    'books/wanders/page (61).png',
    'books/wanders/page (62).png',
    'books/wanders/page (63).png',
    'books/wanders/page (64).png',
    'books/wanders/page (65).png',
    'books/wanders/page (66).png',
    'books/wanders/page (67).png',
    'books/wanders/page (68).png',
    'books/wanders/page (69).png',
    'books/wanders/page (70).png',
    'books/wanders/page (71).png',
    'books/wanders/page (72).png',
    'books/wanders/page (73).png',
    'books/wanders/page (74).png',
    'books/wanders/page (75).png',
    'books/wanders/page (76).png',
    'books/wanders/page (77).png',
    'books/wanders/page (78).png',
    'books/wanders/page (79).png',
    'books/wanders/page (80).png',
    'books/wanders/page (81).png',
    'books/wanders/page (82).png',
    'books/wanders/page (83).png',
    'books/wanders/page (84).png',
    'books/wanders/page (85).png',
    'books/wanders/page (86).png',
    'books/wanders/page (87).png',
    'books/wanders/page (88).png',
    'books/wanders/page (89).png',
    'books/wanders/page (90).png',
    'books/wanders/page (91).png',
    'books/wanders/page (92).png',
    'books/wanders/page (93).png',
    'books/wanders/page (94).png',
    'books/wanders/page (95).png',
    'books/wanders/page (96).png',
    'books/wanders/page (97).png',
    'books/wanders/page (98).png',
    'books/wanders/page (99).png',
    'books/wanders/page (100).png',
    'books/wanders/page (101).png',
    'books/wanders/page (102).png',
    'books/wanders/page (103).png',
    'books/wanders/page (104).png',
    'books/wanders/page (105).png',
    'books/wanders/page (106).png',
    'books/wanders/page (107).png',
    'books/wanders/page (108).png',
    'books/wanders/page (109).png',
    'books/wanders/page (110).png',
    'books/wanders/page (111).png',
    'books/wanders/page (112).png',
    'books/wanders/page (113).png',
    'books/wanders/page (114).png',
    'books/wanders/page (115).png',
    'books/wanders/page (116).png',
    'books/wanders/page (117).png',
    'books/wanders/page (118).png',
    'books/wanders/page (119).png',
    'books/wanders/page (120).png',
    'books/wanders/page (121).png',
    'books/wanders/page (122).png',
    'books/wanders/page (123).png',
    'books/wanders/page (124).png',
    'books/wanders/page (125).png',
    'books/wanders/page (126).png',
    'books/wanders/page (127).png',
    'books/wanders/page (128).png',
    'books/wanders/page (129).png',
    'books/wanders/page (130).png',
    'books/wanders/page (131).png',
    'books/wanders/page (132).png',
    'books/wanders/page (133).png',
    'books/wanders/page (134).png',
    'books/wanders/page (135).png',
    'books/wanders/page (136).png',
    'books/wanders/page (137).png',
    'books/wanders/page (138).png',
    'books/wanders/page (139).png',
    'books/wanders/page (140).png',
    'books/wanders/page (141).png',
    'books/wanders/page (142).png',
    'books/wanders/page (143).png',
    'books/wanders/page (144).png',
    'books/wanders/page (145).png',
    'books/wanders/page (146).png',
    'books/wanders/page (147).png',
    'books/wanders/page (148).png',
    'books/wanders/page (149).png',
    'books/wanders/page (150).png',
    'books/wanders/page (151).png',
    'books/wanders/page (152).png',
    'books/wanders/page (153).png',
    'books/wanders/page (154).png',
    'books/wanders/page (155).png',
    'books/wanders/page (156).png',
    'books/wanders/page (157).png',
    'books/wanders/page (158).png',
    'books/wanders/page (159).png',
    'books/wanders/page (160).png',
    'books/wanders/page (161).png',
    'books/wanders/page (162).png',
    'books/wanders/page (163).png',
    'books/wanders/page (164).png',
    'books/wanders/page (165).png',
    'books/wanders/page (166).png',
    'books/wanders/page (167).png',
    'books/wanders/page (168).png',
    'books/wanders/page (169).png',
    'books/wanders/page (170).png',
    'books/wanders/page (171).png',
    'books/wanders/page (172).png',
    'books/wanders/page (173).png',
    'books/wanders/page (174).png',
    'books/wanders/page (175).png',
    'books/wanders/page (176).png',
    'books/wanders/page (177).png',
    'books/wanders/page (178).png',
    'books/wanders/page (179).png',
    'books/wanders/page (180).png',
    'books/wanders/page (181).png',
    'books/wanders/page (182).png',
    'books/wanders/page (183).png',
    'books/wanders/page (184).png',
    'books/wanders/page (185).png',
    'books/wanders/page (186).png',
    'books/wanders/page (187).png',
    'books/wanders/page (188).png',
    'books/wanders/page (189).png',
    'books/wanders/page (190).png',
    'books/wanders/page (191).png',
    'books/wanders/page (192).png',
    'books/wanders/page (193).png',
    'books/wanders/page (194).png',
    'books/wanders/page (195).png',
    'books/wanders/page (196).png',
    'books/wanders/page (197).png',
    'books/wanders/page (198).png',
    'books/wanders/page (199).png',
    'books/wanders/page (200).png',
    'books/wanders/page (201).png',
    'books/wanders/page (202).png',
    'books/wanders/page (203).png',
    'books/wanders/page (204).png',
    'books/wanders/page (205).png',
    'books/wanders/page (206).png',
    'books/wanders/page (207).png',
    'books/wanders/page (208).png',
    'books/wanders/page (209).png',
    'books/wanders/page (210).png',
    'books/wanders/page (211).png',
    'books/wanders/page (212).png',
    'books/wanders/page (213).png',
    'books/wanders/page (214).png',
    'books/wanders/page (215).png',
    'books/wanders/page (216).png',
    'books/wanders/page (217).png',
    'books/wanders/page (218).png',
    'books/wanders/page (219).png',
    'books/wanders/page (220).png',
    'books/wanders/page (221).png',
    'books/wanders/page (222).png',
    'books/wanders/page (223).png',
    'books/wanders/page (224).png',
    'books/wanders/page (225).png',
    'books/wanders/page (226).png',
    'books/wanders/page (227).png',
    'books/wanders/page (228).png',
    'books/wanders/page (229).png',
    'books/wanders/page (230).png',
    'books/wanders/page (231).png',
    'books/wanders/page (232).png',
    'books/wanders/page (233).png',
    'books/wanders/page (234).png',
    'books/wanders/page (235).png',
    'books/wanders/page (236).png',
    'books/wanders/page (237).png',
    'books/wanders/page (238).png',
    'books/wanders/page (239).png',
    'books/wanders/page (240).png',
    'books/wanders/page (241).png',
    'books/wanders/page (242).png',
    'books/wanders/page (243).png',
    'books/wanders/page (244).png',
    'books/wanders/page (245).png',
    'books/wanders/page (246).png',
    'books/wanders/page (247).png',
    'books/wanders/page (248).png',
    'books/wanders/page (249).png',
    'books/wanders/page (250).png',
    'books/wanders/page (251).png',
    'books/wanders/page (252).png',
    'books/wanders/page (253).png',
    'books/wanders/page (254).png',
    'books/wanders/page (255).png',
    'books/wanders/page (256).png',
    'books/wanders/page (257).png',
    'books/wanders/page (258).png',
    'books/wanders/page (259).png',
    'books/wanders/page (260).png',
    'books/wanders/page (261).png',
    'books/wanders/page (262).png',
    'books/wanders/page (263).png',
    'books/wanders/page (264).png',
    'books/wanders/page (265).png',
    'books/wanders/page (266).png',
    'books/wanders/page (267).png',
    'books/wanders/page (268).png',
    'books/wanders/page (269).png',
    'books/wanders/page (270).png',
    'books/wanders/page (271).png',
    'books/wanders/page (272).png',
    'books/wanders/page (273).png',
    'books/wanders/page (274).png',
    'books/wanders/page (275).png',
    'books/wanders/page (276).png',
    'books/wanders/page (277).png',
    'books/wanders/page (278).png',
    'books/wanders/page (279).png',
    'books/wanders/page (280).png',
    'books/wanders/page (281).png',
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
