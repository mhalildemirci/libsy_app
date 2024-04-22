import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class worldset extends StatefulWidget {
  const worldset({Key? key}) : super(key: key);

  @override
  State<worldset> createState() => _worldsetState();
}

class _worldsetState extends State<worldset> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/world set free/page (1).png',
    'books/world set free/page (2).png',
    'books/world set free/page (3).png',
    'books/world set free/page (4).png',
    'books/world set free/page (5).png',
    'books/world set free/page (6).png',
    'books/world set free/page (7).png',
    'books/world set free/page (8).png',
    'books/world set free/page (9).png',
    'books/world set free/page (10).png',
    'books/world set free/page (11).png',
    'books/world set free/page (12).png',
    'books/world set free/page (13).png',
    'books/world set free/page (14).png',
    'books/world set free/page (15).png',
    'books/world set free/page (16).png',
    'books/world set free/page (17).png',
    'books/world set free/page (18).png',
    'books/world set free/page (19).png',
    'books/world set free/page (20).png',
    'books/world set free/page (21).png',
    'books/world set free/page (22).png',
    'books/world set free/page (23).png',
    'books/world set free/page (24).png',
    'books/world set free/page (25).png',
    'books/world set free/page (26).png',
    'books/world set free/page (27).png',
    'books/world set free/page (28).png',
    'books/world set free/page (29).png',
    'books/world set free/page (30).png',
    'books/world set free/page (31).png',
    'books/world set free/page (32).png',
    'books/world set free/page (33).png',
    'books/world set free/page (34).png',
    'books/world set free/page (35).png',
    'books/world set free/page (36).png',
    'books/world set free/page (37).png',
    'books/world set free/page (38).png',
    'books/world set free/page (39).png',
    'books/world set free/page (40).png',
    'books/world set free/page (41).png',
    'books/world set free/page (42).png',
    'books/world set free/page (43).png',
    'books/world set free/page (44).png',
    'books/world set free/page (45).png',
    'books/world set free/page (46).png',
    'books/world set free/page (47).png',
    'books/world set free/page (48).png',
    'books/world set free/page (49).png',
    'books/world set free/page (50).png',
    'books/world set free/page (51).png',
    'books/world set free/page (52).png',
    'books/world set free/page (53).png',
    'books/world set free/page (54).png',
    'books/world set free/page (55).png',
    'books/world set free/page (56).png',
    'books/world set free/page (57).png',
    'books/world set free/page (58).png',
    'books/world set free/page (59).png',
    'books/world set free/page (60).png',
    'books/world set free/page (61).png',
    'books/world set free/page (62).png',
    'books/world set free/page (63).png',
    'books/world set free/page (64).png',
    'books/world set free/page (65).png',
    'books/world set free/page (66).png',
    'books/world set free/page (67).png',
    'books/world set free/page (68).png',
    'books/world set free/page (69).png',
    'books/world set free/page (70).png',
    'books/world set free/page (71).png',
    'books/world set free/page (72).png',
    'books/world set free/page (73).png',
    'books/world set free/page (74).png',
    'books/world set free/page (75).png',
    'books/world set free/page (76).png',
    'books/world set free/page (77).png',
    'books/world set free/page (78).png',
    'books/world set free/page (79).png',
    'books/world set free/page (80).png',
    'books/world set free/page (81).png',
    'books/world set free/page (82).png',
    'books/world set free/page (83).png',
    'books/world set free/page (84).png',
    'books/world set free/page (85).png',
    'books/world set free/page (86).png',
    'books/world set free/page (87).png',
    'books/world set free/page (88).png',
    'books/world set free/page (89).png',
    'books/world set free/page (90).png',
    'books/world set free/page (91).png',
    'books/world set free/page (92).png',
    'books/world set free/page (93).png',
    'books/world set free/page (94).png',
    'books/world set free/page (95).png',
    'books/world set free/page (96).png',
    'books/world set free/page (97).png',
    'books/world set free/page (98).png',
    'books/world set free/page (99).png',
    'books/world set free/page (100).png',
    'books/world set free/page (101).png',
    'books/world set free/page (102).png',
    'books/world set free/page (103).png',
    'books/world set free/page (104).png',
    'books/world set free/page (105).png',
    'books/world set free/page (106).png',
    'books/world set free/page (107).png',
    'books/world set free/page (108).png',
    'books/world set free/page (109).png',
    'books/world set free/page (110).png',

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
