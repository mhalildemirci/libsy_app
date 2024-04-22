import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class rhyme extends StatefulWidget {
  const rhyme({Key? key}) : super(key: key);

  @override
  State<rhyme> createState() => _rhymeState();
}

class _rhymeState extends State<rhyme> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/rhyme/page (1).png',
    'books/rhyme/page (2).png',
    'books/rhyme/page (3).png',
    'books/rhyme/page (4).png',
    'books/rhyme/page (5).png',
    'books/rhyme/page (6).png',
    'books/rhyme/page (7).png',
    'books/rhyme/page (8).png',
    'books/rhyme/page (9).png',
    'books/rhyme/page (10).png',
    'books/rhyme/page (11).png',
    'books/rhyme/page (12).png',
    'books/rhyme/page (13).png',
    'books/rhyme/page (14).png',
    'books/rhyme/page (15).png',
    'books/rhyme/page (16).png',
    'books/rhyme/page (17).png',
    'books/rhyme/page (18).png',
    'books/rhyme/page (19).png',
    'books/rhyme/page (20).png',
    'books/rhyme/page (21).png',
    'books/rhyme/page (22).png',
    'books/rhyme/page (23).png',
    'books/rhyme/page (24).png',
    'books/rhyme/page (25).png',
    'books/rhyme/page (26).png',
    'books/rhyme/page (27).png',
    'books/rhyme/page (28).png',
    'books/rhyme/page (29).png',
    'books/rhyme/page (30).png',
    'books/rhyme/page (31).png',
    'books/rhyme/page (32).png',
    'books/rhyme/page (33).png',
    'books/rhyme/page (34).png',
    'books/rhyme/page (35).png',
    'books/rhyme/page (36).png',
    'books/rhyme/page (37).png',
    'books/rhyme/page (38).png',
    'books/rhyme/page (39).png',
    'books/rhyme/page (40).png',
    'books/rhyme/page (41).png',
    'books/rhyme/page (42).png',
    'books/rhyme/page (43).png',
    'books/rhyme/page (44).png',
    'books/rhyme/page (45).png',
    'books/rhyme/page (46).png',
    'books/rhyme/page (47).png',
    'books/rhyme/page (48).png',
    'books/rhyme/page (49).png',
    'books/rhyme/page (50).png',
    'books/rhyme/page (51).png',
    'books/rhyme/page (52).png',
    'books/rhyme/page (53).png',
    'books/rhyme/page (54).png',
    'books/rhyme/page (55).png',
    'books/rhyme/page (56).png',
    'books/rhyme/page (57).png',
    'books/rhyme/page (58).png',
    'books/rhyme/page (59).png',
    'books/rhyme/page (60).png',
    'books/rhyme/page (61).png',
    'books/rhyme/page (62).png',
    'books/rhyme/page (63).png',
    'books/rhyme/page (64).png',
    'books/rhyme/page (65).png',
    'books/rhyme/page (66).png',
    'books/rhyme/page (67).png',
    'books/rhyme/page (68).png',
    'books/rhyme/page (69).png',
    'books/rhyme/page (70).png',
    'books/rhyme/page (71).png',
    'books/rhyme/page (72).png',
    'books/rhyme/page (73).png',
    'books/rhyme/page (74).png',
    'books/rhyme/page (75).png',
    'books/rhyme/page (76).png',
    'books/rhyme/page (77).png',
    'books/rhyme/page (78).png',
    'books/rhyme/page (79).png',
    'books/rhyme/page (80).png',
    'books/rhyme/page (81).png',
    'books/rhyme/page (82).png',
    'books/rhyme/page (83).png',
    'books/rhyme/page (84).png',
    'books/rhyme/page (85).png',
    'books/rhyme/page (86).png',
    'books/rhyme/page (87).png',
    'books/rhyme/page (88).png',
    'books/rhyme/page (89).png',
    'books/rhyme/page (90).png',
    'books/rhyme/page (91).png',

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
