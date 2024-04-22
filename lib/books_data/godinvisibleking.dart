import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class godinvisibleking extends StatefulWidget {
  const godinvisibleking({Key? key}) : super(key: key);

  @override
  State<godinvisibleking> createState() => _godinvisiblekingState();
}

class _godinvisiblekingState extends State<godinvisibleking> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/God the Invisible King/page (1).png',
    'books/God the Invisible King/page (2).png',
    'books/God the Invisible King/page (3).png',
    'books/God the Invisible King/page (4).png',
    'books/God the Invisible King/page (5).png',
    'books/God the Invisible King/page (6).png',
    'books/God the Invisible King/page (7).png',
    'books/God the Invisible King/page (8).png',
    'books/God the Invisible King/page (9).png',
    'books/God the Invisible King/page (10).png',
    'books/God the Invisible King/page (11).png',
    'books/God the Invisible King/page (12).png',
    'books/God the Invisible King/page (13).png',
    'books/God the Invisible King/page (14).png',
    'books/God the Invisible King/page (15).png',
    'books/God the Invisible King/page (16).png',
    'books/God the Invisible King/page (17).png',
    'books/God the Invisible King/page (18).png',
    'books/God the Invisible King/page (19).png',
    'books/God the Invisible King/page (20).png',
    'books/God the Invisible King/page (21).png',
    'books/God the Invisible King/page (22).png',
    'books/God the Invisible King/page (23).png',
    'books/God the Invisible King/page (24).png',
    'books/God the Invisible King/page (25).png',
    'books/God the Invisible King/page (26).png',
    'books/God the Invisible King/page (27).png',
    'books/God the Invisible King/page (28).png',
    'books/God the Invisible King/page (29).png',
    'books/God the Invisible King/page (30).png',
    'books/God the Invisible King/page (31).png',
    'books/God the Invisible King/page (32).png',
    'books/God the Invisible King/page (33).png',
    'books/God the Invisible King/page (34).png',
    'books/God the Invisible King/page (35).png',
    'books/God the Invisible King/page (36).png',
    'books/God the Invisible King/page (37).png',
    'books/God the Invisible King/page (38).png',
    'books/God the Invisible King/page (39).png',
    'books/God the Invisible King/page (40).png',
    'books/God the Invisible King/page (41).png',
    'books/God the Invisible King/page (42).png',
    'books/God the Invisible King/page (43).png',
    'books/God the Invisible King/page (44).png',
    'books/God the Invisible King/page (45).png',
    'books/God the Invisible King/page (46).png',
    'books/God the Invisible King/page (47).png',
    'books/God the Invisible King/page (48).png',
    'books/God the Invisible King/page (49).png',
    'books/God the Invisible King/page (50).png',
    'books/God the Invisible King/page (51).png',
    'books/God the Invisible King/page (52).png',
    'books/God the Invisible King/page (53).png',
    'books/God the Invisible King/page (54).png',
    'books/God the Invisible King/page (55).png',
    'books/God the Invisible King/page (56).png',
    'books/God the Invisible King/page (57).png',
    'books/God the Invisible King/page (58).png',
    'books/God the Invisible King/page (59).png',
    'books/God the Invisible King/page (60).png',
    'books/God the Invisible King/page (61).png',
    'books/God the Invisible King/page (62).png',
    'books/God the Invisible King/page (63).png',
    'books/God the Invisible King/page (64).png',
    'books/God the Invisible King/page (65).png',
    'books/God the Invisible King/page (66).png',
    'books/God the Invisible King/page (67).png',
    'books/God the Invisible King/page (68).png',
    'books/God the Invisible King/page (69).png',
    'books/God the Invisible King/page (70).png',
    'books/God the Invisible King/page (71).png',
    'books/God the Invisible King/page (72).png',
    'books/God the Invisible King/page (73).png',
    'books/God the Invisible King/page (74).png',
    'books/God the Invisible King/page (75).png',
    'books/God the Invisible King/page (76).png',
    'books/God the Invisible King/page (77).png',
    'books/God the Invisible King/page (78).png',
    'books/God the Invisible King/page (79).png',
    'books/God the Invisible King/page (80).png',
    'books/God the Invisible King/page (81).png',
    'books/God the Invisible King/page (82).png',
    'books/God the Invisible King/page (83).png',
    'books/God the Invisible King/page (84).png',
    'books/God the Invisible King/page (85).png',
    'books/God the Invisible King/page (86).png',
    'books/God the Invisible King/page (87).png',
    'books/God the Invisible King/page (88).png',
    'books/God the Invisible King/page (89).png',
    'books/God the Invisible King/page (90).png',
    'books/God the Invisible King/page (91).png',
    'books/God the Invisible King/page (92).png',
    'books/God the Invisible King/page (93).png',
    'books/God the Invisible King/page (94).png',
    'books/God the Invisible King/page (95).png',
    'books/God the Invisible King/page (96).png',
    'books/God the Invisible King/page (97).png',
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
