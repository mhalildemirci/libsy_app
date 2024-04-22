import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class slyvie extends StatefulWidget {
  const slyvie({Key? key}) : super(key: key);

  @override
  State<slyvie> createState() => _slyvieState();
}

class _slyvieState extends State<slyvie> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/slyvie/page (1).png',
    'books/slyvie/page (2).png',
    'books/slyvie/page (3).png',
    'books/slyvie/page (4).png',
    'books/slyvie/page (5).png',
    'books/slyvie/page (6).png',
    'books/slyvie/page (7).png',
    'books/slyvie/page (8).png',
    'books/slyvie/page (9).png',
    'books/slyvie/page (10).png',
    'books/slyvie/page (11).png',
    'books/slyvie/page (12).png',
    'books/slyvie/page (13).png',
    'books/slyvie/page (14).png',
    'books/slyvie/page (15).png',
    'books/slyvie/page (16).png',
    'books/slyvie/page (17).png',
    'books/slyvie/page (18).png',
    'books/slyvie/page (19).png',
    'books/slyvie/page (20).png',
    'books/slyvie/page (21).png',
    'books/slyvie/page (22).png',
    'books/slyvie/page (23).png',
    'books/slyvie/page (24).png',
    'books/slyvie/page (25).png',
    'books/slyvie/page (26).png',
    'books/slyvie/page (27).png',
    'books/slyvie/page (28).png',
    'books/slyvie/page (29).png',
    'books/slyvie/page (30).png',
    'books/slyvie/page (31).png',
    'books/slyvie/page (32).png',
    'books/slyvie/page (33).png',
    'books/slyvie/page (34).png',
    'books/slyvie/page (35).png',
    'books/slyvie/page (36).png',
    'books/slyvie/page (37).png',
    'books/slyvie/page (38).png',
    'books/slyvie/page (39).png',
    'books/slyvie/page (40).png',
    'books/slyvie/page (41).png',
    'books/slyvie/page (42).png',
    'books/slyvie/page (43).png',
    'books/slyvie/page (44).png',
    'books/slyvie/page (45).png',
    'books/slyvie/page (46).png',
    'books/slyvie/page (47).png',
    'books/slyvie/page (48).png',
    'books/slyvie/page (49).png',
    'books/slyvie/page (50).png',
    'books/slyvie/page (51).png',
    'books/slyvie/page (52).png',
    'books/slyvie/page (53).png',
    'books/slyvie/page (54).png',
    'books/slyvie/page (55).png',
    'books/slyvie/page (56).png',
    'books/slyvie/page (57).png',
    'books/slyvie/page (58).png',
    'books/slyvie/page (59).png',
    'books/slyvie/page (60).png',
    'books/slyvie/page (61).png',
    'books/slyvie/page (62).png',
    'books/slyvie/page (63).png',
    'books/slyvie/page (64).png',
    'books/slyvie/page (65).png',
    'books/slyvie/page (66).png',
    'books/slyvie/page (67).png',
    'books/slyvie/page (68).png',
    'books/slyvie/page (69).png',
    'books/slyvie/page (70).png',
    'books/slyvie/page (71).png',
    'books/slyvie/page (72).png',
    'books/slyvie/page (73).png',
    'books/slyvie/page (74).png',
    'books/slyvie/page (75).png',
    'books/slyvie/page (76).png',
    'books/slyvie/page (77).png',
    'books/slyvie/page (78).png',
    'books/slyvie/page (79).png',
    'books/slyvie/page (80).png',
    'books/slyvie/page (81).png',
    'books/slyvie/page (82).png',
    'books/slyvie/page (83).png',
    'books/slyvie/page (84).png',
    'books/slyvie/page (85).png',
    'books/slyvie/page (86).png',
    'books/slyvie/page (87).png',
    'books/slyvie/page (88).png',
    'books/slyvie/page (89).png',
    'books/slyvie/page (90).png',
    'books/slyvie/page (91).png',
    'books/slyvie/page (92).png',
    'books/slyvie/page (93).png',
    'books/slyvie/page (94).png',
    'books/slyvie/page (95).png',
    'books/slyvie/page (96).png',
    'books/slyvie/page (97).png',
    'books/slyvie/page (98).png',
    'books/slyvie/page (99).png',
    'books/slyvie/page (100).png',
    'books/slyvie/page (101).png',
    'books/slyvie/page (102).png',
    'books/slyvie/page (103).png',
    'books/slyvie/page (104).png',
    'books/slyvie/page (105).png',
    'books/slyvie/page (106).png',
    'books/slyvie/page (107).png',
    'books/slyvie/page (108).png',
    'books/slyvie/page (109).png',
    'books/slyvie/page (110).png',
    'books/slyvie/page (111).png',
    'books/slyvie/page (112).png',
    'books/slyvie/page (113).png',
    'books/slyvie/page (114).png',
    'books/slyvie/page (115).png',
    'books/slyvie/page (116).png',
    'books/slyvie/page (117).png',
    'books/slyvie/page (118).png',
    'books/slyvie/page (119).png',
    'books/slyvie/page (120).png',
    'books/slyvie/page (121).png',
    'books/slyvie/page (122).png',
    'books/slyvie/page (123).png',
    'books/slyvie/page (124).png',
    'books/slyvie/page (125).png',
    'books/slyvie/page (126).png',
    'books/slyvie/page (127).png',
    'books/slyvie/page (128).png',
    'books/slyvie/page (129).png',
    'books/slyvie/page (130).png',
    'books/slyvie/page (131).png',
    'books/slyvie/page (132).png',
    'books/slyvie/page (133).png',
    'books/slyvie/page (134).png',
    'books/slyvie/page (135).png',
    'books/slyvie/page (136).png',
    'books/slyvie/page (137).png',
    'books/slyvie/page (138).png',
    'books/slyvie/page (139).png',
    'books/slyvie/page (140).png',
    'books/slyvie/page (141).png',
    'books/slyvie/page (142).png',
    'books/slyvie/page (143).png',
    'books/slyvie/page (144).png',
    'books/slyvie/page (145).png',
    'books/slyvie/page (146).png',
    'books/slyvie/page (147).png',
    'books/slyvie/page (148).png',
    'books/slyvie/page (149).png',
    'books/slyvie/page (150).png',
    'books/slyvie/page (151).png',
    'books/slyvie/page (152).png',
    'books/slyvie/page (153).png',
    'books/slyvie/page (154).png',
    'books/slyvie/page (155).png',
    'books/slyvie/page (156).png',
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
