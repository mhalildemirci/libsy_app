import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sawyerabroad extends StatefulWidget {
  const sawyerabroad({Key? key}) : super(key: key);

  @override
  State<sawyerabroad> createState() => _ibnbattutaState();
}

class _ibnbattutaState extends State<sawyerabroad> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sawyer abroad/page (1).png',
    'books/sawyer abroad/page (2).png',
    'books/sawyer abroad/page (3).png',
    'books/sawyer abroad/page (4).png',
    'books/sawyer abroad/page (5).png',
    'books/sawyer abroad/page (6).png',
    'books/sawyer abroad/page (7).png',
    'books/sawyer abroad/page (8).png',
    'books/sawyer abroad/page (9).png',
    'books/sawyer abroad/page (10).png',
    'books/sawyer abroad/page (11).png',
    'books/sawyer abroad/page (12).png',
    'books/sawyer abroad/page (13).png',
    'books/sawyer abroad/page (14).png',
    'books/sawyer abroad/page (15).png',
    'books/sawyer abroad/page (16).png',
    'books/sawyer abroad/page (17).png',
    'books/sawyer abroad/page (18).png',
    'books/sawyer abroad/page (19).png',
    'books/sawyer abroad/page (20).png',
    'books/sawyer abroad/page (21).png',
    'books/sawyer abroad/page (22).png',
    'books/sawyer abroad/page (23).png',
    'books/sawyer abroad/page (24).png',
    'books/sawyer abroad/page (25).png',
    'books/sawyer abroad/page (26).png',
    'books/sawyer abroad/page (27).png',
    'books/sawyer abroad/page (28).png',
    'books/sawyer abroad/page (29).png',
    'books/sawyer abroad/page (30).png',
    'books/sawyer abroad/page (31).png',
    'books/sawyer abroad/page (32).png',
    'books/sawyer abroad/page (33).png',
    'books/sawyer abroad/page (34).png',
    'books/sawyer abroad/page (35).png',
    'books/sawyer abroad/page (36).png',
    'books/sawyer abroad/page (37).png',
    'books/sawyer abroad/page (38).png',
    'books/sawyer abroad/page (39).png',
    'books/sawyer abroad/page (40).png',
    'books/sawyer abroad/page (41).png',
    'books/sawyer abroad/page (42).png',
    'books/sawyer abroad/page (43).png',
    'books/sawyer abroad/page (44).png',
    'books/sawyer abroad/page (45).png',
    'books/sawyer abroad/page (46).png',
    'books/sawyer abroad/page (47).png',
    'books/sawyer abroad/page (48).png',
    'books/sawyer abroad/page (49).png',
    'books/sawyer abroad/page (50).png',
    'books/sawyer abroad/page (51).png',
    'books/sawyer abroad/page (52).png',
    'books/sawyer abroad/page (53).png',
    'books/sawyer abroad/page (54).png',
    'books/sawyer abroad/page (55).png',
    'books/sawyer abroad/page (56).png',
    'books/sawyer abroad/page (57).png',
    'books/sawyer abroad/page (58).png',
    'books/sawyer abroad/page (59).png',
    'books/sawyer abroad/page (60).png',
    'books/sawyer abroad/page (61).png',
    'books/sawyer abroad/page (62).png',
    'books/sawyer abroad/page (63).png',
    'books/sawyer abroad/page (64).png',
    'books/sawyer abroad/page (65).png',
    'books/sawyer abroad/page (66).png',
    'books/sawyer abroad/page (67).png',
    'books/sawyer abroad/page (68).png',
    'books/sawyer abroad/page (69).png',
    'books/sawyer abroad/page (70).png',
    'books/sawyer abroad/page (71).png',
    'books/sawyer abroad/page (72).png',
    'books/sawyer abroad/page (73).png',
    'books/sawyer abroad/page (74).png',
    'books/sawyer abroad/page (75).png',
    'books/sawyer abroad/page (76).png',
    'books/sawyer abroad/page (77).png',
    'books/sawyer abroad/page (78).png',
    'books/sawyer abroad/page (79).png',
    'books/sawyer abroad/page (80).png',
    'books/sawyer abroad/page (81).png',
    'books/sawyer abroad/page (82).png',
    'books/sawyer abroad/page (83).png',
    'books/sawyer abroad/page (84).png',
    'books/sawyer abroad/page (85).png',
    'books/sawyer abroad/page (86).png',
    'books/sawyer abroad/page (87).png',
    'books/sawyer abroad/page (88).png',
    'books/sawyer abroad/page (89).png',
    'books/sawyer abroad/page (90).png',
    'books/sawyer abroad/page (91).png',
    'books/sawyer abroad/page (92).png',
    'books/sawyer abroad/page (93).png',
    'books/sawyer abroad/page (94).png',
    'books/sawyer abroad/page (95).png',
    'books/sawyer abroad/page (96).png',
    'books/sawyer abroad/page (97).png',
    'books/sawyer abroad/page (98).png',
    'books/sawyer abroad/page (99).png',
    'books/sawyer abroad/page (100).png',
    'books/sawyer abroad/page (101).png',
    'books/sawyer abroad/page (102).png',
    'books/sawyer abroad/page (103).png',
    'books/sawyer abroad/page (104).png',
    'books/sawyer abroad/page (105).png',
    'books/sawyer abroad/page (106).png',
    'books/sawyer abroad/page (107).png',
    'books/sawyer abroad/page (108).png',
    'books/sawyer abroad/page (109).png',
    'books/sawyer abroad/page (110).png',
    'books/sawyer abroad/page (111).png',
    'books/sawyer abroad/page (112).png',
    'books/sawyer abroad/page (113).png',
    'books/sawyer abroad/page (114).png',
    'books/sawyer abroad/page (115).png',
    'books/sawyer abroad/page (116).png',
    'books/sawyer abroad/page (117).png',
    'books/sawyer abroad/page (118).png',
    'books/sawyer abroad/page (119).png',
    'books/sawyer abroad/page (120).png',
    'books/sawyer abroad/page (121).png',
    'books/sawyer abroad/page (122).png',
    'books/sawyer abroad/page (123).png',
    'books/sawyer abroad/page (124).png',
    'books/sawyer abroad/page (125).png',
    'books/sawyer abroad/page (126).png',
    'books/sawyer abroad/page (127).png',
    'books/sawyer abroad/page (128).png',
    'books/sawyer abroad/page (129).png',
    'books/sawyer abroad/page (130).png',
    'books/sawyer abroad/page (131).png',
    'books/sawyer abroad/page (132).png',
    'books/sawyer abroad/page (133).png',
    'books/sawyer abroad/page (134).png',
    'books/sawyer abroad/page (135).png',
    'books/sawyer abroad/page (136).png',
    'books/sawyer abroad/page (137).png',
    'books/sawyer abroad/page (138).png',
    'books/sawyer abroad/page (139).png',
    'books/sawyer abroad/page (140).png',
    'books/sawyer abroad/page (141).png',
    'books/sawyer abroad/page (142).png',

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
