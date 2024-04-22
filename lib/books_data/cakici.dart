import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class cakici extends StatefulWidget {
  const cakici({Key? key}) : super(key: key);

  @override
  State<cakici> createState() => _cakiciState();
}

class _cakiciState extends State<cakici> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/cakici/page (1).png',
    'books/cakici/page (2).png',
    'books/cakici/page (3).png',
    'books/cakici/page (4).png',
    'books/cakici/page (5).png',
    'books/cakici/page (6).png',
    'books/cakici/page (7).png',
    'books/cakici/page (8).png',
    'books/cakici/page (9).png',
    'books/cakici/page (10).png',
    'books/cakici/page (11).png',
    'books/cakici/page (12).png',
    'books/cakici/page (13).png',
    'books/cakici/page (14).png',
    'books/cakici/page (15).png',
    'books/cakici/page (16).png',
    'books/cakici/page (17).png',
    'books/cakici/page (18).png',
    'books/cakici/page (19).png',
    'books/cakici/page (20).png',
    'books/cakici/page (21).png',
    'books/cakici/page (22).png',
    'books/cakici/page (23).png',
    'books/cakici/page (24).png',
    'books/cakici/page (25).png',
    'books/cakici/page (26).png',
    'books/cakici/page (27).png',
    'books/cakici/page (28).png',
    'books/cakici/page (29).png',
    'books/cakici/page (30).png',
    'books/cakici/page (31).png',
    'books/cakici/page (32).png',
    'books/cakici/page (33).png',
    'books/cakici/page (34).png',
    'books/cakici/page (35).png',
    'books/cakici/page (36).png',
    'books/cakici/page (37).png',
    'books/cakici/page (38).png',
    'books/cakici/page (39).png',
    'books/cakici/page (40).png',
    'books/cakici/page (41).png',
    'books/cakici/page (42).png',
    'books/cakici/page (43).png',
    'books/cakici/page (44).png',
    'books/cakici/page (45).png',
    'books/cakici/page (46).png',
    'books/cakici/page (47).png',
    'books/cakici/page (48).png',
    'books/cakici/page (49).png',
    'books/cakici/page (50).png',
    'books/cakici/page (51).png',
    'books/cakici/page (52).png',
    'books/cakici/page (53).png',
    'books/cakici/page (54).png',
    'books/cakici/page (55).png',
    'books/cakici/page (56).png',
    'books/cakici/page (57).png',
    'books/cakici/page (58).png',
    'books/cakici/page (59).png',
    'books/cakici/page (60).png',
    'books/cakici/page (61).png',
    'books/cakici/page (62).png',
    'books/cakici/page (63).png',
    'books/cakici/page (64).png',
    'books/cakici/page (65).png',
    'books/cakici/page (66).png',
    'books/cakici/page (67).png',
    'books/cakici/page (68).png',
    'books/cakici/page (69).png',
    'books/cakici/page (70).png',
    'books/cakici/page (71).png',
    'books/cakici/page (72).png',
    'books/cakici/page (73).png',
    'books/cakici/page (74).png',
    'books/cakici/page (75).png',
    'books/cakici/page (76).png',
    'books/cakici/page (77).png',
    'books/cakici/page (78).png',
    'books/cakici/page (79).png',
    'books/cakici/page (80).png',
    'books/cakici/page (81).png',
    'books/cakici/page (82).png',
    'books/cakici/page (83).png',
    'books/cakici/page (84).png',

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
