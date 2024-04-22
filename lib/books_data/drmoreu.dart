import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class drmoreu extends StatefulWidget {
  const drmoreu({Key? key}) : super(key: key);

  @override
  State<drmoreu> createState() => _drmoreuState();
}

class _drmoreuState extends State<drmoreu> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/island of dr.moreau/page (1).png',
    'books/island of dr.moreau/page (2).png',
    'books/island of dr.moreau/page (3).png',
    'books/island of dr.moreau/page (4).png',
    'books/island of dr.moreau/page (5).png',
    'books/island of dr.moreau/page (6).png',
    'books/island of dr.moreau/page (7).png',
    'books/island of dr.moreau/page (8).png',
    'books/island of dr.moreau/page (9).png',
    'books/island of dr.moreau/page (10).png',
    'books/island of dr.moreau/page (11).png',
    'books/island of dr.moreau/page (12).png',
    'books/island of dr.moreau/page (13).png',
    'books/island of dr.moreau/page (14).png',
    'books/island of dr.moreau/page (15).png',
    'books/island of dr.moreau/page (16).png',
    'books/island of dr.moreau/page (17).png',
    'books/island of dr.moreau/page (18).png',
    'books/island of dr.moreau/page (19).png',
    'books/island of dr.moreau/page (20).png',
    'books/island of dr.moreau/page (21).png',
    'books/island of dr.moreau/page (22).png',
    'books/island of dr.moreau/page (23).png',
    'books/island of dr.moreau/page (24).png',
    'books/island of dr.moreau/page (25).png',
    'books/island of dr.moreau/page (26).png',
    'books/island of dr.moreau/page (27).png',
    'books/island of dr.moreau/page (28).png',
    'books/island of dr.moreau/page (29).png',
    'books/island of dr.moreau/page (30).png',
    'books/island of dr.moreau/page (31).png',
    'books/island of dr.moreau/page (32).png',
    'books/island of dr.moreau/page (33).png',
    'books/island of dr.moreau/page (34).png',
    'books/island of dr.moreau/page (35).png',
    'books/island of dr.moreau/page (36).png',
    'books/island of dr.moreau/page (37).png',
    'books/island of dr.moreau/page (38).png',
    'books/island of dr.moreau/page (39).png',
    'books/island of dr.moreau/page (40).png',
    'books/island of dr.moreau/page (41).png',
    'books/island of dr.moreau/page (42).png',
    'books/island of dr.moreau/page (43).png',
    'books/island of dr.moreau/page (44).png',
    'books/island of dr.moreau/page (45).png',
    'books/island of dr.moreau/page (46).png',
    'books/island of dr.moreau/page (47).png',
    'books/island of dr.moreau/page (48).png',
    'books/island of dr.moreau/page (49).png',
    'books/island of dr.moreau/page (50).png',
    'books/island of dr.moreau/page (51).png',
    'books/island of dr.moreau/page (52).png',
    'books/island of dr.moreau/page (53).png',
    'books/island of dr.moreau/page (54).png',
    'books/island of dr.moreau/page (55).png',
    'books/island of dr.moreau/page (56).png',
    'books/island of dr.moreau/page (57).png',
    'books/island of dr.moreau/page (58).png',
    'books/island of dr.moreau/page (59).png',
    'books/island of dr.moreau/page (60).png',
    'books/island of dr.moreau/page (61).png',
    'books/island of dr.moreau/page (62).png',
    'books/island of dr.moreau/page (63).png',
    'books/island of dr.moreau/page (64).png',
    'books/island of dr.moreau/page (65).png',
    'books/island of dr.moreau/page (66).png',
    'books/island of dr.moreau/page (67).png',
    'books/island of dr.moreau/page (68).png',
    'books/island of dr.moreau/page (69).png',
    'books/island of dr.moreau/page (70).png',
    'books/island of dr.moreau/page (71).png',
    'books/island of dr.moreau/page (72).png',
    'books/island of dr.moreau/page (73).png',
    'books/island of dr.moreau/page (74).png',
    'books/island of dr.moreau/page (75).png',
    'books/island of dr.moreau/page (76).png',
    'books/island of dr.moreau/page (77).png',
    'books/island of dr.moreau/page (78).png',
    'books/island of dr.moreau/page (79).png',
    'books/island of dr.moreau/page (80).png',
    'books/island of dr.moreau/page (81).png',
    'books/island of dr.moreau/page (82).png',
    'books/island of dr.moreau/page (83).png',
    'books/island of dr.moreau/page (84).png',
    'books/island of dr.moreau/page (85).png',
    'books/island of dr.moreau/page (86).png',
    'books/island of dr.moreau/page (87).png',
    'books/island of dr.moreau/page (88).png',
    'books/island of dr.moreau/page (89).png',
    'books/island of dr.moreau/page (90).png',
    'books/island of dr.moreau/page (91).png',
    'books/island of dr.moreau/page (92).png',
    'books/island of dr.moreau/page (93).png',
    'books/island of dr.moreau/page (94).png',
    'books/island of dr.moreau/page (95).png',
    'books/island of dr.moreau/page (96).png',
    'books/island of dr.moreau/page (97).png',
    'books/island of dr.moreau/page (98).png',
    'books/island of dr.moreau/page (99).png',
    'books/island of dr.moreau/page (100).png',
    'books/island of dr.moreau/page (101).png',
    'books/island of dr.moreau/page (102).png',
    'books/island of dr.moreau/page (103).png',
    'books/island of dr.moreau/page (104).png',
    'books/island of dr.moreau/page (105).png',
    'books/island of dr.moreau/page (106).png',
    'books/island of dr.moreau/page (107).png',
    'books/island of dr.moreau/page (108).png',
    'books/island of dr.moreau/page (109).png',
    'books/island of dr.moreau/page (110).png',
    'books/island of dr.moreau/page (111).png',
    'books/island of dr.moreau/page (112).png',
    'books/island of dr.moreau/page (113).png',
    'books/island of dr.moreau/page (114).png',
    'books/island of dr.moreau/page (115).png',
    'books/island of dr.moreau/page (116).png',
    'books/island of dr.moreau/page (117).png',
    'books/island of dr.moreau/page (118).png',
    'books/island of dr.moreau/page (119).png',
    'books/island of dr.moreau/page (120).png',
    'books/island of dr.moreau/page (121).png',
    'books/island of dr.moreau/page (122).png',
    'books/island of dr.moreau/page (123).png',
    'books/island of dr.moreau/page (124).png',
    'books/island of dr.moreau/page (125).png',

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
