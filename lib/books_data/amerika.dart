import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class amerika extends StatefulWidget {
  const amerika({Key? key}) : super(key: key);

  @override
  State<amerika> createState() => _amerikaState();
}

class _amerikaState extends State<amerika> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Amerika/page (1).png',
    'books/Amerika/page (2).png',
    'books/Amerika/page (3).png',
    'books/Amerika/page (4).png',
    'books/Amerika/page (5).png',
    'books/Amerika/page (6).png',
    'books/Amerika/page (7).png',
    'books/Amerika/page (8).png',
    'books/Amerika/page (9).png',
    'books/Amerika/page (10).png',
    'books/Amerika/page (11).png',
    'books/Amerika/page (12).png',
    'books/Amerika/page (13).png',
    'books/Amerika/page (14).png',
    'books/Amerika/page (15).png',
    'books/Amerika/page (16).png',
    'books/Amerika/page (17).png',
    'books/Amerika/page (18).png',
    'books/Amerika/page (19).png',
    'books/Amerika/page (20).png',
    'books/Amerika/page (21).png',
    'books/Amerika/page (22).png',
    'books/Amerika/page (23).png',
    'books/Amerika/page (24).png',
    'books/Amerika/page (25).png',
    'books/Amerika/page (26).png',
    'books/Amerika/page (27).png',
    'books/Amerika/page (28).png',
    'books/Amerika/page (29).png',
    'books/Amerika/page (30).png',
    'books/Amerika/page (31).png',
    'books/Amerika/page (32).png',
    'books/Amerika/page (33).png',
    'books/Amerika/page (34).png',
    'books/Amerika/page (35).png',
    'books/Amerika/page (36).png',
    'books/Amerika/page (37).png',
    'books/Amerika/page (38).png',
    'books/Amerika/page (39).png',
    'books/Amerika/page (40).png',
    'books/Amerika/page (41).png',
    'books/Amerika/page (42).png',
    'books/Amerika/page (43).png',
    'books/Amerika/page (44).png',
    'books/Amerika/page (45).png',
    'books/Amerika/page (46).png',
    'books/Amerika/page (47).png',
    'books/Amerika/page (48).png',
    'books/Amerika/page (49).png',
    'books/Amerika/page (50).png',
    'books/Amerika/page (51).png',
    'books/Amerika/page (52).png',
    'books/Amerika/page (53).png',
    'books/Amerika/page (54).png',
    'books/Amerika/page (55).png',
    'books/Amerika/page (56).png',
    'books/Amerika/page (57).png',
    'books/Amerika/page (58).png',
    'books/Amerika/page (59).png',
    'books/Amerika/page (60).png',
    'books/Amerika/page (61).png',
    'books/Amerika/page (62).png',
    'books/Amerika/page (63).png',
    'books/Amerika/page (64).png',
    'books/Amerika/page (65).png',
    'books/Amerika/page (66).png',
    'books/Amerika/page (67).png',
    'books/Amerika/page (68).png',
    'books/Amerika/page (69).png',
    'books/Amerika/page (70).png',
    'books/Amerika/page (71).png',
    'books/Amerika/page (72).png',
    'books/Amerika/page (73).png',
    'books/Amerika/page (74).png',
    'books/Amerika/page (75).png',
    'books/Amerika/page (76).png',
    'books/Amerika/page (77).png',
    'books/Amerika/page (78).png',
    'books/Amerika/page (79).png',
    'books/Amerika/page (80).png',
    'books/Amerika/page (81).png',
    'books/Amerika/page (82).png',
    'books/Amerika/page (83).png',
    'books/Amerika/page (84).png',
    'books/Amerika/page (85).png',
    'books/Amerika/page (86).png',
    'books/Amerika/page (87).png',
    'books/Amerika/page (88).png',
    'books/Amerika/page (89).png',
    'books/Amerika/page (90).png',
    'books/Amerika/page (91).png',
    'books/Amerika/page (92).png',
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
