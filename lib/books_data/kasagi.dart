import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kasagi extends StatefulWidget {
  const kasagi({Key? key}) : super(key: key);

  @override
  State<kasagi> createState() => _kasagiState();
}

class _kasagiState extends State<kasagi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kasagi/page (1).png',
    'books/kasagi/page (2).png',
    'books/kasagi/page (3).png',
    'books/kasagi/page (4).png',
    'books/kasagi/page (5).png',
    'books/kasagi/page (6).png',
    'books/kasagi/page (7).png',
    'books/kasagi/page (8).png',
    'books/kasagi/page (9).png',
    'books/kasagi/page (10).png',
    'books/kasagi/page (11).png',
    'books/kasagi/page (12).png',
    'books/kasagi/page (13).png',
    'books/kasagi/page (14).png',
    'books/kasagi/page (15).png',
    'books/kasagi/page (16).png',
    'books/kasagi/page (17).png',
    'books/kasagi/page (18).png',
    'books/kasagi/page (19).png',
    'books/kasagi/page (20).png',
    'books/kasagi/page (21).png',
    'books/kasagi/page (22).png',
    'books/kasagi/page (23).png',
    'books/kasagi/page (24).png',
    'books/kasagi/page (25).png',
    'books/kasagi/page (26).png',
    'books/kasagi/page (27).png',
    'books/kasagi/page (28).png',
    'books/kasagi/page (29).png',
    'books/kasagi/page (30).png',
    'books/kasagi/page (31).png',
    'books/kasagi/page (32).png',
    'books/kasagi/page (33).png',
    'books/kasagi/page (34).png',
    'books/kasagi/page (35).png',
    'books/kasagi/page (36).png',
    'books/kasagi/page (37).png',
    'books/kasagi/page (38).png',
    'books/kasagi/page (39).png',
    'books/kasagi/page (40).png',
    'books/kasagi/page (41).png',
    'books/kasagi/page (42).png',
    'books/kasagi/page (43).png',
    'books/kasagi/page (44).png',
    'books/kasagi/page (45).png',
    'books/kasagi/page (46).png',
    'books/kasagi/page (47).png',

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
