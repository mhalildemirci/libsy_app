import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class aeysha extends StatefulWidget {
  const aeysha({Key? key}) : super(key: key);

  @override
  State<aeysha> createState() => _aeyshaState();
}

class _aeyshaState extends State<aeysha> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Aeysha/page (1).png',
    'books/Aeysha/page (2).png',
    'books/Aeysha/page (3).png',
    'books/Aeysha/page (4).png',
    'books/Aeysha/page (5).png',
    'books/Aeysha/page (6).png',
    'books/Aeysha/page (7).png',
    'books/Aeysha/page (8).png',
    'books/Aeysha/page (9).png',
    'books/Aeysha/page (10).png',
    'books/Aeysha/page (11).png',
    'books/Aeysha/page (12).png',
    'books/Aeysha/page (13).png',
    'books/Aeysha/page (14).png',
    'books/Aeysha/page (15).png',
    'books/Aeysha/page (16).png',
    'books/Aeysha/page (17).png',
    'books/Aeysha/page (18).png',
    'books/Aeysha/page (19).png',
    'books/Aeysha/page (20).png',
    'books/Aeysha/page (21).png',
    'books/Aeysha/page (22).png',
    'books/Aeysha/page (23).png',
    'books/Aeysha/page (24).png',
    'books/Aeysha/page (25).png',
    'books/Aeysha/page (26).png',
    'books/Aeysha/page (27).png',
    'books/Aeysha/page (28).png',
    'books/Aeysha/page (29).png',
    'books/Aeysha/page (30).png',
    'books/Aeysha/page (31).png',
    'books/Aeysha/page (32).png',
    'books/Aeysha/page (33).png',
    'books/Aeysha/page (34).png',
    'books/Aeysha/page (35).png',
    'books/Aeysha/page (36).png',
    'books/Aeysha/page (37).png',
    'books/Aeysha/page (38).png',
    'books/Aeysha/page (39).png',
    'books/Aeysha/page (40).png',
    'books/Aeysha/page (41).png',
    'books/Aeysha/page (42).png',
    'books/Aeysha/page (43).png',
    'books/Aeysha/page (44).png',
    'books/Aeysha/page (45).png',
    'books/Aeysha/page (46).png',
    'books/Aeysha/page (47).png',
    'books/Aeysha/page (48).png',
    'books/Aeysha/page (49).png',
    'books/Aeysha/page (50).png',
    'books/Aeysha/page (51).png',
    'books/Aeysha/page (52).png',
    'books/Aeysha/page (53).png',
    'books/Aeysha/page (54).png',
    'books/Aeysha/page (55).png',
    'books/Aeysha/page (56).png',
    'books/Aeysha/page (57).png',
    'books/Aeysha/page (58).png',
    'books/Aeysha/page (59).png',
    'books/Aeysha/page (60).png',
    'books/Aeysha/page (61).png',
    'books/Aeysha/page (62).png',
    'books/Aeysha/page (63).png',
    'books/Aeysha/page (64).png',
    'books/Aeysha/page (65).png',
    'books/Aeysha/page (66).png',
    'books/Aeysha/page (67).png',
    'books/Aeysha/page (68).png',
    'books/Aeysha/page (69).png',
    'books/Aeysha/page (70).png',
    'books/Aeysha/page (71).png',
    'books/Aeysha/page (72).png',
    'books/Aeysha/page (73).png',
    'books/Aeysha/page (74).png',
    'books/Aeysha/page (75).png',
    'books/Aeysha/page (76).png',
    'books/Aeysha/page (77).png',
    'books/Aeysha/page (78).png',
    'books/Aeysha/page (79).png',
    'books/Aeysha/page (80).png',
    'books/Aeysha/page (81).png',
    'books/Aeysha/page (82).png',
    'books/Aeysha/page (83).png',
    'books/Aeysha/page (84).png',
    'books/Aeysha/page (85).png',
    'books/Aeysha/page (86).png',
    'books/Aeysha/page (87).png',
    'books/Aeysha/page (88).png',
    'books/Aeysha/page (89).png',
    'books/Aeysha/page (90).png',
    'books/Aeysha/page (91).png',
    'books/Aeysha/page (92).png',
    'books/Aeysha/page (93).png',
    'books/Aeysha/page (94).png',
    'books/Aeysha/page (95).png',
    'books/Aeysha/page (96).png',
    'books/Aeysha/page (97).png',
    'books/Aeysha/page (98).png',
    'books/Aeysha/page (99).png',
    'books/Aeysha/page (100).png',
    'books/Aeysha/page (101).png',
    'books/Aeysha/page (102).png',
    'books/Aeysha/page (103).png',
    'books/Aeysha/page (104).png',
    'books/Aeysha/page (105).png',
    'books/Aeysha/page (106).png',
    'books/Aeysha/page (107).png',
    'books/Aeysha/page (108).png',
    'books/Aeysha/page (109).png',
    'books/Aeysha/page (110).png',
    'books/Aeysha/page (111).png',
    'books/Aeysha/page (112).png',
    'books/Aeysha/page (113).png',
    'books/Aeysha/page (114).png',
    'books/Aeysha/page (115).png',
    'books/Aeysha/page (116).png',
    'books/Aeysha/page (117).png',
    'books/Aeysha/page (118).png',
    'books/Aeysha/page (119).png',
    'books/Aeysha/page (120).png',
    'books/Aeysha/page (121).png',
    'books/Aeysha/page (122).png',
    'books/Aeysha/page (123).png',
    'books/Aeysha/page (124).png',
    'books/Aeysha/page (125).png',
    'books/Aeysha/page (126).png',
    'books/Aeysha/page (127).png',
    'books/Aeysha/page (128).png',
    'books/Aeysha/page (129).png',
    'books/Aeysha/page (130).png',
    'books/Aeysha/page (131).png',
    'books/Aeysha/page (132).png',
    'books/Aeysha/page (133).png',
    'books/Aeysha/page (134).png',
    'books/Aeysha/page (135).png',
    'books/Aeysha/page (136).png',
    'books/Aeysha/page (137).png',
    'books/Aeysha/page (138).png',
    'books/Aeysha/page (139).png',
    'books/Aeysha/page (140).png',
    'books/Aeysha/page (141).png',
    'books/Aeysha/page (142).png',
    'books/Aeysha/page (143).png',
    'books/Aeysha/page (144).png',
    'books/Aeysha/page (145).png',
    'books/Aeysha/page (146).png',
    'books/Aeysha/page (147).png',
    'books/Aeysha/page (148).png',
    'books/Aeysha/page (149).png',
    'books/Aeysha/page (150).png',
    'books/Aeysha/page (151).png',
    'books/Aeysha/page (152).png',
    'books/Aeysha/page (153).png',
    'books/Aeysha/page (154).png',
    'books/Aeysha/page (155).png',
    'books/Aeysha/page (156).png',
    'books/Aeysha/page (157).png',
    'books/Aeysha/page (158).png',
    'books/Aeysha/page (159).png',
    'books/Aeysha/page (160).png',
    'books/Aeysha/page (161).png',
    'books/Aeysha/page (162).png',
    'books/Aeysha/page (163).png',
    'books/Aeysha/page (164).png',
    'books/Aeysha/page (165).png',
    'books/Aeysha/page (166).png',
    'books/Aeysha/page (167).png',
    'books/Aeysha/page (168).png',
    'books/Aeysha/page (169).png',
    'books/Aeysha/page (170).png',
    'books/Aeysha/page (171).png',
    'books/Aeysha/page (172).png',
    'books/Aeysha/page (173).png',
    'books/Aeysha/page (174).png',
    'books/Aeysha/page (175).png',
    'books/Aeysha/page (176).png',
    'books/Aeysha/page (177).png',
    'books/Aeysha/page (178).png',
    'books/Aeysha/page (179).png',
    'books/Aeysha/page (180).png',
    'books/Aeysha/page (181).png',
    'books/Aeysha/page (182).png',
    'books/Aeysha/page (183).png',
    'books/Aeysha/page (184).png',
    'books/Aeysha/page (185).png',
    'books/Aeysha/page (186).png',
    'books/Aeysha/page (187).png',
    'books/Aeysha/page (188).png',
    'books/Aeysha/page (189).png',
    'books/Aeysha/page (190).png',
    'books/Aeysha/page (191).png',
    'books/Aeysha/page (192).png',
    'books/Aeysha/page (193).png',
    'books/Aeysha/page (194).png',
    'books/Aeysha/page (195).png',
    'books/Aeysha/page (196).png',
    'books/Aeysha/page (197).png',
    'books/Aeysha/page (198).png',
    'books/Aeysha/page (199).png',
    'books/Aeysha/page (200).png',
    'books/Aeysha/page (201).png',
    'books/Aeysha/page (202).png',
    'books/Aeysha/page (203).png',
    'books/Aeysha/page (204).png',
    'books/Aeysha/page (205).png',
    'books/Aeysha/page (206).png',
    'books/Aeysha/page (207).png',
    'books/Aeysha/page (208).png',
    'books/Aeysha/page (209).png',
    'books/Aeysha/page (210).png',
    'books/Aeysha/page (211).png',
    'books/Aeysha/page (212).png',
    'books/Aeysha/page (213).png',
    'books/Aeysha/page (214).png',
    'books/Aeysha/page (215).png',
    'books/Aeysha/page (216).png',
    'books/Aeysha/page (217).png',
    'books/Aeysha/page (218).png',
    'books/Aeysha/page (219).png',
    'books/Aeysha/page (220).png',
    'books/Aeysha/page (221).png',
    'books/Aeysha/page (222).png',
    'books/Aeysha/page (223).png',
    'books/Aeysha/page (224).png',
    'books/Aeysha/page (225).png',
    'books/Aeysha/page (226).png',
    'books/Aeysha/page (227).png',
    'books/Aeysha/page (228).png',
    'books/Aeysha/page (229).png',
    'books/Aeysha/page (230).png',
    'books/Aeysha/page (231).png',
    'books/Aeysha/page (232).png',
    'books/Aeysha/page (233).png',
    'books/Aeysha/page (234).png',
    'books/Aeysha/page (235).png',
    'books/Aeysha/page (236).png',
    'books/Aeysha/page (237).png',
    'books/Aeysha/page (238).png',
    'books/Aeysha/page (239).png',
    'books/Aeysha/page (240).png',
    'books/Aeysha/page (241).png',
    'books/Aeysha/page (242).png',
    'books/Aeysha/page (243).png',
    'books/Aeysha/page (244).png',
    'books/Aeysha/page (245).png',
    'books/Aeysha/page (246).png',
    'books/Aeysha/page (247).png',
    'books/Aeysha/page (248).png',
    'books/Aeysha/page (249).png',
    'books/Aeysha/page (250).png',
    'books/Aeysha/page (251).png',
    'books/Aeysha/page (252).png',
    'books/Aeysha/page (253).png',
    'books/Aeysha/page (254).png',
    'books/Aeysha/page (255).png',
    'books/Aeysha/page (256).png',
    'books/Aeysha/page (257).png',
    'books/Aeysha/page (258).png',
    'books/Aeysha/page (259).png',
    'books/Aeysha/page (260).png',
    'books/Aeysha/page (261).png',
    'books/Aeysha/page (262).png',
    'books/Aeysha/page (263).png',
    'books/Aeysha/page (264).png',
    'books/Aeysha/page (265).png',
    'books/Aeysha/page (266).png',
    'books/Aeysha/page (267).png',
    'books/Aeysha/page (268).png',
    'books/Aeysha/page (269).png',
    'books/Aeysha/page (270).png',
    'books/Aeysha/page (271).png',
    'books/Aeysha/page (272).png',
    'books/Aeysha/page (273).png',
    'books/Aeysha/page (274).png',
    'books/Aeysha/page (275).png',
    'books/Aeysha/page (276).png',
    'books/Aeysha/page (277).png',
    'books/Aeysha/page (278).png',
    'books/Aeysha/page (279).png',
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
