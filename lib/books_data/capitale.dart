import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class capitale extends StatefulWidget {
  const capitale({Key? key}) : super(key: key);

  @override
  State<capitale> createState() => _capitaleState();
}

class _capitaleState extends State<capitale> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/capitale/page (1).png',
    'books/capitale/page (2).png',
    'books/capitale/page (3).png',
    'books/capitale/page (4).png',
    'books/capitale/page (5).png',
    'books/capitale/page (6).png',
    'books/capitale/page (7).png',
    'books/capitale/page (8).png',
    'books/capitale/page (9).png',
    'books/capitale/page (10).png',
    'books/capitale/page (11).png',
    'books/capitale/page (12).png',
    'books/capitale/page (13).png',
    'books/capitale/page (14).png',
    'books/capitale/page (15).png',
    'books/capitale/page (16).png',
    'books/capitale/page (17).png',
    'books/capitale/page (18).png',
    'books/capitale/page (19).png',
    'books/capitale/page (20).png',
    'books/capitale/page (21).png',
    'books/capitale/page (22).png',
    'books/capitale/page (23).png',
    'books/capitale/page (24).png',
    'books/capitale/page (25).png',
    'books/capitale/page (26).png',
    'books/capitale/page (27).png',
    'books/capitale/page (28).png',
    'books/capitale/page (29).png',
    'books/capitale/page (30).png',
    'books/capitale/page (31).png',
    'books/capitale/page (32).png',
    'books/capitale/page (33).png',
    'books/capitale/page (34).png',
    'books/capitale/page (35).png',
    'books/capitale/page (36).png',
    'books/capitale/page (37).png',
    'books/capitale/page (38).png',
    'books/capitale/page (39).png',
    'books/capitale/page (40).png',
    'books/capitale/page (41).png',
    'books/capitale/page (42).png',
    'books/capitale/page (43).png',
    'books/capitale/page (44).png',
    'books/capitale/page (45).png',
    'books/capitale/page (46).png',
    'books/capitale/page (47).png',
    'books/capitale/page (48).png',
    'books/capitale/page (49).png',
    'books/capitale/page (50).png',
    'books/capitale/page (51).png',
    'books/capitale/page (52).png',
    'books/capitale/page (53).png',
    'books/capitale/page (54).png',
    'books/capitale/page (55).png',
    'books/capitale/page (56).png',
    'books/capitale/page (57).png',
    'books/capitale/page (58).png',
    'books/capitale/page (59).png',
    'books/capitale/page (60).png',
    'books/capitale/page (61).png',
    'books/capitale/page (62).png',
    'books/capitale/page (63).png',
    'books/capitale/page (64).png',
    'books/capitale/page (65).png',
    'books/capitale/page (66).png',
    'books/capitale/page (67).png',
    'books/capitale/page (68).png',

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
