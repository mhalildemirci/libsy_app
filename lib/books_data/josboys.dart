import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class josboys extends StatefulWidget {
  const josboys({Key? key}) : super(key: key);

  @override
  State<josboys> createState() => _josboysState();
}

class _josboysState extends State<josboys> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/jos boys/page (1).png',
    'books/jos boys/page (2).png',
    'books/jos boys/page (3).png',
    'books/jos boys/page (4).png',
    'books/jos boys/page (5).png',
    'books/jos boys/page (6).png',
    'books/jos boys/page (7).png',
    'books/jos boys/page (8).png',
    'books/jos boys/page (9).png',
    'books/jos boys/page (10).png',
    'books/jos boys/page (11).png',
    'books/jos boys/page (12).png',
    'books/jos boys/page (13).png',
    'books/jos boys/page (14).png',
    'books/jos boys/page (15).png',
    'books/jos boys/page (16).png',
    'books/jos boys/page (17).png',
    'books/jos boys/page (18).png',
    'books/jos boys/page (19).png',
    'books/jos boys/page (20).png',
    'books/jos boys/page (21).png',
    'books/jos boys/page (22).png',
    'books/jos boys/page (23).png',
    'books/jos boys/page (24).png',
    'books/jos boys/page (25).png',
    'books/jos boys/page (26).png',
    'books/jos boys/page (27).png',
    'books/jos boys/page (28).png',
    'books/jos boys/page (29).png',
    'books/jos boys/page (30).png',
    'books/jos boys/page (31).png',
    'books/jos boys/page (32).png',
    'books/jos boys/page (33).png',
    'books/jos boys/page (34).png',
    'books/jos boys/page (35).png',
    'books/jos boys/page (36).png',
    'books/jos boys/page (37).png',
    'books/jos boys/page (38).png',
    'books/jos boys/page (39).png',
    'books/jos boys/page (40).png',
    'books/jos boys/page (41).png',
    'books/jos boys/page (42).png',
    'books/jos boys/page (43).png',
    'books/jos boys/page (44).png',
    'books/jos boys/page (45).png',
    'books/jos boys/page (46).png',
    'books/jos boys/page (47).png',
    'books/jos boys/page (48).png',
    'books/jos boys/page (49).png',
    'books/jos boys/page (50).png',
    'books/jos boys/page (51).png',
    'books/jos boys/page (52).png',
    'books/jos boys/page (53).png',
    'books/jos boys/page (54).png',
    'books/jos boys/page (55).png',
    'books/jos boys/page (56).png',
    'books/jos boys/page (57).png',
    'books/jos boys/page (58).png',
    'books/jos boys/page (59).png',
    'books/jos boys/page (60).png',
    'books/jos boys/page (61).png',
    'books/jos boys/page (62).png',
    'books/jos boys/page (63).png',
    'books/jos boys/page (64).png',
    'books/jos boys/page (65).png',
    'books/jos boys/page (66).png',
    'books/jos boys/page (67).png',
    'books/jos boys/page (68).png',
    'books/jos boys/page (69).png',
    'books/jos boys/page (70).png',
    'books/jos boys/page (71).png',
    'books/jos boys/page (72).png',
    'books/jos boys/page (73).png',
    'books/jos boys/page (74).png',
    'books/jos boys/page (75).png',
    'books/jos boys/page (76).png',
    'books/jos boys/page (77).png',
    'books/jos boys/page (78).png',
    'books/jos boys/page (79).png',
    'books/jos boys/page (80).png',
    'books/jos boys/page (81).png',
    'books/jos boys/page (82).png',
    'books/jos boys/page (83).png',
    'books/jos boys/page (84).png',
    'books/jos boys/page (85).png',
    'books/jos boys/page (86).png',
    'books/jos boys/page (87).png',
    'books/jos boys/page (88).png',
    'books/jos boys/page (89).png',
    'books/jos boys/page (90).png',
    'books/jos boys/page (91).png',
    'books/jos boys/page (92).png',
    'books/jos boys/page (93).png',
    'books/jos boys/page (94).png',
    'books/jos boys/page (95).png',
    'books/jos boys/page (96).png',
    'books/jos boys/page (97).png',
    'books/jos boys/page (98).png',
    'books/jos boys/page (99).png',
    'books/jos boys/page (100).png',
    'books/jos boys/page (101).png',
    'books/jos boys/page (102).png',
    'books/jos boys/page (103).png',
    'books/jos boys/page (104).png',
    'books/jos boys/page (105).png',
    'books/jos boys/page (106).png',
    'books/jos boys/page (107).png',
    'books/jos boys/page (108).png',
    'books/jos boys/page (109).png',
    'books/jos boys/page (110).png',
    'books/jos boys/page (111).png',
    'books/jos boys/page (112).png',
    'books/jos boys/page (113).png',
    'books/jos boys/page (114).png',
    'books/jos boys/page (115).png',
    'books/jos boys/page (116).png',
    'books/jos boys/page (117).png',
    'books/jos boys/page (118).png',
    'books/jos boys/page (119).png',
    'books/jos boys/page (120).png',
    'books/jos boys/page (121).png',
    'books/jos boys/page (122).png',
    'books/jos boys/page (123).png',
    'books/jos boys/page (124).png',
    'books/jos boys/page (125).png',
    'books/jos boys/page (126).png',
    'books/jos boys/page (127).png',
    'books/jos boys/page (128).png',
    'books/jos boys/page (129).png',
    'books/jos boys/page (130).png',
    'books/jos boys/page (131).png',
    'books/jos boys/page (132).png',
    'books/jos boys/page (133).png',
    'books/jos boys/page (134).png',
    'books/jos boys/page (135).png',
    'books/jos boys/page (136).png',
    'books/jos boys/page (137).png',
    'books/jos boys/page (138).png',
    'books/jos boys/page (139).png',
    'books/jos boys/page (140).png',
    'books/jos boys/page (141).png',
    'books/jos boys/page (142).png',
    'books/jos boys/page (143).png',
    'books/jos boys/page (144).png',
    'books/jos boys/page (145).png',
    'books/jos boys/page (146).png',
    'books/jos boys/page (147).png',
    'books/jos boys/page (148).png',
    'books/jos boys/page (149).png',
    'books/jos boys/page (150).png',
    'books/jos boys/page (151).png',
    'books/jos boys/page (152).png',
    'books/jos boys/page (153).png',
    'books/jos boys/page (154).png',
    'books/jos boys/page (155).png',
    'books/jos boys/page (156).png',
    'books/jos boys/page (157).png',
    'books/jos boys/page (158).png',
    'books/jos boys/page (159).png',
    'books/jos boys/page (160).png',
    'books/jos boys/page (161).png',
    'books/jos boys/page (162).png',
    'books/jos boys/page (163).png',
    'books/jos boys/page (164).png',
    'books/jos boys/page (165).png',
    'books/jos boys/page (166).png',
    'books/jos boys/page (167).png',
    'books/jos boys/page (168).png',
    'books/jos boys/page (169).png',
    'books/jos boys/page (170).png',
    'books/jos boys/page (171).png',
    'books/jos boys/page (172).png',
    'books/jos boys/page (173).png',
    'books/jos boys/page (174).png',
    'books/jos boys/page (175).png',
    'books/jos boys/page (176).png',
    'books/jos boys/page (177).png',
    'books/jos boys/page (178).png',
    'books/jos boys/page (179).png',
    'books/jos boys/page (180).png',
    'books/jos boys/page (181).png',
    'books/jos boys/page (182).png',
    'books/jos boys/page (183).png',
    'books/jos boys/page (184).png',
    'books/jos boys/page (185).png',
    'books/jos boys/page (186).png',
    'books/jos boys/page (187).png',
    'books/jos boys/page (188).png',
    'books/jos boys/page (189).png',
    'books/jos boys/page (190).png',
    'books/jos boys/page (191).png',
    'books/jos boys/page (192).png',
    'books/jos boys/page (193).png',
    'books/jos boys/page (194).png',
    'books/jos boys/page (195).png',
    'books/jos boys/page (196).png',
    'books/jos boys/page (197).png',
    'books/jos boys/page (198).png',
    'books/jos boys/page (199).png',
    'books/jos boys/page (200).png',
    'books/jos boys/page (201).png',
    'books/jos boys/page (202).png',
    'books/jos boys/page (203).png',
    'books/jos boys/page (204).png',
    'books/jos boys/page (205).png',
    'books/jos boys/page (206).png',
    'books/jos boys/page (207).png',
    'books/jos boys/page (208).png',
    'books/jos boys/page (209).png',
    'books/jos boys/page (210).png',
    'books/jos boys/page (211).png',
    'books/jos boys/page (212).png',
    'books/jos boys/page (213).png',
    'books/jos boys/page (214).png',
    'books/jos boys/page (215).png',
    'books/jos boys/page (216).png',
    'books/jos boys/page (217).png',
    'books/jos boys/page (218).png',
    'books/jos boys/page (219).png',
    'books/jos boys/page (220).png',
    'books/jos boys/page (221).png',
    'books/jos boys/page (222).png',
    'books/jos boys/page (223).png',
    'books/jos boys/page (224).png',
    'books/jos boys/page (225).png',
    'books/jos boys/page (226).png',
    'books/jos boys/page (227).png',
    'books/jos boys/page (228).png',
    'books/jos boys/page (229).png',
    'books/jos boys/page (230).png',
    'books/jos boys/page (231).png',
    'books/jos boys/page (232).png',
    'books/jos boys/page (233).png',
    'books/jos boys/page (234).png',
    'books/jos boys/page (235).png',
    'books/jos boys/page (236).png',
    'books/jos boys/page (237).png',
    'books/jos boys/page (238).png',
    'books/jos boys/page (239).png',
    'books/jos boys/page (240).png',
    'books/jos boys/page (241).png',
    'books/jos boys/page (242).png',
    'books/jos boys/page (243).png',
    'books/jos boys/page (244).png',
    'books/jos boys/page (245).png',
    'books/jos boys/page (246).png',
    'books/jos boys/page (247).png',
    'books/jos boys/page (248).png',

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
          body: Image.network(
            snapshot.data!,
            fit: BoxFit.cover,
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
