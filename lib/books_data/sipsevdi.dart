import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sipsevdi extends StatefulWidget {
  const sipsevdi({Key? key}) : super(key: key);

  @override
  State<sipsevdi> createState() => _sipsevdiState();
}

class _sipsevdiState extends State<sipsevdi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sipsevdi/page (1).png',
    'books/sipsevdi/page (2).png',
    'books/sipsevdi/page (3).png',
    'books/sipsevdi/page (4).png',
    'books/sipsevdi/page (5).png',
    'books/sipsevdi/page (6).png',
    'books/sipsevdi/page (7).png',
    'books/sipsevdi/page (8).png',
    'books/sipsevdi/page (9).png',
    'books/sipsevdi/page (10).png',
    'books/sipsevdi/page (11).png',
    'books/sipsevdi/page (12).png',
    'books/sipsevdi/page (13).png',
    'books/sipsevdi/page (14).png',
    'books/sipsevdi/page (15).png',
    'books/sipsevdi/page (16).png',
    'books/sipsevdi/page (17).png',
    'books/sipsevdi/page (18).png',
    'books/sipsevdi/page (19).png',
    'books/sipsevdi/page (20).png',
    'books/sipsevdi/page (21).png',
    'books/sipsevdi/page (22).png',
    'books/sipsevdi/page (23).png',
    'books/sipsevdi/page (24).png',
    'books/sipsevdi/page (25).png',
    'books/sipsevdi/page (26).png',
    'books/sipsevdi/page (27).png',
    'books/sipsevdi/page (28).png',
    'books/sipsevdi/page (29).png',
    'books/sipsevdi/page (30).png',
    'books/sipsevdi/page (31).png',
    'books/sipsevdi/page (32).png',
    'books/sipsevdi/page (33).png',
    'books/sipsevdi/page (34).png',
    'books/sipsevdi/page (35).png',
    'books/sipsevdi/page (36).png',
    'books/sipsevdi/page (37).png',
    'books/sipsevdi/page (38).png',
    'books/sipsevdi/page (39).png',
    'books/sipsevdi/page (40).png',
    'books/sipsevdi/page (41).png',
    'books/sipsevdi/page (42).png',
    'books/sipsevdi/page (43).png',
    'books/sipsevdi/page (44).png',
    'books/sipsevdi/page (45).png',
    'books/sipsevdi/page (46).png',
    'books/sipsevdi/page (47).png',
    'books/sipsevdi/page (48).png',
    'books/sipsevdi/page (49).png',
    'books/sipsevdi/page (50).png',
    'books/sipsevdi/page (51).png',
    'books/sipsevdi/page (52).png',
    'books/sipsevdi/page (53).png',
    'books/sipsevdi/page (54).png',
    'books/sipsevdi/page (55).png',
    'books/sipsevdi/page (56).png',
    'books/sipsevdi/page (57).png',
    'books/sipsevdi/page (58).png',
    'books/sipsevdi/page (59).png',
    'books/sipsevdi/page (60).png',
    'books/sipsevdi/page (61).png',
    'books/sipsevdi/page (62).png',
    'books/sipsevdi/page (63).png',
    'books/sipsevdi/page (64).png',
    'books/sipsevdi/page (65).png',
    'books/sipsevdi/page (66).png',
    'books/sipsevdi/page (67).png',
    'books/sipsevdi/page (68).png',
    'books/sipsevdi/page (69).png',
    'books/sipsevdi/page (70).png',
    'books/sipsevdi/page (71).png',
    'books/sipsevdi/page (72).png',
    'books/sipsevdi/page (73).png',
    'books/sipsevdi/page (74).png',
    'books/sipsevdi/page (75).png',
    'books/sipsevdi/page (76).png',
    'books/sipsevdi/page (77).png',
    'books/sipsevdi/page (78).png',
    'books/sipsevdi/page (79).png',
    'books/sipsevdi/page (80).png',
    'books/sipsevdi/page (81).png',
    'books/sipsevdi/page (82).png',
    'books/sipsevdi/page (83).png',
    'books/sipsevdi/page (84).png',
    'books/sipsevdi/page (85).png',
    'books/sipsevdi/page (86).png',
    'books/sipsevdi/page (87).png',
    'books/sipsevdi/page (88).png',
    'books/sipsevdi/page (89).png',
    'books/sipsevdi/page (90).png',
    'books/sipsevdi/page (91).png',
    'books/sipsevdi/page (92).png',
    'books/sipsevdi/page (93).png',
    'books/sipsevdi/page (94).png',
    'books/sipsevdi/page (95).png',
    'books/sipsevdi/page (96).png',
    'books/sipsevdi/page (97).png',
    'books/sipsevdi/page (98).png',
    'books/sipsevdi/page (99).png',
    'books/sipsevdi/page (100).png',
    'books/sipsevdi/page (101).png',
    'books/sipsevdi/page (102).png',
    'books/sipsevdi/page (103).png',
    'books/sipsevdi/page (104).png',
    'books/sipsevdi/page (105).png',
    'books/sipsevdi/page (106).png',
    'books/sipsevdi/page (107).png',
    'books/sipsevdi/page (108).png',
    'books/sipsevdi/page (109).png',
    'books/sipsevdi/page (110).png',
    'books/sipsevdi/page (111).png',
    'books/sipsevdi/page (112).png',
    'books/sipsevdi/page (113).png',
    'books/sipsevdi/page (114).png',
    'books/sipsevdi/page (115).png',
    'books/sipsevdi/page (116).png',
    'books/sipsevdi/page (117).png',
    'books/sipsevdi/page (118).png',
    'books/sipsevdi/page (119).png',
    'books/sipsevdi/page (120).png',
    'books/sipsevdi/page (121).png',
    'books/sipsevdi/page (122).png',
    'books/sipsevdi/page (123).png',
    'books/sipsevdi/page (124).png',
    'books/sipsevdi/page (125).png',
    'books/sipsevdi/page (126).png',
    'books/sipsevdi/page (127).png',
    'books/sipsevdi/page (128).png',
    'books/sipsevdi/page (129).png',
    'books/sipsevdi/page (130).png',
    'books/sipsevdi/page (131).png',
    'books/sipsevdi/page (132).png',
    'books/sipsevdi/page (133).png',
    'books/sipsevdi/page (134).png',
    'books/sipsevdi/page (135).png',
    'books/sipsevdi/page (136).png',
    'books/sipsevdi/page (137).png',
    'books/sipsevdi/page (138).png',
    'books/sipsevdi/page (139).png',
    'books/sipsevdi/page (140).png',
    'books/sipsevdi/page (141).png',
    'books/sipsevdi/page (142).png',
    'books/sipsevdi/page (143).png',
    'books/sipsevdi/page (144).png',
    'books/sipsevdi/page (145).png',
    'books/sipsevdi/page (146).png',
    'books/sipsevdi/page (147).png',
    'books/sipsevdi/page (148).png',
    'books/sipsevdi/page (149).png',
    'books/sipsevdi/page (150).png',
    'books/sipsevdi/page (151).png',
    'books/sipsevdi/page (152).png',
    'books/sipsevdi/page (153).png',
    'books/sipsevdi/page (154).png',
    'books/sipsevdi/page (155).png',
    'books/sipsevdi/page (156).png',
    'books/sipsevdi/page (157).png',
    'books/sipsevdi/page (158).png',
    'books/sipsevdi/page (159).png',
    'books/sipsevdi/page (160).png',
    'books/sipsevdi/page (161).png',
    'books/sipsevdi/page (162).png',
    'books/sipsevdi/page (163).png',
    'books/sipsevdi/page (164).png',
    'books/sipsevdi/page (165).png',
    'books/sipsevdi/page (166).png',
    'books/sipsevdi/page (167).png',
    'books/sipsevdi/page (168).png',
    'books/sipsevdi/page (169).png',
    'books/sipsevdi/page (170).png',
    'books/sipsevdi/page (171).png',
    'books/sipsevdi/page (172).png',
    'books/sipsevdi/page (173).png',
    'books/sipsevdi/page (174).png',
    'books/sipsevdi/page (175).png',
    'books/sipsevdi/page (176).png',
    'books/sipsevdi/page (177).png',
    'books/sipsevdi/page (178).png',
    'books/sipsevdi/page (179).png',
    'books/sipsevdi/page (180).png',
    'books/sipsevdi/page (181).png',
    'books/sipsevdi/page (182).png',
    'books/sipsevdi/page (183).png',
    'books/sipsevdi/page (184).png',
    'books/sipsevdi/page (185).png',
    'books/sipsevdi/page (186).png',
    'books/sipsevdi/page (187).png',
    'books/sipsevdi/page (188).png',
    'books/sipsevdi/page (189).png',
    'books/sipsevdi/page (190).png',
    'books/sipsevdi/page (191).png',
    'books/sipsevdi/page (192).png',
    'books/sipsevdi/page (193).png',
    'books/sipsevdi/page (194).png',
    'books/sipsevdi/page (195).png',
    'books/sipsevdi/page (196).png',
    'books/sipsevdi/page (197).png',
    'books/sipsevdi/page (198).png',
    'books/sipsevdi/page (199).png',
    'books/sipsevdi/page (200).png',
    'books/sipsevdi/page (201).png',
    'books/sipsevdi/page (202).png',
    'books/sipsevdi/page (203).png',
    'books/sipsevdi/page (204).png',
    'books/sipsevdi/page (205).png',
    'books/sipsevdi/page (206).png',
    'books/sipsevdi/page (207).png',
    'books/sipsevdi/page (208).png',
    'books/sipsevdi/page (209).png',
    'books/sipsevdi/page (210).png',
    'books/sipsevdi/page (211).png',
    'books/sipsevdi/page (212).png',
    'books/sipsevdi/page (213).png',
    'books/sipsevdi/page (214).png',
    'books/sipsevdi/page (215).png',
    'books/sipsevdi/page (216).png',
    'books/sipsevdi/page (217).png',
    'books/sipsevdi/page (218).png',
    'books/sipsevdi/page (219).png',
    'books/sipsevdi/page (220).png',
    'books/sipsevdi/page (221).png',
    'books/sipsevdi/page (222).png',
    'books/sipsevdi/page (223).png',
    'books/sipsevdi/page (224).png',
    'books/sipsevdi/page (225).png',
    'books/sipsevdi/page (226).png',
    'books/sipsevdi/page (227).png',
    'books/sipsevdi/page (228).png',
    'books/sipsevdi/page (229).png',
    'books/sipsevdi/page (230).png',
    'books/sipsevdi/page (231).png',
    'books/sipsevdi/page (232).png',
    'books/sipsevdi/page (233).png',
    'books/sipsevdi/page (234).png',
    'books/sipsevdi/page (235).png',
    'books/sipsevdi/page (236).png',
    'books/sipsevdi/page (237).png',
    'books/sipsevdi/page (238).png',
    'books/sipsevdi/page (239).png',
    'books/sipsevdi/page (240).png',
    'books/sipsevdi/page (241).png',

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
