import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ceaser extends StatefulWidget {
  const ceaser({Key? key}) : super(key: key);

  @override
  State<ceaser> createState() => _ceaserState();
}

class _ceaserState extends State<ceaser> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/ceaser/page (1).png',
    'books/ceaser/page (2).png',
    'books/ceaser/page (3).png',
    'books/ceaser/page (4).png',
    'books/ceaser/page (5).png',
    'books/ceaser/page (6).png',
    'books/ceaser/page (7).png',
    'books/ceaser/page (8).png',
    'books/ceaser/page (9).png',
    'books/ceaser/page (10).png',
    'books/ceaser/page (11).png',
    'books/ceaser/page (12).png',
    'books/ceaser/page (13).png',
    'books/ceaser/page (14).png',
    'books/ceaser/page (15).png',
    'books/ceaser/page (16).png',
    'books/ceaser/page (17).png',
    'books/ceaser/page (18).png',
    'books/ceaser/page (19).png',
    'books/ceaser/page (20).png',
    'books/ceaser/page (21).png',
    'books/ceaser/page (22).png',
    'books/ceaser/page (23).png',
    'books/ceaser/page (24).png',
    'books/ceaser/page (25).png',
    'books/ceaser/page (26).png',
    'books/ceaser/page (27).png',
    'books/ceaser/page (28).png',
    'books/ceaser/page (29).png',
    'books/ceaser/page (30).png',
    'books/ceaser/page (31).png',
    'books/ceaser/page (32).png',
    'books/ceaser/page (33).png',
    'books/ceaser/page (34).png',
    'books/ceaser/page (35).png',
    'books/ceaser/page (36).png',
    'books/ceaser/page (37).png',
    'books/ceaser/page (38).png',
    'books/ceaser/page (39).png',
    'books/ceaser/page (40).png',
    'books/ceaser/page (41).png',
    'books/ceaser/page (42).png',
    'books/ceaser/page (43).png',
    'books/ceaser/page (44).png',
    'books/ceaser/page (45).png',
    'books/ceaser/page (46).png',
    'books/ceaser/page (47).png',
    'books/ceaser/page (48).png',
    'books/ceaser/page (49).png',
    'books/ceaser/page (50).png',
    'books/ceaser/page (51).png',
    'books/ceaser/page (52).png',
    'books/ceaser/page (53).png',
    'books/ceaser/page (54).png',
    'books/ceaser/page (55).png',
    'books/ceaser/page (56).png',
    'books/ceaser/page (57).png',
    'books/ceaser/page (58).png',
    'books/ceaser/page (59).png',
    'books/ceaser/page (60).png',
    'books/ceaser/page (61).png',
    'books/ceaser/page (62).png',
    'books/ceaser/page (63).png',
    'books/ceaser/page (64).png',
    'books/ceaser/page (65).png',
    'books/ceaser/page (66).png',
    'books/ceaser/page (67).png',
    'books/ceaser/page (68).png',
    'books/ceaser/page (69).png',
    'books/ceaser/page (70).png',
    'books/ceaser/page (71).png',
    'books/ceaser/page (72).png',
    'books/ceaser/page (73).png',
    'books/ceaser/page (74).png',
    'books/ceaser/page (75).png',
    'books/ceaser/page (76).png',
    'books/ceaser/page (77).png',
    'books/ceaser/page (78).png',
    'books/ceaser/page (79).png',
    'books/ceaser/page (80).png',
    'books/ceaser/page (81).png',
    'books/ceaser/page (82).png',
    'books/ceaser/page (83).png',
    'books/ceaser/page (84).png',
    'books/ceaser/page (85).png',
    'books/ceaser/page (86).png',
    'books/ceaser/page (87).png',
    'books/ceaser/page (88).png',
    'books/ceaser/page (89).png',

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
