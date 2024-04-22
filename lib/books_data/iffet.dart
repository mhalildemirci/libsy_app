import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class iffet extends StatefulWidget {
  const iffet({Key? key}) : super(key: key);

  @override
  State<iffet> createState() => _iffetState();
}

class _iffetState extends State<iffet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/iffet/page (1).png',
    'books/iffet/page (2).png',
    'books/iffet/page (3).png',
    'books/iffet/page (4).png',
    'books/iffet/page (5).png',
    'books/iffet/page (6).png',
    'books/iffet/page (7).png',
    'books/iffet/page (8).png',
    'books/iffet/page (9).png',
    'books/iffet/page (10).png',
    'books/iffet/page (11).png',
    'books/iffet/page (12).png',
    'books/iffet/page (13).png',
    'books/iffet/page (14).png',
    'books/iffet/page (15).png',
    'books/iffet/page (16).png',
    'books/iffet/page (17).png',
    'books/iffet/page (18).png',
    'books/iffet/page (19).png',
    'books/iffet/page (20).png',
    'books/iffet/page (21).png',
    'books/iffet/page (22).png',
    'books/iffet/page (23).png',
    'books/iffet/page (24).png',
    'books/iffet/page (25).png',
    'books/iffet/page (26).png',
    'books/iffet/page (27).png',
    'books/iffet/page (28).png',
    'books/iffet/page (29).png',
    'books/iffet/page (30).png',
    'books/iffet/page (31).png',
    'books/iffet/page (32).png',
    'books/iffet/page (33).png',
    'books/iffet/page (34).png',
    'books/iffet/page (35).png',
    'books/iffet/page (36).png',
    'books/iffet/page (37).png',
    'books/iffet/page (38).png',
    'books/iffet/page (39).png',
    'books/iffet/page (40).png',
    'books/iffet/page (41).png',
    'books/iffet/page (42).png',
    'books/iffet/page (43).png',
    'books/iffet/page (44).png',
    'books/iffet/page (45).png',
    'books/iffet/page (46).png',
    'books/iffet/page (47).png',
    'books/iffet/page (48).png',
    'books/iffet/page (49).png',
    'books/iffet/page (50).png',
    'books/iffet/page (51).png',
    'books/iffet/page (52).png',
    'books/iffet/page (53).png',
    'books/iffet/page (54).png',
    'books/iffet/page (55).png',
    'books/iffet/page (56).png',
    'books/iffet/page (57).png',
    'books/iffet/page (58).png',
    'books/iffet/page (59).png',
    'books/iffet/page (60).png',
    'books/iffet/page (61).png',
    'books/iffet/page (62).png',
    'books/iffet/page (63).png',
    'books/iffet/page (64).png',
    'books/iffet/page (65).png',
    'books/iffet/page (66).png',
    'books/iffet/page (67).png',
    'books/iffet/page (68).png',
    'books/iffet/page (69).png',
    'books/iffet/page (70).png',
    'books/iffet/page (71).png',
    'books/iffet/page (72).png',
    'books/iffet/page (73).png',
    'books/iffet/page (74).png',
    'books/iffet/page (75).png',
    'books/iffet/page (76).png',
    'books/iffet/page (77).png',
    'books/iffet/page (78).png',
    'books/iffet/page (79).png',
    'books/iffet/page (80).png',
    'books/iffet/page (81).png',
    'books/iffet/page (82).png',
    'books/iffet/page (83).png',
    'books/iffet/page (84).png',

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
