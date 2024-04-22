import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class doowall extends StatefulWidget {
  const doowall({Key? key}) : super(key: key);

  @override
  State<doowall> createState() => _doowallState();
}

class _doowallState extends State<doowall> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/door in the wall/page (1).png',
    'books/door in the wall/page (2).png',
    'books/door in the wall/page (3).png',
    'books/door in the wall/page (4).png',
    'books/door in the wall/page (5).png',
    'books/door in the wall/page (6).png',
    'books/door in the wall/page (7).png',
    'books/door in the wall/page (8).png',
    'books/door in the wall/page (9).png',
    'books/door in the wall/page (10).png',
    'books/door in the wall/page (11).png',
    'books/door in the wall/page (12).png',
    'books/door in the wall/page (13).png',
    'books/door in the wall/page (14).png',
    'books/door in the wall/page (15).png',
    'books/door in the wall/page (16).png',
    'books/door in the wall/page (17).png',
    'books/door in the wall/page (18).png',
    'books/door in the wall/page (19).png',
    'books/door in the wall/page (20).png',
    'books/door in the wall/page (21).png',
    'books/door in the wall/page (22).png',
    'books/door in the wall/page (23).png',
    'books/door in the wall/page (24).png',
    'books/door in the wall/page (25).png',
    'books/door in the wall/page (26).png',
    'books/door in the wall/page (27).png',
    'books/door in the wall/page (28).png',
    'books/door in the wall/page (29).png',
    'books/door in the wall/page (30).png',
    'books/door in the wall/page (31).png',
    'books/door in the wall/page (32).png',
    'books/door in the wall/page (33).png',
    'books/door in the wall/page (34).png',
    'books/door in the wall/page (35).png',
    'books/door in the wall/page (36).png',
    'books/door in the wall/page (37).png',
    'books/door in the wall/page (38).png',
    'books/door in the wall/page (39).png',
    'books/door in the wall/page (40).png',
    'books/door in the wall/page (41).png',
    'books/door in the wall/page (42).png',
    'books/door in the wall/page (43).png',
    'books/door in the wall/page (44).png',
    'books/door in the wall/page (45).png',
    'books/door in the wall/page (46).png',
    'books/door in the wall/page (47).png',
    'books/door in the wall/page (48).png',
    'books/door in the wall/page (49).png',
    'books/door in the wall/page (50).png',
    'books/door in the wall/page (51).png',
    'books/door in the wall/page (52).png',
    'books/door in the wall/page (53).png',
    'books/door in the wall/page (54).png',
    'books/door in the wall/page (55).png',
    'books/door in the wall/page (56).png',
    'books/door in the wall/page (57).png',
    'books/door in the wall/page (58).png',
    'books/door in the wall/page (59).png',
    'books/door in the wall/page (60).png',
    'books/door in the wall/page (61).png',
    'books/door in the wall/page (62).png',
    'books/door in the wall/page (63).png',
    'books/door in the wall/page (64).png',
    'books/door in the wall/page (65).png',
    'books/door in the wall/page (66).png',
    'books/door in the wall/page (67).png',
    'books/door in the wall/page (68).png',
    'books/door in the wall/page (69).png',
    'books/door in the wall/page (70).png',
    'books/door in the wall/page (71).png',
    'books/door in the wall/page (72).png',
    'books/door in the wall/page (73).png',
    'books/door in the wall/page (74).png',
    'books/door in the wall/page (75).png',

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
