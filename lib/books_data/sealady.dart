import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sealady extends StatefulWidget {
  const sealady({Key? key}) : super(key: key);

  @override
  State<sealady> createState() => _sealadyState();
}

class _sealadyState extends State<sealady> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sea lady/page (1).png',
    'books/sea lady/page (2).png',
    'books/sea lady/page (3).png',
    'books/sea lady/page (4).png',
    'books/sea lady/page (5).png',
    'books/sea lady/page (6).png',
    'books/sea lady/page (7).png',
    'books/sea lady/page (8).png',
    'books/sea lady/page (9).png',
    'books/sea lady/page (10).png',
    'books/sea lady/page (11).png',
    'books/sea lady/page (12).png',
    'books/sea lady/page (13).png',
    'books/sea lady/page (14).png',
    'books/sea lady/page (15).png',
    'books/sea lady/page (16).png',
    'books/sea lady/page (17).png',
    'books/sea lady/page (18).png',
    'books/sea lady/page (19).png',
    'books/sea lady/page (20).png',
    'books/sea lady/page (21).png',
    'books/sea lady/page (22).png',
    'books/sea lady/page (23).png',
    'books/sea lady/page (24).png',
    'books/sea lady/page (25).png',
    'books/sea lady/page (26).png',
    'books/sea lady/page (27).png',
    'books/sea lady/page (28).png',
    'books/sea lady/page (29).png',
    'books/sea lady/page (30).png',
    'books/sea lady/page (31).png',
    'books/sea lady/page (32).png',
    'books/sea lady/page (33).png',
    'books/sea lady/page (34).png',
    'books/sea lady/page (35).png',
    'books/sea lady/page (36).png',
    'books/sea lady/page (37).png',
    'books/sea lady/page (38).png',
    'books/sea lady/page (39).png',
    'books/sea lady/page (40).png',
    'books/sea lady/page (41).png',
    'books/sea lady/page (42).png',
    'books/sea lady/page (43).png',
    'books/sea lady/page (44).png',
    'books/sea lady/page (45).png',
    'books/sea lady/page (46).png',
    'books/sea lady/page (47).png',
    'books/sea lady/page (48).png',
    'books/sea lady/page (49).png',
    'books/sea lady/page (50).png',
    'books/sea lady/page (51).png',
    'books/sea lady/page (52).png',
    'books/sea lady/page (53).png',
    'books/sea lady/page (54).png',
    'books/sea lady/page (55).png',
    'books/sea lady/page (56).png',
    'books/sea lady/page (57).png',
    'books/sea lady/page (58).png',
    'books/sea lady/page (59).png',
    'books/sea lady/page (60).png',
    'books/sea lady/page (61).png',
    'books/sea lady/page (62).png',
    'books/sea lady/page (63).png',
    'books/sea lady/page (64).png',
    'books/sea lady/page (65).png',
    'books/sea lady/page (66).png',
    'books/sea lady/page (67).png',
    'books/sea lady/page (68).png',
    'books/sea lady/page (69).png',
    'books/sea lady/page (70).png',
    'books/sea lady/page (71).png',
    'books/sea lady/page (72).png',
    'books/sea lady/page (73).png',
    'books/sea lady/page (74).png',
    'books/sea lady/page (75).png',
    'books/sea lady/page (76).png',
    'books/sea lady/page (77).png',
    'books/sea lady/page (78).png',
    'books/sea lady/page (79).png',
    'books/sea lady/page (80).png',
    'books/sea lady/page (81).png',
    'books/sea lady/page (82).png',
    'books/sea lady/page (83).png',
    'books/sea lady/page (84).png',
    'books/sea lady/page (85).png',
    'books/sea lady/page (86).png',
    'books/sea lady/page (87).png',
    'books/sea lady/page (88).png',
    'books/sea lady/page (89).png',
    'books/sea lady/page (90).png',
    'books/sea lady/page (91).png',
    'books/sea lady/page (92).png',
    'books/sea lady/page (93).png',
    'books/sea lady/page (94).png',
    'books/sea lady/page (95).png',
    'books/sea lady/page (96).png',
    'books/sea lady/page (97).png',
    'books/sea lady/page (98).png',
    'books/sea lady/page (99).png',
    'books/sea lady/page (100).png',
    'books/sea lady/page (101).png',
    'books/sea lady/page (102).png',
    'books/sea lady/page (103).png',
    'books/sea lady/page (104).png',
    'books/sea lady/page (105).png',
    'books/sea lady/page (106).png',
    'books/sea lady/page (107).png',
    'books/sea lady/page (108).png',
    'books/sea lady/page (109).png',
    'books/sea lady/page (110).png',
    'books/sea lady/page (111).png',
    'books/sea lady/page (112).png',
    'books/sea lady/page (113).png',
    'books/sea lady/page (114).png',
    'books/sea lady/page (115).png',
    'books/sea lady/page (116).png',
    'books/sea lady/page (117).png',
    'books/sea lady/page (118).png',
    'books/sea lady/page (119).png',
    'books/sea lady/page (120).png',
    'books/sea lady/page (121).png',
    'books/sea lady/page (122).png',
    'books/sea lady/page (123).png',
    'books/sea lady/page (124).png',
    'books/sea lady/page (125).png',
    'books/sea lady/page (126).png',
    'books/sea lady/page (127).png',
    'books/sea lady/page (128).png',
    'books/sea lady/page (129).png',
    'books/sea lady/page (130).png',
    'books/sea lady/page (131).png',
    'books/sea lady/page (132).png',
    'books/sea lady/page (133).png',
    'books/sea lady/page (134).png',
    'books/sea lady/page (135).png',
    'books/sea lady/page (136).png',

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
