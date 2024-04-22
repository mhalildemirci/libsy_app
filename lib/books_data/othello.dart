import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class othello extends StatefulWidget {
  const othello({Key? key}) : super(key: key);

  @override
  State<othello> createState() => _othelloState();
}

class _othelloState extends State<othello> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/othello/page (1).png',
    'books/othello/page (2).png',
    'books/othello/page (3).png',
    'books/othello/page (4).png',
    'books/othello/page (5).png',
    'books/othello/page (6).png',
    'books/othello/page (7).png',
    'books/othello/page (8).png',
    'books/othello/page (9).png',
    'books/othello/page (10).png',
    'books/othello/page (11).png',
    'books/othello/page (12).png',
    'books/othello/page (13).png',
    'books/othello/page (14).png',
    'books/othello/page (15).png',
    'books/othello/page (16).png',
    'books/othello/page (17).png',
    'books/othello/page (18).png',
    'books/othello/page (19).png',
    'books/othello/page (20).png',
    'books/othello/page (21).png',
    'books/othello/page (22).png',
    'books/othello/page (23).png',
    'books/othello/page (24).png',
    'books/othello/page (25).png',
    'books/othello/page (26).png',
    'books/othello/page (27).png',
    'books/othello/page (28).png',
    'books/othello/page (29).png',
    'books/othello/page (30).png',
    'books/othello/page (31).png',
    'books/othello/page (32).png',
    'books/othello/page (33).png',
    'books/othello/page (34).png',
    'books/othello/page (35).png',
    'books/othello/page (36).png',
    'books/othello/page (37).png',
    'books/othello/page (38).png',
    'books/othello/page (39).png',
    'books/othello/page (40).png',
    'books/othello/page (41).png',
    'books/othello/page (42).png',
    'books/othello/page (43).png',
    'books/othello/page (44).png',
    'books/othello/page (45).png',
    'books/othello/page (46).png',
    'books/othello/page (47).png',
    'books/othello/page (48).png',
    'books/othello/page (49).png',
    'books/othello/page (50).png',
    'books/othello/page (51).png',
    'books/othello/page (52).png',
    'books/othello/page (53).png',
    'books/othello/page (54).png',
    'books/othello/page (55).png',
    'books/othello/page (56).png',
    'books/othello/page (57).png',
    'books/othello/page (58).png',
    'books/othello/page (59).png',
    'books/othello/page (60).png',
    'books/othello/page (61).png',
    'books/othello/page (62).png',
    'books/othello/page (63).png',
    'books/othello/page (64).png',
    'books/othello/page (65).png',
    'books/othello/page (66).png',
    'books/othello/page (67).png',
    'books/othello/page (68).png',
    'books/othello/page (69).png',
    'books/othello/page (70).png',
    'books/othello/page (71).png',
    'books/othello/page (72).png',
    'books/othello/page (73).png',
    'books/othello/page (74).png',
    'books/othello/page (75).png',
    'books/othello/page (76).png',
    'books/othello/page (77).png',
    'books/othello/page (78).png',
    'books/othello/page (79).png',
    'books/othello/page (80).png',
    'books/othello/page (81).png',
    'books/othello/page (82).png',
    'books/othello/page (83).png',
    'books/othello/page (84).png',
    'books/othello/page (85).png',
    'books/othello/page (86).png',
    'books/othello/page (87).png',
    'books/othello/page (88).png',
    'books/othello/page (89).png',
    'books/othello/page (90).png',
    'books/othello/page (91).png',
    'books/othello/page (92).png',
    'books/othello/page (93).png',
    'books/othello/page (94).png',
    'books/othello/page (95).png',
    'books/othello/page (96).png',
    'books/othello/page (97).png',
    'books/othello/page (98).png',
    'books/othello/page (99).png',
    'books/othello/page (100).png',
    'books/othello/page (101).png',
    'books/othello/page (102).png',
    'books/othello/page (103).png',
    'books/othello/page (104).png',
    'books/othello/page (105).png',
    'books/othello/page (106).png',
    'books/othello/page (107).png',
    'books/othello/page (108).png',
    'books/othello/page (109).png',
    'books/othello/page (110).png',
    'books/othello/page (111).png',
    'books/othello/page (112).png',
    'books/othello/page (113).png',
    'books/othello/page (114).png',
    'books/othello/page (115).png',
    'books/othello/page (116).png',
    'books/othello/page (117).png',
    'books/othello/page (118).png',
    'books/othello/page (119).png',
    'books/othello/page (120).png',
    'books/othello/page (121).png',
    'books/othello/page (122).png',
    'books/othello/page (123).png',

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
