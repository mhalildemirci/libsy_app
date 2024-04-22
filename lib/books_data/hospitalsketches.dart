import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hospitalsketches extends StatefulWidget {
  const hospitalsketches({Key? key}) : super(key: key);

  @override
  State<hospitalsketches> createState() => _hospitalsketchesState();
}

class _hospitalsketchesState extends State<hospitalsketches> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/hospital sketches/page (1).png',
    'books/hospital sketches/page (2).png',
    'books/hospital sketches/page (3).png',
    'books/hospital sketches/page (4).png',
    'books/hospital sketches/page (5).png',
    'books/hospital sketches/page (6).png',
    'books/hospital sketches/page (7).png',
    'books/hospital sketches/page (8).png',
    'books/hospital sketches/page (9).png',
    'books/hospital sketches/page (10).png',
    'books/hospital sketches/page (11).png',
    'books/hospital sketches/page (12).png',
    'books/hospital sketches/page (13).png',
    'books/hospital sketches/page (14).png',
    'books/hospital sketches/page (15).png',
    'books/hospital sketches/page (16).png',
    'books/hospital sketches/page (17).png',
    'books/hospital sketches/page (18).png',
    'books/hospital sketches/page (19).png',
    'books/hospital sketches/page (20).png',
    'books/hospital sketches/page (21).png',
    'books/hospital sketches/page (22).png',
    'books/hospital sketches/page (23).png',
    'books/hospital sketches/page (24).png',
    'books/hospital sketches/page (25).png',
    'books/hospital sketches/page (26).png',
    'books/hospital sketches/page (27).png',
    'books/hospital sketches/page (28).png',
    'books/hospital sketches/page (29).png',
    'books/hospital sketches/page (30).png',
    'books/hospital sketches/page (31).png',
    'books/hospital sketches/page (32).png',
    'books/hospital sketches/page (33).png',
    'books/hospital sketches/page (34).png',
    'books/hospital sketches/page (35).png',
    'books/hospital sketches/page (36).png',
    'books/hospital sketches/page (37).png',
    'books/hospital sketches/page (38).png',
    'books/hospital sketches/page (39).png',
    'books/hospital sketches/page (40).png',
    'books/hospital sketches/page (41).png',
    'books/hospital sketches/page (42).png',
    'books/hospital sketches/page (43).png',
    'books/hospital sketches/page (44).png',
    'books/hospital sketches/page (45).png',
    'books/hospital sketches/page (46).png',
    'books/hospital sketches/page (47).png',
    'books/hospital sketches/page (48).png',
    'books/hospital sketches/page (49).png',
    'books/hospital sketches/page (50).png',
    'books/hospital sketches/page (51).png',
    'books/hospital sketches/page (52).png',
    'books/hospital sketches/page (53).png',
    'books/hospital sketches/page (54).png',
    'books/hospital sketches/page (55).png',
    'books/hospital sketches/page (56).png',
    'books/hospital sketches/page (57).png',
    'books/hospital sketches/page (58).png',
    'books/hospital sketches/page (59).png',
    'books/hospital sketches/page (60).png',
    'books/hospital sketches/page (61).png',
    'books/hospital sketches/page (62).png',
    'books/hospital sketches/page (63).png',
    'books/hospital sketches/page (64).png',
    'books/hospital sketches/page (65).png',
    'books/hospital sketches/page (66).png',
    'books/hospital sketches/page (67).png',
    'books/hospital sketches/page (68).png',
    'books/hospital sketches/page (69).png',
    'books/hospital sketches/page (70).png',
    'books/hospital sketches/page (71).png',
    'books/hospital sketches/page (72).png',
    'books/hospital sketches/page (73).png',
    'books/hospital sketches/page (74).png',
    'books/hospital sketches/page (75).png',
    'books/hospital sketches/page (76).png',
    'books/hospital sketches/page (77).png',
    'books/hospital sketches/page (78).png',
    'books/hospital sketches/page (79).png',

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
