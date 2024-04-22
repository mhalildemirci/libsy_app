import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class prince extends StatefulWidget {
  const prince({Key? key}) : super(key: key);

  @override
  State<prince> createState() => _princeState();
}

class _princeState extends State<prince> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/the prince/page (1).png',
    'books/the prince/page (2).png',
    'books/the prince/page (3).png',
    'books/the prince/page (4).png',
    'books/the prince/page (5).png',
    'books/the prince/page (6).png',
    'books/the prince/page (7).png',
    'books/the prince/page (8).png',
    'books/the prince/page (9).png',
    'books/the prince/page (10).png',
    'books/the prince/page (11).png',
    'books/the prince/page (12).png',
    'books/the prince/page (13).png',
    'books/the prince/page (14).png',
    'books/the prince/page (15).png',
    'books/the prince/page (16).png',
    'books/the prince/page (17).png',
    'books/the prince/page (18).png',
    'books/the prince/page (19).png',
    'books/the prince/page (20).png',
    'books/the prince/page (21).png',
    'books/the prince/page (22).png',
    'books/the prince/page (23).png',
    'books/the prince/page (24).png',
    'books/the prince/page (25).png',
    'books/the prince/page (26).png',
    'books/the prince/page (27).png',
    'books/the prince/page (28).png',
    'books/the prince/page (29).png',
    'books/the prince/page (30).png',
    'books/the prince/page (31).png',
    'books/the prince/page (32).png',
    'books/the prince/page (33).png',
    'books/the prince/page (34).png',
    'books/the prince/page (35).png',
    'books/the prince/page (36).png',
    'books/the prince/page (37).png',
    'books/the prince/page (38).png',
    'books/the prince/page (39).png',
    'books/the prince/page (40).png',
    'books/the prince/page (41).png',
    'books/the prince/page (42).png',
    'books/the prince/page (43).png',
    'books/the prince/page (44).png',
    'books/the prince/page (45).png',
    'books/the prince/page (46).png',
    'books/the prince/page (47).png',
    'books/the prince/page (48).png',
    'books/the prince/page (49).png',
    'books/the prince/page (50).png',
    'books/the prince/page (51).png',
    'books/the prince/page (52).png',
    'books/the prince/page (53).png',
    'books/the prince/page (54).png',
    'books/the prince/page (55).png',
    'books/the prince/page (56).png',
    'books/the prince/page (57).png',
    'books/the prince/page (58).png',
    'books/the prince/page (59).png',
    'books/the prince/page (60).png',
    'books/the prince/page (61).png',
    'books/the prince/page (62).png',
    'books/the prince/page (63).png',
    'books/the prince/page (64).png',
    'books/the prince/page (65).png',
    'books/the prince/page (66).png',
    'books/the prince/page (67).png',
    'books/the prince/page (68).png',
    'books/the prince/page (69).png',
    'books/the prince/page (70).png',
    'books/the prince/page (71).png',
    'books/the prince/page (72).png',
    'books/the prince/page (73).png',
    'books/the prince/page (74).png',
    'books/the prince/page (75).png',
    'books/the prince/page (76).png',
    'books/the prince/page (77).png',
    'books/the prince/page (78).png',
    'books/the prince/page (79).png',
    'books/the prince/page (80).png',
    'books/the prince/page (81).png',
    'books/the prince/page (82).png',
    'books/the prince/page (83).png',
    'books/the prince/page (84).png',
    'books/the prince/page (85).png',
    'books/the prince/page (86).png',
    'books/the prince/page (87).png',
    'books/the prince/page (88).png',
    'books/the prince/page (89).png',
    'books/the prince/page (90).png',
    'books/the prince/page (91).png',
    'books/the prince/page (92).png',
    'books/the prince/page (93).png',
    'books/the prince/page (94).png',
    'books/the prince/page (95).png',
    'books/the prince/page (96).png',
    'books/the prince/page (97).png',
    'books/the prince/page (98).png',
    'books/the prince/page (99).png',
    'books/the prince/page (100).png',
    'books/the prince/page (101).png',
    'books/the prince/page (102).png',
    'books/the prince/page (103).png',
    'books/the prince/page (104).png',
    'books/the prince/page (105).png',
    'books/the prince/page (106).png',
    'books/the prince/page (107).png',
    'books/the prince/page (108).png',
    'books/the prince/page (109).png',
    'books/the prince/page (110).png',
    'books/the prince/page (111).png',
    'books/the prince/page (112).png',
    'books/the prince/page (113).png',
    'books/the prince/page (114).png',
    'books/the prince/page (115).png',
    'books/the prince/page (116).png',
    'books/the prince/page (117).png',
    'books/the prince/page (118).png',
    'books/the prince/page (119).png',
    'books/the prince/page (120).png',
    'books/the prince/page (121).png',
    'books/the prince/page (122).png',
    'books/the prince/page (123).png',
    'books/the prince/page (124).png',
    'books/the prince/page (125).png',
    'books/the prince/page (126).png',
    'books/the prince/page (127).png',
    'books/the prince/page (128).png',
    'books/the prince/page (129).png',
    'books/the prince/page (130).png',
    'books/the prince/page (131).png',
    'books/the prince/page (132).png',
    'books/the prince/page (133).png',
    'books/the prince/page (134).png',
    'books/the prince/page (135).png',
    'books/the prince/page (136).png',
    'books/the prince/page (137).png',
    'books/the prince/page (138).png',
    'books/the prince/page (139).png',
    'books/the prince/page (140).png',
    'books/the prince/page (141).png',
    'books/the prince/page (142).png',
    'books/the prince/page (143).png',
    'books/the prince/page (144).png',
    'books/the prince/page (145).png',
    'books/the prince/page (146).png',
    'books/the prince/page (147).png',
    'books/the prince/page (148).png',
    'books/the prince/page (149).png',
    'books/the prince/page (150).png',
    'books/the prince/page (151).png',
    'books/the prince/page (152).png',

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
