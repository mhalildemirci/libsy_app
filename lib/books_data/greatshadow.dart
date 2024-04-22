import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class greatshadow extends StatefulWidget {
  const greatshadow({Key? key}) : super(key: key);

  @override
  State<greatshadow> createState() => _greatshadowState();
}

class _greatshadowState extends State<greatshadow> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/great shadow/page (1).png',
    'books/great shadow/page (2).png',
    'books/great shadow/page (3).png',
    'books/great shadow/page (4).png',
    'books/great shadow/page (5).png',
    'books/great shadow/page (6).png',
    'books/great shadow/page (7).png',
    'books/great shadow/page (8).png',
    'books/great shadow/page (9).png',
    'books/great shadow/page (10).png',
    'books/great shadow/page (11).png',
    'books/great shadow/page (12).png',
    'books/great shadow/page (13).png',
    'books/great shadow/page (14).png',
    'books/great shadow/page (15).png',
    'books/great shadow/page (16).png',
    'books/great shadow/page (17).png',
    'books/great shadow/page (18).png',
    'books/great shadow/page (19).png',
    'books/great shadow/page (20).png',
    'books/great shadow/page (21).png',
    'books/great shadow/page (22).png',
    'books/great shadow/page (23).png',
    'books/great shadow/page (24).png',
    'books/great shadow/page (25).png',
    'books/great shadow/page (26).png',
    'books/great shadow/page (27).png',
    'books/great shadow/page (28).png',
    'books/great shadow/page (29).png',
    'books/great shadow/page (30).png',
    'books/great shadow/page (31).png',
    'books/great shadow/page (32).png',
    'books/great shadow/page (33).png',
    'books/great shadow/page (34).png',
    'books/great shadow/page (35).png',
    'books/great shadow/page (36).png',
    'books/great shadow/page (37).png',
    'books/great shadow/page (38).png',
    'books/great shadow/page (39).png',
    'books/great shadow/page (40).png',
    'books/great shadow/page (41).png',
    'books/great shadow/page (42).png',
    'books/great shadow/page (43).png',
    'books/great shadow/page (44).png',
    'books/great shadow/page (45).png',
    'books/great shadow/page (46).png',
    'books/great shadow/page (47).png',
    'books/great shadow/page (48).png',
    'books/great shadow/page (49).png',
    'books/great shadow/page (50).png',
    'books/great shadow/page (51).png',
    'books/great shadow/page (52).png',
    'books/great shadow/page (53).png',
    'books/great shadow/page (54).png',
    'books/great shadow/page (55).png',
    'books/great shadow/page (56).png',
    'books/great shadow/page (57).png',
    'books/great shadow/page (58).png',
    'books/great shadow/page (59).png',
    'books/great shadow/page (60).png',
    'books/great shadow/page (61).png',
    'books/great shadow/page (62).png',
    'books/great shadow/page (63).png',
    'books/great shadow/page (64).png',
    'books/great shadow/page (65).png',
    'books/great shadow/page (66).png',
    'books/great shadow/page (67).png',
    'books/great shadow/page (68).png',
    'books/great shadow/page (69).png',
    'books/great shadow/page (70).png',
    'books/great shadow/page (71).png',
    'books/great shadow/page (72).png',
    'books/great shadow/page (73).png',
    'books/great shadow/page (74).png',
    'books/great shadow/page (75).png',
    'books/great shadow/page (76).png',
    'books/great shadow/page (77).png',
    'books/great shadow/page (78).png',
    'books/great shadow/page (79).png',
    'books/great shadow/page (80).png',
    'books/great shadow/page (81).png',
    'books/great shadow/page (82).png',
    'books/great shadow/page (83).png',
    'books/great shadow/page (84).png',
    'books/great shadow/page (85).png',
    'books/great shadow/page (86).png',
    'books/great shadow/page (87).png',
    'books/great shadow/page (88).png',
    'books/great shadow/page (89).png',
    'books/great shadow/page (90).png',
    'books/great shadow/page (91).png',
    'books/great shadow/page (92).png',
    'books/great shadow/page (93).png',
    'books/great shadow/page (94).png',
    'books/great shadow/page (95).png',
    'books/great shadow/page (96).png',
    'books/great shadow/page (97).png',
    'books/great shadow/page (98).png',
    'books/great shadow/page (99).png',
    'books/great shadow/page (100).png',
    'books/great shadow/page (101).png',
    'books/great shadow/page (102).png',
    'books/great shadow/page (103).png',
    'books/great shadow/page (104).png',
    'books/great shadow/page (105).png',
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
