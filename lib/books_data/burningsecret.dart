import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class burningsecret extends StatefulWidget {
  const burningsecret({Key? key}) : super(key: key);

  @override
  State<burningsecret> createState() => _burningsecretState();
}

class _burningsecretState extends State<burningsecret> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/burning secret/page (1).png',
    'books/burning secret/page (2).png',
    'books/burning secret/page (3).png',
    'books/burning secret/page (4).png',
    'books/burning secret/page (5).png',
    'books/burning secret/page (6).png',
    'books/burning secret/page (7).png',
    'books/burning secret/page (8).png',
    'books/burning secret/page (9).png',
    'books/burning secret/page (10).png',
    'books/burning secret/page (11).png',
    'books/burning secret/page (12).png',
    'books/burning secret/page (13).png',
    'books/burning secret/page (14).png',
    'books/burning secret/page (15).png',
    'books/burning secret/page (16).png',
    'books/burning secret/page (17).png',
    'books/burning secret/page (18).png',
    'books/burning secret/page (19).png',
    'books/burning secret/page (20).png',
    'books/burning secret/page (21).png',
    'books/burning secret/page (22).png',
    'books/burning secret/page (23).png',
    'books/burning secret/page (24).png',
    'books/burning secret/page (25).png',
    'books/burning secret/page (26).png',
    'books/burning secret/page (27).png',
    'books/burning secret/page (28).png',
    'books/burning secret/page (29).png',
    'books/burning secret/page (30).png',
    'books/burning secret/page (31).png',
    'books/burning secret/page (32).png',
    'books/burning secret/page (33).png',
    'books/burning secret/page (34).png',
    'books/burning secret/page (35).png',
    'books/burning secret/page (36).png',
    'books/burning secret/page (37).png',
    'books/burning secret/page (38).png',
    'books/burning secret/page (39).png',
    'books/burning secret/page (40).png',
    'books/burning secret/page (41).png',
    'books/burning secret/page (42).png',
    'books/burning secret/page (43).png',
    'books/burning secret/page (44).png',
    'books/burning secret/page (45).png',
    'books/burning secret/page (46).png',
    'books/burning secret/page (47).png',
    'books/burning secret/page (48).png',
    'books/burning secret/page (49).png',
    'books/burning secret/page (50).png',
    'books/burning secret/page (51).png',
    'books/burning secret/page (52).png',
    'books/burning secret/page (53).png',
    'books/burning secret/page (54).png',
    'books/burning secret/page (55).png',
    'books/burning secret/page (56).png',
    'books/burning secret/page (57).png',
    'books/burning secret/page (58).png',
    'books/burning secret/page (59).png',
    'books/burning secret/page (60).png',
    'books/burning secret/page (61).png',
    'books/burning secret/page (62).png',
    'books/burning secret/page (63).png',
    'books/burning secret/page (64).png',
    'books/burning secret/page (65).png',

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
