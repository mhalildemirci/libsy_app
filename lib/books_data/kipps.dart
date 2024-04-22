import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kipps extends StatefulWidget {
  const kipps({Key? key}) : super(key: key);

  @override
  State<kipps> createState() => _kippsState();
}

class _kippsState extends State<kipps> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kipps/page (1).png',
    'books/kipps/page (2).png',
    'books/kipps/page (3).png',
    'books/kipps/page (4).png',
    'books/kipps/page (5).png',
    'books/kipps/page (6).png',
    'books/kipps/page (7).png',
    'books/kipps/page (8).png',
    'books/kipps/page (9).png',
    'books/kipps/page (10).png',
    'books/kipps/page (11).png',
    'books/kipps/page (12).png',
    'books/kipps/page (13).png',
    'books/kipps/page (14).png',
    'books/kipps/page (15).png',
    'books/kipps/page (16).png',
    'books/kipps/page (17).png',
    'books/kipps/page (18).png',
    'books/kipps/page (19).png',
    'books/kipps/page (20).png',
    'books/kipps/page (21).png',
    'books/kipps/page (22).png',
    'books/kipps/page (23).png',
    'books/kipps/page (24).png',
    'books/kipps/page (25).png',
    'books/kipps/page (26).png',
    'books/kipps/page (27).png',
    'books/kipps/page (28).png',
    'books/kipps/page (29).png',
    'books/kipps/page (30).png',
    'books/kipps/page (31).png',
    'books/kipps/page (32).png',
    'books/kipps/page (33).png',
    'books/kipps/page (34).png',
    'books/kipps/page (35).png',
    'books/kipps/page (36).png',
    'books/kipps/page (37).png',
    'books/kipps/page (38).png',
    'books/kipps/page (39).png',
    'books/kipps/page (40).png',
    'books/kipps/page (41).png',
    'books/kipps/page (42).png',
    'books/kipps/page (43).png',
    'books/kipps/page (44).png',
    'books/kipps/page (45).png',
    'books/kipps/page (46).png',
    'books/kipps/page (47).png',
    'books/kipps/page (48).png',
    'books/kipps/page (49).png',
    'books/kipps/page (50).png',
    'books/kipps/page (51).png',
    'books/kipps/page (52).png',
    'books/kipps/page (53).png',
    'books/kipps/page (54).png',
    'books/kipps/page (55).png',
    'books/kipps/page (56).png',
    'books/kipps/page (57).png',
    'books/kipps/page (58).png',
    'books/kipps/page (59).png',
    'books/kipps/page (60).png',
    'books/kipps/page (61).png',
    'books/kipps/page (62).png',
    'books/kipps/page (63).png',
    'books/kipps/page (64).png',
    'books/kipps/page (65).png',
    'books/kipps/page (66).png',
    'books/kipps/page (67).png',
    'books/kipps/page (68).png',
    'books/kipps/page (69).png',
    'books/kipps/page (70).png',
    'books/kipps/page (71).png',
    'books/kipps/page (72).png',
    'books/kipps/page (73).png',
    'books/kipps/page (74).png',
    'books/kipps/page (75).png',
    'books/kipps/page (76).png',
    'books/kipps/page (77).png',
    'books/kipps/page (78).png',
    'books/kipps/page (79).png',
    'books/kipps/page (80).png',
    'books/kipps/page (81).png',
    'books/kipps/page (82).png',
    'books/kipps/page (83).png',
    'books/kipps/page (84).png',
    'books/kipps/page (85).png',
    'books/kipps/page (86).png',
    'books/kipps/page (87).png',
    'books/kipps/page (88).png',
    'books/kipps/page (89).png',
    'books/kipps/page (90).png',
    'books/kipps/page (91).png',
    'books/kipps/page (92).png',
    'books/kipps/page (93).png',
    'books/kipps/page (94).png',
    'books/kipps/page (95).png',
    'books/kipps/page (96).png',
    'books/kipps/page (97).png',
    'books/kipps/page (98).png',
    'books/kipps/page (99).png',
    'books/kipps/page (100).png',
    'books/kipps/page (101).png',
    'books/kipps/page (102).png',
    'books/kipps/page (103).png',
    'books/kipps/page (104).png',
    'books/kipps/page (105).png',
    'books/kipps/page (106).png',
    'books/kipps/page (107).png',
    'books/kipps/page (108).png',
    'books/kipps/page (109).png',
    'books/kipps/page (110).png',
    'books/kipps/page (111).png',
    'books/kipps/page (112).png',
    'books/kipps/page (113).png',
    'books/kipps/page (114).png',
    'books/kipps/page (115).png',
    'books/kipps/page (116).png',
    'books/kipps/page (117).png',
    'books/kipps/page (118).png',
    'books/kipps/page (119).png',
    'books/kipps/page (120).png',
    'books/kipps/page (121).png',
    'books/kipps/page (122).png',
    'books/kipps/page (123).png',
    'books/kipps/page (124).png',
    'books/kipps/page (125).png',
    'books/kipps/page (126).png',
    'books/kipps/page (127).png',
    'books/kipps/page (128).png',
    'books/kipps/page (129).png',
    'books/kipps/page (130).png',
    'books/kipps/page (131).png',
    'books/kipps/page (132).png',
    'books/kipps/page (133).png',
    'books/kipps/page (134).png',
    'books/kipps/page (135).png',
    'books/kipps/page (136).png',
    'books/kipps/page (137).png',
    'books/kipps/page (138).png',
    'books/kipps/page (139).png',
    'books/kipps/page (140).png',
    'books/kipps/page (141).png',
    'books/kipps/page (142).png',
    'books/kipps/page (143).png',
    'books/kipps/page (144).png',
    'books/kipps/page (145).png',
    'books/kipps/page (146).png',
    'books/kipps/page (147).png',
    'books/kipps/page (148).png',
    'books/kipps/page (149).png',
    'books/kipps/page (150).png',
    'books/kipps/page (151).png',
    'books/kipps/page (152).png',
    'books/kipps/page (153).png',
    'books/kipps/page (154).png',
    'books/kipps/page (155).png',
    'books/kipps/page (156).png',
    'books/kipps/page (157).png',
    'books/kipps/page (158).png',
    'books/kipps/page (159).png',
    'books/kipps/page (160).png',
    'books/kipps/page (161).png',
    'books/kipps/page (162).png',
    'books/kipps/page (163).png',
    'books/kipps/page (164).png',
    'books/kipps/page (165).png',
    'books/kipps/page (166).png',
    'books/kipps/page (167).png',
    'books/kipps/page (168).png',
    'books/kipps/page (169).png',
    'books/kipps/page (170).png',
    'books/kipps/page (171).png',
    'books/kipps/page (172).png',
    'books/kipps/page (173).png',
    'books/kipps/page (174).png',
    'books/kipps/page (175).png',
    'books/kipps/page (176).png',
    'books/kipps/page (177).png',
    'books/kipps/page (178).png',
    'books/kipps/page (179).png',
    'books/kipps/page (180).png',
    'books/kipps/page (181).png',
    'books/kipps/page (182).png',
    'books/kipps/page (183).png',
    'books/kipps/page (184).png',
    'books/kipps/page (185).png',
    'books/kipps/page (186).png',
    'books/kipps/page (187).png',
    'books/kipps/page (188).png',
    'books/kipps/page (189).png',
    'books/kipps/page (190).png',
    'books/kipps/page (191).png',
    'books/kipps/page (192).png',
    'books/kipps/page (193).png',
    'books/kipps/page (194).png',
    'books/kipps/page (195).png',
    'books/kipps/page (196).png',
    'books/kipps/page (197).png',
    'books/kipps/page (198).png',
    'books/kipps/page (199).png',
    'books/kipps/page (200).png',
    'books/kipps/page (201).png',
    'books/kipps/page (202).png',
    'books/kipps/page (203).png',
    'books/kipps/page (204).png',
    'books/kipps/page (205).png',
    'books/kipps/page (206).png',
    'books/kipps/page (207).png',
    'books/kipps/page (208).png',
    'books/kipps/page (209).png',
    'books/kipps/page (210).png',
    'books/kipps/page (211).png',
    'books/kipps/page (212).png',
    'books/kipps/page (213).png',
    'books/kipps/page (214).png',
    'books/kipps/page (215).png',
    'books/kipps/page (216).png',
    'books/kipps/page (217).png',
    'books/kipps/page (218).png',
    'books/kipps/page (219).png',
    'books/kipps/page (220).png',
    'books/kipps/page (221).png',
    'books/kipps/page (222).png',
    'books/kipps/page (223).png',
    'books/kipps/page (224).png',
    'books/kipps/page (225).png',
    'books/kipps/page (226).png',
    'books/kipps/page (227).png',
    'books/kipps/page (228).png',
    'books/kipps/page (229).png',
    'books/kipps/page (230).png',
    'books/kipps/page (231).png',
    'books/kipps/page (232).png',
    'books/kipps/page (233).png',
    'books/kipps/page (234).png',
    'books/kipps/page (235).png',
    'books/kipps/page (236).png',
    'books/kipps/page (237).png',
    'books/kipps/page (238).png',
    'books/kipps/page (239).png',
    'books/kipps/page (240).png',
    'books/kipps/page (241).png',
    'books/kipps/page (242).png',
    'books/kipps/page (243).png',
    'books/kipps/page (244).png',
    'books/kipps/page (245).png',
    'books/kipps/page (246).png',
    'books/kipps/page (247).png',
    'books/kipps/page (248).png',
    'books/kipps/page (249).png',
    'books/kipps/page (250).png',
    'books/kipps/page (251).png',
    'books/kipps/page (252).png',
    'books/kipps/page (253).png',
    'books/kipps/page (254).png',
    'books/kipps/page (255).png',
    'books/kipps/page (256).png',
    'books/kipps/page (257).png',
    'books/kipps/page (258).png',
    'books/kipps/page (259).png',
    'books/kipps/page (260).png',
    'books/kipps/page (261).png',
    'books/kipps/page (262).png',
    'books/kipps/page (263).png',
    'books/kipps/page (264).png',
    'books/kipps/page (265).png',
    'books/kipps/page (266).png',
    'books/kipps/page (267).png',
    'books/kipps/page (268).png',
    'books/kipps/page (269).png',
    'books/kipps/page (270).png',
    'books/kipps/page (271).png',
    'books/kipps/page (272).png',
    'books/kipps/page (273).png',
    'books/kipps/page (274).png',
    'books/kipps/page (275).png',
    'books/kipps/page (276).png',
    'books/kipps/page (277).png',
    'books/kipps/page (278).png',
    'books/kipps/page (279).png',

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
