import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class marieroget extends StatefulWidget {
  const marieroget({Key? key}) : super(key: key);

  @override
  State<marieroget> createState() => _marierogetState();
}

class _marierogetState extends State<marieroget> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/marie roget/page (1).png',
    'books/marie roget/page (2).png',
    'books/marie roget/page (3).png',
    'books/marie roget/page (4).png',
    'books/marie roget/page (5).png',
    'books/marie roget/page (6).png',
    'books/marie roget/page (7).png',
    'books/marie roget/page (8).png',
    'books/marie roget/page (9).png',
    'books/marie roget/page (10).png',
    'books/marie roget/page (11).png',
    'books/marie roget/page (12).png',
    'books/marie roget/page (13).png',
    'books/marie roget/page (14).png',
    'books/marie roget/page (15).png',
    'books/marie roget/page (16).png',
    'books/marie roget/page (17).png',
    'books/marie roget/page (18).png',
    'books/marie roget/page (19).png',
    'books/marie roget/page (20).png',
    'books/marie roget/page (21).png',
    'books/marie roget/page (22).png',
    'books/marie roget/page (23).png',
    'books/marie roget/page (24).png',
    'books/marie roget/page (25).png',
    'books/marie roget/page (26).png',
    'books/marie roget/page (27).png',
    'books/marie roget/page (28).png',
    'books/marie roget/page (29).png',
    'books/marie roget/page (30).png',
    'books/marie roget/page (31).png',
    'books/marie roget/page (32).png',
    'books/marie roget/page (33).png',
    'books/marie roget/page (34).png',
    'books/marie roget/page (35).png',
    'books/marie roget/page (36).png',
    'books/marie roget/page (37).png',
    'books/marie roget/page (38).png',

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
