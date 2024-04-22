import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hisfifty extends StatefulWidget {
  const hisfifty({Key? key}) : super(key: key);

  @override
  State<hisfifty> createState() => _hisfiftyState();
}

class _hisfiftyState extends State<hisfifty> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/his fifty/page (1).png',
    'books/his fifty/page (2).png',
    'books/his fifty/page (3).png',
    'books/his fifty/page (4).png',
    'books/his fifty/page (5).png',
    'books/his fifty/page (6).png',
    'books/his fifty/page (7).png',
    'books/his fifty/page (8).png',
    'books/his fifty/page (9).png',
    'books/his fifty/page (10).png',
    'books/his fifty/page (11).png',
    'books/his fifty/page (12).png',
    'books/his fifty/page (13).png',
    'books/his fifty/page (14).png',
    'books/his fifty/page (15).png',
    'books/his fifty/page (16).png',
    'books/his fifty/page (17).png',
    'books/his fifty/page (18).png',
    'books/his fifty/page (19).png',
    'books/his fifty/page (20).png',
    'books/his fifty/page (21).png',
    'books/his fifty/page (22).png',
    'books/his fifty/page (23).png',
    'books/his fifty/page (24).png',
    'books/his fifty/page (25).png',
    'books/his fifty/page (26).png',
    'books/his fifty/page (27).png',
    'books/his fifty/page (28).png',
    'books/his fifty/page (29).png',
    'books/his fifty/page (30).png',
    'books/his fifty/page (31).png',
    'books/his fifty/page (32).png',
    'books/his fifty/page (33).png',
    'books/his fifty/page (34).png',
    'books/his fifty/page (35).png',
    'books/his fifty/page (36).png',
    'books/his fifty/page (37).png',
    'books/his fifty/page (38).png',
    'books/his fifty/page (39).png',
    'books/his fifty/page (40).png',
    'books/his fifty/page (41).png',
    'books/his fifty/page (42).png',
    'books/his fifty/page (43).png',
    'books/his fifty/page (44).png',
    'books/his fifty/page (45).png',
    'books/his fifty/page (46).png',
    'books/his fifty/page (47).png',
    'books/his fifty/page (48).png',
    'books/his fifty/page (49).png',
    'books/his fifty/page (50).png',
    'books/his fifty/page (51).png',
    'books/his fifty/page (52).png',
    'books/his fifty/page (53).png',
    'books/his fifty/page (54).png',
    'books/his fifty/page (55).png',
    'books/his fifty/page (56).png',
    'books/his fifty/page (57).png',
    'books/his fifty/page (58).png',
    'books/his fifty/page (59).png',
    'books/his fifty/page (60).png',
    'books/his fifty/page (61).png',
    'books/his fifty/page (62).png',
    'books/his fifty/page (63).png',
    'books/his fifty/page (64).png',
    'books/his fifty/page (65).png',
    'books/his fifty/page (66).png',
    'books/his fifty/page (67).png',
    'books/his fifty/page (68).png',
    'books/his fifty/page (69).png',
    'books/his fifty/page (70).png',
    'books/his fifty/page (71).png',
    'books/his fifty/page (72).png',
    'books/his fifty/page (73).png',
    'books/his fifty/page (74).png',
    'books/his fifty/page (75).png',
    'books/his fifty/page (76).png',
    'books/his fifty/page (77).png',
    'books/his fifty/page (78).png',
    'books/his fifty/page (79).png',
    'books/his fifty/page (80).png',
    'books/his fifty/page (81).png',
    'books/his fifty/page (82).png',
    'books/his fifty/page (83).png',
    'books/his fifty/page (84).png',
    'books/his fifty/page (85).png',
    'books/his fifty/page (86).png',
    'books/his fifty/page (87).png',
    'books/his fifty/page (88).png',
    'books/his fifty/page (89).png',
    'books/his fifty/page (90).png',
    'books/his fifty/page (91).png',
    'books/his fifty/page (92).png',
    'books/his fifty/page (93).png',
    'books/his fifty/page (94).png',
    'books/his fifty/page (95).png',
    'books/his fifty/page (96).png',
    'books/his fifty/page (97).png',
    'books/his fifty/page (98).png',
    'books/his fifty/page (99).png',
    'books/his fifty/page (100).png',
    'books/his fifty/page (101).png',
    'books/his fifty/page (102).png',
    'books/his fifty/page (103).png',
    'books/his fifty/page (104).png',
    'books/his fifty/page (105).png',
    'books/his fifty/page (106).png',
    'books/his fifty/page (107).png',
    'books/his fifty/page (108).png',
    'books/his fifty/page (109).png',
    'books/his fifty/page (110).png',
    'books/his fifty/page (111).png',
    'books/his fifty/page (112).png',
    'books/his fifty/page (113).png',
    'books/his fifty/page (114).png',
    'books/his fifty/page (115).png',
    'books/his fifty/page (116).png',
    'books/his fifty/page (117).png',
    'books/his fifty/page (118).png',
    'books/his fifty/page (119).png',
    'books/his fifty/page (120).png',
    'books/his fifty/page (121).png',
    'books/his fifty/page (122).png',
    'books/his fifty/page (123).png',
    'books/his fifty/page (124).png',
    'books/his fifty/page (125).png',
    'books/his fifty/page (126).png',
    'books/his fifty/page (127).png',
    'books/his fifty/page (128).png',
    'books/his fifty/page (129).png',
    'books/his fifty/page (130).png',
    'books/his fifty/page (131).png',
    'books/his fifty/page (132).png',
    'books/his fifty/page (133).png',
    'books/his fifty/page (134).png',
    'books/his fifty/page (135).png',
    'books/his fifty/page (136).png',
    'books/his fifty/page (137).png',
    'books/his fifty/page (138).png',
    'books/his fifty/page (139).png',
    'books/his fifty/page (140).png',
    'books/his fifty/page (141).png',
    'books/his fifty/page (142).png',
    'books/his fifty/page (143).png',
    'books/his fifty/page (144).png',
    'books/his fifty/page (145).png',
    'books/his fifty/page (146).png',
    'books/his fifty/page (147).png',
    'books/his fifty/page (148).png',
    'books/his fifty/page (149).png',
    'books/his fifty/page (150).png',
    'books/his fifty/page (151).png',
    'books/his fifty/page (152).png',
    'books/his fifty/page (153).png',
    'books/his fifty/page (154).png',
    'books/his fifty/page (155).png',
    'books/his fifty/page (156).png',
    'books/his fifty/page (157).png',
    'books/his fifty/page (158).png',
    'books/his fifty/page (159).png',
    'books/his fifty/page (160).png',
    'books/his fifty/page (161).png',
    'books/his fifty/page (162).png',
    'books/his fifty/page (163).png',
    'books/his fifty/page (164).png',
    'books/his fifty/page (165).png',
    'books/his fifty/page (166).png',
    'books/his fifty/page (167).png',
    'books/his fifty/page (168).png',
    'books/his fifty/page (169).png',
    'books/his fifty/page (170).png',
    'books/his fifty/page (171).png',
    'books/his fifty/page (172).png',
    'books/his fifty/page (173).png',
    'books/his fifty/page (174).png',
    'books/his fifty/page (175).png',
    'books/his fifty/page (176).png',
    'books/his fifty/page (177).png',
    'books/his fifty/page (178).png',
    'books/his fifty/page (179).png',
    'books/his fifty/page (180).png',
    'books/his fifty/page (181).png',
    'books/his fifty/page (182).png',
    'books/his fifty/page (183).png',

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
