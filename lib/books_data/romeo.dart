import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class romeo extends StatefulWidget {
  const romeo({Key? key}) : super(key: key);

  @override
  State<romeo> createState() => _romeoState();
}

class _romeoState extends State<romeo> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/romeo/page (1).png',
    'books/romeo/page (2).png',
    'books/romeo/page (3).png',
    'books/romeo/page (4).png',
    'books/romeo/page (5).png',
    'books/romeo/page (6).png',
    'books/romeo/page (7).png',
    'books/romeo/page (8).png',
    'books/romeo/page (9).png',
    'books/romeo/page (10).png',
    'books/romeo/page (11).png',
    'books/romeo/page (12).png',
    'books/romeo/page (13).png',
    'books/romeo/page (14).png',
    'books/romeo/page (15).png',
    'books/romeo/page (16).png',
    'books/romeo/page (17).png',
    'books/romeo/page (18).png',
    'books/romeo/page (19).png',
    'books/romeo/page (20).png',
    'books/romeo/page (21).png',
    'books/romeo/page (22).png',
    'books/romeo/page (23).png',
    'books/romeo/page (24).png',
    'books/romeo/page (25).png',
    'books/romeo/page (26).png',
    'books/romeo/page (27).png',
    'books/romeo/page (28).png',
    'books/romeo/page (29).png',
    'books/romeo/page (30).png',
    'books/romeo/page (31).png',
    'books/romeo/page (32).png',
    'books/romeo/page (33).png',
    'books/romeo/page (34).png',
    'books/romeo/page (35).png',
    'books/romeo/page (36).png',
    'books/romeo/page (37).png',
    'books/romeo/page (38).png',
    'books/romeo/page (39).png',
    'books/romeo/page (40).png',
    'books/romeo/page (41).png',
    'books/romeo/page (42).png',
    'books/romeo/page (43).png',
    'books/romeo/page (44).png',
    'books/romeo/page (45).png',
    'books/romeo/page (46).png',
    'books/romeo/page (47).png',
    'books/romeo/page (48).png',
    'books/romeo/page (49).png',
    'books/romeo/page (50).png',
    'books/romeo/page (51).png',
    'books/romeo/page (52).png',
    'books/romeo/page (53).png',
    'books/romeo/page (54).png',
    'books/romeo/page (55).png',
    'books/romeo/page (56).png',
    'books/romeo/page (57).png',
    'books/romeo/page (58).png',
    'books/romeo/page (59).png',
    'books/romeo/page (60).png',
    'books/romeo/page (61).png',
    'books/romeo/page (62).png',
    'books/romeo/page (63).png',
    'books/romeo/page (64).png',
    'books/romeo/page (65).png',
    'books/romeo/page (66).png',
    'books/romeo/page (67).png',
    'books/romeo/page (68).png',
    'books/romeo/page (69).png',
    'books/romeo/page (70).png',
    'books/romeo/page (71).png',
    'books/romeo/page (72).png',
    'books/romeo/page (73).png',
    'books/romeo/page (74).png',
    'books/romeo/page (75).png',
    'books/romeo/page (76).png',
    'books/romeo/page (77).png',
    'books/romeo/page (78).png',
    'books/romeo/page (79).png',
    'books/romeo/page (80).png',
    'books/romeo/page (81).png',
    'books/romeo/page (82).png',
    'books/romeo/page (83).png',
    'books/romeo/page (84).png',
    'books/romeo/page (85).png',
    'books/romeo/page (86).png',
    'books/romeo/page (87).png',
    'books/romeo/page (88).png',
    'books/romeo/page (89).png',
    'books/romeo/page (90).png',
    'books/romeo/page (91).png',
    'books/romeo/page (92).png',
    'books/romeo/page (93).png',
    'books/romeo/page (94).png',
    'books/romeo/page (95).png',
    'books/romeo/page (96).png',
    'books/romeo/page (97).png',
    'books/romeo/page (98).png',
    'books/romeo/page (99).png',
    'books/romeo/page (100).png',
    'books/romeo/page (101).png',
    'books/romeo/page (102).png',
    'books/romeo/page (103).png',
    'books/romeo/page (104).png',
    'books/romeo/page (105).png',
    'books/romeo/page (106).png',
    'books/romeo/page (107).png',
    'books/romeo/page (108).png',
    'books/romeo/page (109).png',
    'books/romeo/page (110).png',
    'books/romeo/page (111).png',
    'books/romeo/page (112).png',
    'books/romeo/page (113).png',
    'books/romeo/page (114).png',
    'books/romeo/page (115).png',
    'books/romeo/page (116).png',
    'books/romeo/page (117).png',
    'books/romeo/page (118).png',
    'books/romeo/page (119).png',
    'books/romeo/page (120).png',
    'books/romeo/page (121).png',
    'books/romeo/page (122).png',
    'books/romeo/page (123).png',
    'books/romeo/page (124).png',
    'books/romeo/page (125).png',
    'books/romeo/page (126).png',
    'books/romeo/page (127).png',
    'books/romeo/page (128).png',
    'books/romeo/page (129).png',
    'books/romeo/page (130).png',
    'books/romeo/page (131).png',
    'books/romeo/page (132).png',

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
