import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class midsummer extends StatefulWidget {
  const midsummer({Key? key}) : super(key: key);

  @override
  State<midsummer> createState() => _midsummerState();
}

class _midsummerState extends State<midsummer> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/midsummer/page (1).png',
    'books/midsummer/page (2).png',
    'books/midsummer/page (3).png',
    'books/midsummer/page (4).png',
    'books/midsummer/page (5).png',
    'books/midsummer/page (6).png',
    'books/midsummer/page (7).png',
    'books/midsummer/page (8).png',
    'books/midsummer/page (9).png',
    'books/midsummer/page (10).png',
    'books/midsummer/page (11).png',
    'books/midsummer/page (12).png',
    'books/midsummer/page (13).png',
    'books/midsummer/page (14).png',
    'books/midsummer/page (15).png',
    'books/midsummer/page (16).png',
    'books/midsummer/page (17).png',
    'books/midsummer/page (18).png',
    'books/midsummer/page (19).png',
    'books/midsummer/page (20).png',
    'books/midsummer/page (21).png',
    'books/midsummer/page (22).png',
    'books/midsummer/page (23).png',
    'books/midsummer/page (24).png',
    'books/midsummer/page (25).png',
    'books/midsummer/page (26).png',
    'books/midsummer/page (27).png',
    'books/midsummer/page (28).png',
    'books/midsummer/page (29).png',
    'books/midsummer/page (30).png',
    'books/midsummer/page (31).png',
    'books/midsummer/page (32).png',
    'books/midsummer/page (33).png',
    'books/midsummer/page (34).png',
    'books/midsummer/page (35).png',
    'books/midsummer/page (36).png',
    'books/midsummer/page (37).png',
    'books/midsummer/page (38).png',
    'books/midsummer/page (39).png',
    'books/midsummer/page (40).png',
    'books/midsummer/page (41).png',
    'books/midsummer/page (42).png',
    'books/midsummer/page (43).png',
    'books/midsummer/page (44).png',
    'books/midsummer/page (45).png',
    'books/midsummer/page (46).png',
    'books/midsummer/page (47).png',
    'books/midsummer/page (48).png',
    'books/midsummer/page (49).png',
    'books/midsummer/page (50).png',
    'books/midsummer/page (51).png',
    'books/midsummer/page (52).png',
    'books/midsummer/page (53).png',
    'books/midsummer/page (54).png',
    'books/midsummer/page (55).png',
    'books/midsummer/page (56).png',
    'books/midsummer/page (57).png',
    'books/midsummer/page (58).png',
    'books/midsummer/page (59).png',
    'books/midsummer/page (60).png',
    'books/midsummer/page (61).png',
    'books/midsummer/page (62).png',
    'books/midsummer/page (63).png',
    'books/midsummer/page (64).png',
    'books/midsummer/page (65).png',
    'books/midsummer/page (66).png',
    'books/midsummer/page (67).png',
    'books/midsummer/page (68).png',
    'books/midsummer/page (69).png',
    'books/midsummer/page (70).png',
    'books/midsummer/page (71).png',
    'books/midsummer/page (72).png',
    'books/midsummer/page (73).png',
    'books/midsummer/page (74).png',
    'books/midsummer/page (75).png',
    'books/midsummer/page (76).png',

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
