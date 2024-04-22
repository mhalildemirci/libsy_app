import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class yenidunya extends StatefulWidget {
  const yenidunya({Key? key}) : super(key: key);

  @override
  State<yenidunya> createState() => _yenidunyaState();
}

class _yenidunyaState extends State<yenidunya> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/yeni dunya/page (1).png',
    'books/yeni dunya/page (2).png',
    'books/yeni dunya/page (3).png',
    'books/yeni dunya/page (4).png',
    'books/yeni dunya/page (5).png',
    'books/yeni dunya/page (6).png',
    'books/yeni dunya/page (7).png',
    'books/yeni dunya/page (8).png',
    'books/yeni dunya/page (9).png',
    'books/yeni dunya/page (10).png',
    'books/yeni dunya/page (11).png',
    'books/yeni dunya/page (12).png',
    'books/yeni dunya/page (13).png',
    'books/yeni dunya/page (14).png',
    'books/yeni dunya/page (15).png',
    'books/yeni dunya/page (16).png',
    'books/yeni dunya/page (17).png',
    'books/yeni dunya/page (18).png',
    'books/yeni dunya/page (19).png',
    'books/yeni dunya/page (20).png',
    'books/yeni dunya/page (21).png',
    'books/yeni dunya/page (22).png',
    'books/yeni dunya/page (23).png',
    'books/yeni dunya/page (24).png',
    'books/yeni dunya/page (25).png',
    'books/yeni dunya/page (26).png',
    'books/yeni dunya/page (27).png',
    'books/yeni dunya/page (28).png',
    'books/yeni dunya/page (29).png',
    'books/yeni dunya/page (30).png',
    'books/yeni dunya/page (31).png',
    'books/yeni dunya/page (32).png',
    'books/yeni dunya/page (33).png',
    'books/yeni dunya/page (34).png',
    'books/yeni dunya/page (35).png',
    'books/yeni dunya/page (36).png',
    'books/yeni dunya/page (37).png',
    'books/yeni dunya/page (38).png',
    'books/yeni dunya/page (39).png',
    'books/yeni dunya/page (40).png',
    'books/yeni dunya/page (41).png',
    'books/yeni dunya/page (42).png',
    'books/yeni dunya/page (43).png',
    'books/yeni dunya/page (44).png',
    'books/yeni dunya/page (45).png',
    'books/yeni dunya/page (46).png',
    'books/yeni dunya/page (47).png',
    'books/yeni dunya/page (48).png',
    'books/yeni dunya/page (49).png',
    'books/yeni dunya/page (50).png',
    'books/yeni dunya/page (51).png',
    'books/yeni dunya/page (52).png',
    'books/yeni dunya/page (53).png',
    'books/yeni dunya/page (54).png',
    'books/yeni dunya/page (55).png',
    'books/yeni dunya/page (56).png',
    'books/yeni dunya/page (57).png',
    'books/yeni dunya/page (58).png',
    'books/yeni dunya/page (59).png',
    'books/yeni dunya/page (60).png',
    'books/yeni dunya/page (61).png',
    'books/yeni dunya/page (62).png',
    'books/yeni dunya/page (63).png',
    'books/yeni dunya/page (64).png',
    'books/yeni dunya/page (65).png',
    'books/yeni dunya/page (66).png',
    'books/yeni dunya/page (67).png',
    'books/yeni dunya/page (68).png',
    'books/yeni dunya/page (69).png',
    'books/yeni dunya/page (70).png',
    'books/yeni dunya/page (71).png',
    'books/yeni dunya/page (72).png',
    'books/yeni dunya/page (73).png',
    'books/yeni dunya/page (74).png',
    'books/yeni dunya/page (75).png',
    'books/yeni dunya/page (76).png',
    'books/yeni dunya/page (77).png',

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
