import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class adventurestomsawyer extends StatefulWidget {
  const adventurestomsawyer({Key? key}) : super(key: key);

  @override
  State<adventurestomsawyer> createState() => _adventurestomsawyerState();
}

class _adventurestomsawyerState extends State<adventurestomsawyer> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/adventures tom sawyer/page (1).png',
    'books/adventures tom sawyer/page (2).png',
    'books/adventures tom sawyer/page (3).png',
    'books/adventures tom sawyer/page (4).png',
    'books/adventures tom sawyer/page (5).png',
    'books/adventures tom sawyer/page (6).png',
    'books/adventures tom sawyer/page (7).png',
    'books/adventures tom sawyer/page (8).png',
    'books/adventures tom sawyer/page (9).png',
    'books/adventures tom sawyer/page (10).png',
    'books/adventures tom sawyer/page (11).png',
    'books/adventures tom sawyer/page (12).png',
    'books/adventures tom sawyer/page (13).png',
    'books/adventures tom sawyer/page (14).png',
    'books/adventures tom sawyer/page (15).png',
    'books/adventures tom sawyer/page (16).png',
    'books/adventures tom sawyer/page (17).png',
    'books/adventures tom sawyer/page (18).png',
    'books/adventures tom sawyer/page (19).png',
    'books/adventures tom sawyer/page (20).png',
    'books/adventures tom sawyer/page (21).png',
    'books/adventures tom sawyer/page (22).png',
    'books/adventures tom sawyer/page (23).png',
    'books/adventures tom sawyer/page (24).png',
    'books/adventures tom sawyer/page (25).png',
    'books/adventures tom sawyer/page (26).png',
    'books/adventures tom sawyer/page (27).png',
    'books/adventures tom sawyer/page (28).png',
    'books/adventures tom sawyer/page (29).png',
    'books/adventures tom sawyer/page (30).png',
    'books/adventures tom sawyer/page (31).png',
    'books/adventures tom sawyer/page (32).png',
    'books/adventures tom sawyer/page (33).png',
    'books/adventures tom sawyer/page (34).png',
    'books/adventures tom sawyer/page (35).png',
    'books/adventures tom sawyer/page (36).png',
    'books/adventures tom sawyer/page (37).png',
    'books/adventures tom sawyer/page (38).png',
    'books/adventures tom sawyer/page (39).png',
    'books/adventures tom sawyer/page (40).png',
    'books/adventures tom sawyer/page (41).png',
    'books/adventures tom sawyer/page (42).png',
    'books/adventures tom sawyer/page (43).png',
    'books/adventures tom sawyer/page (44).png',
    'books/adventures tom sawyer/page (45).png',
    'books/adventures tom sawyer/page (46).png',
    'books/adventures tom sawyer/page (47).png',
    'books/adventures tom sawyer/page (48).png',
    'books/adventures tom sawyer/page (49).png',
    'books/adventures tom sawyer/page (50).png',
    'books/adventures tom sawyer/page (51).png',
    'books/adventures tom sawyer/page (52).png',
    'books/adventures tom sawyer/page (53).png',
    'books/adventures tom sawyer/page (54).png',
    'books/adventures tom sawyer/page (55).png',
    'books/adventures tom sawyer/page (56).png',
    'books/adventures tom sawyer/page (57).png',
    'books/adventures tom sawyer/page (58).png',
    'books/adventures tom sawyer/page (59).png',
    'books/adventures tom sawyer/page (60).png',
    'books/adventures tom sawyer/page (61).png',
    'books/adventures tom sawyer/page (62).png',
    'books/adventures tom sawyer/page (63).png',
    'books/adventures tom sawyer/page (64).png',
    'books/adventures tom sawyer/page (65).png',
    'books/adventures tom sawyer/page (66).png',
    'books/adventures tom sawyer/page (67).png',
    'books/adventures tom sawyer/page (68).png',
    'books/adventures tom sawyer/page (69).png',
    'books/adventures tom sawyer/page (70).png',
    'books/adventures tom sawyer/page (71).png',
    'books/adventures tom sawyer/page (72).png',
    'books/adventures tom sawyer/page (73).png',
    'books/adventures tom sawyer/page (74).png',
    'books/adventures tom sawyer/page (75).png',
    'books/adventures tom sawyer/page (76).png',
    'books/adventures tom sawyer/page (77).png',
    'books/adventures tom sawyer/page (78).png',
    'books/adventures tom sawyer/page (79).png',
    'books/adventures tom sawyer/page (80).png',
    'books/adventures tom sawyer/page (81).png',
    'books/adventures tom sawyer/page (82).png',
    'books/adventures tom sawyer/page (83).png',
    'books/adventures tom sawyer/page (84).png',
    'books/adventures tom sawyer/page (85).png',
    'books/adventures tom sawyer/page (86).png',
    'books/adventures tom sawyer/page (87).png',
    'books/adventures tom sawyer/page (88).png',
    'books/adventures tom sawyer/page (89).png',
    'books/adventures tom sawyer/page (90).png',
    'books/adventures tom sawyer/page (91).png',
    'books/adventures tom sawyer/page (92).png',
    'books/adventures tom sawyer/page (93).png',
    'books/adventures tom sawyer/page (94).png',
    'books/adventures tom sawyer/page (95).png',
    'books/adventures tom sawyer/page (96).png',
    'books/adventures tom sawyer/page (97).png',
    'books/adventures tom sawyer/page (98).png',
    'books/adventures tom sawyer/page (99).png',
    'books/adventures tom sawyer/page (100).png',
    'books/adventures tom sawyer/page (101).png',
    'books/adventures tom sawyer/page (102).png',
    'books/adventures tom sawyer/page (103).png',
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
