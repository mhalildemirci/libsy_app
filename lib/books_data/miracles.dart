import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class miracles extends StatefulWidget {
  const miracles({Key? key}) : super(key: key);

  @override
  State<miracles> createState() => _miraclesState();
}

class _miraclesState extends State<miracles> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/miracles/page (1).png',
    'books/miracles/page (2).png',
    'books/miracles/page (3).png',
    'books/miracles/page (4).png',
    'books/miracles/page (5).png',
    'books/miracles/page (6).png',
    'books/miracles/page (7).png',
    'books/miracles/page (8).png',
    'books/miracles/page (9).png',
    'books/miracles/page (10).png',
    'books/miracles/page (11).png',
    'books/miracles/page (12).png',
    'books/miracles/page (13).png',
    'books/miracles/page (14).png',
    'books/miracles/page (15).png',
    'books/miracles/page (16).png',
    'books/miracles/page (17).png',
    'books/miracles/page (18).png',
    'books/miracles/page (19).png',
    'books/miracles/page (20).png',
    'books/miracles/page (21).png',
    'books/miracles/page (22).png',
    'books/miracles/page (23).png',
    'books/miracles/page (24).png',
    'books/miracles/page (25).png',
    'books/miracles/page (26).png',
    'books/miracles/page (27).png',
    'books/miracles/page (28).png',
    'books/miracles/page (29).png',
    'books/miracles/page (30).png',
    'books/miracles/page (31).png',
    'books/miracles/page (32).png',
    'books/miracles/page (33).png',
    'books/miracles/page (34).png',
    'books/miracles/page (35).png',
    'books/miracles/page (36).png',
    'books/miracles/page (37).png',
    'books/miracles/page (38).png',
    'books/miracles/page (39).png',
    'books/miracles/page (40).png',
    'books/miracles/page (41).png',
    'books/miracles/page (42).png',
    'books/miracles/page (43).png',
    'books/miracles/page (44).png',
    'books/miracles/page (45).png',
    'books/miracles/page (46).png',
    'books/miracles/page (47).png',
    'books/miracles/page (48).png',
    'books/miracles/page (49).png',
    'books/miracles/page (50).png',
    'books/miracles/page (51).png',
    'books/miracles/page (52).png',
    'books/miracles/page (53).png',
    'books/miracles/page (54).png',
    'books/miracles/page (55).png',
    'books/miracles/page (56).png',
    'books/miracles/page (57).png',
    'books/miracles/page (58).png',
    'books/miracles/page (59).png',
    'books/miracles/page (60).png',
    'books/miracles/page (61).png',
    'books/miracles/page (62).png',
    'books/miracles/page (63).png',
    'books/miracles/page (64).png',
    'books/miracles/page (65).png',
    'books/miracles/page (66).png',
    'books/miracles/page (67).png',
    'books/miracles/page (68).png',
    'books/miracles/page (69).png',
    'books/miracles/page (70).png',
    'books/miracles/page (71).png',
    'books/miracles/page (72).png',
    'books/miracles/page (73).png',
    'books/miracles/page (74).png',
    'books/miracles/page (75).png',
    'books/miracles/page (76).png',
    'books/miracles/page (77).png',
    'books/miracles/page (78).png',
    'books/miracles/page (79).png',
    'books/miracles/page (80).png',
    'books/miracles/page (81).png',
    'books/miracles/page (82).png',
    'books/miracles/page (83).png',
    'books/miracles/page (84).png',
    'books/miracles/page (85).png',
    'books/miracles/page (86).png',
    'books/miracles/page (87).png',
    'books/miracles/page (88).png',
    'books/miracles/page (89).png',
    'books/miracles/page (90).png',
    'books/miracles/page (91).png',
    'books/miracles/page (92).png',
    'books/miracles/page (93).png',
    'books/miracles/page (94).png',
    'books/miracles/page (95).png',
    'books/miracles/page (96).png',
    'books/miracles/page (97).png',
    'books/miracles/page (98).png',
    'books/miracles/page (99).png',
    'books/miracles/page (100).png',
    'books/miracles/page (101).png',
    'books/miracles/page (102).png',
    'books/miracles/page (103).png',
    'books/miracles/page (104).png',
    'books/miracles/page (105).png',
    'books/miracles/page (106).png',
    'books/miracles/page (107).png',
    'books/miracles/page (108).png',
    'books/miracles/page (109).png',
    'books/miracles/page (110).png',
    'books/miracles/page (111).png',
    'books/miracles/page (112).png',
    'books/miracles/page (113).png',
    'books/miracles/page (114).png',
    'books/miracles/page (115).png',
    'books/miracles/page (116).png',
    'books/miracles/page (117).png',
    'books/miracles/page (118).png',
    'books/miracles/page (119).png',
    'books/miracles/page (120).png',
    'books/miracles/page (121).png',
    'books/miracles/page (122).png',
    'books/miracles/page (123).png',
    'books/miracles/page (124).png',
    'books/miracles/page (125).png',
    'books/miracles/page (126).png',
    'books/miracles/page (127).png',
    'books/miracles/page (128).png',
    'books/miracles/page (129).png',
    'books/miracles/page (130).png',

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
