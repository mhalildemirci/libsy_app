import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class invisible extends StatefulWidget {
  const invisible({Key? key}) : super(key: key);

  @override
  State<invisible> createState() => _invisibleState();
}

class _invisibleState extends State<invisible> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/invisible/page (1).png',
    'books/invisible/page (2).png',
    'books/invisible/page (3).png',
    'books/invisible/page (4).png',
    'books/invisible/page (5).png',
    'books/invisible/page (6).png',
    'books/invisible/page (7).png',
    'books/invisible/page (8).png',
    'books/invisible/page (9).png',
    'books/invisible/page (10).png',
    'books/invisible/page (11).png',
    'books/invisible/page (12).png',
    'books/invisible/page (13).png',
    'books/invisible/page (14).png',
    'books/invisible/page (15).png',
    'books/invisible/page (16).png',
    'books/invisible/page (17).png',
    'books/invisible/page (18).png',
    'books/invisible/page (19).png',
    'books/invisible/page (20).png',
    'books/invisible/page (21).png',
    'books/invisible/page (22).png',
    'books/invisible/page (23).png',
    'books/invisible/page (24).png',
    'books/invisible/page (25).png',
    'books/invisible/page (26).png',
    'books/invisible/page (27).png',
    'books/invisible/page (28).png',
    'books/invisible/page (29).png',
    'books/invisible/page (30).png',
    'books/invisible/page (31).png',
    'books/invisible/page (32).png',
    'books/invisible/page (33).png',
    'books/invisible/page (34).png',
    'books/invisible/page (35).png',
    'books/invisible/page (36).png',
    'books/invisible/page (37).png',
    'books/invisible/page (38).png',
    'books/invisible/page (39).png',
    'books/invisible/page (40).png',
    'books/invisible/page (41).png',
    'books/invisible/page (42).png',
    'books/invisible/page (43).png',
    'books/invisible/page (44).png',
    'books/invisible/page (45).png',
    'books/invisible/page (46).png',
    'books/invisible/page (47).png',
    'books/invisible/page (48).png',
    'books/invisible/page (49).png',
    'books/invisible/page (50).png',
    'books/invisible/page (51).png',
    'books/invisible/page (52).png',
    'books/invisible/page (53).png',
    'books/invisible/page (54).png',
    'books/invisible/page (55).png',
    'books/invisible/page (56).png',
    'books/invisible/page (57).png',
    'books/invisible/page (58).png',
    'books/invisible/page (59).png',
    'books/invisible/page (60).png',
    'books/invisible/page (61).png',
    'books/invisible/page (62).png',
    'books/invisible/page (63).png',
    'books/invisible/page (64).png',
    'books/invisible/page (65).png',
    'books/invisible/page (66).png',
    'books/invisible/page (67).png',
    'books/invisible/page (68).png',
    'books/invisible/page (69).png',
    'books/invisible/page (70).png',
    'books/invisible/page (71).png',
    'books/invisible/page (72).png',
    'books/invisible/page (73).png',
    'books/invisible/page (74).png',
    'books/invisible/page (75).png',
    'books/invisible/page (76).png',
    'books/invisible/page (77).png',
    'books/invisible/page (78).png',
    'books/invisible/page (79).png',
    'books/invisible/page (80).png',
    'books/invisible/page (81).png',
    'books/invisible/page (82).png',
    'books/invisible/page (83).png',
    'books/invisible/page (84).png',
    'books/invisible/page (85).png',
    'books/invisible/page (86).png',
    'books/invisible/page (87).png',
    'books/invisible/page (88).png',
    'books/invisible/page (89).png',
    'books/invisible/page (90).png',
    'books/invisible/page (91).png',
    'books/invisible/page (92).png',
    'books/invisible/page (93).png',
    'books/invisible/page (94).png',
    'books/invisible/page (95).png',
    'books/invisible/page (96).png',
    'books/invisible/page (97).png',
    'books/invisible/page (98).png',
    'books/invisible/page (99).png',
    'books/invisible/page (100).png',
    'books/invisible/page (101).png',
    'books/invisible/page (102).png',
    'books/invisible/page (103).png',
    'books/invisible/page (104).png',
    'books/invisible/page (105).png',
    'books/invisible/page (106).png',
    'books/invisible/page (107).png',
    'books/invisible/page (108).png',
    'books/invisible/page (109).png',
    'books/invisible/page (110).png',
    'books/invisible/page (111).png',
    'books/invisible/page (112).png',
    'books/invisible/page (113).png',
    'books/invisible/page (114).png',
    'books/invisible/page (115).png',
    'books/invisible/page (116).png',
    'books/invisible/page (117).png',
    'books/invisible/page (118).png',
    'books/invisible/page (119).png',
    'books/invisible/page (120).png',
    'books/invisible/page (121).png',
    'books/invisible/page (122).png',
    'books/invisible/page (123).png',
    'books/invisible/page (124).png',
    'books/invisible/page (125).png',
    'books/invisible/page (126).png',
    'books/invisible/page (127).png',
    'books/invisible/page (128).png',
    'books/invisible/page (129).png',
    'books/invisible/page (130).png',
    'books/invisible/page (131).png',
    'books/invisible/page (132).png',
    'books/invisible/page (133).png',
    'books/invisible/page (134).png',
    'books/invisible/page (135).png',
    'books/invisible/page (136).png',
    'books/invisible/page (137).png',
    'books/invisible/page (138).png',
    'books/invisible/page (139).png',
    'books/invisible/page (140).png',
    'books/invisible/page (141).png',
    'books/invisible/page (142).png',
    'books/invisible/page (143).png',
    'books/invisible/page (144).png',
    'books/invisible/page (145).png',
    'books/invisible/page (146).png',
    'books/invisible/page (147).png',
    'books/invisible/page (148).png',
    'books/invisible/page (149).png',
    'books/invisible/page (150).png',
    'books/invisible/page (151).png',
    'books/invisible/page (152).png',
    'books/invisible/page (153).png',

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
