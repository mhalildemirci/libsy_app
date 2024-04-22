import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class classicforchilld extends StatefulWidget {
  const classicforchilld({Key? key}) : super(key: key);

  @override
  State<classicforchilld> createState() => _classicforchilldState();
}

class _classicforchilldState extends State<classicforchilld> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/classic for chilldren/page (1).png',
    'books/classic for chilldren/page (2).png',
    'books/classic for chilldren/page (3).png',
    'books/classic for chilldren/page (4).png',
    'books/classic for chilldren/page (5).png',
    'books/classic for chilldren/page (6).png',
    'books/classic for chilldren/page (7).png',
    'books/classic for chilldren/page (8).png',
    'books/classic for chilldren/page (9).png',
    'books/classic for chilldren/page (10).png',
    'books/classic for chilldren/page (11).png',
    'books/classic for chilldren/page (12).png',
    'books/classic for chilldren/page (13).png',
    'books/classic for chilldren/page (14).png',
    'books/classic for chilldren/page (15).png',
    'books/classic for chilldren/page (16).png',
    'books/classic for chilldren/page (17).png',
    'books/classic for chilldren/page (18).png',
    'books/classic for chilldren/page (19).png',
    'books/classic for chilldren/page (20).png',
    'books/classic for chilldren/page (21).png',
    'books/classic for chilldren/page (22).png',
    'books/classic for chilldren/page (23).png',
    'books/classic for chilldren/page (24).png',
    'books/classic for chilldren/page (25).png',
    'books/classic for chilldren/page (26).png',
    'books/classic for chilldren/page (27).png',
    'books/classic for chilldren/page (28).png',
    'books/classic for chilldren/page (29).png',
    'books/classic for chilldren/page (30).png',
    'books/classic for chilldren/page (31).png',
    'books/classic for chilldren/page (32).png',
    'books/classic for chilldren/page (33).png',
    'books/classic for chilldren/page (34).png',
    'books/classic for chilldren/page (35).png',
    'books/classic for chilldren/page (36).png',
    'books/classic for chilldren/page (37).png',
    'books/classic for chilldren/page (38).png',
    'books/classic for chilldren/page (39).png',
    'books/classic for chilldren/page (40).png',
    'books/classic for chilldren/page (41).png',
    'books/classic for chilldren/page (42).png',
    'books/classic for chilldren/page (43).png',
    'books/classic for chilldren/page (44).png',
    'books/classic for chilldren/page (45).png',
    'books/classic for chilldren/page (46).png',
    'books/classic for chilldren/page (47).png',
    'books/classic for chilldren/page (48).png',
    'books/classic for chilldren/page (49).png',
    'books/classic for chilldren/page (50).png',
    'books/classic for chilldren/page (51).png',
    'books/classic for chilldren/page (52).png',
    'books/classic for chilldren/page (53).png',
    'books/classic for chilldren/page (54).png',
    'books/classic for chilldren/page (55).png',
    'books/classic for chilldren/page (56).png',
    'books/classic for chilldren/page (57).png',
    'books/classic for chilldren/page (58).png',
    'books/classic for chilldren/page (59).png',
    'books/classic for chilldren/page (60).png',
    'books/classic for chilldren/page (61).png',
    'books/classic for chilldren/page (62).png',
    'books/classic for chilldren/page (63).png',
    'books/classic for chilldren/page (64).png',
    'books/classic for chilldren/page (65).png',
    'books/classic for chilldren/page (66).png',
    'books/classic for chilldren/page (67).png',
    'books/classic for chilldren/page (68).png',
    'books/classic for chilldren/page (69).png',
    'books/classic for chilldren/page (70).png',
    'books/classic for chilldren/page (71).png',
    'books/classic for chilldren/page (72).png',
    'books/classic for chilldren/page (73).png',
    'books/classic for chilldren/page (74).png',
    'books/classic for chilldren/page (75).png',
    'books/classic for chilldren/page (76).png',
    'books/classic for chilldren/page (77).png',
    'books/classic for chilldren/page (78).png',
    'books/classic for chilldren/page (79).png',
    'books/classic for chilldren/page (80).png',
    'books/classic for chilldren/page (81).png',
    'books/classic for chilldren/page (82).png',
    'books/classic for chilldren/page (83).png',
    'books/classic for chilldren/page (84).png',
    'books/classic for chilldren/page (85).png',
    'books/classic for chilldren/page (86).png',
    'books/classic for chilldren/page (87).png',
    'books/classic for chilldren/page (88).png',
    'books/classic for chilldren/page (89).png',
    'books/classic for chilldren/page (90).png',
    'books/classic for chilldren/page (91).png',
    'books/classic for chilldren/page (92).png',
    'books/classic for chilldren/page (93).png',
    'books/classic for chilldren/page (94).png',
    'books/classic for chilldren/page (95).png',
    'books/classic for chilldren/page (96).png',
    'books/classic for chilldren/page (97).png',
    'books/classic for chilldren/page (98).png',
    'books/classic for chilldren/page (99).png',
    'books/classic for chilldren/page (100).png',
    'books/classic for chilldren/page (101).png',
    'books/classic for chilldren/page (102).png',
    'books/classic for chilldren/page (103).png',
    'books/classic for chilldren/page (104).png',
    'books/classic for chilldren/page (105).png',
    'books/classic for chilldren/page (106).png',
    'books/classic for chilldren/page (107).png',
    'books/classic for chilldren/page (108).png',
    'books/classic for chilldren/page (109).png',
    'books/classic for chilldren/page (110).png',
    'books/classic for chilldren/page (111).png',
    'books/classic for chilldren/page (112).png',
    'books/classic for chilldren/page (113).png',
    'books/classic for chilldren/page (114).png',
    'books/classic for chilldren/page (115).png',
    'books/classic for chilldren/page (116).png',
    'books/classic for chilldren/page (117).png',
    'books/classic for chilldren/page (118).png',
    'books/classic for chilldren/page (119).png',
    'books/classic for chilldren/page (120).png',
    'books/classic for chilldren/page (121).png',
    'books/classic for chilldren/page (122).png',
    'books/classic for chilldren/page (123).png',
    'books/classic for chilldren/page (124).png',
    'books/classic for chilldren/page (125).png',
    'books/classic for chilldren/page (126).png',
    'books/classic for chilldren/page (127).png',

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
