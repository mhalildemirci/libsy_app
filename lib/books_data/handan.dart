import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class handan extends StatefulWidget {
  const handan({Key? key}) : super(key: key);

  @override
  State<handan> createState() => _handanState();
}

class _handanState extends State<handan> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/handan/page (1).png',
    'books/handan/page (2).png',
    'books/handan/page (3).png',
    'books/handan/page (4).png',
    'books/handan/page (5).png',
    'books/handan/page (6).png',
    'books/handan/page (7).png',
    'books/handan/page (8).png',
    'books/handan/page (9).png',
    'books/handan/page (10).png',
    'books/handan/page (11).png',
    'books/handan/page (12).png',
    'books/handan/page (13).png',
    'books/handan/page (14).png',
    'books/handan/page (15).png',
    'books/handan/page (16).png',
    'books/handan/page (17).png',
    'books/handan/page (18).png',
    'books/handan/page (19).png',
    'books/handan/page (20).png',
    'books/handan/page (21).png',
    'books/handan/page (22).png',
    'books/handan/page (23).png',
    'books/handan/page (24).png',
    'books/handan/page (25).png',
    'books/handan/page (26).png',
    'books/handan/page (27).png',
    'books/handan/page (28).png',
    'books/handan/page (29).png',
    'books/handan/page (30).png',
    'books/handan/page (31).png',
    'books/handan/page (32).png',
    'books/handan/page (33).png',
    'books/handan/page (34).png',
    'books/handan/page (35).png',
    'books/handan/page (36).png',
    'books/handan/page (37).png',
    'books/handan/page (38).png',
    'books/handan/page (39).png',
    'books/handan/page (40).png',
    'books/handan/page (41).png',
    'books/handan/page (42).png',
    'books/handan/page (43).png',
    'books/handan/page (44).png',
    'books/handan/page (45).png',
    'books/handan/page (46).png',
    'books/handan/page (47).png',
    'books/handan/page (48).png',
    'books/handan/page (49).png',
    'books/handan/page (50).png',
    'books/handan/page (51).png',
    'books/handan/page (52).png',
    'books/handan/page (53).png',
    'books/handan/page (54).png',
    'books/handan/page (55).png',
    'books/handan/page (56).png',
    'books/handan/page (57).png',
    'books/handan/page (58).png',
    'books/handan/page (59).png',
    'books/handan/page (60).png',
    'books/handan/page (61).png',
    'books/handan/page (62).png',
    'books/handan/page (63).png',
    'books/handan/page (64).png',
    'books/handan/page (65).png',
    'books/handan/page (66).png',
    'books/handan/page (67).png',
    'books/handan/page (68).png',
    'books/handan/page (69).png',
    'books/handan/page (70).png',
    'books/handan/page (71).png',
    'books/handan/page (72).png',
    'books/handan/page (73).png',
    'books/handan/page (74).png',
    'books/handan/page (75).png',
    'books/handan/page (76).png',
    'books/handan/page (77).png',
    'books/handan/page (78).png',
    'books/handan/page (79).png',
    'books/handan/page (80).png',
    'books/handan/page (81).png',
    'books/handan/page (82).png',
    'books/handan/page (83).png',
    'books/handan/page (84).png',
    'books/handan/page (85).png',
    'books/handan/page (86).png',
    'books/handan/page (87).png',
    'books/handan/page (88).png',
    'books/handan/page (89).png',
    'books/handan/page (90).png',
    'books/handan/page (91).png',
    'books/handan/page (92).png',
    'books/handan/page (93).png',
    'books/handan/page (94).png',
    'books/handan/page (95).png',
    'books/handan/page (96).png',
    'books/handan/page (97).png',
    'books/handan/page (98).png',
    'books/handan/page (99).png',
    'books/handan/page (100).png',
    'books/handan/page (101).png',
    'books/handan/page (102).png',
    'books/handan/page (103).png',
    'books/handan/page (104).png',
    'books/handan/page (105).png',
    'books/handan/page (106).png',
    'books/handan/page (107).png',
    'books/handan/page (108).png',
    'books/handan/page (109).png',
    'books/handan/page (110).png',
    'books/handan/page (111).png',
    'books/handan/page (112).png',
    'books/handan/page (113).png',
    'books/handan/page (114).png',
    'books/handan/page (115).png',
    'books/handan/page (116).png',
    'books/handan/page (117).png',
    'books/handan/page (118).png',
    'books/handan/page (119).png',
    'books/handan/page (120).png',
    'books/handan/page (121).png',
    'books/handan/page (122).png',
    'books/handan/page (123).png',
    'books/handan/page (124).png',
    'books/handan/page (125).png',
    'books/handan/page (126).png',
    'books/handan/page (127).png',
    'books/handan/page (128).png',
    'books/handan/page (129).png',
    'books/handan/page (130).png',
    'books/handan/page (131).png',
    'books/handan/page (132).png',
    'books/handan/page (133).png',
    'books/handan/page (134).png',
    'books/handan/page (135).png',
    'books/handan/page (136).png',
    'books/handan/page (137).png',
    'books/handan/page (138).png',
    'books/handan/page (139).png',
    'books/handan/page (140).png',
    'books/handan/page (141).png',
    'books/handan/page (142).png',
    'books/handan/page (143).png',
    'books/handan/page (144).png',
    'books/handan/page (145).png',
    'books/handan/page (146).png',
    'books/handan/page (147).png',
    'books/handan/page (148).png',
    'books/handan/page (149).png',
    'books/handan/page (150).png',
    'books/handan/page (151).png',
    'books/handan/page (152).png',
    'books/handan/page (153).png',

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
