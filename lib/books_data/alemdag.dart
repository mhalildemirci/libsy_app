import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class alemdag extends StatefulWidget {
  const alemdag({Key? key}) : super(key: key);

  @override
  State<alemdag> createState() => _alemdagState();
}

class _alemdagState extends State<alemdag> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Alemdag/page (1).png',
    'books/Alemdag/page (2).png',
    'books/Alemdag/page (3).png',
    'books/Alemdag/page (4).png',
    'books/Alemdag/page (5).png',
    'books/Alemdag/page (6).png',
    'books/Alemdag/page (7).png',
    'books/Alemdag/page (8).png',
    'books/Alemdag/page (9).png',
    'books/Alemdag/page (10).png',
    'books/Alemdag/page (11).png',
    'books/Alemdag/page (12).png',
    'books/Alemdag/page (13).png',
    'books/Alemdag/page (14).png',
    'books/Alemdag/page (15).png',
    'books/Alemdag/page (16).png',
    'books/Alemdag/page (17).png',
    'books/Alemdag/page (18).png',
    'books/Alemdag/page (19).png',
    'books/Alemdag/page (20).png',
    'books/Alemdag/page (21).png',
    'books/Alemdag/page (22).png',
    'books/Alemdag/page (23).png',
    'books/Alemdag/page (24).png',
    'books/Alemdag/page (25).png',
    'books/Alemdag/page (26).png',
    'books/Alemdag/page (27).png',
    'books/Alemdag/page (28).png',
    'books/Alemdag/page (29).png',
    'books/Alemdag/page (30).png',
    'books/Alemdag/page (31).png',
    'books/Alemdag/page (32).png',
    'books/Alemdag/page (33).png',
    'books/Alemdag/page (34).png',
    'books/Alemdag/page (35).png',
    'books/Alemdag/page (36).png',
    'books/Alemdag/page (37).png',
    'books/Alemdag/page (38).png',
    'books/Alemdag/page (39).png',
    'books/Alemdag/page (40).png',
    'books/Alemdag/page (41).png',
    'books/Alemdag/page (42).png',
    'books/Alemdag/page (43).png',
    'books/Alemdag/page (44).png',
    'books/Alemdag/page (45).png',
    'books/Alemdag/page (46).png',
    'books/Alemdag/page (47).png',
    'books/Alemdag/page (48).png',
    'books/Alemdag/page (49).png',
    'books/Alemdag/page (50).png',
    'books/Alemdag/page (51).png',
    'books/Alemdag/page (52).png',
    'books/Alemdag/page (53).png',
    'books/Alemdag/page (54).png',
    'books/Alemdag/page (55).png',
    'books/Alemdag/page (56).png',
    'books/Alemdag/page (57).png',
    'books/Alemdag/page (58).png',
    'books/Alemdag/page (59).png',
    'books/Alemdag/page (60).png',
    'books/Alemdag/page (61).png',
    'books/Alemdag/page (62).png',
    'books/Alemdag/page (63).png',
    'books/Alemdag/page (64).png',
    'books/Alemdag/page (65).png',
    'books/Alemdag/page (66).png',
    'books/Alemdag/page (67).png',
    'books/Alemdag/page (68).png',
    'books/Alemdag/page (69).png',
    'books/Alemdag/page (70).png',
    'books/Alemdag/page (71).png',
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
