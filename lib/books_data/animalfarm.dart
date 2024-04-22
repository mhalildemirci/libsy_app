import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class animalfarm extends StatefulWidget {
  const animalfarm({Key? key}) : super(key: key);

  @override
  State<animalfarm> createState() => _animalfarmState();
}

class _animalfarmState extends State<animalfarm> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Animal Farm/page (1).png',
    'books/Animal Farm/page (2).png',
    'books/Animal Farm/page (3).png',
    'books/Animal Farm/page (4).png',
    'books/Animal Farm/page (5).png',
    'books/Animal Farm/page (6).png',
    'books/Animal Farm/page (7).png',
    'books/Animal Farm/page (8).png',
    'books/Animal Farm/page (9).png',
    'books/Animal Farm/page (10).png',
    'books/Animal Farm/page (11).png',
    'books/Animal Farm/page (12).png',
    'books/Animal Farm/page (13).png',
    'books/Animal Farm/page (14).png',
    'books/Animal Farm/page (15).png',
    'books/Animal Farm/page (16).png',
    'books/Animal Farm/page (17).png',
    'books/Animal Farm/page (18).png',
    'books/Animal Farm/page (19).png',
    'books/Animal Farm/page (20).png',
    'books/Animal Farm/page (21).png',
    'books/Animal Farm/page (22).png',
    'books/Animal Farm/page (23).png',
    'books/Animal Farm/page (24).png',
    'books/Animal Farm/page (25).png',
    'books/Animal Farm/page (26).png',
    'books/Animal Farm/page (27).png',
    'books/Animal Farm/page (28).png',
    'books/Animal Farm/page (29).png',
    'books/Animal Farm/page (30).png',
    'books/Animal Farm/page (31).png',
    'books/Animal Farm/page (32).png',
    'books/Animal Farm/page (33).png',
    'books/Animal Farm/page (34).png',
    'books/Animal Farm/page (35).png',
    'books/Animal Farm/page (36).png',
    'books/Animal Farm/page (37).png',
    'books/Animal Farm/page (38).png',
    'books/Animal Farm/page (39).png',
    'books/Animal Farm/page (40).png',
    'books/Animal Farm/page (41).png',
    'books/Animal Farm/page (42).png',
    'books/Animal Farm/page (43).png',
    'books/Animal Farm/page (44).png',
    'books/Animal Farm/page (45).png',
    'books/Animal Farm/page (46).png',
    'books/Animal Farm/page (47).png',
    'books/Animal Farm/page (48).png',
    'books/Animal Farm/page (49).png',
    'books/Animal Farm/page (50).png',
    'books/Animal Farm/page (51).png',
    'books/Animal Farm/page (52).png',
    'books/Animal Farm/page (53).png',
    'books/Animal Farm/page (54).png',
    'books/Animal Farm/page (55).png',
    'books/Animal Farm/page (56).png',
    'books/Animal Farm/page (57).png',
    'books/Animal Farm/page (58).png',
    'books/Animal Farm/page (59).png',
    'books/Animal Farm/page (60).png',
    'books/Animal Farm/page (61).png',
    'books/Animal Farm/page (62).png',
    'books/Animal Farm/page (63).png',
    'books/Animal Farm/page (64).png',
    'books/Animal Farm/page (65).png',
    'books/Animal Farm/page (66).png',
    'books/Animal Farm/page (67).png',
    'books/Animal Farm/page (68).png',
    'books/Animal Farm/page (69).png',
    'books/Animal Farm/page (70).png',
    'books/Animal Farm/page (71).png',
    'books/Animal Farm/page (72).png',
    'books/Animal Farm/page (73).png',
    'books/Animal Farm/page (74).png',
    'books/Animal Farm/page (75).png',
    'books/Animal Farm/page (76).png',
    'books/Animal Farm/page (77).png',
    'books/Animal Farm/page (78).png',
    'books/Animal Farm/page (79).png',
    'books/Animal Farm/page (80).png',
    'books/Animal Farm/page (81).png',
    'books/Animal Farm/page (82).png',
    'books/Animal Farm/page (83).png',
    'books/Animal Farm/page (84).png',
    'books/Animal Farm/page (85).png',
    'books/Animal Farm/page (86).png',
    'books/Animal Farm/page (87).png',
    'books/Animal Farm/page (88).png',
    'books/Animal Farm/page (89).png',
    'books/Animal Farm/page (90).png',
    'books/Animal Farm/page (91).png',
    'books/Animal Farm/page (92).png',
    'books/Animal Farm/page (93).png',
    'books/Animal Farm/page (94).png',
    'books/Animal Farm/page (95).png',
    'books/Animal Farm/page (96).png',
    'books/Animal Farm/page (97).png',
    'books/Animal Farm/page (98).png',
    'books/Animal Farm/page (99).png',
    'books/Animal Farm/page (100).png',
    'books/Animal Farm/page (101).png',
    'books/Animal Farm/page (102).png',
    'books/Animal Farm/page (103).png',
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
