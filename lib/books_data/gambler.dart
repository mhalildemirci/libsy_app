import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class gambler extends StatefulWidget {
  const gambler({Key? key}) : super(key: key);

  @override
  State<gambler> createState() => _gamblerState();
}

class _gamblerState extends State<gambler> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/gambler/page (1).png',
    'books/gambler/page (2).png',
    'books/gambler/page (3).png',
    'books/gambler/page (4).png',
    'books/gambler/page (5).png',
    'books/gambler/page (6).png',
    'books/gambler/page (7).png',
    'books/gambler/page (8).png',
    'books/gambler/page (9).png',
    'books/gambler/page (10).png',
    'books/gambler/page (11).png',
    'books/gambler/page (12).png',
    'books/gambler/page (13).png',
    'books/gambler/page (14).png',
    'books/gambler/page (15).png',
    'books/gambler/page (16).png',
    'books/gambler/page (17).png',
    'books/gambler/page (18).png',
    'books/gambler/page (19).png',
    'books/gambler/page (20).png',
    'books/gambler/page (21).png',
    'books/gambler/page (22).png',
    'books/gambler/page (23).png',
    'books/gambler/page (24).png',
    'books/gambler/page (25).png',
    'books/gambler/page (26).png',
    'books/gambler/page (27).png',
    'books/gambler/page (28).png',
    'books/gambler/page (29).png',
    'books/gambler/page (30).png',
    'books/gambler/page (31).png',
    'books/gambler/page (32).png',
    'books/gambler/page (33).png',
    'books/gambler/page (34).png',
    'books/gambler/page (35).png',
    'books/gambler/page (36).png',
    'books/gambler/page (37).png',
    'books/gambler/page (38).png',
    'books/gambler/page (39).png',
    'books/gambler/page (40).png',
    'books/gambler/page (41).png',
    'books/gambler/page (42).png',
    'books/gambler/page (43).png',
    'books/gambler/page (44).png',
    'books/gambler/page (45).png',
    'books/gambler/page (46).png',
    'books/gambler/page (47).png',
    'books/gambler/page (48).png',
    'books/gambler/page (49).png',
    'books/gambler/page (50).png',
    'books/gambler/page (51).png',
    'books/gambler/page (52).png',
    'books/gambler/page (53).png',
    'books/gambler/page (54).png',
    'books/gambler/page (55).png',
    'books/gambler/page (56).png',
    'books/gambler/page (57).png',
    'books/gambler/page (58).png',
    'books/gambler/page (59).png',
    'books/gambler/page (60).png',
    'books/gambler/page (61).png',
    'books/gambler/page (62).png',
    'books/gambler/page (63).png',
    'books/gambler/page (64).png',
    'books/gambler/page (65).png',
    'books/gambler/page (66).png',
    'books/gambler/page (67).png',
    'books/gambler/page (68).png',
    'books/gambler/page (69).png',
    'books/gambler/page (70).png',
    'books/gambler/page (71).png',
    'books/gambler/page (72).png',
    'books/gambler/page (73).png',
    'books/gambler/page (74).png',
    'books/gambler/page (75).png',
    'books/gambler/page (76).png',
    'books/gambler/page (77).png',
    'books/gambler/page (78).png',
    'books/gambler/page (79).png',
    'books/gambler/page (80).png',
    'books/gambler/page (81).png',
    'books/gambler/page (82).png',
    'books/gambler/page (83).png',
    'books/gambler/page (84).png',
    'books/gambler/page (85).png',
    'books/gambler/page (86).png',
    'books/gambler/page (87).png',
    'books/gambler/page (88).png',
    'books/gambler/page (89).png',
    'books/gambler/page (90).png',
    'books/gambler/page (91).png',
    'books/gambler/page (92).png',
    'books/gambler/page (93).png',
    'books/gambler/page (94).png',
    'books/gambler/page (95).png',
    'books/gambler/page (96).png',
    'books/gambler/page (97).png',
    'books/gambler/page (98).png',
    'books/gambler/page (99).png',
    'books/gambler/page (100).png',
    'books/gambler/page (101).png',
    'books/gambler/page (102).png',
    'books/gambler/page (103).png',
    'books/gambler/page (104).png',
    'books/gambler/page (105).png',
    'books/gambler/page (106).png',
    'books/gambler/page (107).png',

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
