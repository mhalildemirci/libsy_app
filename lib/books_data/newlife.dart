import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class newlife extends StatefulWidget {
  const newlife({Key? key}) : super(key: key);

  @override
  State<newlife> createState() => _newlifeState();
}

class _newlifeState extends State<newlife> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/new life/page (1).png',
    'books/new life/page (2).png',
    'books/new life/page (3).png',
    'books/new life/page (4).png',
    'books/new life/page (5).png',
    'books/new life/page (6).png',
    'books/new life/page (7).png',
    'books/new life/page (8).png',
    'books/new life/page (9).png',
    'books/new life/page (10).png',
    'books/new life/page (11).png',
    'books/new life/page (12).png',
    'books/new life/page (13).png',
    'books/new life/page (14).png',
    'books/new life/page (15).png',
    'books/new life/page (16).png',
    'books/new life/page (17).png',
    'books/new life/page (18).png',
    'books/new life/page (19).png',
    'books/new life/page (20).png',
    'books/new life/page (21).png',
    'books/new life/page (22).png',
    'books/new life/page (23).png',
    'books/new life/page (24).png',
    'books/new life/page (25).png',
    'books/new life/page (26).png',
    'books/new life/page (27).png',
    'books/new life/page (28).png',
    'books/new life/page (29).png',
    'books/new life/page (30).png',
    'books/new life/page (31).png',
    'books/new life/page (32).png',
    'books/new life/page (33).png',
    'books/new life/page (34).png',
    'books/new life/page (35).png',
    'books/new life/page (36).png',
    'books/new life/page (37).png',
    'books/new life/page (38).png',
    'books/new life/page (39).png',
    'books/new life/page (40).png',
    'books/new life/page (41).png',
    'books/new life/page (42).png',
    'books/new life/page (43).png',
    'books/new life/page (44).png',
    'books/new life/page (45).png',
    'books/new life/page (46).png',
    'books/new life/page (47).png',
    'books/new life/page (48).png',
    'books/new life/page (49).png',
    'books/new life/page (50).png',
    'books/new life/page (51).png',
    'books/new life/page (52).png',
    'books/new life/page (53).png',
    'books/new life/page (54).png',
    'books/new life/page (55).png',
    'books/new life/page (56).png',
    'books/new life/page (57).png',
    'books/new life/page (58).png',
    'books/new life/page (59).png',
    'books/new life/page (60).png',
    'books/new life/page (61).png',
    'books/new life/page (62).png',
    'books/new life/page (63).png',
    'books/new life/page (64).png',
    'books/new life/page (65).png',
    'books/new life/page (66).png',

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
