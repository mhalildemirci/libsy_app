import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class meditations extends StatefulWidget {
  const meditations({Key? key}) : super(key: key);

  @override
  State<meditations> createState() => _meditationsState();
}

class _meditationsState extends State<meditations> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/meditations/page (1).png',
    'books/meditations/page (2).png',
    'books/meditations/page (3).png',
    'books/meditations/page (4).png',
    'books/meditations/page (5).png',
    'books/meditations/page (6).png',
    'books/meditations/page (7).png',
    'books/meditations/page (8).png',
    'books/meditations/page (9).png',
    'books/meditations/page (10).png',
    'books/meditations/page (11).png',
    'books/meditations/page (12).png',
    'books/meditations/page (13).png',
    'books/meditations/page (14).png',
    'books/meditations/page (15).png',
    'books/meditations/page (16).png',
    'books/meditations/page (17).png',
    'books/meditations/page (18).png',
    'books/meditations/page (19).png',
    'books/meditations/page (20).png',
    'books/meditations/page (21).png',
    'books/meditations/page (22).png',
    'books/meditations/page (23).png',
    'books/meditations/page (24).png',
    'books/meditations/page (25).png',
    'books/meditations/page (26).png',
    'books/meditations/page (27).png',
    'books/meditations/page (28).png',
    'books/meditations/page (29).png',
    'books/meditations/page (30).png',
    'books/meditations/page (31).png',
    'books/meditations/page (32).png',
    'books/meditations/page (33).png',
    'books/meditations/page (34).png',
    'books/meditations/page (35).png',
    'books/meditations/page (36).png',
    'books/meditations/page (37).png',
    'books/meditations/page (38).png',
    'books/meditations/page (39).png',
    'books/meditations/page (40).png',
    'books/meditations/page (41).png',
    'books/meditations/page (42).png',
    'books/meditations/page (43).png',
    'books/meditations/page (44).png',
    'books/meditations/page (45).png',
    'books/meditations/page (46).png',
    'books/meditations/page (47).png',
    'books/meditations/page (48).png',
    'books/meditations/page (49).png',
    'books/meditations/page (50).png',
    'books/meditations/page (51).png',
    'books/meditations/page (52).png',
    'books/meditations/page (53).png',
    'books/meditations/page (54).png',
    'books/meditations/page (55).png',
    'books/meditations/page (56).png',
    'books/meditations/page (57).png',
    'books/meditations/page (58).png',
    'books/meditations/page (59).png',
    'books/meditations/page (60).png',
    'books/meditations/page (61).png',
    'books/meditations/page (62).png',
    'books/meditations/page (63).png',
    'books/meditations/page (64).png',
    'books/meditations/page (65).png',
    'books/meditations/page (66).png',
    'books/meditations/page (67).png',
    'books/meditations/page (68).png',
    'books/meditations/page (69).png',
    'books/meditations/page (70).png',
    'books/meditations/page (71).png',
    'books/meditations/page (72).png',
    'books/meditations/page (73).png',
    'books/meditations/page (74).png',
    'books/meditations/page (75).png',
    'books/meditations/page (76).png',
    'books/meditations/page (77).png',
    'books/meditations/page (78).png',
    'books/meditations/page (79).png',
    'books/meditations/page (80).png',
    'books/meditations/page (81).png',
    'books/meditations/page (82).png',
    'books/meditations/page (83).png',
    'books/meditations/page (84).png',
    'books/meditations/page (85).png',
    'books/meditations/page (86).png',
    'books/meditations/page (87).png',
    'books/meditations/page (88).png',
    'books/meditations/page (89).png',
    'books/meditations/page (90).png',
    'books/meditations/page (91).png',
    'books/meditations/page (92).png',
    'books/meditations/page (93).png',
    'books/meditations/page (94).png',
    'books/meditations/page (95).png',
    'books/meditations/page (96).png',
    'books/meditations/page (97).png',
    'books/meditations/page (98).png',
    'books/meditations/page (99).png',
    'books/meditations/page (100).png',
    'books/meditations/page (101).png',
    'books/meditations/page (102).png',
    'books/meditations/page (103).png',
    'books/meditations/page (104).png',
    'books/meditations/page (105).png',
    'books/meditations/page (106).png',
    'books/meditations/page (107).png',
    'books/meditations/page (108).png',
    'books/meditations/page (109).png',
    'books/meditations/page (110).png',
    'books/meditations/page (111).png',
    'books/meditations/page (112).png',
    'books/meditations/page (113).png',
    'books/meditations/page (114).png',
    'books/meditations/page (115).png',
    'books/meditations/page (116).png',
    'books/meditations/page (117).png',
    'books/meditations/page (118).png',
    'books/meditations/page (119).png',
    'books/meditations/page (120).png',
    'books/meditations/page (121).png',
    'books/meditations/page (122).png',
    'books/meditations/page (123).png',
    'books/meditations/page (124).png',
    'books/meditations/page (125).png',
    'books/meditations/page (126).png',
    'books/meditations/page (127).png',
    'books/meditations/page (128).png',
    'books/meditations/page (129).png',
    'books/meditations/page (130).png',

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
