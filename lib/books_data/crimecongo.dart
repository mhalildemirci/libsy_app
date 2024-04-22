import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class crimecongo extends StatefulWidget {
  const crimecongo({Key? key}) : super(key: key);

  @override
  State<crimecongo> createState() => _crimecongoState();
}

class _crimecongoState extends State<crimecongo> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/crime of congo/page (1).png',
    'books/crime of congo/page (2).png',
    'books/crime of congo/page (3).png',
    'books/crime of congo/page (4).png',
    'books/crime of congo/page (5).png',
    'books/crime of congo/page (6).png',
    'books/crime of congo/page (7).png',
    'books/crime of congo/page (8).png',
    'books/crime of congo/page (9).png',
    'books/crime of congo/page (10).png',
    'books/crime of congo/page (11).png',
    'books/crime of congo/page (12).png',
    'books/crime of congo/page (13).png',
    'books/crime of congo/page (14).png',
    'books/crime of congo/page (15).png',
    'books/crime of congo/page (16).png',
    'books/crime of congo/page (17).png',
    'books/crime of congo/page (18).png',
    'books/crime of congo/page (19).png',
    'books/crime of congo/page (20).png',
    'books/crime of congo/page (21).png',
    'books/crime of congo/page (22).png',
    'books/crime of congo/page (23).png',
    'books/crime of congo/page (24).png',
    'books/crime of congo/page (25).png',
    'books/crime of congo/page (26).png',
    'books/crime of congo/page (27).png',
    'books/crime of congo/page (28).png',
    'books/crime of congo/page (29).png',
    'books/crime of congo/page (30).png',
    'books/crime of congo/page (31).png',
    'books/crime of congo/page (32).png',
    'books/crime of congo/page (33).png',
    'books/crime of congo/page (34).png',
    'books/crime of congo/page (35).png',
    'books/crime of congo/page (36).png',
    'books/crime of congo/page (37).png',
    'books/crime of congo/page (38).png',
    'books/crime of congo/page (39).png',
    'books/crime of congo/page (40).png',
    'books/crime of congo/page (41).png',
    'books/crime of congo/page (42).png',
    'books/crime of congo/page (43).png',
    'books/crime of congo/page (44).png',
    'books/crime of congo/page (45).png',
    'books/crime of congo/page (46).png',
    'books/crime of congo/page (47).png',
    'books/crime of congo/page (48).png',
    'books/crime of congo/page (49).png',
    'books/crime of congo/page (50).png',
    'books/crime of congo/page (51).png',
    'books/crime of congo/page (52).png',
    'books/crime of congo/page (53).png',
    'books/crime of congo/page (54).png',
    'books/crime of congo/page (55).png',
    'books/crime of congo/page (56).png',
    'books/crime of congo/page (57).png',
    'books/crime of congo/page (58).png',
    'books/crime of congo/page (59).png',
    'books/crime of congo/page (60).png',
    'books/crime of congo/page (61).png',
    'books/crime of congo/page (62).png',
    'books/crime of congo/page (63).png',
    'books/crime of congo/page (64).png',
    'books/crime of congo/page (65).png',
    'books/crime of congo/page (66).png',
    'books/crime of congo/page (67).png',
    'books/crime of congo/page (68).png',
    'books/crime of congo/page (69).png',
    'books/crime of congo/page (70).png',
    'books/crime of congo/page (71).png',
    'books/crime of congo/page (72).png',
    'books/crime of congo/page (73).png',
    'books/crime of congo/page (74).png',
    'books/crime of congo/page (75).png',
    'books/crime of congo/page (76).png',
    'books/crime of congo/page (77).png',
    'books/crime of congo/page (78).png',
    'books/crime of congo/page (79).png',
    'books/crime of congo/page (80).png',
    'books/crime of congo/page (81).png',
    'books/crime of congo/page (82).png',
    'books/crime of congo/page (83).png',
    'books/crime of congo/page (84).png',
    'books/crime of congo/page (85).png',
    'books/crime of congo/page (86).png',
    'books/crime of congo/page (87).png',
    'books/crime of congo/page (88).png',
    'books/crime of congo/page (89).png',
    'books/crime of congo/page (90).png',
    'books/crime of congo/page (91).png',
    'books/crime of congo/page (92).png',
    'books/crime of congo/page (93).png',
    'books/crime of congo/page (94).png',
    'books/crime of congo/page (95).png',
    'books/crime of congo/page (96).png',
    'books/crime of congo/page (97).png',
    'books/crime of congo/page (98).png',
    'books/crime of congo/page (99).png',

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
