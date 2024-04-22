import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class dorothywizardoz extends StatefulWidget {
  const dorothywizardoz({Key? key}) : super(key: key);

  @override
  State<dorothywizardoz> createState() => _dorothywizardozState();
}

class _dorothywizardozState extends State<dorothywizardoz> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Dorothy and wizard Oz/page (1).png',
    'books/Dorothy and wizard Oz/page (2).png',
    'books/Dorothy and wizard Oz/page (3).png',
    'books/Dorothy and wizard Oz/page (4).png',
    'books/Dorothy and wizard Oz/page (5).png',
    'books/Dorothy and wizard Oz/page (6).png',
    'books/Dorothy and wizard Oz/page (7).png',
    'books/Dorothy and wizard Oz/page (8).png',
    'books/Dorothy and wizard Oz/page (9).png',
    'books/Dorothy and wizard Oz/page (10).png',
    'books/Dorothy and wizard Oz/page (11).png',
    'books/Dorothy and wizard Oz/page (12).png',
    'books/Dorothy and wizard Oz/page (13).png',
    'books/Dorothy and wizard Oz/page (14).png',
    'books/Dorothy and wizard Oz/page (15).png',
    'books/Dorothy and wizard Oz/page (16).png',
    'books/Dorothy and wizard Oz/page (17).png',
    'books/Dorothy and wizard Oz/page (18).png',
    'books/Dorothy and wizard Oz/page (19).png',
    'books/Dorothy and wizard Oz/page (20).png',
    'books/Dorothy and wizard Oz/page (21).png',
    'books/Dorothy and wizard Oz/page (22).png',
    'books/Dorothy and wizard Oz/page (23).png',
    'books/Dorothy and wizard Oz/page (24).png',
    'books/Dorothy and wizard Oz/page (25).png',
    'books/Dorothy and wizard Oz/page (26).png',
    'books/Dorothy and wizard Oz/page (27).png',
    'books/Dorothy and wizard Oz/page (28).png',
    'books/Dorothy and wizard Oz/page (29).png',
    'books/Dorothy and wizard Oz/page (30).png',
    'books/Dorothy and wizard Oz/page (31).png',
    'books/Dorothy and wizard Oz/page (32).png',
    'books/Dorothy and wizard Oz/page (33).png',
    'books/Dorothy and wizard Oz/page (34).png',
    'books/Dorothy and wizard Oz/page (35).png',
    'books/Dorothy and wizard Oz/page (36).png',
    'books/Dorothy and wizard Oz/page (37).png',
    'books/Dorothy and wizard Oz/page (38).png',
    'books/Dorothy and wizard Oz/page (39).png',
    'books/Dorothy and wizard Oz/page (40).png',
    'books/Dorothy and wizard Oz/page (41).png',
    'books/Dorothy and wizard Oz/page (42).png',
    'books/Dorothy and wizard Oz/page (43).png',
    'books/Dorothy and wizard Oz/page (44).png',
    'books/Dorothy and wizard Oz/page (45).png',
    'books/Dorothy and wizard Oz/page (46).png',
    'books/Dorothy and wizard Oz/page (47).png',
    'books/Dorothy and wizard Oz/page (48).png',
    'books/Dorothy and wizard Oz/page (49).png',
    'books/Dorothy and wizard Oz/page (50).png',
    'books/Dorothy and wizard Oz/page (51).png',
    'books/Dorothy and wizard Oz/page (52).png',
    'books/Dorothy and wizard Oz/page (53).png',
    'books/Dorothy and wizard Oz/page (54).png',
    'books/Dorothy and wizard Oz/page (55).png',
    'books/Dorothy and wizard Oz/page (56).png',
    'books/Dorothy and wizard Oz/page (57).png',
    'books/Dorothy and wizard Oz/page (58).png',
    'books/Dorothy and wizard Oz/page (59).png',
    'books/Dorothy and wizard Oz/page (60).png',
    'books/Dorothy and wizard Oz/page (61).png',
    'books/Dorothy and wizard Oz/page (62).png',
    'books/Dorothy and wizard Oz/page (63).png',
    'books/Dorothy and wizard Oz/page (64).png',
    'books/Dorothy and wizard Oz/page (65).png',
    'books/Dorothy and wizard Oz/page (66).png',
    'books/Dorothy and wizard Oz/page (67).png',
    'books/Dorothy and wizard Oz/page (68).png',
    'books/Dorothy and wizard Oz/page (69).png',
    'books/Dorothy and wizard Oz/page (70).png',
    'books/Dorothy and wizard Oz/page (71).png',
    'books/Dorothy and wizard Oz/page (72).png',
    'books/Dorothy and wizard Oz/page (73).png',
    'books/Dorothy and wizard Oz/page (74).png',
    'books/Dorothy and wizard Oz/page (75).png',
    'books/Dorothy and wizard Oz/page (76).png',
    'books/Dorothy and wizard Oz/page (77).png',
    'books/Dorothy and wizard Oz/page (78).png',
    'books/Dorothy and wizard Oz/page (79).png',
    'books/Dorothy and wizard Oz/page (80).png',
    'books/Dorothy and wizard Oz/page (81).png',
    'books/Dorothy and wizard Oz/page (82).png',
    'books/Dorothy and wizard Oz/page (83).png',
    'books/Dorothy and wizard Oz/page (84).png',
    'books/Dorothy and wizard Oz/page (85).png',
    'books/Dorothy and wizard Oz/page (86).png',
    'books/Dorothy and wizard Oz/page (87).png',
    'books/Dorothy and wizard Oz/page (88).png',
    'books/Dorothy and wizard Oz/page (89).png',
    'books/Dorothy and wizard Oz/page (90).png',
    'books/Dorothy and wizard Oz/page (91).png',
    'books/Dorothy and wizard Oz/page (92).png',
    'books/Dorothy and wizard Oz/page (93).png',
    'books/Dorothy and wizard Oz/page (94).png',
    'books/Dorothy and wizard Oz/page (95).png',
    'books/Dorothy and wizard Oz/page (96).png',
    'books/Dorothy and wizard Oz/page (97).png',
    'books/Dorothy and wizard Oz/page (98).png',
    'books/Dorothy and wizard Oz/page (99).png',
    'books/Dorothy and wizard Oz/page (100).png',
    'books/Dorothy and wizard Oz/page (101).png',
    'books/Dorothy and wizard Oz/page (102).png',
    'books/Dorothy and wizard Oz/page (103).png',
    'books/Dorothy and wizard Oz/page (104).png',
    'books/Dorothy and wizard Oz/page (105).png',
    'books/Dorothy and wizard Oz/page (106).png',
    'books/Dorothy and wizard Oz/page (107).png',
    'books/Dorothy and wizard Oz/page (108).png',
    'books/Dorothy and wizard Oz/page (109).png',
    'books/Dorothy and wizard Oz/page (110).png',
    'books/Dorothy and wizard Oz/page (111).png',
    'books/Dorothy and wizard Oz/page (112).png',
    'books/Dorothy and wizard Oz/page (113).png',
    'books/Dorothy and wizard Oz/page (114).png',
    'books/Dorothy and wizard Oz/page (115).png',
    'books/Dorothy and wizard Oz/page (116).png',
    'books/Dorothy and wizard Oz/page (117).png',
    'books/Dorothy and wizard Oz/page (118).png',
    'books/Dorothy and wizard Oz/page (119).png',
    'books/Dorothy and wizard Oz/page (120).png',
    'books/Dorothy and wizard Oz/page (121).png',
    'books/Dorothy and wizard Oz/page (122).png',
    'books/Dorothy and wizard Oz/page (123).png',
    'books/Dorothy and wizard Oz/page (124).png',
    'books/Dorothy and wizard Oz/page (125).png',
    'books/Dorothy and wizard Oz/page (126).png',
    'books/Dorothy and wizard Oz/page (127).png',
    'books/Dorothy and wizard Oz/page (128).png',
    'books/Dorothy and wizard Oz/page (129).png',
    'books/Dorothy and wizard Oz/page (130).png',
    'books/Dorothy and wizard Oz/page (131).png',
    'books/Dorothy and wizard Oz/page (132).png',
    'books/Dorothy and wizard Oz/page (133).png',
    'books/Dorothy and wizard Oz/page (134).png',

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
