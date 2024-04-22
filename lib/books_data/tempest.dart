import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class tempest extends StatefulWidget {
  const tempest({Key? key}) : super(key: key);

  @override
  State<tempest> createState() => _tempestState();
}

class _tempestState extends State<tempest> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/tempest/page (1).png',
    'books/tempest/page (2).png',
    'books/tempest/page (3).png',
    'books/tempest/page (4).png',
    'books/tempest/page (5).png',
    'books/tempest/page (6).png',
    'books/tempest/page (7).png',
    'books/tempest/page (8).png',
    'books/tempest/page (9).png',
    'books/tempest/page (10).png',
    'books/tempest/page (11).png',
    'books/tempest/page (12).png',
    'books/tempest/page (13).png',
    'books/tempest/page (14).png',
    'books/tempest/page (15).png',
    'books/tempest/page (16).png',
    'books/tempest/page (17).png',
    'books/tempest/page (18).png',
    'books/tempest/page (19).png',
    'books/tempest/page (20).png',
    'books/tempest/page (21).png',
    'books/tempest/page (22).png',
    'books/tempest/page (23).png',
    'books/tempest/page (24).png',
    'books/tempest/page (25).png',
    'books/tempest/page (26).png',
    'books/tempest/page (27).png',
    'books/tempest/page (28).png',
    'books/tempest/page (29).png',
    'books/tempest/page (30).png',
    'books/tempest/page (31).png',
    'books/tempest/page (32).png',
    'books/tempest/page (33).png',
    'books/tempest/page (34).png',
    'books/tempest/page (35).png',
    'books/tempest/page (36).png',
    'books/tempest/page (37).png',
    'books/tempest/page (38).png',
    'books/tempest/page (39).png',
    'books/tempest/page (40).png',
    'books/tempest/page (41).png',
    'books/tempest/page (42).png',
    'books/tempest/page (43).png',
    'books/tempest/page (44).png',
    'books/tempest/page (45).png',
    'books/tempest/page (46).png',
    'books/tempest/page (47).png',
    'books/tempest/page (48).png',
    'books/tempest/page (49).png',
    'books/tempest/page (50).png',
    'books/tempest/page (51).png',
    'books/tempest/page (52).png',
    'books/tempest/page (53).png',
    'books/tempest/page (54).png',
    'books/tempest/page (55).png',
    'books/tempest/page (56).png',
    'books/tempest/page (57).png',
    'books/tempest/page (58).png',
    'books/tempest/page (59).png',
    'books/tempest/page (60).png',
    'books/tempest/page (61).png',
    'books/tempest/page (62).png',
    'books/tempest/page (63).png',
    'books/tempest/page (64).png',
    'books/tempest/page (65).png',
    'books/tempest/page (66).png',
    'books/tempest/page (67).png',
    'books/tempest/page (68).png',
    'books/tempest/page (69).png',
    'books/tempest/page (70).png',
    'books/tempest/page (71).png',
    'books/tempest/page (72).png',
    'books/tempest/page (73).png',
    'books/tempest/page (74).png',
    'books/tempest/page (75).png',

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
