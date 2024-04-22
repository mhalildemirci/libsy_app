import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class confidence extends StatefulWidget {
  const confidence({Key? key}) : super(key: key);

  @override
  State<confidence> createState() => _confidenceState();
}

class _confidenceState extends State<confidence> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/confidence/page (1).png',
    'books/confidence/page (2).png',
    'books/confidence/page (3).png',
    'books/confidence/page (4).png',
    'books/confidence/page (5).png',
    'books/confidence/page (6).png',
    'books/confidence/page (7).png',
    'books/confidence/page (8).png',
    'books/confidence/page (9).png',
    'books/confidence/page (10).png',
    'books/confidence/page (11).png',
    'books/confidence/page (12).png',
    'books/confidence/page (13).png',
    'books/confidence/page (14).png',
    'books/confidence/page (15).png',
    'books/confidence/page (16).png',
    'books/confidence/page (17).png',
    'books/confidence/page (18).png',
    'books/confidence/page (19).png',
    'books/confidence/page (20).png',
    'books/confidence/page (21).png',
    'books/confidence/page (22).png',
    'books/confidence/page (23).png',
    'books/confidence/page (24).png',
    'books/confidence/page (25).png',
    'books/confidence/page (26).png',
    'books/confidence/page (27).png',
    'books/confidence/page (28).png',
    'books/confidence/page (29).png',
    'books/confidence/page (30).png',
    'books/confidence/page (31).png',
    'books/confidence/page (32).png',
    'books/confidence/page (33).png',
    'books/confidence/page (34).png',
    'books/confidence/page (35).png',
    'books/confidence/page (36).png',
    'books/confidence/page (37).png',
    'books/confidence/page (38).png',
    'books/confidence/page (39).png',
    'books/confidence/page (40).png',
    'books/confidence/page (41).png',
    'books/confidence/page (42).png',
    'books/confidence/page (43).png',
    'books/confidence/page (44).png',
    'books/confidence/page (45).png',
    'books/confidence/page (46).png',
    'books/confidence/page (47).png',
    'books/confidence/page (48).png',
    'books/confidence/page (49).png',
    'books/confidence/page (50).png',
    'books/confidence/page (51).png',
    'books/confidence/page (52).png',
    'books/confidence/page (53).png',
    'books/confidence/page (54).png',
    'books/confidence/page (55).png',
    'books/confidence/page (56).png',
    'books/confidence/page (57).png',
    'books/confidence/page (58).png',
    'books/confidence/page (59).png',
    'books/confidence/page (60).png',
    'books/confidence/page (61).png',
    'books/confidence/page (62).png',
    'books/confidence/page (63).png',
    'books/confidence/page (64).png',
    'books/confidence/page (65).png',
    'books/confidence/page (66).png',
    'books/confidence/page (67).png',
    'books/confidence/page (68).png',
    'books/confidence/page (69).png',
    'books/confidence/page (70).png',
    'books/confidence/page (71).png',
    'books/confidence/page (72).png',
    'books/confidence/page (73).png',
    'books/confidence/page (74).png',
    'books/confidence/page (75).png',
    'books/confidence/page (76).png',
    'books/confidence/page (77).png',
    'books/confidence/page (78).png',
    'books/confidence/page (79).png',
    'books/confidence/page (80).png',
    'books/confidence/page (81).png',
    'books/confidence/page (82).png',
    'books/confidence/page (83).png',
    'books/confidence/page (84).png',
    'books/confidence/page (85).png',
    'books/confidence/page (86).png',
    'books/confidence/page (87).png',
    'books/confidence/page (88).png',
    'books/confidence/page (89).png',
    'books/confidence/page (90).png',
    'books/confidence/page (91).png',
    'books/confidence/page (92).png',
    'books/confidence/page (93).png',
    'books/confidence/page (94).png',
    'books/confidence/page (95).png',
    'books/confidence/page (96).png',
    'books/confidence/page (97).png',
    'books/confidence/page (98).png',
    'books/confidence/page (99).png',
    'books/confidence/page (100).png',
    'books/confidence/page (101).png',
    'books/confidence/page (102).png',
    'books/confidence/page (103).png',
    'books/confidence/page (104).png',
    'books/confidence/page (105).png',
    'books/confidence/page (106).png',
    'books/confidence/page (107).png',
    'books/confidence/page (108).png',
    'books/confidence/page (109).png',
    'books/confidence/page (110).png',
    'books/confidence/page (111).png',
    'books/confidence/page (112).png',
    'books/confidence/page (113).png',
    'books/confidence/page (114).png',
    'books/confidence/page (115).png',
    'books/confidence/page (116).png',
    'books/confidence/page (117).png',
    'books/confidence/page (118).png',
    'books/confidence/page (119).png',
    'books/confidence/page (120).png',
    'books/confidence/page (121).png',
    'books/confidence/page (122).png',
    'books/confidence/page (123).png',
    'books/confidence/page (124).png',
    'books/confidence/page (125).png',
    'books/confidence/page (126).png',
    'books/confidence/page (127).png',
    'books/confidence/page (128).png',
    'books/confidence/page (129).png',
    'books/confidence/page (130).png',
    'books/confidence/page (131).png',
    'books/confidence/page (132).png',
    'books/confidence/page (133).png',
    'books/confidence/page (134).png',
    'books/confidence/page (135).png',
    'books/confidence/page (136).png',
    'books/confidence/page (137).png',
    'books/confidence/page (138).png',
    'books/confidence/page (139).png',
    'books/confidence/page (140).png',
    'books/confidence/page (141).png',
    'books/confidence/page (142).png',
    'books/confidence/page (143).png',
    'books/confidence/page (144).png',
    'books/confidence/page (145).png',
    'books/confidence/page (146).png',
    'books/confidence/page (147).png',
    'books/confidence/page (148).png',
    'books/confidence/page (149).png',
    'books/confidence/page (150).png',
    'books/confidence/page (151).png',
    'books/confidence/page (152).png',
    'books/confidence/page (153).png',
    'books/confidence/page (154).png',
    'books/confidence/page (155).png',
    'books/confidence/page (156).png',
    'books/confidence/page (157).png',
    'books/confidence/page (158).png',
    'books/confidence/page (159).png',
    'books/confidence/page (160).png',
    'books/confidence/page (161).png',
    'books/confidence/page (162).png',
    'books/confidence/page (163).png',
    'books/confidence/page (164).png',
    'books/confidence/page (165).png',
    'books/confidence/page (166).png',
    'books/confidence/page (167).png',
    'books/confidence/page (168).png',
    'books/confidence/page (169).png',
    'books/confidence/page (170).png',
    'books/confidence/page (171).png',
    'books/confidence/page (172).png',

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
