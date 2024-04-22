import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class butunoykuler1 extends StatefulWidget {
  const butunoykuler1({Key? key}) : super(key: key);

  @override
  State<butunoykuler1> createState() => _butunoykuler1State();
}

class _butunoykuler1State extends State<butunoykuler1> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/butun oykuler1/page (1).png',
    'books/butun oykuler1/page (2).png',
    'books/butun oykuler1/page (3).png',
    'books/butun oykuler1/page (4).png',
    'books/butun oykuler1/page (5).png',
    'books/butun oykuler1/page (6).png',
    'books/butun oykuler1/page (7).png',
    'books/butun oykuler1/page (8).png',
    'books/butun oykuler1/page (9).png',
    'books/butun oykuler1/page (10).png',
    'books/butun oykuler1/page (11).png',
    'books/butun oykuler1/page (12).png',
    'books/butun oykuler1/page (13).png',
    'books/butun oykuler1/page (14).png',
    'books/butun oykuler1/page (15).png',
    'books/butun oykuler1/page (16).png',
    'books/butun oykuler1/page (17).png',
    'books/butun oykuler1/page (18).png',
    'books/butun oykuler1/page (19).png',
    'books/butun oykuler1/page (20).png',
    'books/butun oykuler1/page (21).png',
    'books/butun oykuler1/page (22).png',
    'books/butun oykuler1/page (23).png',
    'books/butun oykuler1/page (24).png',
    'books/butun oykuler1/page (25).png',
    'books/butun oykuler1/page (26).png',
    'books/butun oykuler1/page (27).png',
    'books/butun oykuler1/page (28).png',
    'books/butun oykuler1/page (29).png',
    'books/butun oykuler1/page (30).png',
    'books/butun oykuler1/page (31).png',
    'books/butun oykuler1/page (32).png',
    'books/butun oykuler1/page (33).png',
    'books/butun oykuler1/page (34).png',
    'books/butun oykuler1/page (35).png',
    'books/butun oykuler1/page (36).png',
    'books/butun oykuler1/page (37).png',
    'books/butun oykuler1/page (38).png',
    'books/butun oykuler1/page (39).png',
    'books/butun oykuler1/page (40).png',
    'books/butun oykuler1/page (41).png',
    'books/butun oykuler1/page (42).png',
    'books/butun oykuler1/page (43).png',
    'books/butun oykuler1/page (44).png',
    'books/butun oykuler1/page (45).png',
    'books/butun oykuler1/page (46).png',
    'books/butun oykuler1/page (47).png',
    'books/butun oykuler1/page (48).png',
    'books/butun oykuler1/page (49).png',
    'books/butun oykuler1/page (50).png',
    'books/butun oykuler1/page (51).png',
    'books/butun oykuler1/page (52).png',
    'books/butun oykuler1/page (53).png',
    'books/butun oykuler1/page (54).png',
    'books/butun oykuler1/page (55).png',
    'books/butun oykuler1/page (56).png',
    'books/butun oykuler1/page (57).png',
    'books/butun oykuler1/page (58).png',
    'books/butun oykuler1/page (59).png',
    'books/butun oykuler1/page (60).png',
    'books/butun oykuler1/page (61).png',
    'books/butun oykuler1/page (62).png',
    'books/butun oykuler1/page (63).png',
    'books/butun oykuler1/page (64).png',
    'books/butun oykuler1/page (65).png',
    'books/butun oykuler1/page (66).png',
    'books/butun oykuler1/page (67).png',
    'books/butun oykuler1/page (68).png',
    'books/butun oykuler1/page (69).png',
    'books/butun oykuler1/page (70).png',
    'books/butun oykuler1/page (71).png',
    'books/butun oykuler1/page (72).png',
    'books/butun oykuler1/page (73).png',
    'books/butun oykuler1/page (74).png',
    'books/butun oykuler1/page (75).png',
    'books/butun oykuler1/page (76).png',
    'books/butun oykuler1/page (77).png',
    'books/butun oykuler1/page (78).png',
    'books/butun oykuler1/page (79).png',
    'books/butun oykuler1/page (80).png',
    'books/butun oykuler1/page (81).png',
    'books/butun oykuler1/page (82).png',
    'books/butun oykuler1/page (83).png',
    'books/butun oykuler1/page (84).png',
    'books/butun oykuler1/page (85).png',
    'books/butun oykuler1/page (86).png',
    'books/butun oykuler1/page (87).png',
    'books/butun oykuler1/page (88).png',
    'books/butun oykuler1/page (89).png',
    'books/butun oykuler1/page (90).png',
    'books/butun oykuler1/page (91).png',
    'books/butun oykuler1/page (92).png',
    'books/butun oykuler1/page (93).png',
    'books/butun oykuler1/page (94).png',
    'books/butun oykuler1/page (95).png',
    'books/butun oykuler1/page (96).png',
    'books/butun oykuler1/page (97).png',
    'books/butun oykuler1/page (98).png',
    'books/butun oykuler1/page (99).png',
    'books/butun oykuler1/page (100).png',
    'books/butun oykuler1/page (101).png',
    'books/butun oykuler1/page (102).png',
    'books/butun oykuler1/page (103).png',
    'books/butun oykuler1/page (104).png',
    'books/butun oykuler1/page (105).png',
    'books/butun oykuler1/page (106).png',
    'books/butun oykuler1/page (107).png',
    'books/butun oykuler1/page (108).png',
    'books/butun oykuler1/page (109).png',
    'books/butun oykuler1/page (110).png',
    'books/butun oykuler1/page (111).png',
    'books/butun oykuler1/page (112).png',
    'books/butun oykuler1/page (113).png',
    'books/butun oykuler1/page (114).png',
    'books/butun oykuler1/page (115).png',
    'books/butun oykuler1/page (116).png',
    'books/butun oykuler1/page (117).png',
    'books/butun oykuler1/page (118).png',
    'books/butun oykuler1/page (119).png',
    'books/butun oykuler1/page (120).png',
    'books/butun oykuler1/page (121).png',
    'books/butun oykuler1/page (122).png',
    'books/butun oykuler1/page (123).png',
    'books/butun oykuler1/page (124).png',
    'books/butun oykuler1/page (125).png',
    'books/butun oykuler1/page (126).png',
    'books/butun oykuler1/page (127).png',
    'books/butun oykuler1/page (128).png',
    'books/butun oykuler1/page (129).png',
    'books/butun oykuler1/page (130).png',
    'books/butun oykuler1/page (131).png',
    'books/butun oykuler1/page (132).png',
    'books/butun oykuler1/page (133).png',
    'books/butun oykuler1/page (134).png',
    'books/butun oykuler1/page (135).png',
    'books/butun oykuler1/page (136).png',
    'books/butun oykuler1/page (137).png',
    'books/butun oykuler1/page (138).png',
    'books/butun oykuler1/page (139).png',
    'books/butun oykuler1/page (140).png',
    'books/butun oykuler1/page (141).png',
    'books/butun oykuler1/page (142).png',
    'books/butun oykuler1/page (143).png',
    'books/butun oykuler1/page (144).png',
    'books/butun oykuler1/page (145).png',
    'books/butun oykuler1/page (146).png',
    'books/butun oykuler1/page (147).png',
    'books/butun oykuler1/page (148).png',
    'books/butun oykuler1/page (149).png',
    'books/butun oykuler1/page (150).png',
    'books/butun oykuler1/page (151).png',
    'books/butun oykuler1/page (152).png',
    'books/butun oykuler1/page (153).png',
    'books/butun oykuler1/page (154).png',
    'books/butun oykuler1/page (155).png',
    'books/butun oykuler1/page (156).png',
    'books/butun oykuler1/page (157).png',
    'books/butun oykuler1/page (158).png',
    'books/butun oykuler1/page (159).png',
    'books/butun oykuler1/page (160).png',
    'books/butun oykuler1/page (161).png',
    'books/butun oykuler1/page (162).png',
    'books/butun oykuler1/page (163).png',
    'books/butun oykuler1/page (164).png',
    'books/butun oykuler1/page (165).png',
    'books/butun oykuler1/page (166).png',
    'books/butun oykuler1/page (167).png',
    'books/butun oykuler1/page (168).png',
    'books/butun oykuler1/page (169).png',
    'books/butun oykuler1/page (170).png',
    'books/butun oykuler1/page (171).png',
    'books/butun oykuler1/page (172).png',
    'books/butun oykuler1/page (173).png',
    'books/butun oykuler1/page (174).png',
    'books/butun oykuler1/page (175).png',
    'books/butun oykuler1/page (176).png',
    'books/butun oykuler1/page (177).png',
    'books/butun oykuler1/page (178).png',
    'books/butun oykuler1/page (179).png',
    'books/butun oykuler1/page (180).png',
    'books/butun oykuler1/page (181).png',
    'books/butun oykuler1/page (182).png',
    'books/butun oykuler1/page (183).png',
    'books/butun oykuler1/page (184).png',
    'books/butun oykuler1/page (185).png',
    'books/butun oykuler1/page (186).png',
    'books/butun oykuler1/page (187).png',
    'books/butun oykuler1/page (188).png',
    'books/butun oykuler1/page (189).png',
    'books/butun oykuler1/page (190).png',
    'books/butun oykuler1/page (191).png',
    'books/butun oykuler1/page (192).png',
    'books/butun oykuler1/page (193).png',
    'books/butun oykuler1/page (194).png',
    'books/butun oykuler1/page (195).png',
    'books/butun oykuler1/page (196).png',
    'books/butun oykuler1/page (197).png',
    'books/butun oykuler1/page (198).png',
    'books/butun oykuler1/page (199).png',
    'books/butun oykuler1/page (200).png',
    'books/butun oykuler1/page (201).png',
    'books/butun oykuler1/page (202).png',
    'books/butun oykuler1/page (203).png',
    'books/butun oykuler1/page (204).png',
    'books/butun oykuler1/page (205).png',
    'books/butun oykuler1/page (206).png',
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
