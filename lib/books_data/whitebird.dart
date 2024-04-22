import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class whitebird extends StatefulWidget {
  const whitebird({Key? key}) : super(key: key);

  @override
  State<whitebird> createState() => _whitebirdState();
}

class _whitebirdState extends State<whitebird> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/white bird/page (1).png',
    'books/white bird/page (2).png',
    'books/white bird/page (3).png',
    'books/white bird/page (4).png',
    'books/white bird/page (5).png',
    'books/white bird/page (6).png',
    'books/white bird/page (7).png',
    'books/white bird/page (8).png',
    'books/white bird/page (9).png',
    'books/white bird/page (10).png',
    'books/white bird/page (11).png',
    'books/white bird/page (12).png',
    'books/white bird/page (13).png',
    'books/white bird/page (14).png',
    'books/white bird/page (15).png',
    'books/white bird/page (16).png',
    'books/white bird/page (17).png',
    'books/white bird/page (18).png',
    'books/white bird/page (19).png',
    'books/white bird/page (20).png',
    'books/white bird/page (21).png',
    'books/white bird/page (22).png',
    'books/white bird/page (23).png',
    'books/white bird/page (24).png',
    'books/white bird/page (25).png',
    'books/white bird/page (26).png',
    'books/white bird/page (27).png',
    'books/white bird/page (28).png',
    'books/white bird/page (29).png',
    'books/white bird/page (30).png',
    'books/white bird/page (31).png',
    'books/white bird/page (32).png',
    'books/white bird/page (33).png',
    'books/white bird/page (34).png',
    'books/white bird/page (35).png',
    'books/white bird/page (36).png',
    'books/white bird/page (37).png',
    'books/white bird/page (38).png',
    'books/white bird/page (39).png',
    'books/white bird/page (40).png',
    'books/white bird/page (41).png',
    'books/white bird/page (42).png',
    'books/white bird/page (43).png',
    'books/white bird/page (44).png',
    'books/white bird/page (45).png',
    'books/white bird/page (46).png',
    'books/white bird/page (47).png',
    'books/white bird/page (48).png',
    'books/white bird/page (49).png',
    'books/white bird/page (50).png',
    'books/white bird/page (51).png',
    'books/white bird/page (52).png',
    'books/white bird/page (53).png',
    'books/white bird/page (54).png',
    'books/white bird/page (55).png',
    'books/white bird/page (56).png',
    'books/white bird/page (57).png',
    'books/white bird/page (58).png',
    'books/white bird/page (59).png',
    'books/white bird/page (60).png',
    'books/white bird/page (61).png',
    'books/white bird/page (62).png',
    'books/white bird/page (63).png',
    'books/white bird/page (64).png',
    'books/white bird/page (65).png',
    'books/white bird/page (66).png',
    'books/white bird/page (67).png',
    'books/white bird/page (68).png',
    'books/white bird/page (69).png',
    'books/white bird/page (70).png',
    'books/white bird/page (71).png',
    'books/white bird/page (72).png',
    'books/white bird/page (73).png',
    'books/white bird/page (74).png',
    'books/white bird/page (75).png',
    'books/white bird/page (76).png',
    'books/white bird/page (77).png',
    'books/white bird/page (78).png',
    'books/white bird/page (79).png',
    'books/white bird/page (80).png',
    'books/white bird/page (81).png',
    'books/white bird/page (82).png',
    'books/white bird/page (83).png',
    'books/white bird/page (84).png',
    'books/white bird/page (85).png',
    'books/white bird/page (86).png',
    'books/white bird/page (87).png',
    'books/white bird/page (88).png',
    'books/white bird/page (89).png',
    'books/white bird/page (90).png',
    'books/white bird/page (91).png',
    'books/white bird/page (92).png',
    'books/white bird/page (93).png',
    'books/white bird/page (94).png',
    'books/white bird/page (95).png',
    'books/white bird/page (96).png',
    'books/white bird/page (97).png',
    'books/white bird/page (98).png',
    'books/white bird/page (99).png',
    'books/white bird/page (100).png',
    'books/white bird/page (101).png',
    'books/white bird/page (102).png',
    'books/white bird/page (103).png',
    'books/white bird/page (104).png',
    'books/white bird/page (105).png',
    'books/white bird/page (106).png',
    'books/white bird/page (107).png',
    'books/white bird/page (108).png',
    'books/white bird/page (109).png',
    'books/white bird/page (110).png',
    'books/white bird/page (111).png',
    'books/white bird/page (112).png',
    'books/white bird/page (113).png',
    'books/white bird/page (114).png',
    'books/white bird/page (115).png',
    'books/white bird/page (116).png',
    'books/white bird/page (117).png',
    'books/white bird/page (118).png',
    'books/white bird/page (119).png',
    'books/white bird/page (120).png',
    'books/white bird/page (121).png',
    'books/white bird/page (122).png',
    'books/white bird/page (123).png',
    'books/white bird/page (124).png',
    'books/white bird/page (125).png',
    'books/white bird/page (126).png',
    'books/white bird/page (127).png',
    'books/white bird/page (128).png',
    'books/white bird/page (129).png',
    'books/white bird/page (130).png',
    'books/white bird/page (131).png',
    'books/white bird/page (132).png',
    'books/white bird/page (133).png',
    'books/white bird/page (134).png',
    'books/white bird/page (135).png',
    'books/white bird/page (136).png',
    'books/white bird/page (137).png',
    'books/white bird/page (138).png',
    'books/white bird/page (139).png',
    'books/white bird/page (140).png',
    'books/white bird/page (141).png',
    'books/white bird/page (142).png',
    'books/white bird/page (143).png',
    'books/white bird/page (144).png',
    'books/white bird/page (145).png',
    'books/white bird/page (146).png',
    'books/white bird/page (147).png',
    'books/white bird/page (148).png',
    'books/white bird/page (149).png',
    'books/white bird/page (150).png',
    'books/white bird/page (151).png',
    'books/white bird/page (152).png',
    'books/white bird/page (153).png',
    'books/white bird/page (154).png',
    'books/white bird/page (155).png',
    'books/white bird/page (156).png',
    'books/white bird/page (157).png',
    'books/white bird/page (158).png',
    'books/white bird/page (159).png',
    'books/white bird/page (160).png',
    'books/white bird/page (161).png',
    'books/white bird/page (162).png',
    'books/white bird/page (163).png',
    'books/white bird/page (164).png',
    'books/white bird/page (165).png',
    'books/white bird/page (166).png',
    'books/white bird/page (167).png',

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
