import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class henryv extends StatefulWidget {
  const henryv({Key? key}) : super(key: key);

  @override
  State<henryv> createState() => _henryvState();
}

class _henryvState extends State<henryv> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/henry v/page (1).png',
    'books/henry v/page (2).png',
    'books/henry v/page (3).png',
    'books/henry v/page (4).png',
    'books/henry v/page (5).png',
    'books/henry v/page (6).png',
    'books/henry v/page (7).png',
    'books/henry v/page (8).png',
    'books/henry v/page (9).png',
    'books/henry v/page (10).png',
    'books/henry v/page (11).png',
    'books/henry v/page (12).png',
    'books/henry v/page (13).png',
    'books/henry v/page (14).png',
    'books/henry v/page (15).png',
    'books/henry v/page (16).png',
    'books/henry v/page (17).png',
    'books/henry v/page (18).png',
    'books/henry v/page (19).png',
    'books/henry v/page (20).png',
    'books/henry v/page (21).png',
    'books/henry v/page (22).png',
    'books/henry v/page (23).png',
    'books/henry v/page (24).png',
    'books/henry v/page (25).png',
    'books/henry v/page (26).png',
    'books/henry v/page (27).png',
    'books/henry v/page (28).png',
    'books/henry v/page (29).png',
    'books/henry v/page (30).png',
    'books/henry v/page (31).png',
    'books/henry v/page (32).png',
    'books/henry v/page (33).png',
    'books/henry v/page (34).png',
    'books/henry v/page (35).png',
    'books/henry v/page (36).png',
    'books/henry v/page (37).png',
    'books/henry v/page (38).png',
    'books/henry v/page (39).png',
    'books/henry v/page (40).png',
    'books/henry v/page (41).png',
    'books/henry v/page (42).png',
    'books/henry v/page (43).png',
    'books/henry v/page (44).png',
    'books/henry v/page (45).png',
    'books/henry v/page (46).png',
    'books/henry v/page (47).png',
    'books/henry v/page (48).png',
    'books/henry v/page (49).png',
    'books/henry v/page (50).png',
    'books/henry v/page (51).png',
    'books/henry v/page (52).png',
    'books/henry v/page (53).png',
    'books/henry v/page (54).png',
    'books/henry v/page (55).png',
    'books/henry v/page (56).png',
    'books/henry v/page (57).png',
    'books/henry v/page (58).png',
    'books/henry v/page (59).png',
    'books/henry v/page (60).png',
    'books/henry v/page (61).png',
    'books/henry v/page (62).png',
    'books/henry v/page (63).png',
    'books/henry v/page (64).png',
    'books/henry v/page (65).png',
    'books/henry v/page (66).png',
    'books/henry v/page (67).png',
    'books/henry v/page (68).png',
    'books/henry v/page (69).png',
    'books/henry v/page (70).png',
    'books/henry v/page (71).png',
    'books/henry v/page (72).png',
    'books/henry v/page (73).png',
    'books/henry v/page (74).png',
    'books/henry v/page (75).png',
    'books/henry v/page (76).png',
    'books/henry v/page (77).png',
    'books/henry v/page (78).png',
    'books/henry v/page (79).png',
    'books/henry v/page (80).png',
    'books/henry v/page (81).png',
    'books/henry v/page (82).png',
    'books/henry v/page (83).png',
    'books/henry v/page (84).png',
    'books/henry v/page (85).png',
    'books/henry v/page (86).png',
    'books/henry v/page (87).png',
    'books/henry v/page (88).png',
    'books/henry v/page (89).png',
    'books/henry v/page (90).png',
    'books/henry v/page (91).png',
    'books/henry v/page (92).png',
    'books/henry v/page (93).png',
    'books/henry v/page (94).png',
    'books/henry v/page (95).png',
    'books/henry v/page (96).png',
    'books/henry v/page (97).png',
    'books/henry v/page (98).png',
    'books/henry v/page (99).png',
    'books/henry v/page (100).png',

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
