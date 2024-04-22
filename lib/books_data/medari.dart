import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class medari extends StatefulWidget {
  const medari({Key? key}) : super(key: key);

  @override
  State<medari> createState() => _medariState();
}

class _medariState extends State<medari> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/medari/page (1).png',
    'books/medari/page (2).png',
    'books/medari/page (3).png',
    'books/medari/page (4).png',
    'books/medari/page (5).png',
    'books/medari/page (6).png',
    'books/medari/page (7).png',
    'books/medari/page (8).png',
    'books/medari/page (9).png',
    'books/medari/page (10).png',
    'books/medari/page (11).png',
    'books/medari/page (12).png',
    'books/medari/page (13).png',
    'books/medari/page (14).png',
    'books/medari/page (15).png',
    'books/medari/page (16).png',
    'books/medari/page (17).png',
    'books/medari/page (18).png',
    'books/medari/page (19).png',
    'books/medari/page (20).png',
    'books/medari/page (21).png',
    'books/medari/page (22).png',
    'books/medari/page (23).png',
    'books/medari/page (24).png',
    'books/medari/page (25).png',
    'books/medari/page (26).png',
    'books/medari/page (27).png',
    'books/medari/page (28).png',
    'books/medari/page (29).png',
    'books/medari/page (30).png',
    'books/medari/page (31).png',
    'books/medari/page (32).png',
    'books/medari/page (33).png',
    'books/medari/page (34).png',
    'books/medari/page (35).png',
    'books/medari/page (36).png',
    'books/medari/page (37).png',
    'books/medari/page (38).png',
    'books/medari/page (39).png',
    'books/medari/page (40).png',
    'books/medari/page (41).png',
    'books/medari/page (42).png',
    'books/medari/page (43).png',
    'books/medari/page (44).png',
    'books/medari/page (45).png',
    'books/medari/page (46).png',
    'books/medari/page (47).png',
    'books/medari/page (48).png',
    'books/medari/page (49).png',
    'books/medari/page (50).png',
    'books/medari/page (51).png',
    'books/medari/page (52).png',
    'books/medari/page (53).png',
    'books/medari/page (54).png',
    'books/medari/page (55).png',
    'books/medari/page (56).png',
    'books/medari/page (57).png',
    'books/medari/page (58).png',
    'books/medari/page (59).png',
    'books/medari/page (60).png',
    'books/medari/page (61).png',
    'books/medari/page (62).png',
    'books/medari/page (63).png',
    'books/medari/page (64).png',
    'books/medari/page (65).png',
    'books/medari/page (66).png',
    'books/medari/page (67).png',
    'books/medari/page (68).png',
    'books/medari/page (69).png',
    'books/medari/page (70).png',
    'books/medari/page (71).png',
    'books/medari/page (72).png',
    'books/medari/page (73).png',
    'books/medari/page (74).png',
    'books/medari/page (75).png',
    'books/medari/page (76).png',
    'books/medari/page (77).png',
    'books/medari/page (78).png',
    'books/medari/page (79).png',
    'books/medari/page (80).png',
    'books/medari/page (81).png',
    'books/medari/page (82).png',
    'books/medari/page (83).png',

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
