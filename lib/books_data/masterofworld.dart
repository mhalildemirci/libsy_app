import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class masterofworld extends StatefulWidget {
  const masterofworld({Key? key}) : super(key: key);

  @override
  State<masterofworld> createState() => _masterofworldState();
}

class _masterofworldState extends State<masterofworld> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/master of world/page (1).png',
    'books/master of world/page (2).png',
    'books/master of world/page (3).png',
    'books/master of world/page (4).png',
    'books/master of world/page (5).png',
    'books/master of world/page (6).png',
    'books/master of world/page (7).png',
    'books/master of world/page (8).png',
    'books/master of world/page (9).png',
    'books/master of world/page (10).png',
    'books/master of world/page (11).png',
    'books/master of world/page (12).png',
    'books/master of world/page (13).png',
    'books/master of world/page (14).png',
    'books/master of world/page (15).png',
    'books/master of world/page (16).png',
    'books/master of world/page (17).png',
    'books/master of world/page (18).png',
    'books/master of world/page (19).png',
    'books/master of world/page (20).png',
    'books/master of world/page (21).png',
    'books/master of world/page (22).png',
    'books/master of world/page (23).png',
    'books/master of world/page (24).png',
    'books/master of world/page (25).png',
    'books/master of world/page (26).png',
    'books/master of world/page (27).png',
    'books/master of world/page (28).png',
    'books/master of world/page (29).png',
    'books/master of world/page (30).png',
    'books/master of world/page (31).png',
    'books/master of world/page (32).png',
    'books/master of world/page (33).png',
    'books/master of world/page (34).png',
    'books/master of world/page (35).png',
    'books/master of world/page (36).png',
    'books/master of world/page (37).png',
    'books/master of world/page (38).png',
    'books/master of world/page (39).png',
    'books/master of world/page (40).png',
    'books/master of world/page (41).png',
    'books/master of world/page (42).png',
    'books/master of world/page (43).png',
    'books/master of world/page (44).png',
    'books/master of world/page (45).png',
    'books/master of world/page (46).png',
    'books/master of world/page (47).png',
    'books/master of world/page (48).png',
    'books/master of world/page (49).png',
    'books/master of world/page (50).png',
    'books/master of world/page (51).png',
    'books/master of world/page (52).png',
    'books/master of world/page (53).png',
    'books/master of world/page (54).png',
    'books/master of world/page (55).png',
    'books/master of world/page (56).png',
    'books/master of world/page (57).png',
    'books/master of world/page (58).png',
    'books/master of world/page (59).png',
    'books/master of world/page (60).png',
    'books/master of world/page (61).png',
    'books/master of world/page (62).png',
    'books/master of world/page (63).png',
    'books/master of world/page (64).png',
    'books/master of world/page (65).png',
    'books/master of world/page (66).png',
    'books/master of world/page (67).png',
    'books/master of world/page (68).png',
    'books/master of world/page (69).png',
    'books/master of world/page (70).png',
    'books/master of world/page (71).png',
    'books/master of world/page (72).png',
    'books/master of world/page (73).png',
    'books/master of world/page (74).png',
    'books/master of world/page (75).png',
    'books/master of world/page (76).png',
    'books/master of world/page (77).png',
    'books/master of world/page (78).png',
    'books/master of world/page (79).png',

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
