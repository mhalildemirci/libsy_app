import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class brownsuit extends StatefulWidget {
  const brownsuit({Key? key}) : super(key: key);

  @override
  State<brownsuit> createState() => _brownsuitState();
}

class _brownsuitState extends State<brownsuit> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/brown suit/page (1).png',
    'books/brown suit/page (2).png',
    'books/brown suit/page (3).png',
    'books/brown suit/page (4).png',
    'books/brown suit/page (5).png',
    'books/brown suit/page (6).png',
    'books/brown suit/page (7).png',
    'books/brown suit/page (8).png',
    'books/brown suit/page (9).png',
    'books/brown suit/page (10).png',
    'books/brown suit/page (11).png',
    'books/brown suit/page (12).png',
    'books/brown suit/page (13).png',
    'books/brown suit/page (14).png',
    'books/brown suit/page (15).png',
    'books/brown suit/page (16).png',
    'books/brown suit/page (17).png',
    'books/brown suit/page (18).png',
    'books/brown suit/page (19).png',
    'books/brown suit/page (20).png',
    'books/brown suit/page (21).png',
    'books/brown suit/page (22).png',
    'books/brown suit/page (23).png',
    'books/brown suit/page (24).png',
    'books/brown suit/page (25).png',
    'books/brown suit/page (26).png',
    'books/brown suit/page (27).png',
    'books/brown suit/page (28).png',
    'books/brown suit/page (29).png',
    'books/brown suit/page (30).png',
    'books/brown suit/page (31).png',
    'books/brown suit/page (32).png',
    'books/brown suit/page (33).png',
    'books/brown suit/page (34).png',
    'books/brown suit/page (35).png',
    'books/brown suit/page (36).png',
    'books/brown suit/page (37).png',
    'books/brown suit/page (38).png',
    'books/brown suit/page (39).png',
    'books/brown suit/page (40).png',
    'books/brown suit/page (41).png',
    'books/brown suit/page (42).png',
    'books/brown suit/page (43).png',
    'books/brown suit/page (44).png',
    'books/brown suit/page (45).png',
    'books/brown suit/page (46).png',
    'books/brown suit/page (47).png',
    'books/brown suit/page (48).png',
    'books/brown suit/page (49).png',
    'books/brown suit/page (50).png',
    'books/brown suit/page (51).png',
    'books/brown suit/page (52).png',
    'books/brown suit/page (53).png',
    'books/brown suit/page (54).png',
    'books/brown suit/page (55).png',
    'books/brown suit/page (56).png',
    'books/brown suit/page (57).png',
    'books/brown suit/page (58).png',
    'books/brown suit/page (59).png',
    'books/brown suit/page (60).png',
    'books/brown suit/page (61).png',
    'books/brown suit/page (62).png',
    'books/brown suit/page (63).png',
    'books/brown suit/page (64).png',
    'books/brown suit/page (65).png',
    'books/brown suit/page (66).png',
    'books/brown suit/page (67).png',
    'books/brown suit/page (68).png',
    'books/brown suit/page (69).png',
    'books/brown suit/page (70).png',
    'books/brown suit/page (71).png',
    'books/brown suit/page (72).png',
    'books/brown suit/page (73).png',
    'books/brown suit/page (74).png',
    'books/brown suit/page (75).png',
    'books/brown suit/page (76).png',
    'books/brown suit/page (77).png',
    'books/brown suit/page (78).png',
    'books/brown suit/page (79).png',
    'books/brown suit/page (80).png',
    'books/brown suit/page (81).png',
    'books/brown suit/page (82).png',
    'books/brown suit/page (83).png',
    'books/brown suit/page (84).png',
    'books/brown suit/page (85).png',
    'books/brown suit/page (86).png',
    'books/brown suit/page (87).png',
    'books/brown suit/page (88).png',
    'books/brown suit/page (89).png',
    'books/brown suit/page (90).png',
    'books/brown suit/page (91).png',
    'books/brown suit/page (92).png',
    'books/brown suit/page (93).png',
    'books/brown suit/page (94).png',
    'books/brown suit/page (95).png',
    'books/brown suit/page (96).png',
    'books/brown suit/page (97).png',
    'books/brown suit/page (98).png',
    'books/brown suit/page (99).png',
    'books/brown suit/page (100).png',
    'books/brown suit/page (101).png',
    'books/brown suit/page (102).png',
    'books/brown suit/page (103).png',
    'books/brown suit/page (104).png',
    'books/brown suit/page (105).png',
    'books/brown suit/page (106).png',
    'books/brown suit/page (107).png',
    'books/brown suit/page (108).png',
    'books/brown suit/page (109).png',
    'books/brown suit/page (110).png',
    'books/brown suit/page (111).png',
    'books/brown suit/page (112).png',
    'books/brown suit/page (113).png',
    'books/brown suit/page (114).png',
    'books/brown suit/page (115).png',
    'books/brown suit/page (116).png',
    'books/brown suit/page (117).png',
    'books/brown suit/page (118).png',
    'books/brown suit/page (119).png',
    'books/brown suit/page (120).png',
    'books/brown suit/page (121).png',
    'books/brown suit/page (122).png',
    'books/brown suit/page (123).png',
    'books/brown suit/page (124).png',
    'books/brown suit/page (125).png',
    'books/brown suit/page (126).png',
    'books/brown suit/page (127).png',
    'books/brown suit/page (128).png',
    'books/brown suit/page (129).png',
    'books/brown suit/page (130).png',
    'books/brown suit/page (131).png',
    'books/brown suit/page (132).png',
    'books/brown suit/page (133).png',
    'books/brown suit/page (134).png',
    'books/brown suit/page (135).png',
    'books/brown suit/page (136).png',
    'books/brown suit/page (137).png',
    'books/brown suit/page (138).png',
    'books/brown suit/page (139).png',
    'books/brown suit/page (140).png',
    'books/brown suit/page (141).png',
    'books/brown suit/page (142).png',
    'books/brown suit/page (143).png',
    'books/brown suit/page (144).png',
    'books/brown suit/page (145).png',
    'books/brown suit/page (146).png',
    'books/brown suit/page (147).png',
    'books/brown suit/page (148).png',
    'books/brown suit/page (149).png',
    'books/brown suit/page (150).png',
    'books/brown suit/page (151).png',
    'books/brown suit/page (152).png',
    'books/brown suit/page (153).png',
    'books/brown suit/page (154).png',
    'books/brown suit/page (155).png',
    'books/brown suit/page (156).png',
    'books/brown suit/page (157).png',
    'books/brown suit/page (158).png',
    'books/brown suit/page (159).png',
    'books/brown suit/page (160).png',
    'books/brown suit/page (161).png',
    'books/brown suit/page (162).png',
    'books/brown suit/page (163).png',
    'books/brown suit/page (164).png',
    'books/brown suit/page (165).png',
    'books/brown suit/page (166).png',
    'books/brown suit/page (167).png',
    'books/brown suit/page (168).png',
    'books/brown suit/page (169).png',
    'books/brown suit/page (170).png',
    'books/brown suit/page (171).png',
    'books/brown suit/page (172).png',
    'books/brown suit/page (173).png',
    'books/brown suit/page (174).png',
    'books/brown suit/page (175).png',
    'books/brown suit/page (176).png',
    'books/brown suit/page (177).png',
    'books/brown suit/page (178).png',
    'books/brown suit/page (179).png',
    'books/brown suit/page (180).png',
    'books/brown suit/page (181).png',
    'books/brown suit/page (182).png',
    'books/brown suit/page (183).png',
    'books/brown suit/page (184).png',
    'books/brown suit/page (185).png',
    'books/brown suit/page (186).png',
    'books/brown suit/page (187).png',
    'books/brown suit/page (188).png',
    'books/brown suit/page (189).png',
    'books/brown suit/page (190).png',
    'books/brown suit/page (191).png',
    'books/brown suit/page (192).png',
    'books/brown suit/page (193).png',
    'books/brown suit/page (194).png',
    'books/brown suit/page (195).png',
    'books/brown suit/page (196).png',
    'books/brown suit/page (197).png',
    'books/brown suit/page (198).png',
    'books/brown suit/page (199).png',
    'books/brown suit/page (200).png',
    'books/brown suit/page (201).png',
    'books/brown suit/page (202).png',
    'books/brown suit/page (203).png',
    'books/brown suit/page (204).png',
    'books/brown suit/page (205).png',
    'books/brown suit/page (206).png',
    'books/brown suit/page (207).png',
    'books/brown suit/page (208).png',
    'books/brown suit/page (209).png',
    'books/brown suit/page (210).png',
    'books/brown suit/page (211).png',
    'books/brown suit/page (212).png',
    'books/brown suit/page (213).png',
    'books/brown suit/page (214).png',
    'books/brown suit/page (215).png',
    'books/brown suit/page (216).png',
    'books/brown suit/page (217).png',
    'books/brown suit/page (218).png',
    'books/brown suit/page (219).png',
    'books/brown suit/page (220).png',
    'books/brown suit/page (221).png',
    'books/brown suit/page (222).png',
    'books/brown suit/page (223).png',
    'books/brown suit/page (224).png',
    'books/brown suit/page (225).png',
    'books/brown suit/page (226).png',
    'books/brown suit/page (227).png',
    'books/brown suit/page (228).png',
    'books/brown suit/page (229).png',
    'books/brown suit/page (230).png',
    'books/brown suit/page (231).png',
    'books/brown suit/page (232).png',
    'books/brown suit/page (233).png',
    'books/brown suit/page (234).png',
    'books/brown suit/page (235).png',
    'books/brown suit/page (236).png',
    'books/brown suit/page (237).png',
    'books/brown suit/page (238).png',
    'books/brown suit/page (239).png',
    'books/brown suit/page (240).png',
    'books/brown suit/page (241).png',
    'books/brown suit/page (242).png',
    'books/brown suit/page (243).png',
    'books/brown suit/page (244).png',
    'books/brown suit/page (245).png',
    'books/brown suit/page (246).png',
    'books/brown suit/page (247).png',
    'books/brown suit/page (248).png',
    'books/brown suit/page (249).png',
    'books/brown suit/page (250).png',
    'books/brown suit/page (251).png',
    'books/brown suit/page (252).png',
    'books/brown suit/page (253).png',
    'books/brown suit/page (254).png',
    'books/brown suit/page (255).png',
    'books/brown suit/page (256).png',
    'books/brown suit/page (257).png',
    'books/brown suit/page (258).png',
    'books/brown suit/page (259).png',
    'books/brown suit/page (260).png',
    'books/brown suit/page (261).png',
    'books/brown suit/page (262).png',
    'books/brown suit/page (263).png',
    'books/brown suit/page (264).png',
    'books/brown suit/page (265).png',
    'books/brown suit/page (266).png',
    'books/brown suit/page (267).png',
    'books/brown suit/page (268).png',
    'books/brown suit/page (269).png',
    'books/brown suit/page (270).png',
    'books/brown suit/page (271).png',
    'books/brown suit/page (272).png',
    'books/brown suit/page (273).png',
    'books/brown suit/page (274).png',
    'books/brown suit/page (275).png',
    'books/brown suit/page (276).png',

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
