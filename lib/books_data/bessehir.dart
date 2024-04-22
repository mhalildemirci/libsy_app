import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bessehir extends StatefulWidget {
  const bessehir({Key? key}) : super(key: key);

  @override
  State<bessehir> createState() => _bessehirState();
}

class _bessehirState extends State<bessehir> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bes sehir/page (1).png',
    'books/bes sehir/page (2).png',
    'books/bes sehir/page (3).png',
    'books/bes sehir/page (4).png',
    'books/bes sehir/page (5).png',
    'books/bes sehir/page (6).png',
    'books/bes sehir/page (7).png',
    'books/bes sehir/page (8).png',
    'books/bes sehir/page (9).png',
    'books/bes sehir/page (10).png',
    'books/bes sehir/page (11).png',
    'books/bes sehir/page (12).png',
    'books/bes sehir/page (13).png',
    'books/bes sehir/page (14).png',
    'books/bes sehir/page (15).png',
    'books/bes sehir/page (16).png',
    'books/bes sehir/page (17).png',
    'books/bes sehir/page (18).png',
    'books/bes sehir/page (19).png',
    'books/bes sehir/page (20).png',
    'books/bes sehir/page (21).png',
    'books/bes sehir/page (22).png',
    'books/bes sehir/page (23).png',
    'books/bes sehir/page (24).png',
    'books/bes sehir/page (25).png',
    'books/bes sehir/page (26).png',
    'books/bes sehir/page (27).png',
    'books/bes sehir/page (28).png',
    'books/bes sehir/page (29).png',
    'books/bes sehir/page (30).png',
    'books/bes sehir/page (31).png',
    'books/bes sehir/page (32).png',
    'books/bes sehir/page (33).png',
    'books/bes sehir/page (34).png',
    'books/bes sehir/page (35).png',
    'books/bes sehir/page (36).png',
    'books/bes sehir/page (37).png',
    'books/bes sehir/page (38).png',
    'books/bes sehir/page (39).png',
    'books/bes sehir/page (40).png',
    'books/bes sehir/page (41).png',
    'books/bes sehir/page (42).png',
    'books/bes sehir/page (43).png',
    'books/bes sehir/page (44).png',
    'books/bes sehir/page (45).png',
    'books/bes sehir/page (46).png',
    'books/bes sehir/page (47).png',
    'books/bes sehir/page (48).png',
    'books/bes sehir/page (49).png',
    'books/bes sehir/page (50).png',
    'books/bes sehir/page (51).png',
    'books/bes sehir/page (52).png',
    'books/bes sehir/page (53).png',
    'books/bes sehir/page (54).png',
    'books/bes sehir/page (55).png',
    'books/bes sehir/page (56).png',
    'books/bes sehir/page (57).png',
    'books/bes sehir/page (58).png',
    'books/bes sehir/page (59).png',
    'books/bes sehir/page (60).png',
    'books/bes sehir/page (61).png',
    'books/bes sehir/page (62).png',
    'books/bes sehir/page (63).png',
    'books/bes sehir/page (64).png',
    'books/bes sehir/page (65).png',
    'books/bes sehir/page (66).png',
    'books/bes sehir/page (67).png',
    'books/bes sehir/page (68).png',
    'books/bes sehir/page (69).png',
    'books/bes sehir/page (70).png',
    'books/bes sehir/page (71).png',
    'books/bes sehir/page (72).png',
    'books/bes sehir/page (73).png',
    'books/bes sehir/page (74).png',
    'books/bes sehir/page (75).png',
    'books/bes sehir/page (76).png',
    'books/bes sehir/page (77).png',
    'books/bes sehir/page (78).png',
    'books/bes sehir/page (79).png',
    'books/bes sehir/page (80).png',
    'books/bes sehir/page (81).png',
    'books/bes sehir/page (82).png',
    'books/bes sehir/page (83).png',
    'books/bes sehir/page (84).png',
    'books/bes sehir/page (85).png',
    'books/bes sehir/page (86).png',
    'books/bes sehir/page (87).png',
    'books/bes sehir/page (88).png',
    'books/bes sehir/page (89).png',
    'books/bes sehir/page (90).png',
    'books/bes sehir/page (91).png',
    'books/bes sehir/page (92).png',
    'books/bes sehir/page (93).png',
    'books/bes sehir/page (94).png',
    'books/bes sehir/page (95).png',
    'books/bes sehir/page (96).png',
    'books/bes sehir/page (97).png',
    'books/bes sehir/page (98).png',
    'books/bes sehir/page (99).png',
    'books/bes sehir/page (100).png',
    'books/bes sehir/page (101).png',
    'books/bes sehir/page (102).png',
    'books/bes sehir/page (103).png',
    'books/bes sehir/page (104).png',
    'books/bes sehir/page (105).png',
    'books/bes sehir/page (106).png',
    'books/bes sehir/page (107).png',
    'books/bes sehir/page (108).png',
    'books/bes sehir/page (109).png',
    'books/bes sehir/page (110).png',
    'books/bes sehir/page (111).png',
    'books/bes sehir/page (112).png',
    'books/bes sehir/page (113).png',
    'books/bes sehir/page (114).png',
    'books/bes sehir/page (115).png',
    'books/bes sehir/page (116).png',
    'books/bes sehir/page (117).png',

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
