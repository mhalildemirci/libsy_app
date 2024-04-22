import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class balkanharbi extends StatefulWidget {
  const balkanharbi({Key? key}) : super(key: key);

  @override
  State<balkanharbi> createState() => _balkanharbiState();
}

class _balkanharbiState extends State<balkanharbi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Balkan Harbi/page (1).png',
    'books/Balkan Harbi/page (2).png',
    'books/Balkan Harbi/page (3).png',
    'books/Balkan Harbi/page (4).png',
    'books/Balkan Harbi/page (5).png',
    'books/Balkan Harbi/page (6).png',
    'books/Balkan Harbi/page (7).png',
    'books/Balkan Harbi/page (8).png',
    'books/Balkan Harbi/page (9).png',
    'books/Balkan Harbi/page (10).png',
    'books/Balkan Harbi/page (11).png',
    'books/Balkan Harbi/page (12).png',
    'books/Balkan Harbi/page (13).png',
    'books/Balkan Harbi/page (14).png',
    'books/Balkan Harbi/page (15).png',
    'books/Balkan Harbi/page (16).png',
    'books/Balkan Harbi/page (17).png',
    'books/Balkan Harbi/page (18).png',
    'books/Balkan Harbi/page (19).png',
    'books/Balkan Harbi/page (20).png',
    'books/Balkan Harbi/page (21).png',
    'books/Balkan Harbi/page (22).png',
    'books/Balkan Harbi/page (23).png',
    'books/Balkan Harbi/page (24).png',
    'books/Balkan Harbi/page (25).png',
    'books/Balkan Harbi/page (26).png',
    'books/Balkan Harbi/page (27).png',
    'books/Balkan Harbi/page (28).png',
    'books/Balkan Harbi/page (29).png',
    'books/Balkan Harbi/page (30).png',
    'books/Balkan Harbi/page (31).png',
    'books/Balkan Harbi/page (32).png',
    'books/Balkan Harbi/page (33).png',
    'books/Balkan Harbi/page (34).png',
    'books/Balkan Harbi/page (35).png',
    'books/Balkan Harbi/page (36).png',
    'books/Balkan Harbi/page (37).png',
    'books/Balkan Harbi/page (38).png',
    'books/Balkan Harbi/page (39).png',
    'books/Balkan Harbi/page (40).png',
    'books/Balkan Harbi/page (41).png',
    'books/Balkan Harbi/page (42).png',
    'books/Balkan Harbi/page (43).png',
    'books/Balkan Harbi/page (44).png',
    'books/Balkan Harbi/page (45).png',
    'books/Balkan Harbi/page (46).png',
    'books/Balkan Harbi/page (47).png',
    'books/Balkan Harbi/page (48).png',
    'books/Balkan Harbi/page (49).png',
    'books/Balkan Harbi/page (50).png',
    'books/Balkan Harbi/page (51).png',
    'books/Balkan Harbi/page (52).png',
    'books/Balkan Harbi/page (53).png',
    'books/Balkan Harbi/page (54).png',
    'books/Balkan Harbi/page (55).png',
    'books/Balkan Harbi/page (56).png',
    'books/Balkan Harbi/page (57).png',
    'books/Balkan Harbi/page (58).png',
    'books/Balkan Harbi/page (59).png',
    'books/Balkan Harbi/page (60).png',
    'books/Balkan Harbi/page (61).png',
    'books/Balkan Harbi/page (62).png',
    'books/Balkan Harbi/page (63).png',
    'books/Balkan Harbi/page (64).png',
    'books/Balkan Harbi/page (65).png',
    'books/Balkan Harbi/page (66).png',
    'books/Balkan Harbi/page (67).png',
    'books/Balkan Harbi/page (68).png',
    'books/Balkan Harbi/page (69).png',
    'books/Balkan Harbi/page (70).png',
    'books/Balkan Harbi/page (71).png',
    'books/Balkan Harbi/page (72).png',
    'books/Balkan Harbi/page (73).png',
    'books/Balkan Harbi/page (74).png',
    'books/Balkan Harbi/page (75).png',
    'books/Balkan Harbi/page (76).png',
    'books/Balkan Harbi/page (77).png',
    'books/Balkan Harbi/page (78).png',
    'books/Balkan Harbi/page (79).png',
    'books/Balkan Harbi/page (80).png',
    'books/Balkan Harbi/page (81).png',
    'books/Balkan Harbi/page (82).png',
    'books/Balkan Harbi/page (83).png',
    'books/Balkan Harbi/page (84).png',
    'books/Balkan Harbi/page (85).png',
    'books/Balkan Harbi/page (86).png',
    'books/Balkan Harbi/page (87).png',
    'books/Balkan Harbi/page (88).png',
    'books/Balkan Harbi/page (89).png',
    'books/Balkan Harbi/page (90).png',
    'books/Balkan Harbi/page (91).png',
    'books/Balkan Harbi/page (92).png',
    'books/Balkan Harbi/page (93).png',
    'books/Balkan Harbi/page (94).png',
    'books/Balkan Harbi/page (95).png',

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
