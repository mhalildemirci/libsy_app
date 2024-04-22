import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class metres extends StatefulWidget {
  const metres({Key? key}) : super(key: key);

  @override
  State<metres> createState() => _metresState();
}

class _metresState extends State<metres> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/metres/page (1).png',
    'books/metres/page (2).png',
    'books/metres/page (3).png',
    'books/metres/page (4).png',
    'books/metres/page (5).png',
    'books/metres/page (6).png',
    'books/metres/page (7).png',
    'books/metres/page (8).png',
    'books/metres/page (9).png',
    'books/metres/page (10).png',
    'books/metres/page (11).png',
    'books/metres/page (12).png',
    'books/metres/page (13).png',
    'books/metres/page (14).png',
    'books/metres/page (15).png',
    'books/metres/page (16).png',
    'books/metres/page (17).png',
    'books/metres/page (18).png',
    'books/metres/page (19).png',
    'books/metres/page (20).png',
    'books/metres/page (21).png',
    'books/metres/page (22).png',
    'books/metres/page (23).png',
    'books/metres/page (24).png',
    'books/metres/page (25).png',
    'books/metres/page (26).png',
    'books/metres/page (27).png',
    'books/metres/page (28).png',
    'books/metres/page (29).png',
    'books/metres/page (30).png',
    'books/metres/page (31).png',
    'books/metres/page (32).png',
    'books/metres/page (33).png',
    'books/metres/page (34).png',
    'books/metres/page (35).png',
    'books/metres/page (36).png',
    'books/metres/page (37).png',
    'books/metres/page (38).png',
    'books/metres/page (39).png',
    'books/metres/page (40).png',
    'books/metres/page (41).png',
    'books/metres/page (42).png',
    'books/metres/page (43).png',
    'books/metres/page (44).png',
    'books/metres/page (45).png',
    'books/metres/page (46).png',
    'books/metres/page (47).png',
    'books/metres/page (48).png',
    'books/metres/page (49).png',
    'books/metres/page (50).png',
    'books/metres/page (51).png',
    'books/metres/page (52).png',
    'books/metres/page (53).png',
    'books/metres/page (54).png',
    'books/metres/page (55).png',
    'books/metres/page (56).png',
    'books/metres/page (57).png',
    'books/metres/page (58).png',
    'books/metres/page (59).png',
    'books/metres/page (60).png',
    'books/metres/page (61).png',
    'books/metres/page (62).png',
    'books/metres/page (63).png',
    'books/metres/page (64).png',
    'books/metres/page (65).png',
    'books/metres/page (66).png',
    'books/metres/page (67).png',
    'books/metres/page (68).png',
    'books/metres/page (69).png',
    'books/metres/page (70).png',
    'books/metres/page (71).png',
    'books/metres/page (72).png',
    'books/metres/page (73).png',
    'books/metres/page (74).png',
    'books/metres/page (75).png',
    'books/metres/page (76).png',
    'books/metres/page (77).png',
    'books/metres/page (78).png',
    'books/metres/page (79).png',
    'books/metres/page (80).png',
    'books/metres/page (81).png',
    'books/metres/page (82).png',
    'books/metres/page (83).png',
    'books/metres/page (84).png',
    'books/metres/page (85).png',
    'books/metres/page (86).png',
    'books/metres/page (87).png',
    'books/metres/page (88).png',
    'books/metres/page (89).png',
    'books/metres/page (90).png',
    'books/metres/page (91).png',
    'books/metres/page (92).png',
    'books/metres/page (93).png',
    'books/metres/page (94).png',
    'books/metres/page (95).png',
    'books/metres/page (96).png',
    'books/metres/page (97).png',
    'books/metres/page (98).png',
    'books/metres/page (99).png',
    'books/metres/page (100).png',
    'books/metres/page (101).png',
    'books/metres/page (102).png',
    'books/metres/page (103).png',
    'books/metres/page (104).png',
    'books/metres/page (105).png',
    'books/metres/page (106).png',
    'books/metres/page (107).png',
    'books/metres/page (108).png',
    'books/metres/page (109).png',
    'books/metres/page (110).png',
    'books/metres/page (111).png',
    'books/metres/page (112).png',
    'books/metres/page (113).png',
    'books/metres/page (114).png',
    'books/metres/page (115).png',
    'books/metres/page (116).png',
    'books/metres/page (117).png',
    'books/metres/page (118).png',
    'books/metres/page (119).png',
    'books/metres/page (120).png',
    'books/metres/page (121).png',
    'books/metres/page (122).png',
    'books/metres/page (123).png',
    'books/metres/page (124).png',
    'books/metres/page (125).png',
    'books/metres/page (126).png',
    'books/metres/page (127).png',
    'books/metres/page (128).png',
    'books/metres/page (129).png',
    'books/metres/page (130).png',
    'books/metres/page (131).png',
    'books/metres/page (132).png',
    'books/metres/page (133).png',
    'books/metres/page (134).png',
    'books/metres/page (135).png',
    'books/metres/page (136).png',
    'books/metres/page (137).png',
    'books/metres/page (138).png',
    'books/metres/page (139).png',
    'books/metres/page (140).png',
    'books/metres/page (141).png',
    'books/metres/page (142).png',
    'books/metres/page (143).png',
    'books/metres/page (144).png',
    'books/metres/page (145).png',
    'books/metres/page (146).png',
    'books/metres/page (147).png',
    'books/metres/page (148).png',
    'books/metres/page (149).png',
    'books/metres/page (150).png',
    'books/metres/page (151).png',
    'books/metres/page (152).png',
    'books/metres/page (153).png',
    'books/metres/page (154).png',
    'books/metres/page (155).png',
    'books/metres/page (156).png',
    'books/metres/page (157).png',
    'books/metres/page (158).png',
    'books/metres/page (159).png',
    'books/metres/page (160).png',
    'books/metres/page (161).png',
    'books/metres/page (162).png',
    'books/metres/page (163).png',
    'books/metres/page (164).png',
    'books/metres/page (165).png',
    'books/metres/page (166).png',
    'books/metres/page (167).png',
    'books/metres/page (168).png',
    'books/metres/page (169).png',
    'books/metres/page (170).png',
    'books/metres/page (171).png',
    'books/metres/page (172).png',
    'books/metres/page (173).png',
    'books/metres/page (174).png',
    'books/metres/page (175).png',
    'books/metres/page (176).png',
    'books/metres/page (177).png',
    'books/metres/page (178).png',
    'books/metres/page (179).png',
    'books/metres/page (180).png',
    'books/metres/page (181).png',
    'books/metres/page (182).png',
    'books/metres/page (183).png',
    'books/metres/page (184).png',
    'books/metres/page (185).png',
    'books/metres/page (186).png',
    'books/metres/page (187).png',
    'books/metres/page (188).png',
    'books/metres/page (189).png',
    'books/metres/page (190).png',
    'books/metres/page (191).png',
    'books/metres/page (192).png',
    'books/metres/page (193).png',
    'books/metres/page (194).png',
    'books/metres/page (195).png',
    'books/metres/page (196).png',
    'books/metres/page (197).png',
    'books/metres/page (198).png',
    'books/metres/page (199).png',
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
