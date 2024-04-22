import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class candide extends StatefulWidget {
  const candide({Key? key}) : super(key: key);

  @override
  State<candide> createState() => _candideState();
}

class _candideState extends State<candide> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/candide/page (1).png',
    'books/candide/page (2).png',
    'books/candide/page (3).png',
    'books/candide/page (4).png',
    'books/candide/page (5).png',
    'books/candide/page (6).png',
    'books/candide/page (7).png',
    'books/candide/page (8).png',
    'books/candide/page (9).png',
    'books/candide/page (10).png',
    'books/candide/page (11).png',
    'books/candide/page (12).png',
    'books/candide/page (13).png',
    'books/candide/page (14).png',
    'books/candide/page (15).png',
    'books/candide/page (16).png',
    'books/candide/page (17).png',
    'books/candide/page (18).png',
    'books/candide/page (19).png',
    'books/candide/page (20).png',
    'books/candide/page (21).png',
    'books/candide/page (22).png',
    'books/candide/page (23).png',
    'books/candide/page (24).png',
    'books/candide/page (25).png',
    'books/candide/page (26).png',
    'books/candide/page (27).png',
    'books/candide/page (28).png',
    'books/candide/page (29).png',
    'books/candide/page (30).png',
    'books/candide/page (31).png',
    'books/candide/page (32).png',
    'books/candide/page (33).png',
    'books/candide/page (34).png',
    'books/candide/page (35).png',
    'books/candide/page (36).png',
    'books/candide/page (37).png',
    'books/candide/page (38).png',
    'books/candide/page (39).png',
    'books/candide/page (40).png',
    'books/candide/page (41).png',
    'books/candide/page (42).png',
    'books/candide/page (43).png',
    'books/candide/page (44).png',
    'books/candide/page (45).png',
    'books/candide/page (46).png',
    'books/candide/page (47).png',
    'books/candide/page (48).png',
    'books/candide/page (49).png',
    'books/candide/page (50).png',
    'books/candide/page (51).png',
    'books/candide/page (52).png',
    'books/candide/page (53).png',
    'books/candide/page (54).png',
    'books/candide/page (55).png',
    'books/candide/page (56).png',
    'books/candide/page (57).png',
    'books/candide/page (58).png',
    'books/candide/page (59).png',
    'books/candide/page (60).png',
    'books/candide/page (61).png',
    'books/candide/page (62).png',
    'books/candide/page (63).png',
    'books/candide/page (64).png',
    'books/candide/page (65).png',
    'books/candide/page (66).png',
    'books/candide/page (67).png',
    'books/candide/page (68).png',
    'books/candide/page (69).png',
    'books/candide/page (70).png',
    'books/candide/page (71).png',
    'books/candide/page (72).png',
    'books/candide/page (73).png',
    'books/candide/page (74).png',
    'books/candide/page (75).png',
    'books/candide/page (76).png',
    'books/candide/page (77).png',
    'books/candide/page (78).png',
    'books/candide/page (79).png',
    'books/candide/page (80).png',
    'books/candide/page (81).png',
    'books/candide/page (82).png',
    'books/candide/page (83).png',
    'books/candide/page (84).png',
    'books/candide/page (85).png',
    'books/candide/page (86).png',
    'books/candide/page (87).png',
    'books/candide/page (88).png',
    'books/candide/page (89).png',
    'books/candide/page (90).png',
    'books/candide/page (91).png',
    'books/candide/page (92).png',
    'books/candide/page (93).png',
    'books/candide/page (94).png',
    'books/candide/page (95).png',
    'books/candide/page (96).png',
    'books/candide/page (97).png',
    'books/candide/page (98).png',
    'books/candide/page (99).png',
    'books/candide/page (100).png',
    'books/candide/page (101).png',
    'books/candide/page (102).png',
    'books/candide/page (103).png',
    'books/candide/page (104).png',
    'books/candide/page (105).png',
    'books/candide/page (106).png',
    'books/candide/page (107).png',
    'books/candide/page (108).png',
    'books/candide/page (109).png',
    'books/candide/page (110).png',
    'books/candide/page (111).png',
    'books/candide/page (112).png',
    'books/candide/page (113).png',

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
