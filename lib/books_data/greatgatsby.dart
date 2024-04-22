import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class greatgatsby extends StatefulWidget {
  const greatgatsby({Key? key}) : super(key: key);

  @override
  State<greatgatsby> createState() => _greatgatsbyState();
}

class _greatgatsbyState extends State<greatgatsby> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/great gatsby/page (1).png',
    'books/great gatsby/page (2).png',
    'books/great gatsby/page (3).png',
    'books/great gatsby/page (4).png',
    'books/great gatsby/page (5).png',
    'books/great gatsby/page (6).png',
    'books/great gatsby/page (7).png',
    'books/great gatsby/page (8).png',
    'books/great gatsby/page (9).png',
    'books/great gatsby/page (10).png',
    'books/great gatsby/page (11).png',
    'books/great gatsby/page (12).png',
    'books/great gatsby/page (13).png',
    'books/great gatsby/page (14).png',
    'books/great gatsby/page (15).png',
    'books/great gatsby/page (16).png',
    'books/great gatsby/page (17).png',
    'books/great gatsby/page (18).png',
    'books/great gatsby/page (19).png',
    'books/great gatsby/page (20).png',
    'books/great gatsby/page (21).png',
    'books/great gatsby/page (22).png',
    'books/great gatsby/page (23).png',
    'books/great gatsby/page (24).png',
    'books/great gatsby/page (25).png',
    'books/great gatsby/page (26).png',
    'books/great gatsby/page (27).png',
    'books/great gatsby/page (28).png',
    'books/great gatsby/page (29).png',
    'books/great gatsby/page (30).png',
    'books/great gatsby/page (31).png',
    'books/great gatsby/page (32).png',
    'books/great gatsby/page (33).png',
    'books/great gatsby/page (34).png',
    'books/great gatsby/page (35).png',
    'books/great gatsby/page (36).png',
    'books/great gatsby/page (37).png',
    'books/great gatsby/page (38).png',
    'books/great gatsby/page (39).png',
    'books/great gatsby/page (40).png',
    'books/great gatsby/page (41).png',
    'books/great gatsby/page (42).png',
    'books/great gatsby/page (43).png',
    'books/great gatsby/page (44).png',
    'books/great gatsby/page (45).png',
    'books/great gatsby/page (46).png',
    'books/great gatsby/page (47).png',
    'books/great gatsby/page (48).png',
    'books/great gatsby/page (49).png',
    'books/great gatsby/page (50).png',
    'books/great gatsby/page (51).png',
    'books/great gatsby/page (52).png',
    'books/great gatsby/page (53).png',
    'books/great gatsby/page (54).png',
    'books/great gatsby/page (55).png',
    'books/great gatsby/page (56).png',
    'books/great gatsby/page (57).png',
    'books/great gatsby/page (58).png',
    'books/great gatsby/page (59).png',
    'books/great gatsby/page (60).png',
    'books/great gatsby/page (61).png',
    'books/great gatsby/page (62).png',
    'books/great gatsby/page (63).png',
    'books/great gatsby/page (64).png',
    'books/great gatsby/page (65).png',
    'books/great gatsby/page (66).png',
    'books/great gatsby/page (67).png',
    'books/great gatsby/page (68).png',
    'books/great gatsby/page (69).png',
    'books/great gatsby/page (70).png',
    'books/great gatsby/page (71).png',
    'books/great gatsby/page (72).png',
    'books/great gatsby/page (73).png',
    'books/great gatsby/page (74).png',
    'books/great gatsby/page (75).png',
    'books/great gatsby/page (76).png',
    'books/great gatsby/page (77).png',
    'books/great gatsby/page (78).png',
    'books/great gatsby/page (79).png',
    'books/great gatsby/page (80).png',
    'books/great gatsby/page (81).png',
    'books/great gatsby/page (82).png',
    'books/great gatsby/page (83).png',
    'books/great gatsby/page (84).png',
    'books/great gatsby/page (85).png',
    'books/great gatsby/page (86).png',
    'books/great gatsby/page (87).png',
    'books/great gatsby/page (88).png',
    'books/great gatsby/page (89).png',
    'books/great gatsby/page (90).png',
    'books/great gatsby/page (91).png',
    'books/great gatsby/page (92).png',
    'books/great gatsby/page (93).png',
    'books/great gatsby/page (94).png',
    'books/great gatsby/page (95).png',
    'books/great gatsby/page (96).png',
    'books/great gatsby/page (97).png',
    'books/great gatsby/page (98).png',
    'books/great gatsby/page (99).png',
    'books/great gatsby/page (100).png',
    'books/great gatsby/page (101).png',
    'books/great gatsby/page (102).png',
    'books/great gatsby/page (103).png',
    'books/great gatsby/page (104).png',
    'books/great gatsby/page (105).png',
    'books/great gatsby/page (106).png',
    'books/great gatsby/page (107).png',
    'books/great gatsby/page (108).png',
    'books/great gatsby/page (109).png',
    'books/great gatsby/page (110).png',
    'books/great gatsby/page (111).png',
    'books/great gatsby/page (112).png',
    'books/great gatsby/page (113).png',
    'books/great gatsby/page (114).png',
    'books/great gatsby/page (115).png',
    'books/great gatsby/page (116).png',
    'books/great gatsby/page (117).png',
    'books/great gatsby/page (118).png',
    'books/great gatsby/page (119).png',
    'books/great gatsby/page (120).png',
    'books/great gatsby/page (121).png',
    'books/great gatsby/page (122).png',
    'books/great gatsby/page (123).png',
    'books/great gatsby/page (124).png',
    'books/great gatsby/page (125).png',
    'books/great gatsby/page (126).png',
    'books/great gatsby/page (127).png',
    'books/great gatsby/page (128).png',
    'books/great gatsby/page (129).png',
    'books/great gatsby/page (130).png',
    'books/great gatsby/page (131).png',

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
