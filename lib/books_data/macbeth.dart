import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class macbeth extends StatefulWidget {
  const macbeth({Key? key}) : super(key: key);

  @override
  State<macbeth> createState() => _macbethState();
}

class _macbethState extends State<macbeth> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/macbeth/page (1).png',
    'books/macbeth/page (2).png',
    'books/macbeth/page (3).png',
    'books/macbeth/page (4).png',
    'books/macbeth/page (5).png',
    'books/macbeth/page (6).png',
    'books/macbeth/page (7).png',
    'books/macbeth/page (8).png',
    'books/macbeth/page (9).png',
    'books/macbeth/page (10).png',
    'books/macbeth/page (11).png',
    'books/macbeth/page (12).png',
    'books/macbeth/page (13).png',
    'books/macbeth/page (14).png',
    'books/macbeth/page (15).png',
    'books/macbeth/page (16).png',
    'books/macbeth/page (17).png',
    'books/macbeth/page (18).png',
    'books/macbeth/page (19).png',
    'books/macbeth/page (20).png',
    'books/macbeth/page (21).png',
    'books/macbeth/page (22).png',
    'books/macbeth/page (23).png',
    'books/macbeth/page (24).png',
    'books/macbeth/page (25).png',
    'books/macbeth/page (26).png',
    'books/macbeth/page (27).png',
    'books/macbeth/page (28).png',
    'books/macbeth/page (29).png',
    'books/macbeth/page (30).png',
    'books/macbeth/page (31).png',
    'books/macbeth/page (32).png',
    'books/macbeth/page (33).png',
    'books/macbeth/page (34).png',
    'books/macbeth/page (35).png',
    'books/macbeth/page (36).png',
    'books/macbeth/page (37).png',
    'books/macbeth/page (38).png',
    'books/macbeth/page (39).png',
    'books/macbeth/page (40).png',
    'books/macbeth/page (41).png',
    'books/macbeth/page (42).png',
    'books/macbeth/page (43).png',
    'books/macbeth/page (44).png',
    'books/macbeth/page (45).png',
    'books/macbeth/page (46).png',
    'books/macbeth/page (47).png',
    'books/macbeth/page (48).png',
    'books/macbeth/page (49).png',
    'books/macbeth/page (50).png',
    'books/macbeth/page (51).png',
    'books/macbeth/page (52).png',
    'books/macbeth/page (53).png',
    'books/macbeth/page (54).png',
    'books/macbeth/page (55).png',
    'books/macbeth/page (56).png',
    'books/macbeth/page (57).png',
    'books/macbeth/page (58).png',
    'books/macbeth/page (59).png',
    'books/macbeth/page (60).png',
    'books/macbeth/page (61).png',
    'books/macbeth/page (62).png',
    'books/macbeth/page (63).png',
    'books/macbeth/page (64).png',
    'books/macbeth/page (65).png',
    'books/macbeth/page (66).png',
    'books/macbeth/page (67).png',
    'books/macbeth/page (68).png',
    'books/macbeth/page (69).png',
    'books/macbeth/page (70).png',
    'books/macbeth/page (71).png',
    'books/macbeth/page (72).png',
    'books/macbeth/page (73).png',
    'books/macbeth/page (74).png',
    'books/macbeth/page (75).png',
    'books/macbeth/page (76).png',
    'books/macbeth/page (77).png',
    'books/macbeth/page (78).png',
    'books/macbeth/page (79).png',
    'books/macbeth/page (80).png',
    'books/macbeth/page (81).png',

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
