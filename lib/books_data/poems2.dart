import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class poemstwo extends StatefulWidget {
  const poemstwo({Key? key}) : super(key: key);

  @override
  State<poemstwo> createState() => _poemstwoState();
}

class _poemstwoState extends State<poemstwo> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/2 Poems/page (1).png',
    'books/2 Poems/page (2).png',
    'books/2 Poems/page (3).png',
    'books/2 Poems/page (4).png',
    'books/2 Poems/page (5).png',
    'books/2 Poems/page (6).png',
    'books/2 Poems/page (7).png',
    'books/2 Poems/page (8).png',
    'books/2 Poems/page (9).png',
    'books/2 Poems/page (10).png',
    'books/2 Poems/page (11).png',
    'books/2 Poems/page (12).png',
    'books/2 Poems/page (13).png',
    'books/2 Poems/page (14).png',
    'books/2 Poems/page (15).png',
    'books/2 Poems/page (16).png',
    'books/2 Poems/page (17).png',
    'books/2 Poems/page (18).png',
    'books/2 Poems/page (19).png',
    'books/2 Poems/page (20).png',
    'books/2 Poems/page (21).png',
    'books/2 Poems/page (22).png',
    'books/2 Poems/page (23).png',
    'books/2 Poems/page (24).png',
    'books/2 Poems/page (25).png',
    'books/2 Poems/page (26).png',
    'books/2 Poems/page (27).png',
    'books/2 Poems/page (28).png',
    'books/2 Poems/page (29).png',
    'books/2 Poems/page (30).png',
    'books/2 Poems/page (31).png',
    'books/2 Poems/page (32).png',
    'books/2 Poems/page (33).png',
    'books/2 Poems/page (34).png',
    'books/2 Poems/page (35).png',
    'books/2 Poems/page (36).png',
    'books/2 Poems/page (37).png',
    'books/2 Poems/page (38).png',
    'books/2 Poems/page (39).png',
    'books/2 Poems/page (40).png',
    'books/2 Poems/page (41).png',
    'books/2 Poems/page (42).png',
    'books/2 Poems/page (43).png',
    'books/2 Poems/page (44).png',
    'books/2 Poems/page (45).png',
    'books/2 Poems/page (46).png',
    'books/2 Poems/page (47).png',
    'books/2 Poems/page (48).png',
    'books/2 Poems/page (49).png',
    'books/2 Poems/page (50).png',
    'books/2 Poems/page (51).png',
    'books/2 Poems/page (52).png',
    'books/2 Poems/page (53).png',
    'books/2 Poems/page (54).png',
    'books/2 Poems/page (55).png',
    'books/2 Poems/page (56).png',
    'books/2 Poems/page (57).png',
    'books/2 Poems/page (58).png',
    'books/2 Poems/page (59).png',
    'books/2 Poems/page (60).png',
    'books/2 Poems/page (61).png',
    'books/2 Poems/page (62).png',
    'books/2 Poems/page (63).png',
    'books/2 Poems/page (64).png',
    'books/2 Poems/page (65).png',
    'books/2 Poems/page (66).png',
    'books/2 Poems/page (67).png',
    'books/2 Poems/page (68).png',
    'books/2 Poems/page (69).png',
    'books/2 Poems/page (70).png',
    'books/2 Poems/page (71).png',
    'books/2 Poems/page (72).png',
    'books/2 Poems/page (73).png',
    'books/2 Poems/page (74).png',
    'books/2 Poems/page (75).png',
    'books/2 Poems/page (76).png',
    'books/2 Poems/page (77).png',
    'books/2 Poems/page (78).png',
    'books/2 Poems/page (79).png',
    'books/2 Poems/page (80).png',
    'books/2 Poems/page (81).png',
    'books/2 Poems/page (82).png',
    'books/2 Poems/page (83).png',
    'books/2 Poems/page (84).png',
    'books/2 Poems/page (85).png',
    'books/2 Poems/page (86).png',
    'books/2 Poems/page (87).png',
    'books/2 Poems/page (88).png',
    'books/2 Poems/page (89).png',
    'books/2 Poems/page (90).png',
    'books/2 Poems/page (91).png',
    'books/2 Poems/page (92).png',
    'books/2 Poems/page (93).png',
    'books/2 Poems/page (94).png',
    'books/2 Poems/page (95).png',
    'books/2 Poems/page (96).png',
    'books/2 Poems/page (97).png',
    'books/2 Poems/page (98).png',
    'books/2 Poems/page (99).png',
    'books/2 Poems/page (100).png',
    'books/2 Poems/page (101).png',
    'books/2 Poems/page (102).png',
    'books/2 Poems/page (103).png',
    'books/2 Poems/page (104).png',
    'books/2 Poems/page (105).png',
    'books/2 Poems/page (106).png',
    'books/2 Poems/page (107).png',
    'books/2 Poems/page (108).png',
    'books/2 Poems/page (109).png',
    'books/2 Poems/page (110).png',
    'books/2 Poems/page (111).png',
    'books/2 Poems/page (112).png',
    'books/2 Poems/page (113).png',
    'books/2 Poems/page (114).png',
    'books/2 Poems/page (115).png',
    'books/2 Poems/page (116).png',
    'books/2 Poems/page (117).png',
    'books/2 Poems/page (118).png',
    'books/2 Poems/page (119).png',
    'books/2 Poems/page (120).png',
    'books/2 Poems/page (121).png',
    'books/2 Poems/page (122).png',
    'books/2 Poems/page (123).png',
    'books/2 Poems/page (124).png',
    'books/2 Poems/page (125).png',
    'books/2 Poems/page (126).png',
    'books/2 Poems/page (127).png',
    'books/2 Poems/page (128).png',
    'books/2 Poems/page (129).png',
    'books/2 Poems/page (130).png',
    'books/2 Poems/page (131).png',
    'books/2 Poems/page (132).png',
    'books/2 Poems/page (133).png',
    'books/2 Poems/page (134).png',
    'books/2 Poems/page (135).png',
    'books/2 Poems/page (136).png',
    'books/2 Poems/page (137).png',
    'books/2 Poems/page (138).png',
    'books/2 Poems/page (139).png',
    'books/2 Poems/page (140).png',
    'books/2 Poems/page (141).png',
    'books/2 Poems/page (142).png',
    'books/2 Poems/page (143).png',
    'books/2 Poems/page (144).png',
    'books/2 Poems/page (145).png',
    'books/2 Poems/page (146).png',
    'books/2 Poems/page (147).png',
    'books/2 Poems/page (148).png',
    'books/2 Poems/page (149).png',
    'books/2 Poems/page (150).png',
    'books/2 Poems/page (151).png',
    'books/2 Poems/page (152).png',
    'books/2 Poems/page (153).png',
    'books/2 Poems/page (154).png',
    'books/2 Poems/page (155).png',
    'books/2 Poems/page (156).png',
    'books/2 Poems/page (157).png',
    'books/2 Poems/page (158).png',
    'books/2 Poems/page (159).png',
    'books/2 Poems/page (160).png',
    'books/2 Poems/page (161).png',
    'books/2 Poems/page (162).png',
    'books/2 Poems/page (163).png',
    'books/2 Poems/page (164).png',
    'books/2 Poems/page (165).png',
    'books/2 Poems/page (166).png',
    'books/2 Poems/page (167).png',
    'books/2 Poems/page (168).png',
    'books/2 Poems/page (169).png',
    'books/2 Poems/page (170).png',
    'books/2 Poems/page (171).png',
    'books/2 Poems/page (172).png',
    'books/2 Poems/page (173).png',
    'books/2 Poems/page (174).png',
    'books/2 Poems/page (175).png',
    'books/2 Poems/page (176).png',
    'books/2 Poems/page (177).png',
    'books/2 Poems/page (178).png',
    'books/2 Poems/page (179).png',
    'books/2 Poems/page (180).png',
    'books/2 Poems/page (181).png',
    'books/2 Poems/page (182).png',
    'books/2 Poems/page (183).png',
    'books/2 Poems/page (184).png',
    'books/2 Poems/page (185).png',
    'books/2 Poems/page (186).png',
    'books/2 Poems/page (187).png',
    'books/2 Poems/page (188).png',
    'books/2 Poems/page (189).png',
    'books/2 Poems/page (190).png',
    'books/2 Poems/page (191).png',
    'books/2 Poems/page (192).png',
    'books/2 Poems/page (193).png',
    'books/2 Poems/page (194).png',
    'books/2 Poems/page (195).png',
    'books/2 Poems/page (196).png',
    'books/2 Poems/page (197).png',
    'books/2 Poems/page (198).png',
    'books/2 Poems/page (199).png',
    'books/2 Poems/page (200).png',
    'books/2 Poems/page (201).png',
    'books/2 Poems/page (202).png',
    'books/2 Poems/page (203).png',
    'books/2 Poems/page (204).png',
    'books/2 Poems/page (205).png',
    'books/2 Poems/page (206).png',
    'books/2 Poems/page (207).png',
    'books/2 Poems/page (208).png',
    'books/2 Poems/page (209).png',
    'books/2 Poems/page (210).png',
    'books/2 Poems/page (211).png',
    'books/2 Poems/page (212).png',
    'books/2 Poems/page (213).png',
    'books/2 Poems/page (214).png',
    'books/2 Poems/page (215).png',
    'books/2 Poems/page (216).png',
    'books/2 Poems/page (217).png',
    'books/2 Poems/page (218).png',
    'books/2 Poems/page (219).png',
    'books/2 Poems/page (220).png',
    'books/2 Poems/page (221).png',
    'books/2 Poems/page (222).png',
    'books/2 Poems/page (223).png',
    'books/2 Poems/page (224).png',
    'books/2 Poems/page (225).png',
    'books/2 Poems/page (226).png',
    'books/2 Poems/page (227).png',
    'books/2 Poems/page (228).png',
    'books/2 Poems/page (229).png',
    'books/2 Poems/page (230).png',
    'books/2 Poems/page (231).png',
    'books/2 Poems/page (232).png',
    'books/2 Poems/page (233).png',
    'books/2 Poems/page (234).png',
    'books/2 Poems/page (235).png',
    'books/2 Poems/page (236).png',
    'books/2 Poems/page (237).png',
    'books/2 Poems/page (238).png',
    'books/2 Poems/page (239).png',
    'books/2 Poems/page (240).png',
    'books/2 Poems/page (241).png',
    'books/2 Poems/page (242).png',
    'books/2 Poems/page (243).png',
    'books/2 Poems/page (244).png',
    'books/2 Poems/page (245).png',
    'books/2 Poems/page (246).png',
    'books/2 Poems/page (247).png',
    'books/2 Poems/page (248).png',
    'books/2 Poems/page (249).png',
    'books/2 Poems/page (250).png',
    'books/2 Poems/page (251).png',
    'books/2 Poems/page (252).png',
    'books/2 Poems/page (253).png',
    'books/2 Poems/page (254).png',
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
