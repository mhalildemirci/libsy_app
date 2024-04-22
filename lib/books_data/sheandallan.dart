import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sheandallan extends StatefulWidget {
  const sheandallan({Key? key}) : super(key: key);

  @override
  State<sheandallan> createState() => _sheandallanState();
}

class _sheandallanState extends State<sheandallan> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/she and allan/page (1).png',
    'books/she and allan/page (2).png',
    'books/she and allan/page (3).png',
    'books/she and allan/page (4).png',
    'books/she and allan/page (5).png',
    'books/she and allan/page (6).png',
    'books/she and allan/page (7).png',
    'books/she and allan/page (8).png',
    'books/she and allan/page (9).png',
    'books/she and allan/page (10).png',
    'books/she and allan/page (11).png',
    'books/she and allan/page (12).png',
    'books/she and allan/page (13).png',
    'books/she and allan/page (14).png',
    'books/she and allan/page (15).png',
    'books/she and allan/page (16).png',
    'books/she and allan/page (17).png',
    'books/she and allan/page (18).png',
    'books/she and allan/page (19).png',
    'books/she and allan/page (20).png',
    'books/she and allan/page (21).png',
    'books/she and allan/page (22).png',
    'books/she and allan/page (23).png',
    'books/she and allan/page (24).png',
    'books/she and allan/page (25).png',
    'books/she and allan/page (26).png',
    'books/she and allan/page (27).png',
    'books/she and allan/page (28).png',
    'books/she and allan/page (29).png',
    'books/she and allan/page (30).png',
    'books/she and allan/page (31).png',
    'books/she and allan/page (32).png',
    'books/she and allan/page (33).png',
    'books/she and allan/page (34).png',
    'books/she and allan/page (35).png',
    'books/she and allan/page (36).png',
    'books/she and allan/page (37).png',
    'books/she and allan/page (38).png',
    'books/she and allan/page (39).png',
    'books/she and allan/page (40).png',
    'books/she and allan/page (41).png',
    'books/she and allan/page (42).png',
    'books/she and allan/page (43).png',
    'books/she and allan/page (44).png',
    'books/she and allan/page (45).png',
    'books/she and allan/page (46).png',
    'books/she and allan/page (47).png',
    'books/she and allan/page (48).png',
    'books/she and allan/page (49).png',
    'books/she and allan/page (50).png',
    'books/she and allan/page (51).png',
    'books/she and allan/page (52).png',
    'books/she and allan/page (53).png',
    'books/she and allan/page (54).png',
    'books/she and allan/page (55).png',
    'books/she and allan/page (56).png',
    'books/she and allan/page (57).png',
    'books/she and allan/page (58).png',
    'books/she and allan/page (59).png',
    'books/she and allan/page (60).png',
    'books/she and allan/page (61).png',
    'books/she and allan/page (62).png',
    'books/she and allan/page (63).png',
    'books/she and allan/page (64).png',
    'books/she and allan/page (65).png',
    'books/she and allan/page (66).png',
    'books/she and allan/page (67).png',
    'books/she and allan/page (68).png',
    'books/she and allan/page (69).png',
    'books/she and allan/page (70).png',
    'books/she and allan/page (71).png',
    'books/she and allan/page (72).png',
    'books/she and allan/page (73).png',
    'books/she and allan/page (74).png',
    'books/she and allan/page (75).png',
    'books/she and allan/page (76).png',
    'books/she and allan/page (77).png',
    'books/she and allan/page (78).png',
    'books/she and allan/page (79).png',
    'books/she and allan/page (80).png',
    'books/she and allan/page (81).png',
    'books/she and allan/page (82).png',
    'books/she and allan/page (83).png',
    'books/she and allan/page (84).png',
    'books/she and allan/page (85).png',
    'books/she and allan/page (86).png',
    'books/she and allan/page (87).png',
    'books/she and allan/page (88).png',
    'books/she and allan/page (89).png',
    'books/she and allan/page (90).png',
    'books/she and allan/page (91).png',
    'books/she and allan/page (92).png',
    'books/she and allan/page (93).png',
    'books/she and allan/page (94).png',
    'books/she and allan/page (95).png',
    'books/she and allan/page (96).png',
    'books/she and allan/page (97).png',
    'books/she and allan/page (98).png',
    'books/she and allan/page (99).png',
    'books/she and allan/page (100).png',
    'books/she and allan/page (101).png',
    'books/she and allan/page (102).png',
    'books/she and allan/page (103).png',
    'books/she and allan/page (104).png',
    'books/she and allan/page (105).png',
    'books/she and allan/page (106).png',
    'books/she and allan/page (107).png',
    'books/she and allan/page (108).png',
    'books/she and allan/page (109).png',
    'books/she and allan/page (110).png',
    'books/she and allan/page (111).png',
    'books/she and allan/page (112).png',
    'books/she and allan/page (113).png',
    'books/she and allan/page (114).png',
    'books/she and allan/page (115).png',
    'books/she and allan/page (116).png',
    'books/she and allan/page (117).png',
    'books/she and allan/page (118).png',
    'books/she and allan/page (119).png',
    'books/she and allan/page (120).png',
    'books/she and allan/page (121).png',
    'books/she and allan/page (122).png',
    'books/she and allan/page (123).png',
    'books/she and allan/page (124).png',
    'books/she and allan/page (125).png',
    'books/she and allan/page (126).png',
    'books/she and allan/page (127).png',
    'books/she and allan/page (128).png',
    'books/she and allan/page (129).png',
    'books/she and allan/page (130).png',
    'books/she and allan/page (131).png',
    'books/she and allan/page (132).png',
    'books/she and allan/page (133).png',
    'books/she and allan/page (134).png',
    'books/she and allan/page (135).png',
    'books/she and allan/page (136).png',
    'books/she and allan/page (137).png',
    'books/she and allan/page (138).png',
    'books/she and allan/page (139).png',
    'books/she and allan/page (140).png',
    'books/she and allan/page (141).png',
    'books/she and allan/page (142).png',
    'books/she and allan/page (143).png',
    'books/she and allan/page (144).png',
    'books/she and allan/page (145).png',
    'books/she and allan/page (146).png',
    'books/she and allan/page (147).png',
    'books/she and allan/page (148).png',
    'books/she and allan/page (149).png',
    'books/she and allan/page (150).png',
    'books/she and allan/page (151).png',
    'books/she and allan/page (152).png',
    'books/she and allan/page (153).png',
    'books/she and allan/page (154).png',
    'books/she and allan/page (155).png',
    'books/she and allan/page (156).png',
    'books/she and allan/page (157).png',
    'books/she and allan/page (158).png',
    'books/she and allan/page (159).png',
    'books/she and allan/page (160).png',
    'books/she and allan/page (161).png',
    'books/she and allan/page (162).png',
    'books/she and allan/page (163).png',
    'books/she and allan/page (164).png',
    'books/she and allan/page (165).png',
    'books/she and allan/page (166).png',
    'books/she and allan/page (167).png',
    'books/she and allan/page (168).png',
    'books/she and allan/page (169).png',
    'books/she and allan/page (170).png',
    'books/she and allan/page (171).png',
    'books/she and allan/page (172).png',
    'books/she and allan/page (173).png',
    'books/she and allan/page (174).png',
    'books/she and allan/page (175).png',
    'books/she and allan/page (176).png',
    'books/she and allan/page (177).png',
    'books/she and allan/page (178).png',
    'books/she and allan/page (179).png',
    'books/she and allan/page (180).png',
    'books/she and allan/page (181).png',
    'books/she and allan/page (182).png',
    'books/she and allan/page (183).png',
    'books/she and allan/page (184).png',
    'books/she and allan/page (185).png',
    'books/she and allan/page (186).png',
    'books/she and allan/page (187).png',
    'books/she and allan/page (188).png',
    'books/she and allan/page (189).png',
    'books/she and allan/page (190).png',
    'books/she and allan/page (191).png',
    'books/she and allan/page (192).png',
    'books/she and allan/page (193).png',
    'books/she and allan/page (194).png',
    'books/she and allan/page (195).png',
    'books/she and allan/page (196).png',
    'books/she and allan/page (197).png',
    'books/she and allan/page (198).png',
    'books/she and allan/page (199).png',
    'books/she and allan/page (200).png',
    'books/she and allan/page (201).png',
    'books/she and allan/page (202).png',
    'books/she and allan/page (203).png',
    'books/she and allan/page (204).png',
    'books/she and allan/page (205).png',
    'books/she and allan/page (206).png',
    'books/she and allan/page (207).png',
    'books/she and allan/page (208).png',
    'books/she and allan/page (209).png',
    'books/she and allan/page (210).png',
    'books/she and allan/page (211).png',
    'books/she and allan/page (212).png',
    'books/she and allan/page (213).png',
    'books/she and allan/page (214).png',
    'books/she and allan/page (215).png',
    'books/she and allan/page (216).png',
    'books/she and allan/page (217).png',
    'books/she and allan/page (218).png',
    'books/she and allan/page (219).png',
    'books/she and allan/page (220).png',
    'books/she and allan/page (221).png',
    'books/she and allan/page (222).png',
    'books/she and allan/page (223).png',
    'books/she and allan/page (224).png',
    'books/she and allan/page (225).png',
    'books/she and allan/page (226).png',
    'books/she and allan/page (227).png',
    'books/she and allan/page (228).png',
    'books/she and allan/page (229).png',
    'books/she and allan/page (230).png',
    'books/she and allan/page (231).png',
    'books/she and allan/page (232).png',
    'books/she and allan/page (233).png',
    'books/she and allan/page (234).png',
    'books/she and allan/page (235).png',
    'books/she and allan/page (236).png',
    'books/she and allan/page (237).png',
    'books/she and allan/page (238).png',
    'books/she and allan/page (239).png',
    'books/she and allan/page (240).png',
    'books/she and allan/page (241).png',
    'books/she and allan/page (242).png',
    'books/she and allan/page (243).png',
    'books/she and allan/page (244).png',
    'books/she and allan/page (245).png',
    'books/she and allan/page (246).png',
    'books/she and allan/page (247).png',
    'books/she and allan/page (248).png',
    'books/she and allan/page (249).png',
    'books/she and allan/page (250).png',
    'books/she and allan/page (251).png',
    'books/she and allan/page (252).png',
    'books/she and allan/page (253).png',
    'books/she and allan/page (254).png',
    'books/she and allan/page (255).png',
    'books/she and allan/page (256).png',
    'books/she and allan/page (257).png',
    'books/she and allan/page (258).png',
    'books/she and allan/page (259).png',
    'books/she and allan/page (260).png',
    'books/she and allan/page (261).png',
    'books/she and allan/page (262).png',
    'books/she and allan/page (263).png',
    'books/she and allan/page (264).png',
    'books/she and allan/page (265).png',
    'books/she and allan/page (266).png',
    'books/she and allan/page (267).png',
    'books/she and allan/page (268).png',
    'books/she and allan/page (269).png',
    'books/she and allan/page (270).png',
    'books/she and allan/page (271).png',
    'books/she and allan/page (272).png',
    'books/she and allan/page (273).png',
    'books/she and allan/page (274).png',
    'books/she and allan/page (275).png',
    'books/she and allan/page (276).png',
    'books/she and allan/page (277).png',
    'books/she and allan/page (278).png',
    'books/she and allan/page (279).png',
    'books/she and allan/page (280).png',
    'books/she and allan/page (281).png',
    'books/she and allan/page (282).png',
    'books/she and allan/page (283).png',
    'books/she and allan/page (284).png',
    'books/she and allan/page (285).png',
    'books/she and allan/page (286).png',
    'books/she and allan/page (287).png',
    'books/she and allan/page (288).png',
    'books/she and allan/page (289).png',
    'books/she and allan/page (290).png',

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
