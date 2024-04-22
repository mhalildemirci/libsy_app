import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class vitalproblemmarried extends StatefulWidget {
  const vitalproblemmarried({Key? key}) : super(key: key);

  @override
  State<vitalproblemmarried> createState() => _vitalproblemmarriedState();
}

class _vitalproblemmarriedState extends State<vitalproblemmarried> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/a vital problem of married/page (1).png',
    'books/a vital problem of married/page (2).png',
    'books/a vital problem of married/page (3).png',
    'books/a vital problem of married/page (4).png',
    'books/a vital problem of married/page (5).png',
    'books/a vital problem of married/page (6).png',
    'books/a vital problem of married/page (7).png',
    'books/a vital problem of married/page (8).png',
    'books/a vital problem of married/page (9).png',
    'books/a vital problem of married/page (10).png',
    'books/a vital problem of married/page (11).png',
    'books/a vital problem of married/page (12).png',
    'books/a vital problem of married/page (13).png',
    'books/a vital problem of married/page (14).png',
    'books/a vital problem of married/page (15).png',
    'books/a vital problem of married/page (16).png',
    'books/a vital problem of married/page (17).png',
    'books/a vital problem of married/page (18).png',
    'books/a vital problem of married/page (19).png',
    'books/a vital problem of married/page (20).png',
    'books/a vital problem of married/page (21).png',
    'books/a vital problem of married/page (22).png',
    'books/a vital problem of married/page (23).png',
    'books/a vital problem of married/page (24).png',
    'books/a vital problem of married/page (25).png',
    'books/a vital problem of married/page (26).png',
    'books/a vital problem of married/page (27).png',
    'books/a vital problem of married/page (28).png',
    'books/a vital problem of married/page (29).png',
    'books/a vital problem of married/page (30).png',
    'books/a vital problem of married/page (31).png',
    'books/a vital problem of married/page (32).png',
    'books/a vital problem of married/page (33).png',
    'books/a vital problem of married/page (34).png',
    'books/a vital problem of married/page (35).png',
    'books/a vital problem of married/page (36).png',
    'books/a vital problem of married/page (37).png',
    'books/a vital problem of married/page (38).png',
    'books/a vital problem of married/page (39).png',
    'books/a vital problem of married/page (40).png',
    'books/a vital problem of married/page (41).png',
    'books/a vital problem of married/page (42).png',
    'books/a vital problem of married/page (43).png',
    'books/a vital problem of married/page (44).png',
    'books/a vital problem of married/page (45).png',
    'books/a vital problem of married/page (46).png',
    'books/a vital problem of married/page (47).png',
    'books/a vital problem of married/page (48).png',
    'books/a vital problem of married/page (49).png',
    'books/a vital problem of married/page (50).png',
    'books/a vital problem of married/page (51).png',
    'books/a vital problem of married/page (52).png',
    'books/a vital problem of married/page (53).png',
    'books/a vital problem of married/page (54).png',
    'books/a vital problem of married/page (55).png',
    'books/a vital problem of married/page (56).png',
    'books/a vital problem of married/page (57).png',
    'books/a vital problem of married/page (58).png',
    'books/a vital problem of married/page (59).png',
    'books/a vital problem of married/page (60).png',
    'books/a vital problem of married/page (61).png',
    'books/a vital problem of married/page (62).png',
    'books/a vital problem of married/page (63).png',
    'books/a vital problem of married/page (64).png',
    'books/a vital problem of married/page (65).png',
    'books/a vital problem of married/page (66).png',
    'books/a vital problem of married/page (67).png',
    'books/a vital problem of married/page (68).png',
    'books/a vital problem of married/page (69).png',
    'books/a vital problem of married/page (70).png',
    'books/a vital problem of married/page (71).png',
    'books/a vital problem of married/page (72).png',
    'books/a vital problem of married/page (73).png',
    'books/a vital problem of married/page (74).png',
    'books/a vital problem of married/page (75).png',
    'books/a vital problem of married/page (76).png',
    'books/a vital problem of married/page (77).png',
    'books/a vital problem of married/page (78).png',
    'books/a vital problem of married/page (79).png',
    'books/a vital problem of married/page (80).png',
    'books/a vital problem of married/page (81).png',
    'books/a vital problem of married/page (82).png',
    'books/a vital problem of married/page (83).png',
    'books/a vital problem of married/page (84).png',
    'books/a vital problem of married/page (85).png',
    'books/a vital problem of married/page (86).png',
    'books/a vital problem of married/page (87).png',
    'books/a vital problem of married/page (88).png',
    'books/a vital problem of married/page (89).png',
    'books/a vital problem of married/page (90).png',
    'books/a vital problem of married/page (91).png',
    'books/a vital problem of married/page (92).png',
    'books/a vital problem of married/page (93).png',
    'books/a vital problem of married/page (94).png',
    'books/a vital problem of married/page (95).png',
    'books/a vital problem of married/page (96).png',
    'books/a vital problem of married/page (97).png',
    'books/a vital problem of married/page (98).png',
    'books/a vital problem of married/page (99).png',
    'books/a vital problem of married/page (100).png',
    'books/a vital problem of married/page (101).png',
    'books/a vital problem of married/page (102).png',
    'books/a vital problem of married/page (103).png',
    'books/a vital problem of married/page (104).png',
    'books/a vital problem of married/page (105).png',
    'books/a vital problem of married/page (106).png',
    'books/a vital problem of married/page (107).png',
    'books/a vital problem of married/page (108).png',
    'books/a vital problem of married/page (109).png',
    'books/a vital problem of married/page (110).png',
    'books/a vital problem of married/page (111).png',
    'books/a vital problem of married/page (112).png',
    'books/a vital problem of married/page (113).png',
    'books/a vital problem of married/page (114).png',
    'books/a vital problem of married/page (115).png',
    'books/a vital problem of married/page (116).png',
    'books/a vital problem of married/page (117).png',
    'books/a vital problem of married/page (118).png',
    'books/a vital problem of married/page (119).png',
    'books/a vital problem of married/page (120).png',
    'books/a vital problem of married/page (121).png',
    'books/a vital problem of married/page (122).png',
    'books/a vital problem of married/page (123).png',
    'books/a vital problem of married/page (124).png',
    'books/a vital problem of married/page (125).png',
    'books/a vital problem of married/page (126).png',
    'books/a vital problem of married/page (127).png',
    'books/a vital problem of married/page (128).png',
    'books/a vital problem of married/page (129).png',
    'books/a vital problem of married/page (130).png',
    'books/a vital problem of married/page (131).png',
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
