import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class alicesadventures extends StatefulWidget {
  const alicesadventures({Key? key}) : super(key: key);

  @override
  State<alicesadventures> createState() => _alicesadventuresState();
}

class _alicesadventuresState extends State<alicesadventures> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Alices Adventures/page (1).png',
    'books/Alices Adventures/page (2).png',
    'books/Alices Adventures/page (3).png',
    'books/Alices Adventures/page (4).png',
    'books/Alices Adventures/page (5).png',
    'books/Alices Adventures/page (6).png',
    'books/Alices Adventures/page (7).png',
    'books/Alices Adventures/page (8).png',
    'books/Alices Adventures/page (9).png',
    'books/Alices Adventures/page (10).png',
    'books/Alices Adventures/page (11).png',
    'books/Alices Adventures/page (12).png',
    'books/Alices Adventures/page (13).png',
    'books/Alices Adventures/page (14).png',
    'books/Alices Adventures/page (15).png',
    'books/Alices Adventures/page (16).png',
    'books/Alices Adventures/page (17).png',
    'books/Alices Adventures/page (18).png',
    'books/Alices Adventures/page (19).png',
    'books/Alices Adventures/page (20).png',
    'books/Alices Adventures/page (21).png',
    'books/Alices Adventures/page (22).png',
    'books/Alices Adventures/page (23).png',
    'books/Alices Adventures/page (24).png',
    'books/Alices Adventures/page (25).png',
    'books/Alices Adventures/page (26).png',
    'books/Alices Adventures/page (27).png',
    'books/Alices Adventures/page (28).png',
    'books/Alices Adventures/page (29).png',
    'books/Alices Adventures/page (30).png',
    'books/Alices Adventures/page (31).png',
    'books/Alices Adventures/page (32).png',
    'books/Alices Adventures/page (33).png',
    'books/Alices Adventures/page (34).png',
    'books/Alices Adventures/page (35).png',
    'books/Alices Adventures/page (36).png',
    'books/Alices Adventures/page (37).png',
    'books/Alices Adventures/page (38).png',
    'books/Alices Adventures/page (39).png',
    'books/Alices Adventures/page (40).png',
    'books/Alices Adventures/page (41).png',
    'books/Alices Adventures/page (42).png',
    'books/Alices Adventures/page (43).png',
    'books/Alices Adventures/page (44).png',
    'books/Alices Adventures/page (45).png',
    'books/Alices Adventures/page (46).png',
    'books/Alices Adventures/page (47).png',
    'books/Alices Adventures/page (48).png',
    'books/Alices Adventures/page (49).png',
    'books/Alices Adventures/page (50).png',
    'books/Alices Adventures/page (51).png',
    'books/Alices Adventures/page (52).png',
    'books/Alices Adventures/page (53).png',
    'books/Alices Adventures/page (54).png',
    'books/Alices Adventures/page (55).png',
    'books/Alices Adventures/page (56).png',
    'books/Alices Adventures/page (57).png',
    'books/Alices Adventures/page (58).png',
    'books/Alices Adventures/page (59).png',
    'books/Alices Adventures/page (60).png',
    'books/Alices Adventures/page (61).png',
    'books/Alices Adventures/page (62).png',
    'books/Alices Adventures/page (63).png',
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
