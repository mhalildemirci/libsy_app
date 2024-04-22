import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class antichrist extends StatefulWidget {
  const antichrist({Key? key}) : super(key: key);

  @override
  State<antichrist> createState() => _antichristState();
}

class _antichristState extends State<antichrist> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/antichrist/page (1).png',
    'books/antichrist/page (2).png',
    'books/antichrist/page (3).png',
    'books/antichrist/page (4).png',
    'books/antichrist/page (5).png',
    'books/antichrist/page (6).png',
    'books/antichrist/page (7).png',
    'books/antichrist/page (8).png',
    'books/antichrist/page (9).png',
    'books/antichrist/page (10).png',
    'books/antichrist/page (11).png',
    'books/antichrist/page (12).png',
    'books/antichrist/page (13).png',
    'books/antichrist/page (14).png',
    'books/antichrist/page (15).png',
    'books/antichrist/page (16).png',
    'books/antichrist/page (17).png',
    'books/antichrist/page (18).png',
    'books/antichrist/page (19).png',
    'books/antichrist/page (20).png',
    'books/antichrist/page (21).png',
    'books/antichrist/page (22).png',
    'books/antichrist/page (23).png',
    'books/antichrist/page (24).png',
    'books/antichrist/page (25).png',
    'books/antichrist/page (26).png',
    'books/antichrist/page (27).png',
    'books/antichrist/page (28).png',
    'books/antichrist/page (29).png',
    'books/antichrist/page (30).png',
    'books/antichrist/page (31).png',
    'books/antichrist/page (32).png',
    'books/antichrist/page (33).png',
    'books/antichrist/page (34).png',
    'books/antichrist/page (35).png',
    'books/antichrist/page (36).png',
    'books/antichrist/page (37).png',
    'books/antichrist/page (38).png',
    'books/antichrist/page (39).png',
    'books/antichrist/page (40).png',
    'books/antichrist/page (41).png',
    'books/antichrist/page (42).png',
    'books/antichrist/page (43).png',
    'books/antichrist/page (44).png',
    'books/antichrist/page (45).png',
    'books/antichrist/page (46).png',
    'books/antichrist/page (47).png',
    'books/antichrist/page (48).png',
    'books/antichrist/page (49).png',
    'books/antichrist/page (50).png',
    'books/antichrist/page (51).png',
    'books/antichrist/page (52).png',
    'books/antichrist/page (53).png',
    'books/antichrist/page (54).png',
    'books/antichrist/page (55).png',
    'books/antichrist/page (56).png',
    'books/antichrist/page (57).png',
    'books/antichrist/page (58).png',
    'books/antichrist/page (59).png',
    'books/antichrist/page (60).png',
    'books/antichrist/page (61).png',
    'books/antichrist/page (62).png',
    'books/antichrist/page (63).png',
    'books/antichrist/page (64).png',
    'books/antichrist/page (65).png',
    'books/antichrist/page (66).png',
    'books/antichrist/page (67).png',
    'books/antichrist/page (68).png',
    'books/antichrist/page (69).png',
    'books/antichrist/page (70).png',
    'books/antichrist/page (71).png',
    'books/antichrist/page (72).png',
    'books/antichrist/page (73).png',
    'books/antichrist/page (74).png',
    'books/antichrist/page (75).png',
    'books/antichrist/page (76).png',
    'books/antichrist/page (77).png',
    'books/antichrist/page (78).png',
    'books/antichrist/page (79).png',
    'books/antichrist/page (80).png',
    'books/antichrist/page (81).png',
    'books/antichrist/page (82).png',
    'books/antichrist/page (83).png',
    'books/antichrist/page (84).png',
    'books/antichrist/page (85).png',

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
