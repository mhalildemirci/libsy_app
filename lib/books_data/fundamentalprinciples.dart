import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class fundamentalprinciples extends StatefulWidget {
  const fundamentalprinciples({Key? key}) : super(key: key);

  @override
  State<fundamentalprinciples> createState() => _fundamentalprinciplesState();
}

class _fundamentalprinciplesState extends State<fundamentalprinciples> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Fundamental Principles/page (1).png',
    'books/Fundamental Principles/page (2).png',
    'books/Fundamental Principles/page (3).png',
    'books/Fundamental Principles/page (4).png',
    'books/Fundamental Principles/page (5).png',
    'books/Fundamental Principles/page (6).png',
    'books/Fundamental Principles/page (7).png',
    'books/Fundamental Principles/page (8).png',
    'books/Fundamental Principles/page (9).png',
    'books/Fundamental Principles/page (10).png',
    'books/Fundamental Principles/page (11).png',
    'books/Fundamental Principles/page (12).png',
    'books/Fundamental Principles/page (13).png',
    'books/Fundamental Principles/page (14).png',
    'books/Fundamental Principles/page (15).png',
    'books/Fundamental Principles/page (16).png',
    'books/Fundamental Principles/page (17).png',
    'books/Fundamental Principles/page (18).png',
    'books/Fundamental Principles/page (19).png',
    'books/Fundamental Principles/page (20).png',
    'books/Fundamental Principles/page (21).png',
    'books/Fundamental Principles/page (22).png',
    'books/Fundamental Principles/page (23).png',
    'books/Fundamental Principles/page (24).png',
    'books/Fundamental Principles/page (25).png',
    'books/Fundamental Principles/page (26).png',
    'books/Fundamental Principles/page (27).png',
    'books/Fundamental Principles/page (28).png',
    'books/Fundamental Principles/page (29).png',
    'books/Fundamental Principles/page (30).png',
    'books/Fundamental Principles/page (31).png',
    'books/Fundamental Principles/page (32).png',
    'books/Fundamental Principles/page (33).png',
    'books/Fundamental Principles/page (34).png',
    'books/Fundamental Principles/page (35).png',
    'books/Fundamental Principles/page (36).png',
    'books/Fundamental Principles/page (37).png',
    'books/Fundamental Principles/page (38).png',
    'books/Fundamental Principles/page (39).png',
    'books/Fundamental Principles/page (40).png',
    'books/Fundamental Principles/page (41).png',
    'books/Fundamental Principles/page (42).png',
    'books/Fundamental Principles/page (43).png',
    'books/Fundamental Principles/page (44).png',
    'books/Fundamental Principles/page (45).png',
    'books/Fundamental Principles/page (46).png',
    'books/Fundamental Principles/page (47).png',
    'books/Fundamental Principles/page (48).png',
    'books/Fundamental Principles/page (49).png',
    'books/Fundamental Principles/page (50).png',
    'books/Fundamental Principles/page (51).png',
    'books/Fundamental Principles/page (52).png',
    'books/Fundamental Principles/page (53).png',
    'books/Fundamental Principles/page (54).png',
    'books/Fundamental Principles/page (55).png',
    'books/Fundamental Principles/page (56).png',
    'books/Fundamental Principles/page (57).png',
    'books/Fundamental Principles/page (58).png',
    'books/Fundamental Principles/page (59).png',
    'books/Fundamental Principles/page (60).png',
    'books/Fundamental Principles/page (61).png',
    'books/Fundamental Principles/page (62).png',
    'books/Fundamental Principles/page (63).png',
    'books/Fundamental Principles/page (64).png',
    'books/Fundamental Principles/page (65).png',
    'books/Fundamental Principles/page (66).png',
    'books/Fundamental Principles/page (67).png',
    'books/Fundamental Principles/page (68).png',
    'books/Fundamental Principles/page (69).png',
    'books/Fundamental Principles/page (70).png',
    'books/Fundamental Principles/page (71).png',
    'books/Fundamental Principles/page (72).png',
    'books/Fundamental Principles/page (73).png',

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
