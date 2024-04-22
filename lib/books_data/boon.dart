import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class boon extends StatefulWidget {
  const boon({Key? key}) : super(key: key);

  @override
  State<boon> createState() => _boonState();
}

class _boonState extends State<boon> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/boon/page (1).png',
    'books/boon/page (2).png',
    'books/boon/page (3).png',
    'books/boon/page (4).png',
    'books/boon/page (5).png',
    'books/boon/page (6).png',
    'books/boon/page (7).png',
    'books/boon/page (8).png',
    'books/boon/page (9).png',
    'books/boon/page (10).png',
    'books/boon/page (11).png',
    'books/boon/page (12).png',
    'books/boon/page (13).png',
    'books/boon/page (14).png',
    'books/boon/page (15).png',
    'books/boon/page (16).png',
    'books/boon/page (17).png',
    'books/boon/page (18).png',
    'books/boon/page (19).png',
    'books/boon/page (20).png',
    'books/boon/page (21).png',
    'books/boon/page (22).png',
    'books/boon/page (23).png',
    'books/boon/page (24).png',
    'books/boon/page (25).png',
    'books/boon/page (26).png',
    'books/boon/page (27).png',
    'books/boon/page (28).png',
    'books/boon/page (29).png',
    'books/boon/page (30).png',
    'books/boon/page (31).png',
    'books/boon/page (32).png',
    'books/boon/page (33).png',
    'books/boon/page (34).png',
    'books/boon/page (35).png',
    'books/boon/page (36).png',
    'books/boon/page (37).png',
    'books/boon/page (38).png',
    'books/boon/page (39).png',
    'books/boon/page (40).png',
    'books/boon/page (41).png',
    'books/boon/page (42).png',
    'books/boon/page (43).png',
    'books/boon/page (44).png',
    'books/boon/page (45).png',
    'books/boon/page (46).png',
    'books/boon/page (47).png',
    'books/boon/page (48).png',
    'books/boon/page (49).png',
    'books/boon/page (50).png',
    'books/boon/page (51).png',
    'books/boon/page (52).png',
    'books/boon/page (53).png',
    'books/boon/page (54).png',
    'books/boon/page (55).png',
    'books/boon/page (56).png',
    'books/boon/page (57).png',
    'books/boon/page (58).png',
    'books/boon/page (59).png',
    'books/boon/page (60).png',
    'books/boon/page (61).png',
    'books/boon/page (62).png',
    'books/boon/page (63).png',
    'books/boon/page (64).png',
    'books/boon/page (65).png',
    'books/boon/page (66).png',
    'books/boon/page (67).png',
    'books/boon/page (68).png',
    'books/boon/page (69).png',
    'books/boon/page (70).png',
    'books/boon/page (71).png',
    'books/boon/page (72).png',
    'books/boon/page (73).png',
    'books/boon/page (74).png',
    'books/boon/page (75).png',
    'books/boon/page (76).png',
    'books/boon/page (77).png',
    'books/boon/page (78).png',
    'books/boon/page (79).png',
    'books/boon/page (80).png',
    'books/boon/page (81).png',
    'books/boon/page (82).png',
    'books/boon/page (83).png',
    'books/boon/page (84).png',
    'books/boon/page (85).png',
    'books/boon/page (86).png',
    'books/boon/page (87).png',
    'books/boon/page (88).png',
    'books/boon/page (89).png',
    'books/boon/page (90).png',
    'books/boon/page (91).png',
    'books/boon/page (92).png',
    'books/boon/page (93).png',
    'books/boon/page (94).png',
    'books/boon/page (95).png',
    'books/boon/page (96).png',
    'books/boon/page (97).png',
    'books/boon/page (98).png',
    'books/boon/page (99).png',
    'books/boon/page (100).png',
    'books/boon/page (101).png',
    'books/boon/page (102).png',
    'books/boon/page (103).png',
    'books/boon/page (104).png',
    'books/boon/page (105).png',
    'books/boon/page (106).png',
    'books/boon/page (107).png',
    'books/boon/page (108).png',
    'books/boon/page (109).png',
    'books/boon/page (110).png',
    'books/boon/page (111).png',
    'books/boon/page (112).png',
    'books/boon/page (113).png',
    'books/boon/page (114).png',
    'books/boon/page (115).png',
    'books/boon/page (116).png',
    'books/boon/page (117).png',
    'books/boon/page (118).png',
    'books/boon/page (119).png',
    'books/boon/page (120).png',
    'books/boon/page (121).png',
    'books/boon/page (122).png',
    'books/boon/page (123).png',
    'books/boon/page (124).png',
    'books/boon/page (125).png',
    'books/boon/page (126).png',
    'books/boon/page (127).png',
    'books/boon/page (128).png',
    'books/boon/page (129).png',
    'books/boon/page (130).png',
    'books/boon/page (131).png',
    'books/boon/page (132).png',
    'books/boon/page (133).png',
    'books/boon/page (134).png',
    'books/boon/page (135).png',
    'books/boon/page (136).png',
    'books/boon/page (137).png',
    'books/boon/page (138).png',
    'books/boon/page (139).png',
    'books/boon/page (140).png',
    'books/boon/page (141).png',
    'books/boon/page (142).png',
    'books/boon/page (143).png',
    'books/boon/page (144).png',
    'books/boon/page (145).png',
    'books/boon/page (146).png',
    'books/boon/page (147).png',
    'books/boon/page (148).png',

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
