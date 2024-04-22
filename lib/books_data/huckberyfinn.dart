import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class huckberyfinn extends StatefulWidget {
  const huckberyfinn({Key? key}) : super(key: key);

  @override
  State<huckberyfinn> createState() => _huckberyfinnState();
}

class _huckberyfinnState extends State<huckberyfinn> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Adventures of Huckleberry Finn/page (1).png',
    'books/Adventures of Huckleberry Finn/page (2).png',
    'books/Adventures of Huckleberry Finn/page (3).png',
    'books/Adventures of Huckleberry Finn/page (4).png',
    'books/Adventures of Huckleberry Finn/page (5).png',
    'books/Adventures of Huckleberry Finn/page (6).png',
    'books/Adventures of Huckleberry Finn/page (7).png',
    'books/Adventures of Huckleberry Finn/page (8).png',
    'books/Adventures of Huckleberry Finn/page (9).png',
    'books/Adventures of Huckleberry Finn/page (10).png',
    'books/Adventures of Huckleberry Finn/page (11).png',
    'books/Adventures of Huckleberry Finn/page (12).png',
    'books/Adventures of Huckleberry Finn/page (13).png',
    'books/Adventures of Huckleberry Finn/page (14).png',
    'books/Adventures of Huckleberry Finn/page (15).png',
    'books/Adventures of Huckleberry Finn/page (16).png',
    'books/Adventures of Huckleberry Finn/page (17).png',
    'books/Adventures of Huckleberry Finn/page (18).png',
    'books/Adventures of Huckleberry Finn/page (19).png',
    'books/Adventures of Huckleberry Finn/page (20).png',
    'books/Adventures of Huckleberry Finn/page (21).png',
    'books/Adventures of Huckleberry Finn/page (22).png',
    'books/Adventures of Huckleberry Finn/page (23).png',
    'books/Adventures of Huckleberry Finn/page (24).png',
    'books/Adventures of Huckleberry Finn/page (25).png',
    'books/Adventures of Huckleberry Finn/page (26).png',
    'books/Adventures of Huckleberry Finn/page (27).png',
    'books/Adventures of Huckleberry Finn/page (28).png',
    'books/Adventures of Huckleberry Finn/page (29).png',
    'books/Adventures of Huckleberry Finn/page (30).png',
    'books/Adventures of Huckleberry Finn/page (31).png',
    'books/Adventures of Huckleberry Finn/page (32).png',
    'books/Adventures of Huckleberry Finn/page (33).png',
    'books/Adventures of Huckleberry Finn/page (34).png',
    'books/Adventures of Huckleberry Finn/page (35).png',
    'books/Adventures of Huckleberry Finn/page (36).png',
    'books/Adventures of Huckleberry Finn/page (37).png',
    'books/Adventures of Huckleberry Finn/page (38).png',
    'books/Adventures of Huckleberry Finn/page (39).png',
    'books/Adventures of Huckleberry Finn/page (40).png',
    'books/Adventures of Huckleberry Finn/page (41).png',
    'books/Adventures of Huckleberry Finn/page (42).png',
    'books/Adventures of Huckleberry Finn/page (43).png',
    'books/Adventures of Huckleberry Finn/page (44).png',
    'books/Adventures of Huckleberry Finn/page (45).png',
    'books/Adventures of Huckleberry Finn/page (46).png',
    'books/Adventures of Huckleberry Finn/page (47).png',
    'books/Adventures of Huckleberry Finn/page (48).png',
    'books/Adventures of Huckleberry Finn/page (49).png',
    'books/Adventures of Huckleberry Finn/page (50).png',
    'books/Adventures of Huckleberry Finn/page (51).png',
    'books/Adventures of Huckleberry Finn/page (52).png',
    'books/Adventures of Huckleberry Finn/page (53).png',
    'books/Adventures of Huckleberry Finn/page (54).png',
    'books/Adventures of Huckleberry Finn/page (55).png',
    'books/Adventures of Huckleberry Finn/page (56).png',
    'books/Adventures of Huckleberry Finn/page (57).png',
    'books/Adventures of Huckleberry Finn/page (58).png',
    'books/Adventures of Huckleberry Finn/page (59).png',
    'books/Adventures of Huckleberry Finn/page (60).png',
    'books/Adventures of Huckleberry Finn/page (61).png',
    'books/Adventures of Huckleberry Finn/page (62).png',
    'books/Adventures of Huckleberry Finn/page (63).png',
    'books/Adventures of Huckleberry Finn/page (64).png',
    'books/Adventures of Huckleberry Finn/page (65).png',
    'books/Adventures of Huckleberry Finn/page (66).png',
    'books/Adventures of Huckleberry Finn/page (67).png',
    'books/Adventures of Huckleberry Finn/page (68).png',
    'books/Adventures of Huckleberry Finn/page (69).png',
    'books/Adventures of Huckleberry Finn/page (70).png',
    'books/Adventures of Huckleberry Finn/page (71).png',
    'books/Adventures of Huckleberry Finn/page (72).png',
    'books/Adventures of Huckleberry Finn/page (73).png',
    'books/Adventures of Huckleberry Finn/page (74).png',
    'books/Adventures of Huckleberry Finn/page (75).png',
    'books/Adventures of Huckleberry Finn/page (76).png',
    'books/Adventures of Huckleberry Finn/page (77).png',
    'books/Adventures of Huckleberry Finn/page (78).png',
    'books/Adventures of Huckleberry Finn/page (79).png',
    'books/Adventures of Huckleberry Finn/page (80).png',
    'books/Adventures of Huckleberry Finn/page (81).png',
    'books/Adventures of Huckleberry Finn/page (82).png',
    'books/Adventures of Huckleberry Finn/page (83).png',
    'books/Adventures of Huckleberry Finn/page (84).png',
    'books/Adventures of Huckleberry Finn/page (85).png',
    'books/Adventures of Huckleberry Finn/page (86).png',
    'books/Adventures of Huckleberry Finn/page (87).png',
    'books/Adventures of Huckleberry Finn/page (88).png',
    'books/Adventures of Huckleberry Finn/page (89).png',
    'books/Adventures of Huckleberry Finn/page (90).png',
    'books/Adventures of Huckleberry Finn/page (91).png',
    'books/Adventures of Huckleberry Finn/page (92).png',
    'books/Adventures of Huckleberry Finn/page (93).png',
    'books/Adventures of Huckleberry Finn/page (94).png',
    'books/Adventures of Huckleberry Finn/page (95).png',
    'books/Adventures of Huckleberry Finn/page (96).png',
    'books/Adventures of Huckleberry Finn/page (97).png',
    'books/Adventures of Huckleberry Finn/page (98).png',
    'books/Adventures of Huckleberry Finn/page (99).png',
    'books/Adventures of Huckleberry Finn/page (100).png',
    'books/Adventures of Huckleberry Finn/page (101).png',
    'books/Adventures of Huckleberry Finn/page (102).png',
    'books/Adventures of Huckleberry Finn/page (103).png',
    'books/Adventures of Huckleberry Finn/page (104).png',
    'books/Adventures of Huckleberry Finn/page (105).png',
    'books/Adventures of Huckleberry Finn/page (106).png',
    'books/Adventures of Huckleberry Finn/page (107).png',
    'books/Adventures of Huckleberry Finn/page (108).png',
    'books/Adventures of Huckleberry Finn/page (109).png',
    'books/Adventures of Huckleberry Finn/page (110).png',
    'books/Adventures of Huckleberry Finn/page (111).png',
    'books/Adventures of Huckleberry Finn/page (112).png',
    'books/Adventures of Huckleberry Finn/page (113).png',
    'books/Adventures of Huckleberry Finn/page (114).png',
    'books/Adventures of Huckleberry Finn/page (115).png',
    'books/Adventures of Huckleberry Finn/page (116).png',
    'books/Adventures of Huckleberry Finn/page (117).png',
    'books/Adventures of Huckleberry Finn/page (118).png',
    'books/Adventures of Huckleberry Finn/page (119).png',
    'books/Adventures of Huckleberry Finn/page (120).png',
    'books/Adventures of Huckleberry Finn/page (121).png',
    'books/Adventures of Huckleberry Finn/page (122).png',
    'books/Adventures of Huckleberry Finn/page (123).png',
    'books/Adventures of Huckleberry Finn/page (124).png',
    'books/Adventures of Huckleberry Finn/page (125).png',
    'books/Adventures of Huckleberry Finn/page (126).png',
    'books/Adventures of Huckleberry Finn/page (127).png',
    'books/Adventures of Huckleberry Finn/page (128).png',
    'books/Adventures of Huckleberry Finn/page (129).png',
    'books/Adventures of Huckleberry Finn/page (130).png',
    'books/Adventures of Huckleberry Finn/page (131).png',
    'books/Adventures of Huckleberry Finn/page (132).png',
    'books/Adventures of Huckleberry Finn/page (133).png',
    'books/Adventures of Huckleberry Finn/page (134).png',
    'books/Adventures of Huckleberry Finn/page (135).png',
    'books/Adventures of Huckleberry Finn/page (136).png',
    'books/Adventures of Huckleberry Finn/page (137).png',
    'books/Adventures of Huckleberry Finn/page (138).png',
    'books/Adventures of Huckleberry Finn/page (139).png',
    'books/Adventures of Huckleberry Finn/page (140).png',
    'books/Adventures of Huckleberry Finn/page (141).png',
    'books/Adventures of Huckleberry Finn/page (142).png',
    'books/Adventures of Huckleberry Finn/page (143).png',
    'books/Adventures of Huckleberry Finn/page (144).png',
    'books/Adventures of Huckleberry Finn/page (145).png',
    'books/Adventures of Huckleberry Finn/page (146).png',
    'books/Adventures of Huckleberry Finn/page (147).png',
    'books/Adventures of Huckleberry Finn/page (148).png',
    'books/Adventures of Huckleberry Finn/page (149).png',
    'books/Adventures of Huckleberry Finn/page (150).png',
    'books/Adventures of Huckleberry Finn/page (151).png',
    'books/Adventures of Huckleberry Finn/page (152).png',
    'books/Adventures of Huckleberry Finn/page (153).png',
    'books/Adventures of Huckleberry Finn/page (154).png',
    'books/Adventures of Huckleberry Finn/page (155).png',
    'books/Adventures of Huckleberry Finn/page (156).png',
    'books/Adventures of Huckleberry Finn/page (157).png',
    'books/Adventures of Huckleberry Finn/page (158).png',
    'books/Adventures of Huckleberry Finn/page (159).png',
    'books/Adventures of Huckleberry Finn/page (160).png',
    'books/Adventures of Huckleberry Finn/page (161).png',
    'books/Adventures of Huckleberry Finn/page (162).png',
    'books/Adventures of Huckleberry Finn/page (163).png',
    'books/Adventures of Huckleberry Finn/page (164).png',
    'books/Adventures of Huckleberry Finn/page (165).png',
    'books/Adventures of Huckleberry Finn/page (166).png',
    'books/Adventures of Huckleberry Finn/page (167).png',
    'books/Adventures of Huckleberry Finn/page (168).png',
    'books/Adventures of Huckleberry Finn/page (169).png',
    'books/Adventures of Huckleberry Finn/page (170).png',
    'books/Adventures of Huckleberry Finn/page (171).png',
    'books/Adventures of Huckleberry Finn/page (172).png',
    'books/Adventures of Huckleberry Finn/page (173).png',
    'books/Adventures of Huckleberry Finn/page (174).png',
    'books/Adventures of Huckleberry Finn/page (175).png',
    'books/Adventures of Huckleberry Finn/page (176).png',
    'books/Adventures of Huckleberry Finn/page (177).png',
    'books/Adventures of Huckleberry Finn/page (178).png',
    'books/Adventures of Huckleberry Finn/page (179).png',
    'books/Adventures of Huckleberry Finn/page (180).png',
    'books/Adventures of Huckleberry Finn/page (181).png',
    'books/Adventures of Huckleberry Finn/page (182).png',
    'books/Adventures of Huckleberry Finn/page (183).png',
    'books/Adventures of Huckleberry Finn/page (184).png',
    'books/Adventures of Huckleberry Finn/page (185).png',
    'books/Adventures of Huckleberry Finn/page (186).png',
    'books/Adventures of Huckleberry Finn/page (187).png',
    'books/Adventures of Huckleberry Finn/page (188).png',
    'books/Adventures of Huckleberry Finn/page (189).png',
    'books/Adventures of Huckleberry Finn/page (190).png',
    'books/Adventures of Huckleberry Finn/page (191).png',
    'books/Adventures of Huckleberry Finn/page (192).png',
    'books/Adventures of Huckleberry Finn/page (193).png',
    'books/Adventures of Huckleberry Finn/page (194).png',
    'books/Adventures of Huckleberry Finn/page (195).png',
    'books/Adventures of Huckleberry Finn/page (196).png',
    'books/Adventures of Huckleberry Finn/page (197).png',
    'books/Adventures of Huckleberry Finn/page (198).png',
    'books/Adventures of Huckleberry Finn/page (199).png',
    'books/Adventures of Huckleberry Finn/page (200).png',
    'books/Adventures of Huckleberry Finn/page (201).png',
    'books/Adventures of Huckleberry Finn/page (202).png',
    'books/Adventures of Huckleberry Finn/page (203).png',
    'books/Adventures of Huckleberry Finn/page (204).png',
    'books/Adventures of Huckleberry Finn/page (205).png',
    'books/Adventures of Huckleberry Finn/page (206).png',
    'books/Adventures of Huckleberry Finn/page (207).png',
    'books/Adventures of Huckleberry Finn/page (208).png',
    'books/Adventures of Huckleberry Finn/page (209).png',
    'books/Adventures of Huckleberry Finn/page (210).png',
    'books/Adventures of Huckleberry Finn/page (211).png',
    'books/Adventures of Huckleberry Finn/page (212).png',
    'books/Adventures of Huckleberry Finn/page (213).png',
    'books/Adventures of Huckleberry Finn/page (214).png',
    'books/Adventures of Huckleberry Finn/page (215).png',
    'books/Adventures of Huckleberry Finn/page (216).png',
    'books/Adventures of Huckleberry Finn/page (217).png',
    'books/Adventures of Huckleberry Finn/page (218).png',
    'books/Adventures of Huckleberry Finn/page (219).png',
    'books/Adventures of Huckleberry Finn/page (220).png',
    'books/Adventures of Huckleberry Finn/page (221).png',
    'books/Adventures of Huckleberry Finn/page (222).png',
    'books/Adventures of Huckleberry Finn/page (223).png',
    'books/Adventures of Huckleberry Finn/page (224).png',
    'books/Adventures of Huckleberry Finn/page (225).png',
    'books/Adventures of Huckleberry Finn/page (226).png',
    'books/Adventures of Huckleberry Finn/page (227).png',
    'books/Adventures of Huckleberry Finn/page (228).png',
    'books/Adventures of Huckleberry Finn/page (229).png',
    'books/Adventures of Huckleberry Finn/page (230).png',
    'books/Adventures of Huckleberry Finn/page (231).png',
    'books/Adventures of Huckleberry Finn/page (232).png',
    'books/Adventures of Huckleberry Finn/page (233).png',
    'books/Adventures of Huckleberry Finn/page (234).png',
    'books/Adventures of Huckleberry Finn/page (235).png',
    'books/Adventures of Huckleberry Finn/page (236).png',
    'books/Adventures of Huckleberry Finn/page (237).png',
    'books/Adventures of Huckleberry Finn/page (238).png',
    'books/Adventures of Huckleberry Finn/page (239).png',
    'books/Adventures of Huckleberry Finn/page (240).png',
    'books/Adventures of Huckleberry Finn/page (241).png',
    'books/Adventures of Huckleberry Finn/page (242).png',
    'books/Adventures of Huckleberry Finn/page (243).png',
    'books/Adventures of Huckleberry Finn/page (244).png',
    'books/Adventures of Huckleberry Finn/page (245).png',
    'books/Adventures of Huckleberry Finn/page (246).png',
    'books/Adventures of Huckleberry Finn/page (247).png',
    'books/Adventures of Huckleberry Finn/page (248).png',
    'books/Adventures of Huckleberry Finn/page (249).png',
    'books/Adventures of Huckleberry Finn/page (250).png',
    'books/Adventures of Huckleberry Finn/page (251).png',
    'books/Adventures of Huckleberry Finn/page (252).png',
    'books/Adventures of Huckleberry Finn/page (253).png',
    'books/Adventures of Huckleberry Finn/page (254).png',
    'books/Adventures of Huckleberry Finn/page (255).png',
    'books/Adventures of Huckleberry Finn/page (256).png',
    'books/Adventures of Huckleberry Finn/page (257).png',
    'books/Adventures of Huckleberry Finn/page (258).png',
    'books/Adventures of Huckleberry Finn/page (259).png',
    'books/Adventures of Huckleberry Finn/page (260).png',
    'books/Adventures of Huckleberry Finn/page (261).png',
    'books/Adventures of Huckleberry Finn/page (262).png',
    'books/Adventures of Huckleberry Finn/page (263).png',
    'books/Adventures of Huckleberry Finn/page (264).png',
    'books/Adventures of Huckleberry Finn/page (265).png',
    'books/Adventures of Huckleberry Finn/page (266).png',
    'books/Adventures of Huckleberry Finn/page (267).png',
    'books/Adventures of Huckleberry Finn/page (268).png',
    'books/Adventures of Huckleberry Finn/page (269).png',
    'books/Adventures of Huckleberry Finn/page (270).png',
    'books/Adventures of Huckleberry Finn/page (271).png',
    'books/Adventures of Huckleberry Finn/page (272).png',
    'books/Adventures of Huckleberry Finn/page (273).png',
    'books/Adventures of Huckleberry Finn/page (274).png',
    'books/Adventures of Huckleberry Finn/page (275).png',
    'books/Adventures of Huckleberry Finn/page (276).png',
    'books/Adventures of Huckleberry Finn/page (277).png',
    'books/Adventures of Huckleberry Finn/page (278).png',
    'books/Adventures of Huckleberry Finn/page (279).png',
    'books/Adventures of Huckleberry Finn/page (280).png',
    'books/Adventures of Huckleberry Finn/page (281).png',
    'books/Adventures of Huckleberry Finn/page (282).png',
    'books/Adventures of Huckleberry Finn/page (283).png',
    'books/Adventures of Huckleberry Finn/page (284).png',
    'books/Adventures of Huckleberry Finn/page (285).png',
    'books/Adventures of Huckleberry Finn/page (286).png',
    'books/Adventures of Huckleberry Finn/page (287).png',
    'books/Adventures of Huckleberry Finn/page (288).png',
    'books/Adventures of Huckleberry Finn/page (289).png',
    'books/Adventures of Huckleberry Finn/page (290).png',
    'books/Adventures of Huckleberry Finn/page (291).png',
    'books/Adventures of Huckleberry Finn/page (292).png',
    'books/Adventures of Huckleberry Finn/page (293).png',
    'books/Adventures of Huckleberry Finn/page (294).png',
    'books/Adventures of Huckleberry Finn/page (295).png',
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
