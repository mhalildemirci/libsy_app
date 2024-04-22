import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mysteryedwin extends StatefulWidget {
  const mysteryedwin({Key? key}) : super(key: key);

  @override
  State<mysteryedwin> createState() => _mysteryedwinState();
}

class _mysteryedwinState extends State<mysteryedwin> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mystery edwin/page (1).png',
    'books/mystery edwin/page (2).png',
    'books/mystery edwin/page (3).png',
    'books/mystery edwin/page (4).png',
    'books/mystery edwin/page (5).png',
    'books/mystery edwin/page (6).png',
    'books/mystery edwin/page (7).png',
    'books/mystery edwin/page (8).png',
    'books/mystery edwin/page (9).png',
    'books/mystery edwin/page (10).png',
    'books/mystery edwin/page (11).png',
    'books/mystery edwin/page (12).png',
    'books/mystery edwin/page (13).png',
    'books/mystery edwin/page (14).png',
    'books/mystery edwin/page (15).png',
    'books/mystery edwin/page (16).png',
    'books/mystery edwin/page (17).png',
    'books/mystery edwin/page (18).png',
    'books/mystery edwin/page (19).png',
    'books/mystery edwin/page (20).png',
    'books/mystery edwin/page (21).png',
    'books/mystery edwin/page (22).png',
    'books/mystery edwin/page (23).png',
    'books/mystery edwin/page (24).png',
    'books/mystery edwin/page (25).png',
    'books/mystery edwin/page (26).png',
    'books/mystery edwin/page (27).png',
    'books/mystery edwin/page (28).png',
    'books/mystery edwin/page (29).png',
    'books/mystery edwin/page (30).png',
    'books/mystery edwin/page (31).png',
    'books/mystery edwin/page (32).png',
    'books/mystery edwin/page (33).png',
    'books/mystery edwin/page (34).png',
    'books/mystery edwin/page (35).png',
    'books/mystery edwin/page (36).png',
    'books/mystery edwin/page (37).png',
    'books/mystery edwin/page (38).png',
    'books/mystery edwin/page (39).png',
    'books/mystery edwin/page (40).png',
    'books/mystery edwin/page (41).png',
    'books/mystery edwin/page (42).png',
    'books/mystery edwin/page (43).png',
    'books/mystery edwin/page (44).png',
    'books/mystery edwin/page (45).png',
    'books/mystery edwin/page (46).png',
    'books/mystery edwin/page (47).png',
    'books/mystery edwin/page (48).png',
    'books/mystery edwin/page (49).png',
    'books/mystery edwin/page (50).png',
    'books/mystery edwin/page (51).png',
    'books/mystery edwin/page (52).png',
    'books/mystery edwin/page (53).png',
    'books/mystery edwin/page (54).png',
    'books/mystery edwin/page (55).png',
    'books/mystery edwin/page (56).png',
    'books/mystery edwin/page (57).png',
    'books/mystery edwin/page (58).png',
    'books/mystery edwin/page (59).png',
    'books/mystery edwin/page (60).png',
    'books/mystery edwin/page (61).png',
    'books/mystery edwin/page (62).png',
    'books/mystery edwin/page (63).png',
    'books/mystery edwin/page (64).png',
    'books/mystery edwin/page (65).png',
    'books/mystery edwin/page (66).png',
    'books/mystery edwin/page (67).png',
    'books/mystery edwin/page (68).png',
    'books/mystery edwin/page (69).png',
    'books/mystery edwin/page (70).png',
    'books/mystery edwin/page (71).png',
    'books/mystery edwin/page (72).png',
    'books/mystery edwin/page (73).png',
    'books/mystery edwin/page (74).png',
    'books/mystery edwin/page (75).png',
    'books/mystery edwin/page (76).png',
    'books/mystery edwin/page (77).png',
    'books/mystery edwin/page (78).png',
    'books/mystery edwin/page (79).png',
    'books/mystery edwin/page (80).png',
    'books/mystery edwin/page (81).png',
    'books/mystery edwin/page (82).png',
    'books/mystery edwin/page (83).png',
    'books/mystery edwin/page (84).png',
    'books/mystery edwin/page (85).png',
    'books/mystery edwin/page (86).png',
    'books/mystery edwin/page (87).png',
    'books/mystery edwin/page (88).png',
    'books/mystery edwin/page (89).png',
    'books/mystery edwin/page (90).png',
    'books/mystery edwin/page (91).png',
    'books/mystery edwin/page (92).png',
    'books/mystery edwin/page (93).png',
    'books/mystery edwin/page (94).png',
    'books/mystery edwin/page (95).png',
    'books/mystery edwin/page (96).png',
    'books/mystery edwin/page (97).png',
    'books/mystery edwin/page (98).png',
    'books/mystery edwin/page (99).png',
    'books/mystery edwin/page (100).png',
    'books/mystery edwin/page (101).png',
    'books/mystery edwin/page (102).png',
    'books/mystery edwin/page (103).png',
    'books/mystery edwin/page (104).png',
    'books/mystery edwin/page (105).png',
    'books/mystery edwin/page (106).png',
    'books/mystery edwin/page (107).png',
    'books/mystery edwin/page (108).png',
    'books/mystery edwin/page (109).png',
    'books/mystery edwin/page (110).png',
    'books/mystery edwin/page (111).png',
    'books/mystery edwin/page (112).png',
    'books/mystery edwin/page (113).png',
    'books/mystery edwin/page (114).png',
    'books/mystery edwin/page (115).png',
    'books/mystery edwin/page (116).png',
    'books/mystery edwin/page (117).png',
    'books/mystery edwin/page (118).png',
    'books/mystery edwin/page (119).png',
    'books/mystery edwin/page (120).png',
    'books/mystery edwin/page (121).png',
    'books/mystery edwin/page (122).png',
    'books/mystery edwin/page (123).png',
    'books/mystery edwin/page (124).png',
    'books/mystery edwin/page (125).png',
    'books/mystery edwin/page (126).png',
    'books/mystery edwin/page (127).png',
    'books/mystery edwin/page (128).png',
    'books/mystery edwin/page (129).png',
    'books/mystery edwin/page (130).png',
    'books/mystery edwin/page (131).png',
    'books/mystery edwin/page (132).png',
    'books/mystery edwin/page (133).png',
    'books/mystery edwin/page (134).png',
    'books/mystery edwin/page (135).png',
    'books/mystery edwin/page (136).png',
    'books/mystery edwin/page (137).png',
    'books/mystery edwin/page (138).png',
    'books/mystery edwin/page (139).png',
    'books/mystery edwin/page (140).png',
    'books/mystery edwin/page (141).png',
    'books/mystery edwin/page (142).png',
    'books/mystery edwin/page (143).png',
    'books/mystery edwin/page (144).png',
    'books/mystery edwin/page (145).png',
    'books/mystery edwin/page (146).png',
    'books/mystery edwin/page (147).png',
    'books/mystery edwin/page (148).png',
    'books/mystery edwin/page (149).png',
    'books/mystery edwin/page (150).png',
    'books/mystery edwin/page (151).png',
    'books/mystery edwin/page (152).png',
    'books/mystery edwin/page (153).png',
    'books/mystery edwin/page (154).png',
    'books/mystery edwin/page (155).png',
    'books/mystery edwin/page (156).png',
    'books/mystery edwin/page (157).png',
    'books/mystery edwin/page (158).png',
    'books/mystery edwin/page (159).png',
    'books/mystery edwin/page (160).png',
    'books/mystery edwin/page (161).png',
    'books/mystery edwin/page (162).png',
    'books/mystery edwin/page (163).png',
    'books/mystery edwin/page (164).png',
    'books/mystery edwin/page (165).png',
    'books/mystery edwin/page (166).png',
    'books/mystery edwin/page (167).png',
    'books/mystery edwin/page (168).png',
    'books/mystery edwin/page (169).png',
    'books/mystery edwin/page (170).png',
    'books/mystery edwin/page (171).png',
    'books/mystery edwin/page (172).png',
    'books/mystery edwin/page (173).png',
    'books/mystery edwin/page (174).png',
    'books/mystery edwin/page (175).png',
    'books/mystery edwin/page (176).png',
    'books/mystery edwin/page (177).png',
    'books/mystery edwin/page (178).png',
    'books/mystery edwin/page (179).png',
    'books/mystery edwin/page (180).png',
    'books/mystery edwin/page (181).png',
    'books/mystery edwin/page (182).png',
    'books/mystery edwin/page (183).png',
    'books/mystery edwin/page (184).png',
    'books/mystery edwin/page (185).png',
    'books/mystery edwin/page (186).png',
    'books/mystery edwin/page (187).png',
    'books/mystery edwin/page (188).png',
    'books/mystery edwin/page (189).png',
    'books/mystery edwin/page (190).png',
    'books/mystery edwin/page (191).png',
    'books/mystery edwin/page (192).png',
    'books/mystery edwin/page (193).png',
    'books/mystery edwin/page (194).png',
    'books/mystery edwin/page (195).png',
    'books/mystery edwin/page (196).png',
    'books/mystery edwin/page (197).png',
    'books/mystery edwin/page (198).png',
    'books/mystery edwin/page (199).png',
    'books/mystery edwin/page (200).png',
    'books/mystery edwin/page (201).png',
    'books/mystery edwin/page (202).png',
    'books/mystery edwin/page (203).png',
    'books/mystery edwin/page (204).png',
    'books/mystery edwin/page (205).png',
    'books/mystery edwin/page (206).png',
    'books/mystery edwin/page (207).png',
    'books/mystery edwin/page (208).png',
    'books/mystery edwin/page (209).png',
    'books/mystery edwin/page (210).png',
    'books/mystery edwin/page (211).png',
    'books/mystery edwin/page (212).png',
    'books/mystery edwin/page (213).png',
    'books/mystery edwin/page (214).png',
    'books/mystery edwin/page (215).png',
    'books/mystery edwin/page (216).png',
    'books/mystery edwin/page (217).png',
    'books/mystery edwin/page (218).png',
    'books/mystery edwin/page (219).png',
    'books/mystery edwin/page (220).png',
    'books/mystery edwin/page (221).png',
    'books/mystery edwin/page (222).png',
    'books/mystery edwin/page (223).png',
    'books/mystery edwin/page (224).png',
    'books/mystery edwin/page (225).png',
    'books/mystery edwin/page (226).png',
    'books/mystery edwin/page (227).png',
    'books/mystery edwin/page (228).png',
    'books/mystery edwin/page (229).png',
    'books/mystery edwin/page (230).png',
    'books/mystery edwin/page (231).png',
    'books/mystery edwin/page (232).png',
    'books/mystery edwin/page (233).png',
    'books/mystery edwin/page (234).png',
    'books/mystery edwin/page (235).png',
    'books/mystery edwin/page (236).png',
    'books/mystery edwin/page (237).png',
    'books/mystery edwin/page (238).png',
    'books/mystery edwin/page (239).png',
    'books/mystery edwin/page (240).png',
    'books/mystery edwin/page (241).png',
    'books/mystery edwin/page (242).png',
    'books/mystery edwin/page (243).png',
    'books/mystery edwin/page (244).png',
    'books/mystery edwin/page (245).png',
    'books/mystery edwin/page (246).png',
    'books/mystery edwin/page (247).png',
    'books/mystery edwin/page (248).png',
    'books/mystery edwin/page (249).png',
    'books/mystery edwin/page (250).png',
    'books/mystery edwin/page (251).png',
    'books/mystery edwin/page (252).png',
    'books/mystery edwin/page (253).png',
    'books/mystery edwin/page (254).png',
    'books/mystery edwin/page (255).png',
    'books/mystery edwin/page (256).png',
    'books/mystery edwin/page (257).png',
    'books/mystery edwin/page (258).png',
    'books/mystery edwin/page (259).png',
    'books/mystery edwin/page (260).png',
    'books/mystery edwin/page (261).png',

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
