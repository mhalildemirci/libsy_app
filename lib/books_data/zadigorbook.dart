import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class zadigorbook extends StatefulWidget {
  const zadigorbook({Key? key}) : super(key: key);

  @override
  State<zadigorbook> createState() => _zadigorbookState();
}

class _zadigorbookState extends State<zadigorbook> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/zadig or the book/page (1).png',
    'books/zadig or the book/page (2).png',
    'books/zadig or the book/page (3).png',
    'books/zadig or the book/page (4).png',
    'books/zadig or the book/page (5).png',
    'books/zadig or the book/page (6).png',
    'books/zadig or the book/page (7).png',
    'books/zadig or the book/page (8).png',
    'books/zadig or the book/page (9).png',
    'books/zadig or the book/page (10).png',
    'books/zadig or the book/page (11).png',
    'books/zadig or the book/page (12).png',
    'books/zadig or the book/page (13).png',
    'books/zadig or the book/page (14).png',
    'books/zadig or the book/page (15).png',
    'books/zadig or the book/page (16).png',
    'books/zadig or the book/page (17).png',
    'books/zadig or the book/page (18).png',
    'books/zadig or the book/page (19).png',
    'books/zadig or the book/page (20).png',
    'books/zadig or the book/page (21).png',
    'books/zadig or the book/page (22).png',
    'books/zadig or the book/page (23).png',
    'books/zadig or the book/page (24).png',
    'books/zadig or the book/page (25).png',
    'books/zadig or the book/page (26).png',
    'books/zadig or the book/page (27).png',
    'books/zadig or the book/page (28).png',
    'books/zadig or the book/page (29).png',
    'books/zadig or the book/page (30).png',
    'books/zadig or the book/page (31).png',
    'books/zadig or the book/page (32).png',
    'books/zadig or the book/page (33).png',
    'books/zadig or the book/page (34).png',
    'books/zadig or the book/page (35).png',
    'books/zadig or the book/page (36).png',
    'books/zadig or the book/page (37).png',
    'books/zadig or the book/page (38).png',
    'books/zadig or the book/page (39).png',
    'books/zadig or the book/page (40).png',
    'books/zadig or the book/page (41).png',
    'books/zadig or the book/page (42).png',
    'books/zadig or the book/page (43).png',
    'books/zadig or the book/page (44).png',
    'books/zadig or the book/page (45).png',
    'books/zadig or the book/page (46).png',
    'books/zadig or the book/page (47).png',
    'books/zadig or the book/page (48).png',
    'books/zadig or the book/page (49).png',
    'books/zadig or the book/page (50).png',
    'books/zadig or the book/page (51).png',
    'books/zadig or the book/page (52).png',
    'books/zadig or the book/page (53).png',
    'books/zadig or the book/page (54).png',
    'books/zadig or the book/page (55).png',
    'books/zadig or the book/page (56).png',
    'books/zadig or the book/page (57).png',
    'books/zadig or the book/page (58).png',
    'books/zadig or the book/page (59).png',
    'books/zadig or the book/page (60).png',
    'books/zadig or the book/page (61).png',
    'books/zadig or the book/page (62).png',
    'books/zadig or the book/page (63).png',
    'books/zadig or the book/page (64).png',
    'books/zadig or the book/page (65).png',
    'books/zadig or the book/page (66).png',
    'books/zadig or the book/page (67).png',
    'books/zadig or the book/page (68).png',
    'books/zadig or the book/page (69).png',
    'books/zadig or the book/page (70).png',
    'books/zadig or the book/page (71).png',
    'books/zadig or the book/page (72).png',
    'books/zadig or the book/page (73).png',
    'books/zadig or the book/page (74).png',
    'books/zadig or the book/page (75).png',
    'books/zadig or the book/page (76).png',
    'books/zadig or the book/page (77).png',
    'books/zadig or the book/page (78).png',
    'books/zadig or the book/page (79).png',
    'books/zadig or the book/page (80).png',
    'books/zadig or the book/page (81).png',
    'books/zadig or the book/page (82).png',
    'books/zadig or the book/page (83).png',
    'books/zadig or the book/page (84).png',

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
