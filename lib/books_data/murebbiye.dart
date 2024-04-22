import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class murebbiye extends StatefulWidget {
  const murebbiye({Key? key}) : super(key: key);

  @override
  State<murebbiye> createState() => _murebbiyeState();
}

class _murebbiyeState extends State<murebbiye> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/murebbiye/page (1).png',
    'books/murebbiye/page (2).png',
    'books/murebbiye/page (3).png',
    'books/murebbiye/page (4).png',
    'books/murebbiye/page (5).png',
    'books/murebbiye/page (6).png',
    'books/murebbiye/page (7).png',
    'books/murebbiye/page (8).png',
    'books/murebbiye/page (9).png',
    'books/murebbiye/page (10).png',
    'books/murebbiye/page (11).png',
    'books/murebbiye/page (12).png',
    'books/murebbiye/page (13).png',
    'books/murebbiye/page (14).png',
    'books/murebbiye/page (15).png',
    'books/murebbiye/page (16).png',
    'books/murebbiye/page (17).png',
    'books/murebbiye/page (18).png',
    'books/murebbiye/page (19).png',
    'books/murebbiye/page (20).png',
    'books/murebbiye/page (21).png',
    'books/murebbiye/page (22).png',
    'books/murebbiye/page (23).png',
    'books/murebbiye/page (24).png',
    'books/murebbiye/page (25).png',
    'books/murebbiye/page (26).png',
    'books/murebbiye/page (27).png',
    'books/murebbiye/page (28).png',
    'books/murebbiye/page (29).png',
    'books/murebbiye/page (30).png',
    'books/murebbiye/page (31).png',
    'books/murebbiye/page (32).png',
    'books/murebbiye/page (33).png',
    'books/murebbiye/page (34).png',
    'books/murebbiye/page (35).png',
    'books/murebbiye/page (36).png',
    'books/murebbiye/page (37).png',
    'books/murebbiye/page (38).png',
    'books/murebbiye/page (39).png',
    'books/murebbiye/page (40).png',
    'books/murebbiye/page (41).png',
    'books/murebbiye/page (42).png',
    'books/murebbiye/page (43).png',
    'books/murebbiye/page (44).png',
    'books/murebbiye/page (45).png',
    'books/murebbiye/page (46).png',
    'books/murebbiye/page (47).png',
    'books/murebbiye/page (48).png',
    'books/murebbiye/page (49).png',
    'books/murebbiye/page (50).png',
    'books/murebbiye/page (51).png',
    'books/murebbiye/page (52).png',
    'books/murebbiye/page (53).png',
    'books/murebbiye/page (54).png',
    'books/murebbiye/page (55).png',
    'books/murebbiye/page (56).png',
    'books/murebbiye/page (57).png',
    'books/murebbiye/page (58).png',
    'books/murebbiye/page (59).png',
    'books/murebbiye/page (60).png',
    'books/murebbiye/page (61).png',
    'books/murebbiye/page (62).png',
    'books/murebbiye/page (63).png',
    'books/murebbiye/page (64).png',
    'books/murebbiye/page (65).png',
    'books/murebbiye/page (66).png',
    'books/murebbiye/page (67).png',
    'books/murebbiye/page (68).png',
    'books/murebbiye/page (69).png',
    'books/murebbiye/page (70).png',
    'books/murebbiye/page (71).png',
    'books/murebbiye/page (72).png',
    'books/murebbiye/page (73).png',
    'books/murebbiye/page (74).png',
    'books/murebbiye/page (75).png',
    'books/murebbiye/page (76).png',
    'books/murebbiye/page (77).png',
    'books/murebbiye/page (78).png',
    'books/murebbiye/page (79).png',
    'books/murebbiye/page (80).png',
    'books/murebbiye/page (81).png',
    'books/murebbiye/page (82).png',
    'books/murebbiye/page (83).png',
    'books/murebbiye/page (84).png',
    'books/murebbiye/page (85).png',
    'books/murebbiye/page (86).png',
    'books/murebbiye/page (87).png',
    'books/murebbiye/page (88).png',
    'books/murebbiye/page (89).png',
    'books/murebbiye/page (90).png',
    'books/murebbiye/page (91).png',
    'books/murebbiye/page (92).png',
    'books/murebbiye/page (93).png',
    'books/murebbiye/page (94).png',
    'books/murebbiye/page (95).png',
    'books/murebbiye/page (96).png',
    'books/murebbiye/page (97).png',
    'books/murebbiye/page (98).png',
    'books/murebbiye/page (99).png',
    'books/murebbiye/page (100).png',
    'books/murebbiye/page (101).png',
    'books/murebbiye/page (102).png',
    'books/murebbiye/page (103).png',
    'books/murebbiye/page (104).png',
    'books/murebbiye/page (105).png',
    'books/murebbiye/page (106).png',
    'books/murebbiye/page (107).png',

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
