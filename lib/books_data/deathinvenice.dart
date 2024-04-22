import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class deathinvenice extends StatefulWidget {
  const deathinvenice({Key? key}) : super(key: key);

  @override
  State<deathinvenice> createState() => _deathinveniceState();
}

class _deathinveniceState extends State<deathinvenice> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/death in venice/page (1).png',
    'books/death in venice/page (2).png',
    'books/death in venice/page (3).png',
    'books/death in venice/page (4).png',
    'books/death in venice/page (5).png',
    'books/death in venice/page (6).png',
    'books/death in venice/page (7).png',
    'books/death in venice/page (8).png',
    'books/death in venice/page (9).png',
    'books/death in venice/page (10).png',
    'books/death in venice/page (11).png',
    'books/death in venice/page (12).png',
    'books/death in venice/page (13).png',
    'books/death in venice/page (14).png',
    'books/death in venice/page (15).png',
    'books/death in venice/page (16).png',
    'books/death in venice/page (17).png',
    'books/death in venice/page (18).png',
    'books/death in venice/page (19).png',
    'books/death in venice/page (20).png',
    'books/death in venice/page (21).png',
    'books/death in venice/page (22).png',
    'books/death in venice/page (23).png',
    'books/death in venice/page (24).png',
    'books/death in venice/page (25).png',
    'books/death in venice/page (26).png',
    'books/death in venice/page (27).png',
    'books/death in venice/page (28).png',
    'books/death in venice/page (29).png',
    'books/death in venice/page (30).png',
    'books/death in venice/page (31).png',
    'books/death in venice/page (32).png',
    'books/death in venice/page (33).png',
    'books/death in venice/page (34).png',
    'books/death in venice/page (35).png',
    'books/death in venice/page (36).png',
    'books/death in venice/page (37).png',
    'books/death in venice/page (38).png',
    'books/death in venice/page (39).png',
    'books/death in venice/page (40).png',
    'books/death in venice/page (41).png',
    'books/death in venice/page (42).png',
    'books/death in venice/page (43).png',
    'books/death in venice/page (44).png',
    'books/death in venice/page (45).png',
    'books/death in venice/page (46).png',
    'books/death in venice/page (47).png',
    'books/death in venice/page (48).png',
    'books/death in venice/page (49).png',
    'books/death in venice/page (50).png',
    'books/death in venice/page (51).png',
    'books/death in venice/page (52).png',
    'books/death in venice/page (53).png',
    'books/death in venice/page (54).png',
    'books/death in venice/page (55).png',
    'books/death in venice/page (56).png',
    'books/death in venice/page (57).png',
    'books/death in venice/page (58).png',
    'books/death in venice/page (59).png',
    'books/death in venice/page (60).png',
    'books/death in venice/page (61).png',
    'books/death in venice/page (62).png',
    'books/death in venice/page (63).png',
    'books/death in venice/page (64).png',
    'books/death in venice/page (65).png',
    'books/death in venice/page (66).png',
    'books/death in venice/page (67).png',
    'books/death in venice/page (68).png',

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
