import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class merchant extends StatefulWidget {
  const merchant({Key? key}) : super(key: key);

  @override
  State<merchant> createState() => _merchantState();
}

class _merchantState extends State<merchant> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/merchant/page (1).png',
    'books/merchant/page (2).png',
    'books/merchant/page (3).png',
    'books/merchant/page (4).png',
    'books/merchant/page (5).png',
    'books/merchant/page (6).png',
    'books/merchant/page (7).png',
    'books/merchant/page (8).png',
    'books/merchant/page (9).png',
    'books/merchant/page (10).png',
    'books/merchant/page (11).png',
    'books/merchant/page (12).png',
    'books/merchant/page (13).png',
    'books/merchant/page (14).png',
    'books/merchant/page (15).png',
    'books/merchant/page (16).png',
    'books/merchant/page (17).png',
    'books/merchant/page (18).png',
    'books/merchant/page (19).png',
    'books/merchant/page (20).png',
    'books/merchant/page (21).png',
    'books/merchant/page (22).png',
    'books/merchant/page (23).png',
    'books/merchant/page (24).png',
    'books/merchant/page (25).png',
    'books/merchant/page (26).png',
    'books/merchant/page (27).png',
    'books/merchant/page (28).png',
    'books/merchant/page (29).png',
    'books/merchant/page (30).png',
    'books/merchant/page (31).png',
    'books/merchant/page (32).png',
    'books/merchant/page (33).png',
    'books/merchant/page (34).png',
    'books/merchant/page (35).png',
    'books/merchant/page (36).png',
    'books/merchant/page (37).png',
    'books/merchant/page (38).png',
    'books/merchant/page (39).png',
    'books/merchant/page (40).png',
    'books/merchant/page (41).png',
    'books/merchant/page (42).png',
    'books/merchant/page (43).png',
    'books/merchant/page (44).png',
    'books/merchant/page (45).png',
    'books/merchant/page (46).png',
    'books/merchant/page (47).png',
    'books/merchant/page (48).png',
    'books/merchant/page (49).png',
    'books/merchant/page (50).png',
    'books/merchant/page (51).png',
    'books/merchant/page (52).png',
    'books/merchant/page (53).png',
    'books/merchant/page (54).png',
    'books/merchant/page (55).png',
    'books/merchant/page (56).png',
    'books/merchant/page (57).png',
    'books/merchant/page (58).png',
    'books/merchant/page (59).png',
    'books/merchant/page (60).png',
    'books/merchant/page (61).png',
    'books/merchant/page (62).png',
    'books/merchant/page (63).png',
    'books/merchant/page (64).png',
    'books/merchant/page (65).png',
    'books/merchant/page (66).png',
    'books/merchant/page (67).png',
    'books/merchant/page (68).png',
    'books/merchant/page (69).png',
    'books/merchant/page (70).png',
    'books/merchant/page (71).png',
    'books/merchant/page (72).png',
    'books/merchant/page (73).png',
    'books/merchant/page (74).png',
    'books/merchant/page (75).png',
    'books/merchant/page (76).png',
    'books/merchant/page (77).png',
    'books/merchant/page (78).png',
    'books/merchant/page (79).png',
    'books/merchant/page (80).png',
    'books/merchant/page (81).png',
    'books/merchant/page (82).png',
    'books/merchant/page (83).png',
    'books/merchant/page (84).png',
    'books/merchant/page (85).png',
    'books/merchant/page (86).png',
    'books/merchant/page (87).png',
    'books/merchant/page (88).png',
    'books/merchant/page (89).png',
    'books/merchant/page (90).png',

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
