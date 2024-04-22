import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class princeotto extends StatefulWidget {
  const princeotto({Key? key}) : super(key: key);

  @override
  State<princeotto> createState() => _princeottoState();
}

class _princeottoState extends State<princeotto> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/prince otto/page (1).png',
    'books/prince otto/page (2).png',
    'books/prince otto/page (3).png',
    'books/prince otto/page (4).png',
    'books/prince otto/page (5).png',
    'books/prince otto/page (6).png',
    'books/prince otto/page (7).png',
    'books/prince otto/page (8).png',
    'books/prince otto/page (9).png',
    'books/prince otto/page (10).png',
    'books/prince otto/page (11).png',
    'books/prince otto/page (12).png',
    'books/prince otto/page (13).png',
    'books/prince otto/page (14).png',
    'books/prince otto/page (15).png',
    'books/prince otto/page (16).png',
    'books/prince otto/page (17).png',
    'books/prince otto/page (18).png',
    'books/prince otto/page (19).png',
    'books/prince otto/page (20).png',
    'books/prince otto/page (21).png',
    'books/prince otto/page (22).png',
    'books/prince otto/page (23).png',
    'books/prince otto/page (24).png',
    'books/prince otto/page (25).png',
    'books/prince otto/page (26).png',
    'books/prince otto/page (27).png',
    'books/prince otto/page (28).png',
    'books/prince otto/page (29).png',
    'books/prince otto/page (30).png',
    'books/prince otto/page (31).png',
    'books/prince otto/page (32).png',
    'books/prince otto/page (33).png',
    'books/prince otto/page (34).png',
    'books/prince otto/page (35).png',
    'books/prince otto/page (36).png',
    'books/prince otto/page (37).png',
    'books/prince otto/page (38).png',
    'books/prince otto/page (39).png',
    'books/prince otto/page (40).png',
    'books/prince otto/page (41).png',
    'books/prince otto/page (42).png',
    'books/prince otto/page (43).png',
    'books/prince otto/page (44).png',
    'books/prince otto/page (45).png',
    'books/prince otto/page (46).png',
    'books/prince otto/page (47).png',
    'books/prince otto/page (48).png',
    'books/prince otto/page (49).png',
    'books/prince otto/page (50).png',
    'books/prince otto/page (51).png',
    'books/prince otto/page (52).png',
    'books/prince otto/page (53).png',
    'books/prince otto/page (54).png',
    'books/prince otto/page (55).png',
    'books/prince otto/page (56).png',
    'books/prince otto/page (57).png',
    'books/prince otto/page (58).png',
    'books/prince otto/page (59).png',
    'books/prince otto/page (60).png',
    'books/prince otto/page (61).png',
    'books/prince otto/page (62).png',
    'books/prince otto/page (63).png',
    'books/prince otto/page (64).png',
    'books/prince otto/page (65).png',
    'books/prince otto/page (66).png',
    'books/prince otto/page (67).png',
    'books/prince otto/page (68).png',
    'books/prince otto/page (69).png',
    'books/prince otto/page (70).png',
    'books/prince otto/page (71).png',
    'books/prince otto/page (72).png',
    'books/prince otto/page (73).png',
    'books/prince otto/page (74).png',
    'books/prince otto/page (75).png',
    'books/prince otto/page (76).png',
    'books/prince otto/page (77).png',
    'books/prince otto/page (78).png',
    'books/prince otto/page (79).png',
    'books/prince otto/page (80).png',
    'books/prince otto/page (81).png',
    'books/prince otto/page (82).png',
    'books/prince otto/page (83).png',
    'books/prince otto/page (84).png',
    'books/prince otto/page (85).png',
    'books/prince otto/page (86).png',
    'books/prince otto/page (87).png',
    'books/prince otto/page (88).png',
    'books/prince otto/page (89).png',
    'books/prince otto/page (90).png',
    'books/prince otto/page (91).png',
    'books/prince otto/page (92).png',
    'books/prince otto/page (93).png',
    'books/prince otto/page (94).png',
    'books/prince otto/page (95).png',
    'books/prince otto/page (96).png',
    'books/prince otto/page (97).png',
    'books/prince otto/page (98).png',
    'books/prince otto/page (99).png',
    'books/prince otto/page (100).png',
    'books/prince otto/page (101).png',
    'books/prince otto/page (102).png',
    'books/prince otto/page (103).png',
    'books/prince otto/page (104).png',
    'books/prince otto/page (105).png',
    'books/prince otto/page (106).png',
    'books/prince otto/page (107).png',
    'books/prince otto/page (108).png',
    'books/prince otto/page (109).png',
    'books/prince otto/page (110).png',
    'books/prince otto/page (111).png',
    'books/prince otto/page (112).png',
    'books/prince otto/page (113).png',
    'books/prince otto/page (114).png',
    'books/prince otto/page (115).png',
    'books/prince otto/page (116).png',
    'books/prince otto/page (117).png',
    'books/prince otto/page (118).png',
    'books/prince otto/page (119).png',
    'books/prince otto/page (120).png',
    'books/prince otto/page (121).png',
    'books/prince otto/page (122).png',
    'books/prince otto/page (123).png',
    'books/prince otto/page (124).png',
    'books/prince otto/page (125).png',
    'books/prince otto/page (126).png',
    'books/prince otto/page (127).png',
    'books/prince otto/page (128).png',
    'books/prince otto/page (129).png',
    'books/prince otto/page (130).png',

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
