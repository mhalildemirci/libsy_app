import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class peterpan extends StatefulWidget {
  const peterpan({Key? key}) : super(key: key);

  @override
  State<peterpan> createState() => _peterpanState();
}

class _peterpanState extends State<peterpan> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/peterpan/page (1).png',
    'books/peterpan/page (2).png',
    'books/peterpan/page (3).png',
    'books/peterpan/page (4).png',
    'books/peterpan/page (5).png',
    'books/peterpan/page (6).png',
    'books/peterpan/page (7).png',
    'books/peterpan/page (8).png',
    'books/peterpan/page (9).png',
    'books/peterpan/page (10).png',
    'books/peterpan/page (11).png',
    'books/peterpan/page (12).png',
    'books/peterpan/page (13).png',
    'books/peterpan/page (14).png',
    'books/peterpan/page (15).png',
    'books/peterpan/page (16).png',
    'books/peterpan/page (17).png',
    'books/peterpan/page (18).png',
    'books/peterpan/page (19).png',
    'books/peterpan/page (20).png',
    'books/peterpan/page (21).png',
    'books/peterpan/page (22).png',
    'books/peterpan/page (23).png',
    'books/peterpan/page (24).png',
    'books/peterpan/page (25).png',
    'books/peterpan/page (26).png',
    'books/peterpan/page (27).png',
    'books/peterpan/page (28).png',
    'books/peterpan/page (29).png',
    'books/peterpan/page (30).png',
    'books/peterpan/page (31).png',
    'books/peterpan/page (32).png',
    'books/peterpan/page (33).png',
    'books/peterpan/page (34).png',
    'books/peterpan/page (35).png',
    'books/peterpan/page (36).png',
    'books/peterpan/page (37).png',
    'books/peterpan/page (38).png',
    'books/peterpan/page (39).png',
    'books/peterpan/page (40).png',
    'books/peterpan/page (41).png',
    'books/peterpan/page (42).png',
    'books/peterpan/page (43).png',
    'books/peterpan/page (44).png',
    'books/peterpan/page (45).png',
    'books/peterpan/page (46).png',
    'books/peterpan/page (47).png',
    'books/peterpan/page (48).png',
    'books/peterpan/page (49).png',
    'books/peterpan/page (50).png',
    'books/peterpan/page (51).png',
    'books/peterpan/page (52).png',
    'books/peterpan/page (53).png',
    'books/peterpan/page (54).png',
    'books/peterpan/page (55).png',
    'books/peterpan/page (56).png',
    'books/peterpan/page (57).png',
    'books/peterpan/page (58).png',
    'books/peterpan/page (59).png',
    'books/peterpan/page (60).png',
    'books/peterpan/page (61).png',
    'books/peterpan/page (62).png',
    'books/peterpan/page (63).png',
    'books/peterpan/page (64).png',
    'books/peterpan/page (65).png',
    'books/peterpan/page (66).png',
    'books/peterpan/page (67).png',
    'books/peterpan/page (68).png',
    'books/peterpan/page (69).png',
    'books/peterpan/page (70).png',
    'books/peterpan/page (71).png',
    'books/peterpan/page (72).png',
    'books/peterpan/page (73).png',
    'books/peterpan/page (74).png',
    'books/peterpan/page (75).png',
    'books/peterpan/page (76).png',
    'books/peterpan/page (77).png',
    'books/peterpan/page (78).png',
    'books/peterpan/page (79).png',
    'books/peterpan/page (80).png',
    'books/peterpan/page (81).png',
    'books/peterpan/page (82).png',
    'books/peterpan/page (83).png',
    'books/peterpan/page (84).png',
    'books/peterpan/page (85).png',
    'books/peterpan/page (86).png',
    'books/peterpan/page (87).png',
    'books/peterpan/page (88).png',
    'books/peterpan/page (89).png',
    'books/peterpan/page (90).png',
    'books/peterpan/page (91).png',
    'books/peterpan/page (92).png',
    'books/peterpan/page (93).png',
    'books/peterpan/page (94).png',
    'books/peterpan/page (95).png',
    'books/peterpan/page (96).png',
    'books/peterpan/page (97).png',
    'books/peterpan/page (98).png',
    'books/peterpan/page (99).png',
    'books/peterpan/page (100).png',
    'books/peterpan/page (101).png',
    'books/peterpan/page (102).png',
    'books/peterpan/page (103).png',
    'books/peterpan/page (104).png',
    'books/peterpan/page (105).png',
    'books/peterpan/page (106).png',
    'books/peterpan/page (107).png',
    'books/peterpan/page (108).png',
    'books/peterpan/page (109).png',
    'books/peterpan/page (110).png',
    'books/peterpan/page (111).png',
    'books/peterpan/page (112).png',
    'books/peterpan/page (113).png',
    'books/peterpan/page (114).png',
    'books/peterpan/page (115).png',
    'books/peterpan/page (116).png',
    'books/peterpan/page (117).png',
    'books/peterpan/page (118).png',
    'books/peterpan/page (119).png',
    'books/peterpan/page (120).png',
    'books/peterpan/page (121).png',
    'books/peterpan/page (122).png',
    'books/peterpan/page (123).png',
    'books/peterpan/page (124).png',
    'books/peterpan/page (125).png',
    'books/peterpan/page (126).png',
    'books/peterpan/page (127).png',
    'books/peterpan/page (128).png',
    'books/peterpan/page (129).png',
    'books/peterpan/page (130).png',
    'books/peterpan/page (131).png',
    'books/peterpan/page (132).png',
    'books/peterpan/page (133).png',
    'books/peterpan/page (134).png',
    'books/peterpan/page (135).png',
    'books/peterpan/page (136).png',
    'books/peterpan/page (137).png',
    'books/peterpan/page (138).png',

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
