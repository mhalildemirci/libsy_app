import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class notesunderground extends StatefulWidget {
  const notesunderground({Key? key}) : super(key: key);

  @override
  State<notesunderground> createState() => _notesundergroundState();
}

class _notesundergroundState extends State<notesunderground> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/notes underground/page (1).png',
    'books/notes underground/page (2).png',
    'books/notes underground/page (3).png',
    'books/notes underground/page (4).png',
    'books/notes underground/page (5).png',
    'books/notes underground/page (6).png',
    'books/notes underground/page (7).png',
    'books/notes underground/page (8).png',
    'books/notes underground/page (9).png',
    'books/notes underground/page (10).png',
    'books/notes underground/page (11).png',
    'books/notes underground/page (12).png',
    'books/notes underground/page (13).png',
    'books/notes underground/page (14).png',
    'books/notes underground/page (15).png',
    'books/notes underground/page (16).png',
    'books/notes underground/page (17).png',
    'books/notes underground/page (18).png',
    'books/notes underground/page (19).png',
    'books/notes underground/page (20).png',
    'books/notes underground/page (21).png',
    'books/notes underground/page (22).png',
    'books/notes underground/page (23).png',
    'books/notes underground/page (24).png',
    'books/notes underground/page (25).png',
    'books/notes underground/page (26).png',
    'books/notes underground/page (27).png',
    'books/notes underground/page (28).png',
    'books/notes underground/page (29).png',
    'books/notes underground/page (30).png',
    'books/notes underground/page (31).png',
    'books/notes underground/page (32).png',
    'books/notes underground/page (33).png',
    'books/notes underground/page (34).png',
    'books/notes underground/page (35).png',
    'books/notes underground/page (36).png',
    'books/notes underground/page (37).png',
    'books/notes underground/page (38).png',
    'books/notes underground/page (39).png',
    'books/notes underground/page (40).png',
    'books/notes underground/page (41).png',
    'books/notes underground/page (42).png',
    'books/notes underground/page (43).png',
    'books/notes underground/page (44).png',
    'books/notes underground/page (45).png',
    'books/notes underground/page (46).png',
    'books/notes underground/page (47).png',
    'books/notes underground/page (48).png',
    'books/notes underground/page (49).png',
    'books/notes underground/page (50).png',
    'books/notes underground/page (51).png',
    'books/notes underground/page (52).png',
    'books/notes underground/page (53).png',
    'books/notes underground/page (54).png',
    'books/notes underground/page (55).png',
    'books/notes underground/page (56).png',
    'books/notes underground/page (57).png',
    'books/notes underground/page (58).png',
    'books/notes underground/page (59).png',
    'books/notes underground/page (60).png',
    'books/notes underground/page (61).png',
    'books/notes underground/page (62).png',
    'books/notes underground/page (63).png',
    'books/notes underground/page (64).png',
    'books/notes underground/page (65).png',
    'books/notes underground/page (66).png',
    'books/notes underground/page (67).png',
    'books/notes underground/page (68).png',
    'books/notes underground/page (69).png',
    'books/notes underground/page (70).png',
    'books/notes underground/page (71).png',
    'books/notes underground/page (72).png',
    'books/notes underground/page (73).png',
    'books/notes underground/page (74).png',
    'books/notes underground/page (75).png',
    'books/notes underground/page (76).png',
    'books/notes underground/page (77).png',
    'books/notes underground/page (78).png',
    'books/notes underground/page (79).png',
    'books/notes underground/page (80).png',
    'books/notes underground/page (81).png',
    'books/notes underground/page (82).png',
    'books/notes underground/page (83).png',
    'books/notes underground/page (84).png',
    'books/notes underground/page (85).png',
    'books/notes underground/page (86).png',
    'books/notes underground/page (87).png',
    'books/notes underground/page (88).png',
    'books/notes underground/page (89).png',
    'books/notes underground/page (90).png',
    'books/notes underground/page (91).png',
    'books/notes underground/page (92).png',
    'books/notes underground/page (93).png',
    'books/notes underground/page (94).png',
    'books/notes underground/page (95).png',
    'books/notes underground/page (96).png',
    'books/notes underground/page (97).png',
    'books/notes underground/page (98).png',
    'books/notes underground/page (99).png',
    'books/notes underground/page (100).png',
    'books/notes underground/page (101).png',
    'books/notes underground/page (102).png',
    'books/notes underground/page (103).png',
    'books/notes underground/page (104).png',
    'books/notes underground/page (105).png',
    'books/notes underground/page (106).png',
    'books/notes underground/page (107).png',
    'books/notes underground/page (108).png',
    'books/notes underground/page (109).png',
    'books/notes underground/page (110).png',
    'books/notes underground/page (111).png',
    'books/notes underground/page (112).png',
    'books/notes underground/page (113).png',
    'books/notes underground/page (114).png',
    'books/notes underground/page (115).png',
    'books/notes underground/page (116).png',
    'books/notes underground/page (117).png',

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
