import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class tangledtale extends StatefulWidget {
  const tangledtale({Key? key}) : super(key: key);

  @override
  State<tangledtale> createState() => _tangledtaleState();
}

class _tangledtaleState extends State<tangledtale> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Tangled Tale/page (1).png',
    'books/A Tangled Tale/page (2).png',
    'books/A Tangled Tale/page (3).png',
    'books/A Tangled Tale/page (4).png',
    'books/A Tangled Tale/page (5).png',
    'books/A Tangled Tale/page (6).png',
    'books/A Tangled Tale/page (7).png',
    'books/A Tangled Tale/page (8).png',
    'books/A Tangled Tale/page (9).png',
    'books/A Tangled Tale/page (10).png',
    'books/A Tangled Tale/page (11).png',
    'books/A Tangled Tale/page (12).png',
    'books/A Tangled Tale/page (13).png',
    'books/A Tangled Tale/page (14).png',
    'books/A Tangled Tale/page (15).png',
    'books/A Tangled Tale/page (16).png',
    'books/A Tangled Tale/page (17).png',
    'books/A Tangled Tale/page (18).png',
    'books/A Tangled Tale/page (19).png',
    'books/A Tangled Tale/page (20).png',
    'books/A Tangled Tale/page (21).png',
    'books/A Tangled Tale/page (22).png',
    'books/A Tangled Tale/page (23).png',
    'books/A Tangled Tale/page (24).png',
    'books/A Tangled Tale/page (25).png',
    'books/A Tangled Tale/page (26).png',
    'books/A Tangled Tale/page (27).png',
    'books/A Tangled Tale/page (28).png',
    'books/A Tangled Tale/page (29).png',
    'books/A Tangled Tale/page (30).png',
    'books/A Tangled Tale/page (31).png',
    'books/A Tangled Tale/page (32).png',
    'books/A Tangled Tale/page (33).png',
    'books/A Tangled Tale/page (34).png',
    'books/A Tangled Tale/page (35).png',
    'books/A Tangled Tale/page (36).png',
    'books/A Tangled Tale/page (37).png',
    'books/A Tangled Tale/page (38).png',
    'books/A Tangled Tale/page (39).png',
    'books/A Tangled Tale/page (40).png',
    'books/A Tangled Tale/page (41).png',
    'books/A Tangled Tale/page (42).png',
    'books/A Tangled Tale/page (43).png',
    'books/A Tangled Tale/page (44).png',
    'books/A Tangled Tale/page (45).png',
    'books/A Tangled Tale/page (46).png',
    'books/A Tangled Tale/page (47).png',
    'books/A Tangled Tale/page (48).png',
    'books/A Tangled Tale/page (49).png',
    'books/A Tangled Tale/page (50).png',
    'books/A Tangled Tale/page (51).png',
    'books/A Tangled Tale/page (52).png',
    'books/A Tangled Tale/page (53).png',
    'books/A Tangled Tale/page (54).png',
    'books/A Tangled Tale/page (55).png',
    'books/A Tangled Tale/page (56).png',
    'books/A Tangled Tale/page (57).png',
    'books/A Tangled Tale/page (58).png',
    'books/A Tangled Tale/page (59).png',
    'books/A Tangled Tale/page (60).png',
    'books/A Tangled Tale/page (61).png',
    'books/A Tangled Tale/page (62).png',
    'books/A Tangled Tale/page (63).png',
    'books/A Tangled Tale/page (64).png',
    'books/A Tangled Tale/page (65).png',
    'books/A Tangled Tale/page (66).png',
    'books/A Tangled Tale/page (67).png',
    'books/A Tangled Tale/page (68).png',
    'books/A Tangled Tale/page (69).png',
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
