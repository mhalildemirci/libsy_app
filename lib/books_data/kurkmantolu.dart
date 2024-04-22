import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kurkmantolu extends StatefulWidget {
  const kurkmantolu({Key? key}) : super(key: key);

  @override
  State<kurkmantolu> createState() => _kurkmantoluState();
}

class _kurkmantoluState extends State<kurkmantolu> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kurk mantolu/page (1).png',
    'books/kurk mantolu/page (2).png',
    'books/kurk mantolu/page (3).png',
    'books/kurk mantolu/page (4).png',
    'books/kurk mantolu/page (5).png',
    'books/kurk mantolu/page (6).png',
    'books/kurk mantolu/page (7).png',
    'books/kurk mantolu/page (8).png',
    'books/kurk mantolu/page (9).png',
    'books/kurk mantolu/page (10).png',
    'books/kurk mantolu/page (11).png',
    'books/kurk mantolu/page (12).png',
    'books/kurk mantolu/page (13).png',
    'books/kurk mantolu/page (14).png',
    'books/kurk mantolu/page (15).png',
    'books/kurk mantolu/page (16).png',
    'books/kurk mantolu/page (17).png',
    'books/kurk mantolu/page (18).png',
    'books/kurk mantolu/page (19).png',
    'books/kurk mantolu/page (20).png',
    'books/kurk mantolu/page (21).png',
    'books/kurk mantolu/page (22).png',
    'books/kurk mantolu/page (23).png',
    'books/kurk mantolu/page (24).png',
    'books/kurk mantolu/page (25).png',
    'books/kurk mantolu/page (26).png',
    'books/kurk mantolu/page (27).png',
    'books/kurk mantolu/page (28).png',
    'books/kurk mantolu/page (29).png',
    'books/kurk mantolu/page (30).png',
    'books/kurk mantolu/page (31).png',
    'books/kurk mantolu/page (32).png',
    'books/kurk mantolu/page (33).png',
    'books/kurk mantolu/page (34).png',
    'books/kurk mantolu/page (35).png',
    'books/kurk mantolu/page (36).png',
    'books/kurk mantolu/page (37).png',
    'books/kurk mantolu/page (38).png',
    'books/kurk mantolu/page (39).png',
    'books/kurk mantolu/page (40).png',
    'books/kurk mantolu/page (41).png',
    'books/kurk mantolu/page (42).png',
    'books/kurk mantolu/page (43).png',
    'books/kurk mantolu/page (44).png',
    'books/kurk mantolu/page (45).png',
    'books/kurk mantolu/page (46).png',
    'books/kurk mantolu/page (47).png',
    'books/kurk mantolu/page (48).png',
    'books/kurk mantolu/page (49).png',
    'books/kurk mantolu/page (50).png',
    'books/kurk mantolu/page (51).png',
    'books/kurk mantolu/page (52).png',
    'books/kurk mantolu/page (53).png',
    'books/kurk mantolu/page (54).png',
    'books/kurk mantolu/page (55).png',
    'books/kurk mantolu/page (56).png',
    'books/kurk mantolu/page (57).png',
    'books/kurk mantolu/page (58).png',
    'books/kurk mantolu/page (59).png',
    'books/kurk mantolu/page (60).png',
    'books/kurk mantolu/page (61).png',
    'books/kurk mantolu/page (62).png',
    'books/kurk mantolu/page (63).png',
    'books/kurk mantolu/page (64).png',
    'books/kurk mantolu/page (65).png',
    'books/kurk mantolu/page (66).png',
    'books/kurk mantolu/page (67).png',
    'books/kurk mantolu/page (68).png',
    'books/kurk mantolu/page (69).png',
    'books/kurk mantolu/page (70).png',
    'books/kurk mantolu/page (71).png',
    'books/kurk mantolu/page (72).png',
    'books/kurk mantolu/page (73).png',
    'books/kurk mantolu/page (74).png',
    'books/kurk mantolu/page (75).png',
    'books/kurk mantolu/page (76).png',
    'books/kurk mantolu/page (77).png',
    'books/kurk mantolu/page (78).png',
    'books/kurk mantolu/page (79).png',
    'books/kurk mantolu/page (80).png',
    'books/kurk mantolu/page (81).png',
    'books/kurk mantolu/page (82).png',
    'books/kurk mantolu/page (83).png',
    'books/kurk mantolu/page (84).png',
    'books/kurk mantolu/page (85).png',
    'books/kurk mantolu/page (86).png',
    'books/kurk mantolu/page (87).png',
    'books/kurk mantolu/page (88).png',
    'books/kurk mantolu/page (89).png',
    'books/kurk mantolu/page (90).png',
    'books/kurk mantolu/page (91).png',
    'books/kurk mantolu/page (92).png',
    'books/kurk mantolu/page (93).png',

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
