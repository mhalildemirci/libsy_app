import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hawthrone extends StatefulWidget {
  const hawthrone({Key? key}) : super(key: key);

  @override
  State<hawthrone> createState() => _hawthroneState();
}

class _hawthroneState extends State<hawthrone> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Hawthrone/page (1).png',
    'books/Hawthrone/page (2).png',
    'books/Hawthrone/page (3).png',
    'books/Hawthrone/page (4).png',
    'books/Hawthrone/page (5).png',
    'books/Hawthrone/page (6).png',
    'books/Hawthrone/page (7).png',
    'books/Hawthrone/page (8).png',
    'books/Hawthrone/page (9).png',
    'books/Hawthrone/page (10).png',
    'books/Hawthrone/page (11).png',
    'books/Hawthrone/page (12).png',
    'books/Hawthrone/page (13).png',
    'books/Hawthrone/page (14).png',
    'books/Hawthrone/page (15).png',
    'books/Hawthrone/page (16).png',
    'books/Hawthrone/page (17).png',
    'books/Hawthrone/page (18).png',
    'books/Hawthrone/page (19).png',
    'books/Hawthrone/page (20).png',
    'books/Hawthrone/page (21).png',
    'books/Hawthrone/page (22).png',
    'books/Hawthrone/page (23).png',
    'books/Hawthrone/page (24).png',
    'books/Hawthrone/page (25).png',
    'books/Hawthrone/page (26).png',
    'books/Hawthrone/page (27).png',
    'books/Hawthrone/page (28).png',
    'books/Hawthrone/page (29).png',
    'books/Hawthrone/page (30).png',
    'books/Hawthrone/page (31).png',
    'books/Hawthrone/page (32).png',
    'books/Hawthrone/page (33).png',
    'books/Hawthrone/page (34).png',
    'books/Hawthrone/page (35).png',
    'books/Hawthrone/page (36).png',
    'books/Hawthrone/page (37).png',
    'books/Hawthrone/page (38).png',
    'books/Hawthrone/page (39).png',
    'books/Hawthrone/page (40).png',
    'books/Hawthrone/page (41).png',
    'books/Hawthrone/page (42).png',
    'books/Hawthrone/page (43).png',
    'books/Hawthrone/page (44).png',
    'books/Hawthrone/page (45).png',
    'books/Hawthrone/page (46).png',
    'books/Hawthrone/page (47).png',
    'books/Hawthrone/page (48).png',
    'books/Hawthrone/page (49).png',
    'books/Hawthrone/page (50).png',
    'books/Hawthrone/page (51).png',
    'books/Hawthrone/page (52).png',
    'books/Hawthrone/page (53).png',
    'books/Hawthrone/page (54).png',
    'books/Hawthrone/page (55).png',
    'books/Hawthrone/page (56).png',
    'books/Hawthrone/page (57).png',
    'books/Hawthrone/page (58).png',
    'books/Hawthrone/page (59).png',
    'books/Hawthrone/page (60).png',
    'books/Hawthrone/page (61).png',
    'books/Hawthrone/page (62).png',
    'books/Hawthrone/page (63).png',
    'books/Hawthrone/page (64).png',
    'books/Hawthrone/page (65).png',
    'books/Hawthrone/page (66).png',
    'books/Hawthrone/page (67).png',
    'books/Hawthrone/page (68).png',
    'books/Hawthrone/page (69).png',
    'books/Hawthrone/page (70).png',
    'books/Hawthrone/page (71).png',
    'books/Hawthrone/page (72).png',
    'books/Hawthrone/page (73).png',
    'books/Hawthrone/page (74).png',
    'books/Hawthrone/page (75).png',
    'books/Hawthrone/page (76).png',
    'books/Hawthrone/page (77).png',
    'books/Hawthrone/page (78).png',
    'books/Hawthrone/page (79).png',
    'books/Hawthrone/page (80).png',
    'books/Hawthrone/page (81).png',
    'books/Hawthrone/page (82).png',
    'books/Hawthrone/page (83).png',
    'books/Hawthrone/page (84).png',
    'books/Hawthrone/page (85).png',
    'books/Hawthrone/page (86).png',
    'books/Hawthrone/page (87).png',
    'books/Hawthrone/page (88).png',
    'books/Hawthrone/page (89).png',
    'books/Hawthrone/page (90).png',
    'books/Hawthrone/page (91).png',
    'books/Hawthrone/page (92).png',
    'books/Hawthrone/page (93).png',
    'books/Hawthrone/page (94).png',
    'books/Hawthrone/page (95).png',
    'books/Hawthrone/page (96).png',
    'books/Hawthrone/page (97).png',
    'books/Hawthrone/page (98).png',
    'books/Hawthrone/page (99).png',
    'books/Hawthrone/page (100).png',
    'books/Hawthrone/page (101).png',
    'books/Hawthrone/page (102).png',
    'books/Hawthrone/page (103).png',

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
