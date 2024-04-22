import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hamlet extends StatefulWidget {
  const hamlet({Key? key}) : super(key: key);

  @override
  State<hamlet> createState() => _hamletState();
}

class _hamletState extends State<hamlet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/hamlet/page (1).png',
    'books/hamlet/page (2).png',
    'books/hamlet/page (3).png',
    'books/hamlet/page (4).png',
    'books/hamlet/page (5).png',
    'books/hamlet/page (6).png',
    'books/hamlet/page (7).png',
    'books/hamlet/page (8).png',
    'books/hamlet/page (9).png',
    'books/hamlet/page (10).png',
    'books/hamlet/page (11).png',
    'books/hamlet/page (12).png',
    'books/hamlet/page (13).png',
    'books/hamlet/page (14).png',
    'books/hamlet/page (15).png',
    'books/hamlet/page (16).png',
    'books/hamlet/page (17).png',
    'books/hamlet/page (18).png',
    'books/hamlet/page (19).png',
    'books/hamlet/page (20).png',
    'books/hamlet/page (21).png',
    'books/hamlet/page (22).png',
    'books/hamlet/page (23).png',
    'books/hamlet/page (24).png',
    'books/hamlet/page (25).png',
    'books/hamlet/page (26).png',
    'books/hamlet/page (27).png',
    'books/hamlet/page (28).png',
    'books/hamlet/page (29).png',
    'books/hamlet/page (30).png',
    'books/hamlet/page (31).png',
    'books/hamlet/page (32).png',
    'books/hamlet/page (33).png',
    'books/hamlet/page (34).png',
    'books/hamlet/page (35).png',
    'books/hamlet/page (36).png',
    'books/hamlet/page (37).png',
    'books/hamlet/page (38).png',
    'books/hamlet/page (39).png',
    'books/hamlet/page (40).png',
    'books/hamlet/page (41).png',
    'books/hamlet/page (42).png',
    'books/hamlet/page (43).png',
    'books/hamlet/page (44).png',
    'books/hamlet/page (45).png',
    'books/hamlet/page (46).png',
    'books/hamlet/page (47).png',
    'books/hamlet/page (48).png',
    'books/hamlet/page (49).png',
    'books/hamlet/page (50).png',
    'books/hamlet/page (51).png',
    'books/hamlet/page (52).png',
    'books/hamlet/page (53).png',
    'books/hamlet/page (54).png',
    'books/hamlet/page (55).png',
    'books/hamlet/page (56).png',
    'books/hamlet/page (57).png',
    'books/hamlet/page (58).png',
    'books/hamlet/page (59).png',
    'books/hamlet/page (60).png',
    'books/hamlet/page (61).png',
    'books/hamlet/page (62).png',
    'books/hamlet/page (63).png',
    'books/hamlet/page (64).png',
    'books/hamlet/page (65).png',
    'books/hamlet/page (66).png',
    'books/hamlet/page (67).png',
    'books/hamlet/page (68).png',
    'books/hamlet/page (69).png',
    'books/hamlet/page (70).png',
    'books/hamlet/page (71).png',
    'books/hamlet/page (72).png',
    'books/hamlet/page (73).png',
    'books/hamlet/page (74).png',
    'books/hamlet/page (75).png',
    'books/hamlet/page (76).png',
    'books/hamlet/page (77).png',
    'books/hamlet/page (78).png',
    'books/hamlet/page (79).png',
    'books/hamlet/page (80).png',
    'books/hamlet/page (81).png',
    'books/hamlet/page (82).png',
    'books/hamlet/page (83).png',
    'books/hamlet/page (84).png',
    'books/hamlet/page (85).png',
    'books/hamlet/page (86).png',
    'books/hamlet/page (87).png',
    'books/hamlet/page (88).png',
    'books/hamlet/page (89).png',
    'books/hamlet/page (90).png',
    'books/hamlet/page (91).png',
    'books/hamlet/page (92).png',
    'books/hamlet/page (93).png',
    'books/hamlet/page (94).png',
    'books/hamlet/page (95).png',
    'books/hamlet/page (96).png',
    'books/hamlet/page (97).png',
    'books/hamlet/page (98).png',
    'books/hamlet/page (99).png',
    'books/hamlet/page (100).png',
    'books/hamlet/page (101).png',
    'books/hamlet/page (102).png',
    'books/hamlet/page (103).png',
    'books/hamlet/page (104).png',
    'books/hamlet/page (105).png',
    'books/hamlet/page (106).png',
    'books/hamlet/page (107).png',
    'books/hamlet/page (108).png',
    'books/hamlet/page (109).png',
    'books/hamlet/page (110).png',
    'books/hamlet/page (111).png',
    'books/hamlet/page (112).png',
    'books/hamlet/page (113).png',
    'books/hamlet/page (114).png',
    'books/hamlet/page (115).png',
    'books/hamlet/page (116).png',
    'books/hamlet/page (117).png',
    'books/hamlet/page (118).png',
    'books/hamlet/page (119).png',
    'books/hamlet/page (120).png',
    'books/hamlet/page (121).png',
    'books/hamlet/page (122).png',
    'books/hamlet/page (123).png',
    'books/hamlet/page (124).png',
    'books/hamlet/page (125).png',
    'books/hamlet/page (126).png',
    'books/hamlet/page (127).png',
    'books/hamlet/page (128).png',
    'books/hamlet/page (129).png',
    'books/hamlet/page (130).png',
    'books/hamlet/page (131).png',
    'books/hamlet/page (132).png',

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
