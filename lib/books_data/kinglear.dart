import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kinglear extends StatefulWidget {
  const kinglear({Key? key}) : super(key: key);

  @override
  State<kinglear> createState() => _kinglearState();
}

class _kinglearState extends State<kinglear> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/king-lear/page (1).png',
    'books/king-lear/page (2).png',
    'books/king-lear/page (3).png',
    'books/king-lear/page (4).png',
    'books/king-lear/page (5).png',
    'books/king-lear/page (6).png',
    'books/king-lear/page (7).png',
    'books/king-lear/page (8).png',
    'books/king-lear/page (9).png',
    'books/king-lear/page (10).png',
    'books/king-lear/page (11).png',
    'books/king-lear/page (12).png',
    'books/king-lear/page (13).png',
    'books/king-lear/page (14).png',
    'books/king-lear/page (15).png',
    'books/king-lear/page (16).png',
    'books/king-lear/page (17).png',
    'books/king-lear/page (18).png',
    'books/king-lear/page (19).png',
    'books/king-lear/page (20).png',
    'books/king-lear/page (21).png',
    'books/king-lear/page (22).png',
    'books/king-lear/page (23).png',
    'books/king-lear/page (24).png',
    'books/king-lear/page (25).png',
    'books/king-lear/page (26).png',
    'books/king-lear/page (27).png',
    'books/king-lear/page (28).png',
    'books/king-lear/page (29).png',
    'books/king-lear/page (30).png',
    'books/king-lear/page (31).png',
    'books/king-lear/page (32).png',
    'books/king-lear/page (33).png',
    'books/king-lear/page (34).png',
    'books/king-lear/page (35).png',
    'books/king-lear/page (36).png',
    'books/king-lear/page (37).png',
    'books/king-lear/page (38).png',
    'books/king-lear/page (39).png',
    'books/king-lear/page (40).png',
    'books/king-lear/page (41).png',
    'books/king-lear/page (42).png',
    'books/king-lear/page (43).png',
    'books/king-lear/page (44).png',
    'books/king-lear/page (45).png',
    'books/king-lear/page (46).png',
    'books/king-lear/page (47).png',
    'books/king-lear/page (48).png',
    'books/king-lear/page (49).png',
    'books/king-lear/page (50).png',
    'books/king-lear/page (51).png',
    'books/king-lear/page (52).png',
    'books/king-lear/page (53).png',
    'books/king-lear/page (54).png',
    'books/king-lear/page (55).png',
    'books/king-lear/page (56).png',
    'books/king-lear/page (57).png',
    'books/king-lear/page (58).png',
    'books/king-lear/page (59).png',
    'books/king-lear/page (60).png',
    'books/king-lear/page (61).png',
    'books/king-lear/page (62).png',
    'books/king-lear/page (63).png',
    'books/king-lear/page (64).png',
    'books/king-lear/page (65).png',
    'books/king-lear/page (66).png',
    'books/king-lear/page (67).png',
    'books/king-lear/page (68).png',
    'books/king-lear/page (69).png',
    'books/king-lear/page (70).png',
    'books/king-lear/page (71).png',
    'books/king-lear/page (72).png',
    'books/king-lear/page (73).png',
    'books/king-lear/page (74).png',
    'books/king-lear/page (75).png',
    'books/king-lear/page (76).png',
    'books/king-lear/page (77).png',
    'books/king-lear/page (78).png',
    'books/king-lear/page (79).png',
    'books/king-lear/page (80).png',
    'books/king-lear/page (81).png',
    'books/king-lear/page (82).png',
    'books/king-lear/page (83).png',
    'books/king-lear/page (84).png',
    'books/king-lear/page (85).png',
    'books/king-lear/page (86).png',
    'books/king-lear/page (87).png',
    'books/king-lear/page (88).png',
    'books/king-lear/page (89).png',
    'books/king-lear/page (90).png',
    'books/king-lear/page (91).png',
    'books/king-lear/page (92).png',
    'books/king-lear/page (93).png',
    'books/king-lear/page (94).png',
    'books/king-lear/page (95).png',
    'books/king-lear/page (96).png',
    'books/king-lear/page (97).png',
    'books/king-lear/page (98).png',
    'books/king-lear/page (99).png',
    'books/king-lear/page (100).png',
    'books/king-lear/page (101).png',
    'books/king-lear/page (102).png',
    'books/king-lear/page (103).png',
    'books/king-lear/page (104).png',
    'books/king-lear/page (105).png',
    'books/king-lear/page (106).png',
    'books/king-lear/page (107).png',
    'books/king-lear/page (108).png',
    'books/king-lear/page (109).png',
    'books/king-lear/page (110).png',
    'books/king-lear/page (111).png',
    'books/king-lear/page (112).png',
    'books/king-lear/page (113).png',
    'books/king-lear/page (114).png',
    'books/king-lear/page (115).png',
    'books/king-lear/page (116).png',
    'books/king-lear/page (117).png',
    'books/king-lear/page (118).png',
    'books/king-lear/page (119).png',
    'books/king-lear/page (120).png',
    'books/king-lear/page (121).png',
    'books/king-lear/page (122).png',
    'books/king-lear/page (123).png',
    'books/king-lear/page (124).png',
    'books/king-lear/page (125).png',
    'books/king-lear/page (126).png',
    'books/king-lear/page (127).png',
    'books/king-lear/page (128).png',
    'books/king-lear/page (129).png',
    'books/king-lear/page (130).png',
    'books/king-lear/page (131).png',
    'books/king-lear/page (132).png',
    'books/king-lear/page (133).png',
    'books/king-lear/page (134).png',
    'books/king-lear/page (135).png',
    'books/king-lear/page (136).png',

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
