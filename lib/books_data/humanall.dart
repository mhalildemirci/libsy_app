import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class humanall extends StatefulWidget {
  const humanall({Key? key}) : super(key: key);

  @override
  State<humanall> createState() => _humanallState();
}

class _humanallState extends State<humanall> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Human all too human/page (1).png',
    'books/Human all too human/page (2).png',
    'books/Human all too human/page (3).png',
    'books/Human all too human/page (4).png',
    'books/Human all too human/page (5).png',
    'books/Human all too human/page (6).png',
    'books/Human all too human/page (7).png',
    'books/Human all too human/page (8).png',
    'books/Human all too human/page (9).png',
    'books/Human all too human/page (10).png',
    'books/Human all too human/page (11).png',
    'books/Human all too human/page (12).png',
    'books/Human all too human/page (13).png',
    'books/Human all too human/page (14).png',
    'books/Human all too human/page (15).png',
    'books/Human all too human/page (16).png',
    'books/Human all too human/page (17).png',
    'books/Human all too human/page (18).png',
    'books/Human all too human/page (19).png',
    'books/Human all too human/page (20).png',
    'books/Human all too human/page (21).png',
    'books/Human all too human/page (22).png',
    'books/Human all too human/page (23).png',
    'books/Human all too human/page (24).png',
    'books/Human all too human/page (25).png',
    'books/Human all too human/page (26).png',
    'books/Human all too human/page (27).png',
    'books/Human all too human/page (28).png',
    'books/Human all too human/page (29).png',
    'books/Human all too human/page (30).png',
    'books/Human all too human/page (31).png',
    'books/Human all too human/page (32).png',
    'books/Human all too human/page (33).png',
    'books/Human all too human/page (34).png',
    'books/Human all too human/page (35).png',
    'books/Human all too human/page (36).png',
    'books/Human all too human/page (37).png',
    'books/Human all too human/page (38).png',
    'books/Human all too human/page (39).png',
    'books/Human all too human/page (40).png',
    'books/Human all too human/page (41).png',
    'books/Human all too human/page (42).png',
    'books/Human all too human/page (43).png',
    'books/Human all too human/page (44).png',
    'books/Human all too human/page (45).png',
    'books/Human all too human/page (46).png',
    'books/Human all too human/page (47).png',
    'books/Human all too human/page (48).png',
    'books/Human all too human/page (49).png',
    'books/Human all too human/page (50).png',
    'books/Human all too human/page (51).png',
    'books/Human all too human/page (52).png',
    'books/Human all too human/page (53).png',
    'books/Human all too human/page (54).png',
    'books/Human all too human/page (55).png',
    'books/Human all too human/page (56).png',
    'books/Human all too human/page (57).png',
    'books/Human all too human/page (58).png',
    'books/Human all too human/page (59).png',
    'books/Human all too human/page (60).png',
    'books/Human all too human/page (61).png',
    'books/Human all too human/page (62).png',
    'books/Human all too human/page (63).png',
    'books/Human all too human/page (64).png',
    'books/Human all too human/page (65).png',
    'books/Human all too human/page (66).png',
    'books/Human all too human/page (67).png',
    'books/Human all too human/page (68).png',
    'books/Human all too human/page (69).png',
    'books/Human all too human/page (70).png',
    'books/Human all too human/page (71).png',
    'books/Human all too human/page (72).png',
    'books/Human all too human/page (73).png',
    'books/Human all too human/page (74).png',
    'books/Human all too human/page (75).png',
    'books/Human all too human/page (76).png',
    'books/Human all too human/page (77).png',
    'books/Human all too human/page (78).png',
    'books/Human all too human/page (79).png',
    'books/Human all too human/page (80).png',
    'books/Human all too human/page (81).png',
    'books/Human all too human/page (82).png',
    'books/Human all too human/page (83).png',
    'books/Human all too human/page (84).png',
    'books/Human all too human/page (85).png',
    'books/Human all too human/page (86).png',
    'books/Human all too human/page (87).png',
    'books/Human all too human/page (88).png',
    'books/Human all too human/page (89).png',
    'books/Human all too human/page (90).png',
    'books/Human all too human/page (91).png',
    'books/Human all too human/page (92).png',
    'books/Human all too human/page (93).png',

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
