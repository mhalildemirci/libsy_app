import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sevisme extends StatefulWidget {
  const sevisme({Key? key}) : super(key: key);

  @override
  State<sevisme> createState() => _sevismeState();
}

class _sevismeState extends State<sevisme> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sevisme/page (1).png',
    'books/sevisme/page (2).png',
    'books/sevisme/page (3).png',
    'books/sevisme/page (4).png',
    'books/sevisme/page (5).png',
    'books/sevisme/page (6).png',
    'books/sevisme/page (7).png',
    'books/sevisme/page (8).png',
    'books/sevisme/page (9).png',
    'books/sevisme/page (10).png',
    'books/sevisme/page (11).png',
    'books/sevisme/page (12).png',
    'books/sevisme/page (13).png',
    'books/sevisme/page (14).png',
    'books/sevisme/page (15).png',
    'books/sevisme/page (16).png',
    'books/sevisme/page (17).png',
    'books/sevisme/page (18).png',
    'books/sevisme/page (19).png',
    'books/sevisme/page (20).png',
    'books/sevisme/page (21).png',
    'books/sevisme/page (22).png',
    'books/sevisme/page (23).png',
    'books/sevisme/page (24).png',
    'books/sevisme/page (25).png',
    'books/sevisme/page (26).png',
    'books/sevisme/page (27).png',
    'books/sevisme/page (28).png',
    'books/sevisme/page (29).png',
    'books/sevisme/page (30).png',
    'books/sevisme/page (31).png',
    'books/sevisme/page (32).png',
    'books/sevisme/page (33).png',
    'books/sevisme/page (34).png',
    'books/sevisme/page (35).png',
    'books/sevisme/page (36).png',
    'books/sevisme/page (37).png',
    'books/sevisme/page (38).png',
    'books/sevisme/page (39).png',
    'books/sevisme/page (40).png',

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
