import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class marko extends StatefulWidget {
  const marko({Key? key}) : super(key: key);

  @override
  State<marko> createState() => _markoState();
}

class _markoState extends State<marko> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/marko/page (1).png',
    'books/marko/page (2).png',
    'books/marko/page (3).png',
    'books/marko/page (4).png',
    'books/marko/page (5).png',
    'books/marko/page (6).png',
    'books/marko/page (7).png',
    'books/marko/page (8).png',
    'books/marko/page (9).png',
    'books/marko/page (10).png',
    'books/marko/page (11).png',
    'books/marko/page (12).png',
    'books/marko/page (13).png',
    'books/marko/page (14).png',
    'books/marko/page (15).png',
    'books/marko/page (16).png',
    'books/marko/page (17).png',
    'books/marko/page (18).png',
    'books/marko/page (19).png',
    'books/marko/page (20).png',
    'books/marko/page (21).png',
    'books/marko/page (22).png',
    'books/marko/page (23).png',
    'books/marko/page (24).png',
    'books/marko/page (25).png',
    'books/marko/page (26).png',
    'books/marko/page (27).png',
    'books/marko/page (28).png',
    'books/marko/page (29).png',
    'books/marko/page (30).png',
    'books/marko/page (31).png',
    'books/marko/page (32).png',
    'books/marko/page (33).png',
    'books/marko/page (34).png',
    'books/marko/page (35).png',
    'books/marko/page (36).png',
    'books/marko/page (37).png',
    'books/marko/page (38).png',
    'books/marko/page (39).png',
    'books/marko/page (40).png',
    'books/marko/page (41).png',
    'books/marko/page (42).png',
    'books/marko/page (43).png',
    'books/marko/page (44).png',
    'books/marko/page (45).png',
    'books/marko/page (46).png',
    'books/marko/page (47).png',
    'books/marko/page (48).png',
    'books/marko/page (49).png',
    'books/marko/page (50).png',
    'books/marko/page (51).png',
    'books/marko/page (52).png',
    'books/marko/page (53).png',
    'books/marko/page (54).png',
    'books/marko/page (55).png',
    'books/marko/page (56).png',
    'books/marko/page (57).png',
    'books/marko/page (58).png',
    'books/marko/page (59).png',
    'books/marko/page (60).png',
    'books/marko/page (61).png',
    'books/marko/page (62).png',
    'books/marko/page (63).png',
    'books/marko/page (64).png',
    'books/marko/page (65).png',
    'books/marko/page (66).png',
    'books/marko/page (67).png',
    'books/marko/page (68).png',
    'books/marko/page (69).png',
    'books/marko/page (70).png',
    'books/marko/page (71).png',
    'books/marko/page (72).png',
    'books/marko/page (73).png',
    'books/marko/page (74).png',
    'books/marko/page (75).png',
    'books/marko/page (76).png',
    'books/marko/page (77).png',
    'books/marko/page (78).png',
    'books/marko/page (79).png',
    'books/marko/page (80).png',
    'books/marko/page (81).png',
    'books/marko/page (82).png',
    'books/marko/page (83).png',
    'books/marko/page (84).png',
    'books/marko/page (85).png',
    'books/marko/page (86).png',
    'books/marko/page (87).png',
    'books/marko/page (88).png',
    'books/marko/page (89).png',
    'books/marko/page (90).png',
    'books/marko/page (91).png',
    'books/marko/page (92).png',
    'books/marko/page (93).png',
    'books/marko/page (94).png',
    'books/marko/page (95).png',
    'books/marko/page (96).png',

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
