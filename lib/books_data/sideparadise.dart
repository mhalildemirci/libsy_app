import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sideparadise extends StatefulWidget {
  const sideparadise({Key? key}) : super(key: key);

  @override
  State<sideparadise> createState() => _sideparadiseState();
}

class _sideparadiseState extends State<sideparadise> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/side of paradise/page (1).png',
    'books/side of paradise/page (2).png',
    'books/side of paradise/page (3).png',
    'books/side of paradise/page (4).png',
    'books/side of paradise/page (5).png',
    'books/side of paradise/page (6).png',
    'books/side of paradise/page (7).png',
    'books/side of paradise/page (8).png',
    'books/side of paradise/page (9).png',
    'books/side of paradise/page (10).png',
    'books/side of paradise/page (11).png',
    'books/side of paradise/page (12).png',
    'books/side of paradise/page (13).png',
    'books/side of paradise/page (14).png',
    'books/side of paradise/page (15).png',
    'books/side of paradise/page (16).png',
    'books/side of paradise/page (17).png',
    'books/side of paradise/page (18).png',
    'books/side of paradise/page (19).png',
    'books/side of paradise/page (20).png',
    'books/side of paradise/page (21).png',
    'books/side of paradise/page (22).png',
    'books/side of paradise/page (23).png',
    'books/side of paradise/page (24).png',
    'books/side of paradise/page (25).png',
    'books/side of paradise/page (26).png',
    'books/side of paradise/page (27).png',
    'books/side of paradise/page (28).png',
    'books/side of paradise/page (29).png',
    'books/side of paradise/page (30).png',
    'books/side of paradise/page (31).png',
    'books/side of paradise/page (32).png',
    'books/side of paradise/page (33).png',
    'books/side of paradise/page (34).png',
    'books/side of paradise/page (35).png',
    'books/side of paradise/page (36).png',
    'books/side of paradise/page (37).png',
    'books/side of paradise/page (38).png',
    'books/side of paradise/page (39).png',
    'books/side of paradise/page (40).png',
    'books/side of paradise/page (41).png',
    'books/side of paradise/page (42).png',
    'books/side of paradise/page (43).png',
    'books/side of paradise/page (44).png',
    'books/side of paradise/page (45).png',
    'books/side of paradise/page (46).png',
    'books/side of paradise/page (47).png',
    'books/side of paradise/page (48).png',
    'books/side of paradise/page (49).png',
    'books/side of paradise/page (50).png',
    'books/side of paradise/page (51).png',
    'books/side of paradise/page (52).png',
    'books/side of paradise/page (53).png',
    'books/side of paradise/page (54).png',
    'books/side of paradise/page (55).png',
    'books/side of paradise/page (56).png',
    'books/side of paradise/page (57).png',
    'books/side of paradise/page (58).png',
    'books/side of paradise/page (59).png',
    'books/side of paradise/page (60).png',
    'books/side of paradise/page (61).png',
    'books/side of paradise/page (62).png',
    'books/side of paradise/page (63).png',
    'books/side of paradise/page (64).png',
    'books/side of paradise/page (65).png',
    'books/side of paradise/page (66).png',
    'books/side of paradise/page (67).png',
    'books/side of paradise/page (68).png',
    'books/side of paradise/page (69).png',
    'books/side of paradise/page (70).png',
    'books/side of paradise/page (71).png',
    'books/side of paradise/page (72).png',
    'books/side of paradise/page (73).png',
    'books/side of paradise/page (74).png',
    'books/side of paradise/page (75).png',
    'books/side of paradise/page (76).png',
    'books/side of paradise/page (77).png',
    'books/side of paradise/page (78).png',
    'books/side of paradise/page (79).png',
    'books/side of paradise/page (80).png',
    'books/side of paradise/page (81).png',
    'books/side of paradise/page (82).png',
    'books/side of paradise/page (83).png',
    'books/side of paradise/page (84).png',
    'books/side of paradise/page (85).png',
    'books/side of paradise/page (86).png',
    'books/side of paradise/page (87).png',
    'books/side of paradise/page (88).png',
    'books/side of paradise/page (89).png',
    'books/side of paradise/page (90).png',
    'books/side of paradise/page (91).png',
    'books/side of paradise/page (92).png',
    'books/side of paradise/page (93).png',
    'books/side of paradise/page (94).png',
    'books/side of paradise/page (95).png',
    'books/side of paradise/page (96).png',
    'books/side of paradise/page (97).png',
    'books/side of paradise/page (98).png',
    'books/side of paradise/page (99).png',
    'books/side of paradise/page (100).png',
    'books/side of paradise/page (101).png',
    'books/side of paradise/page (102).png',
    'books/side of paradise/page (103).png',
    'books/side of paradise/page (104).png',
    'books/side of paradise/page (105).png',
    'books/side of paradise/page (106).png',
    'books/side of paradise/page (107).png',
    'books/side of paradise/page (108).png',
    'books/side of paradise/page (109).png',
    'books/side of paradise/page (110).png',
    'books/side of paradise/page (111).png',
    'books/side of paradise/page (112).png',
    'books/side of paradise/page (113).png',
    'books/side of paradise/page (114).png',
    'books/side of paradise/page (115).png',
    'books/side of paradise/page (116).png',
    'books/side of paradise/page (117).png',
    'books/side of paradise/page (118).png',
    'books/side of paradise/page (119).png',
    'books/side of paradise/page (120).png',
    'books/side of paradise/page (121).png',
    'books/side of paradise/page (122).png',
    'books/side of paradise/page (123).png',
    'books/side of paradise/page (124).png',
    'books/side of paradise/page (125).png',
    'books/side of paradise/page (126).png',
    'books/side of paradise/page (127).png',
    'books/side of paradise/page (128).png',
    'books/side of paradise/page (129).png',
    'books/side of paradise/page (130).png',
    'books/side of paradise/page (131).png',
    'books/side of paradise/page (132).png',
    'books/side of paradise/page (133).png',
    'books/side of paradise/page (134).png',
    'books/side of paradise/page (135).png',
    'books/side of paradise/page (136).png',
    'books/side of paradise/page (137).png',
    'books/side of paradise/page (138).png',
    'books/side of paradise/page (139).png',
    'books/side of paradise/page (140).png',
    'books/side of paradise/page (141).png',
    'books/side of paradise/page (142).png',
    'books/side of paradise/page (143).png',
    'books/side of paradise/page (144).png',
    'books/side of paradise/page (145).png',
    'books/side of paradise/page (146).png',
    'books/side of paradise/page (147).png',
    'books/side of paradise/page (148).png',
    'books/side of paradise/page (149).png',
    'books/side of paradise/page (150).png',
    'books/side of paradise/page (151).png',
    'books/side of paradise/page (152).png',
    'books/side of paradise/page (153).png',
    'books/side of paradise/page (154).png',
    'books/side of paradise/page (155).png',
    'books/side of paradise/page (156).png',
    'books/side of paradise/page (157).png',
    'books/side of paradise/page (158).png',
    'books/side of paradise/page (159).png',
    'books/side of paradise/page (160).png',
    'books/side of paradise/page (161).png',
    'books/side of paradise/page (162).png',
    'books/side of paradise/page (163).png',
    'books/side of paradise/page (164).png',
    'books/side of paradise/page (165).png',
    'books/side of paradise/page (166).png',
    'books/side of paradise/page (167).png',
    'books/side of paradise/page (168).png',
    'books/side of paradise/page (169).png',
    'books/side of paradise/page (170).png',
    'books/side of paradise/page (171).png',
    'books/side of paradise/page (172).png',
    'books/side of paradise/page (173).png',
    'books/side of paradise/page (174).png',
    'books/side of paradise/page (175).png',
    'books/side of paradise/page (176).png',
    'books/side of paradise/page (177).png',
    'books/side of paradise/page (178).png',
    'books/side of paradise/page (179).png',
    'books/side of paradise/page (180).png',
    'books/side of paradise/page (181).png',
    'books/side of paradise/page (182).png',
    'books/side of paradise/page (183).png',
    'books/side of paradise/page (184).png',
    'books/side of paradise/page (185).png',
    'books/side of paradise/page (186).png',
    'books/side of paradise/page (187).png',
    'books/side of paradise/page (188).png',
    'books/side of paradise/page (189).png',
    'books/side of paradise/page (190).png',
    'books/side of paradise/page (191).png',
    'books/side of paradise/page (192).png',
    'books/side of paradise/page (193).png',
    'books/side of paradise/page (194).png',
    'books/side of paradise/page (195).png',
    'books/side of paradise/page (196).png',
    'books/side of paradise/page (197).png',
    'books/side of paradise/page (198).png',
    'books/side of paradise/page (199).png',
    'books/side of paradise/page (200).png',
    'books/side of paradise/page (201).png',
    'books/side of paradise/page (202).png',
    'books/side of paradise/page (203).png',
    'books/side of paradise/page (204).png',
    'books/side of paradise/page (205).png',
    'books/side of paradise/page (206).png',
    'books/side of paradise/page (207).png',
    'books/side of paradise/page (208).png',
    'books/side of paradise/page (209).png',
    'books/side of paradise/page (210).png',
    'books/side of paradise/page (211).png',
    'books/side of paradise/page (212).png',
    'books/side of paradise/page (213).png',
    'books/side of paradise/page (214).png',
    'books/side of paradise/page (215).png',
    'books/side of paradise/page (216).png',
    'books/side of paradise/page (217).png',
    'books/side of paradise/page (218).png',
    'books/side of paradise/page (219).png',
    'books/side of paradise/page (220).png',
    'books/side of paradise/page (221).png',
    'books/side of paradise/page (222).png',
    'books/side of paradise/page (223).png',
    'books/side of paradise/page (224).png',
    'books/side of paradise/page (225).png',
    'books/side of paradise/page (226).png',
    'books/side of paradise/page (227).png',
    'books/side of paradise/page (228).png',
    'books/side of paradise/page (229).png',
    'books/side of paradise/page (230).png',
    'books/side of paradise/page (231).png',
    'books/side of paradise/page (232).png',
    'books/side of paradise/page (233).png',
    'books/side of paradise/page (234).png',
    'books/side of paradise/page (235).png',
    'books/side of paradise/page (236).png',
    'books/side of paradise/page (237).png',
    'books/side of paradise/page (238).png',
    'books/side of paradise/page (239).png',
    'books/side of paradise/page (240).png',
    'books/side of paradise/page (241).png',

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
