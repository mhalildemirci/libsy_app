import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class cadi extends StatefulWidget {
  const cadi({Key? key}) : super(key: key);

  @override
  State<cadi> createState() => _cadiState();
}

class _cadiState extends State<cadi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/cadi/page (1).png',
    'books/cadi/page (2).png',
    'books/cadi/page (3).png',
    'books/cadi/page (4).png',
    'books/cadi/page (5).png',
    'books/cadi/page (6).png',
    'books/cadi/page (7).png',
    'books/cadi/page (8).png',
    'books/cadi/page (9).png',
    'books/cadi/page (10).png',
    'books/cadi/page (11).png',
    'books/cadi/page (12).png',
    'books/cadi/page (13).png',
    'books/cadi/page (14).png',
    'books/cadi/page (15).png',
    'books/cadi/page (16).png',
    'books/cadi/page (17).png',
    'books/cadi/page (18).png',
    'books/cadi/page (19).png',
    'books/cadi/page (20).png',
    'books/cadi/page (21).png',
    'books/cadi/page (22).png',
    'books/cadi/page (23).png',
    'books/cadi/page (24).png',
    'books/cadi/page (25).png',
    'books/cadi/page (26).png',
    'books/cadi/page (27).png',
    'books/cadi/page (28).png',
    'books/cadi/page (29).png',
    'books/cadi/page (30).png',
    'books/cadi/page (31).png',
    'books/cadi/page (32).png',
    'books/cadi/page (33).png',
    'books/cadi/page (34).png',
    'books/cadi/page (35).png',
    'books/cadi/page (36).png',
    'books/cadi/page (37).png',
    'books/cadi/page (38).png',
    'books/cadi/page (39).png',
    'books/cadi/page (40).png',
    'books/cadi/page (41).png',
    'books/cadi/page (42).png',
    'books/cadi/page (43).png',
    'books/cadi/page (44).png',
    'books/cadi/page (45).png',
    'books/cadi/page (46).png',
    'books/cadi/page (47).png',
    'books/cadi/page (48).png',
    'books/cadi/page (49).png',
    'books/cadi/page (50).png',
    'books/cadi/page (51).png',
    'books/cadi/page (52).png',
    'books/cadi/page (53).png',
    'books/cadi/page (54).png',
    'books/cadi/page (55).png',
    'books/cadi/page (56).png',
    'books/cadi/page (57).png',
    'books/cadi/page (58).png',
    'books/cadi/page (59).png',
    'books/cadi/page (60).png',
    'books/cadi/page (61).png',
    'books/cadi/page (62).png',
    'books/cadi/page (63).png',
    'books/cadi/page (64).png',
    'books/cadi/page (65).png',
    'books/cadi/page (66).png',
    'books/cadi/page (67).png',
    'books/cadi/page (68).png',
    'books/cadi/page (69).png',
    'books/cadi/page (70).png',
    'books/cadi/page (71).png',
    'books/cadi/page (72).png',
    'books/cadi/page (73).png',
    'books/cadi/page (74).png',
    'books/cadi/page (75).png',
    'books/cadi/page (76).png',
    'books/cadi/page (77).png',
    'books/cadi/page (78).png',
    'books/cadi/page (79).png',
    'books/cadi/page (80).png',
    'books/cadi/page (81).png',
    'books/cadi/page (82).png',
    'books/cadi/page (83).png',
    'books/cadi/page (84).png',
    'books/cadi/page (85).png',
    'books/cadi/page (86).png',
    'books/cadi/page (87).png',
    'books/cadi/page (88).png',
    'books/cadi/page (89).png',
    'books/cadi/page (90).png',
    'books/cadi/page (91).png',
    'books/cadi/page (92).png',
    'books/cadi/page (93).png',
    'books/cadi/page (94).png',
    'books/cadi/page (95).png',
    'books/cadi/page (96).png',
    'books/cadi/page (97).png',
    'books/cadi/page (98).png',
    'books/cadi/page (99).png',
    'books/cadi/page (100).png',
    'books/cadi/page (101).png',
    'books/cadi/page (102).png',
    'books/cadi/page (103).png',
    'books/cadi/page (104).png',
    'books/cadi/page (105).png',
    'books/cadi/page (106).png',
    'books/cadi/page (107).png',
    'books/cadi/page (108).png',
    'books/cadi/page (109).png',
    'books/cadi/page (110).png',
    'books/cadi/page (111).png',
    'books/cadi/page (112).png',
    'books/cadi/page (113).png',
    'books/cadi/page (114).png',
    'books/cadi/page (115).png',
    'books/cadi/page (116).png',
    'books/cadi/page (117).png',
    'books/cadi/page (118).png',
    'books/cadi/page (119).png',
    'books/cadi/page (120).png',
    'books/cadi/page (121).png',
    'books/cadi/page (122).png',
    'books/cadi/page (123).png',
    'books/cadi/page (124).png',
    'books/cadi/page (125).png',
    'books/cadi/page (126).png',
    'books/cadi/page (127).png',
    'books/cadi/page (128).png',
    'books/cadi/page (129).png',
    'books/cadi/page (130).png',
    'books/cadi/page (131).png',
    'books/cadi/page (132).png',
    'books/cadi/page (133).png',
    'books/cadi/page (134).png',
    'books/cadi/page (135).png',
    'books/cadi/page (136).png',
    'books/cadi/page (137).png',

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
