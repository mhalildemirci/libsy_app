import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class beyondgood extends StatefulWidget {
  const beyondgood({Key? key}) : super(key: key);

  @override
  State<beyondgood> createState() => _beyondgoodState();
}

class _beyondgoodState extends State<beyondgood> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/beyond Good/page (1).png',
    'books/beyond Good/page (2).png',
    'books/beyond Good/page (3).png',
    'books/beyond Good/page (4).png',
    'books/beyond Good/page (5).png',
    'books/beyond Good/page (6).png',
    'books/beyond Good/page (7).png',
    'books/beyond Good/page (8).png',
    'books/beyond Good/page (9).png',
    'books/beyond Good/page (10).png',
    'books/beyond Good/page (11).png',
    'books/beyond Good/page (12).png',
    'books/beyond Good/page (13).png',
    'books/beyond Good/page (14).png',
    'books/beyond Good/page (15).png',
    'books/beyond Good/page (16).png',
    'books/beyond Good/page (17).png',
    'books/beyond Good/page (18).png',
    'books/beyond Good/page (19).png',
    'books/beyond Good/page (20).png',
    'books/beyond Good/page (21).png',
    'books/beyond Good/page (22).png',
    'books/beyond Good/page (23).png',
    'books/beyond Good/page (24).png',
    'books/beyond Good/page (25).png',
    'books/beyond Good/page (26).png',
    'books/beyond Good/page (27).png',
    'books/beyond Good/page (28).png',
    'books/beyond Good/page (29).png',
    'books/beyond Good/page (30).png',
    'books/beyond Good/page (31).png',
    'books/beyond Good/page (32).png',
    'books/beyond Good/page (33).png',
    'books/beyond Good/page (34).png',
    'books/beyond Good/page (35).png',
    'books/beyond Good/page (36).png',
    'books/beyond Good/page (37).png',
    'books/beyond Good/page (38).png',
    'books/beyond Good/page (39).png',
    'books/beyond Good/page (40).png',
    'books/beyond Good/page (41).png',
    'books/beyond Good/page (42).png',
    'books/beyond Good/page (43).png',
    'books/beyond Good/page (44).png',
    'books/beyond Good/page (45).png',
    'books/beyond Good/page (46).png',
    'books/beyond Good/page (47).png',
    'books/beyond Good/page (48).png',
    'books/beyond Good/page (49).png',
    'books/beyond Good/page (50).png',
    'books/beyond Good/page (51).png',
    'books/beyond Good/page (52).png',
    'books/beyond Good/page (53).png',
    'books/beyond Good/page (54).png',
    'books/beyond Good/page (55).png',
    'books/beyond Good/page (56).png',
    'books/beyond Good/page (57).png',
    'books/beyond Good/page (58).png',
    'books/beyond Good/page (59).png',
    'books/beyond Good/page (60).png',
    'books/beyond Good/page (61).png',
    'books/beyond Good/page (62).png',
    'books/beyond Good/page (63).png',
    'books/beyond Good/page (64).png',
    'books/beyond Good/page (65).png',
    'books/beyond Good/page (66).png',
    'books/beyond Good/page (67).png',
    'books/beyond Good/page (68).png',
    'books/beyond Good/page (69).png',
    'books/beyond Good/page (70).png',
    'books/beyond Good/page (71).png',
    'books/beyond Good/page (72).png',
    'books/beyond Good/page (73).png',
    'books/beyond Good/page (74).png',
    'books/beyond Good/page (75).png',
    'books/beyond Good/page (76).png',
    'books/beyond Good/page (77).png',
    'books/beyond Good/page (78).png',
    'books/beyond Good/page (79).png',
    'books/beyond Good/page (80).png',
    'books/beyond Good/page (81).png',
    'books/beyond Good/page (82).png',
    'books/beyond Good/page (83).png',
    'books/beyond Good/page (84).png',
    'books/beyond Good/page (85).png',
    'books/beyond Good/page (86).png',

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
