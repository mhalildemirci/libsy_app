import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class huzur extends StatefulWidget {
  const huzur({Key? key}) : super(key: key);

  @override
  State<huzur> createState() => _huzurState();
}

class _huzurState extends State<huzur> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/hzur/page (1).png',
    'books/hzur/page (2).png',
    'books/hzur/page (3).png',
    'books/hzur/page (4).png',
    'books/hzur/page (5).png',
    'books/hzur/page (6).png',
    'books/hzur/page (7).png',
    'books/hzur/page (8).png',
    'books/hzur/page (9).png',
    'books/hzur/page (10).png',
    'books/hzur/page (11).png',
    'books/hzur/page (12).png',
    'books/hzur/page (13).png',
    'books/hzur/page (14).png',
    'books/hzur/page (15).png',
    'books/hzur/page (16).png',
    'books/hzur/page (17).png',
    'books/hzur/page (18).png',
    'books/hzur/page (19).png',
    'books/hzur/page (20).png',
    'books/hzur/page (21).png',
    'books/hzur/page (22).png',
    'books/hzur/page (23).png',
    'books/hzur/page (24).png',
    'books/hzur/page (25).png',
    'books/hzur/page (26).png',
    'books/hzur/page (27).png',
    'books/hzur/page (28).png',
    'books/hzur/page (29).png',
    'books/hzur/page (30).png',
    'books/hzur/page (31).png',
    'books/hzur/page (32).png',
    'books/hzur/page (33).png',
    'books/hzur/page (34).png',
    'books/hzur/page (35).png',
    'books/hzur/page (36).png',
    'books/hzur/page (37).png',
    'books/hzur/page (38).png',
    'books/hzur/page (39).png',
    'books/hzur/page (40).png',
    'books/hzur/page (41).png',
    'books/hzur/page (42).png',
    'books/hzur/page (43).png',
    'books/hzur/page (44).png',
    'books/hzur/page (45).png',
    'books/hzur/page (46).png',
    'books/hzur/page (47).png',
    'books/hzur/page (48).png',
    'books/hzur/page (49).png',
    'books/hzur/page (50).png',
    'books/hzur/page (51).png',
    'books/hzur/page (52).png',
    'books/hzur/page (53).png',
    'books/hzur/page (54).png',
    'books/hzur/page (55).png',
    'books/hzur/page (56).png',
    'books/hzur/page (57).png',
    'books/hzur/page (58).png',
    'books/hzur/page (59).png',
    'books/hzur/page (60).png',
    'books/hzur/page (61).png',
    'books/hzur/page (62).png',
    'books/hzur/page (63).png',
    'books/hzur/page (64).png',
    'books/hzur/page (65).png',
    'books/hzur/page (66).png',
    'books/hzur/page (67).png',
    'books/hzur/page (68).png',
    'books/hzur/page (69).png',
    'books/hzur/page (70).png',
    'books/hzur/page (71).png',
    'books/hzur/page (72).png',
    'books/hzur/page (73).png',
    'books/hzur/page (74).png',
    'books/hzur/page (75).png',
    'books/hzur/page (76).png',
    'books/hzur/page (77).png',
    'books/hzur/page (78).png',
    'books/hzur/page (79).png',
    'books/hzur/page (80).png',
    'books/hzur/page (81).png',
    'books/hzur/page (82).png',
    'books/hzur/page (83).png',
    'books/hzur/page (84).png',
    'books/hzur/page (85).png',
    'books/hzur/page (86).png',
    'books/hzur/page (87).png',
    'books/hzur/page (88).png',
    'books/hzur/page (89).png',
    'books/hzur/page (90).png',
    'books/hzur/page (91).png',
    'books/hzur/page (92).png',
    'books/hzur/page (93).png',
    'books/hzur/page (94).png',
    'books/hzur/page (95).png',
    'books/hzur/page (96).png',
    'books/hzur/page (97).png',
    'books/hzur/page (98).png',
    'books/hzur/page (99).png',
    'books/hzur/page (100).png',
    'books/hzur/page (101).png',
    'books/hzur/page (102).png',
    'books/hzur/page (103).png',
    'books/hzur/page (104).png',
    'books/hzur/page (105).png',
    'books/hzur/page (106).png',
    'books/hzur/page (107).png',
    'books/hzur/page (108).png',
    'books/hzur/page (109).png',
    'books/hzur/page (110).png',
    'books/hzur/page (111).png',
    'books/hzur/page (112).png',
    'books/hzur/page (113).png',
    'books/hzur/page (114).png',
    'books/hzur/page (115).png',
    'books/hzur/page (116).png',
    'books/hzur/page (117).png',
    'books/hzur/page (118).png',
    'books/hzur/page (119).png',
    'books/hzur/page (120).png',
    'books/hzur/page (121).png',
    'books/hzur/page (122).png',
    'books/hzur/page (123).png',
    'books/hzur/page (124).png',
    'books/hzur/page (125).png',
    'books/hzur/page (126).png',
    'books/hzur/page (127).png',
    'books/hzur/page (128).png',
    'books/hzur/page (129).png',
    'books/hzur/page (130).png',
    'books/hzur/page (131).png',
    'books/hzur/page (132).png',
    'books/hzur/page (133).png',
    'books/hzur/page (134).png',
    'books/hzur/page (135).png',
    'books/hzur/page (136).png',
    'books/hzur/page (137).png',
    'books/hzur/page (138).png',
    'books/hzur/page (139).png',
    'books/hzur/page (140).png',
    'books/hzur/page (141).png',
    'books/hzur/page (142).png',
    'books/hzur/page (143).png',
    'books/hzur/page (144).png',
    'books/hzur/page (145).png',
    'books/hzur/page (146).png',
    'books/hzur/page (147).png',
    'books/hzur/page (148).png',
    'books/hzur/page (149).png',
    'books/hzur/page (150).png',
    'books/hzur/page (151).png',
    'books/hzur/page (152).png',
    'books/hzur/page (153).png',
    'books/hzur/page (154).png',
    'books/hzur/page (155).png',
    'books/hzur/page (156).png',
    'books/hzur/page (157).png',
    'books/hzur/page (158).png',
    'books/hzur/page (159).png',
    'books/hzur/page (160).png',
    'books/hzur/page (161).png',
    'books/hzur/page (162).png',
    'books/hzur/page (163).png',
    'books/hzur/page (164).png',
    'books/hzur/page (165).png',
    'books/hzur/page (166).png',
    'books/hzur/page (167).png',
    'books/hzur/page (168).png',
    'books/hzur/page (169).png',
    'books/hzur/page (170).png',
    'books/hzur/page (171).png',
    'books/hzur/page (172).png',
    'books/hzur/page (173).png',
    'books/hzur/page (174).png',
    'books/hzur/page (175).png',
    'books/hzur/page (176).png',
    'books/hzur/page (177).png',
    'books/hzur/page (178).png',
    'books/hzur/page (179).png',
    'books/hzur/page (180).png',
    'books/hzur/page (181).png',
    'books/hzur/page (182).png',
    'books/hzur/page (183).png',
    'books/hzur/page (184).png',
    'books/hzur/page (185).png',
    'books/hzur/page (186).png',
    'books/hzur/page (187).png',
    'books/hzur/page (188).png',
    'books/hzur/page (189).png',
    'books/hzur/page (190).png',
    'books/hzur/page (191).png',
    'books/hzur/page (192).png',
    'books/hzur/page (193).png',
    'books/hzur/page (194).png',
    'books/hzur/page (195).png',
    'books/hzur/page (196).png',
    'books/hzur/page (197).png',
    'books/hzur/page (198).png',
    'books/hzur/page (199).png',
    'books/hzur/page (200).png',
    'books/hzur/page (201).png',
    'books/hzur/page (202).png',
    'books/hzur/page (203).png',
    'books/hzur/page (204).png',
    'books/hzur/page (205).png',
    'books/hzur/page (206).png',
    'books/hzur/page (207).png',
    'books/hzur/page (208).png',
    'books/hzur/page (209).png',
    'books/hzur/page (210).png',
    'books/hzur/page (211).png',
    'books/hzur/page (212).png',
    'books/hzur/page (213).png',
    'books/hzur/page (214).png',
    'books/hzur/page (215).png',
    'books/hzur/page (216).png',
    'books/hzur/page (217).png',
    'books/hzur/page (218).png',
    'books/hzur/page (219).png',
    'books/hzur/page (220).png',
    'books/hzur/page (221).png',
    'books/hzur/page (222).png',
    'books/hzur/page (223).png',
    'books/hzur/page (224).png',
    'books/hzur/page (225).png',
    'books/hzur/page (226).png',
    'books/hzur/page (227).png',
    'books/hzur/page (228).png',
    'books/hzur/page (229).png',
    'books/hzur/page (230).png',
    'books/hzur/page (231).png',
    'books/hzur/page (232).png',
    'books/hzur/page (233).png',
    'books/hzur/page (234).png',
    'books/hzur/page (235).png',
    'books/hzur/page (236).png',
    'books/hzur/page (237).png',
    'books/hzur/page (238).png',
    'books/hzur/page (239).png',
    'books/hzur/page (240).png',
    'books/hzur/page (241).png',
    'books/hzur/page (242).png',
    'books/hzur/page (243).png',
    'books/hzur/page (244).png',
    'books/hzur/page (245).png',
    'books/hzur/page (246).png',
    'books/hzur/page (247).png',
    'books/hzur/page (248).png',
    'books/hzur/page (249).png',
    'books/hzur/page (250).png',
    'books/hzur/page (251).png',
    'books/hzur/page (252).png',
    'books/hzur/page (253).png',
    'books/hzur/page (254).png',
    'books/hzur/page (255).png',
    'books/hzur/page (256).png',
    'books/hzur/page (257).png',
    'books/hzur/page (258).png',
    'books/hzur/page (259).png',
    'books/hzur/page (260).png',
    'books/hzur/page (261).png',
    'books/hzur/page (262).png',
    'books/hzur/page (263).png',
    'books/hzur/page (264).png',
    'books/hzur/page (265).png',
    'books/hzur/page (266).png',
    'books/hzur/page (267).png',
    'books/hzur/page (268).png',
    'books/hzur/page (269).png',
    'books/hzur/page (270).png',
    'books/hzur/page (271).png',
    'books/hzur/page (272).png',
    'books/hzur/page (273).png',
    'books/hzur/page (274).png',
    'books/hzur/page (275).png',
    'books/hzur/page (276).png',
    'books/hzur/page (277).png',
    'books/hzur/page (278).png',
    'books/hzur/page (279).png',
    'books/hzur/page (280).png',
    'books/hzur/page (281).png',

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
