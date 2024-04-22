import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class vicarwakefield extends StatefulWidget {
  const vicarwakefield({Key? key}) : super(key: key);

  @override
  State<vicarwakefield> createState() => _vicarwakefieldState();
}

class _vicarwakefieldState extends State<vicarwakefield> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/vicar wakefield/page (1).png',
    'books/vicar wakefield/page (2).png',
    'books/vicar wakefield/page (3).png',
    'books/vicar wakefield/page (4).png',
    'books/vicar wakefield/page (5).png',
    'books/vicar wakefield/page (6).png',
    'books/vicar wakefield/page (7).png',
    'books/vicar wakefield/page (8).png',
    'books/vicar wakefield/page (9).png',
    'books/vicar wakefield/page (10).png',
    'books/vicar wakefield/page (11).png',
    'books/vicar wakefield/page (12).png',
    'books/vicar wakefield/page (13).png',
    'books/vicar wakefield/page (14).png',
    'books/vicar wakefield/page (15).png',
    'books/vicar wakefield/page (16).png',
    'books/vicar wakefield/page (17).png',
    'books/vicar wakefield/page (18).png',
    'books/vicar wakefield/page (19).png',
    'books/vicar wakefield/page (20).png',
    'books/vicar wakefield/page (21).png',
    'books/vicar wakefield/page (22).png',
    'books/vicar wakefield/page (23).png',
    'books/vicar wakefield/page (24).png',
    'books/vicar wakefield/page (25).png',
    'books/vicar wakefield/page (26).png',
    'books/vicar wakefield/page (27).png',
    'books/vicar wakefield/page (28).png',
    'books/vicar wakefield/page (29).png',
    'books/vicar wakefield/page (30).png',
    'books/vicar wakefield/page (31).png',
    'books/vicar wakefield/page (32).png',
    'books/vicar wakefield/page (33).png',
    'books/vicar wakefield/page (34).png',
    'books/vicar wakefield/page (35).png',
    'books/vicar wakefield/page (36).png',
    'books/vicar wakefield/page (37).png',
    'books/vicar wakefield/page (38).png',
    'books/vicar wakefield/page (39).png',
    'books/vicar wakefield/page (40).png',
    'books/vicar wakefield/page (41).png',
    'books/vicar wakefield/page (42).png',
    'books/vicar wakefield/page (43).png',
    'books/vicar wakefield/page (44).png',
    'books/vicar wakefield/page (45).png',
    'books/vicar wakefield/page (46).png',
    'books/vicar wakefield/page (47).png',
    'books/vicar wakefield/page (48).png',
    'books/vicar wakefield/page (49).png',
    'books/vicar wakefield/page (50).png',
    'books/vicar wakefield/page (51).png',
    'books/vicar wakefield/page (52).png',
    'books/vicar wakefield/page (53).png',
    'books/vicar wakefield/page (54).png',
    'books/vicar wakefield/page (55).png',
    'books/vicar wakefield/page (56).png',
    'books/vicar wakefield/page (57).png',
    'books/vicar wakefield/page (58).png',
    'books/vicar wakefield/page (59).png',
    'books/vicar wakefield/page (60).png',
    'books/vicar wakefield/page (61).png',
    'books/vicar wakefield/page (62).png',
    'books/vicar wakefield/page (63).png',
    'books/vicar wakefield/page (64).png',
    'books/vicar wakefield/page (65).png',
    'books/vicar wakefield/page (66).png',
    'books/vicar wakefield/page (67).png',
    'books/vicar wakefield/page (68).png',
    'books/vicar wakefield/page (69).png',
    'books/vicar wakefield/page (70).png',
    'books/vicar wakefield/page (71).png',
    'books/vicar wakefield/page (72).png',
    'books/vicar wakefield/page (73).png',
    'books/vicar wakefield/page (74).png',
    'books/vicar wakefield/page (75).png',
    'books/vicar wakefield/page (76).png',
    'books/vicar wakefield/page (77).png',
    'books/vicar wakefield/page (78).png',
    'books/vicar wakefield/page (79).png',
    'books/vicar wakefield/page (80).png',
    'books/vicar wakefield/page (81).png',
    'books/vicar wakefield/page (82).png',
    'books/vicar wakefield/page (83).png',
    'books/vicar wakefield/page (84).png',
    'books/vicar wakefield/page (85).png',
    'books/vicar wakefield/page (86).png',
    'books/vicar wakefield/page (87).png',
    'books/vicar wakefield/page (88).png',
    'books/vicar wakefield/page (89).png',
    'books/vicar wakefield/page (90).png',
    'books/vicar wakefield/page (91).png',
    'books/vicar wakefield/page (92).png',
    'books/vicar wakefield/page (93).png',
    'books/vicar wakefield/page (94).png',
    'books/vicar wakefield/page (95).png',
    'books/vicar wakefield/page (96).png',
    'books/vicar wakefield/page (97).png',
    'books/vicar wakefield/page (98).png',
    'books/vicar wakefield/page (99).png',
    'books/vicar wakefield/page (100).png',
    'books/vicar wakefield/page (101).png',
    'books/vicar wakefield/page (102).png',
    'books/vicar wakefield/page (103).png',
    'books/vicar wakefield/page (104).png',
    'books/vicar wakefield/page (105).png',
    'books/vicar wakefield/page (106).png',
    'books/vicar wakefield/page (107).png',
    'books/vicar wakefield/page (108).png',
    'books/vicar wakefield/page (109).png',
    'books/vicar wakefield/page (110).png',
    'books/vicar wakefield/page (111).png',
    'books/vicar wakefield/page (112).png',
    'books/vicar wakefield/page (113).png',
    'books/vicar wakefield/page (114).png',
    'books/vicar wakefield/page (115).png',
    'books/vicar wakefield/page (116).png',
    'books/vicar wakefield/page (117).png',
    'books/vicar wakefield/page (118).png',
    'books/vicar wakefield/page (119).png',
    'books/vicar wakefield/page (120).png',
    'books/vicar wakefield/page (121).png',
    'books/vicar wakefield/page (122).png',
    'books/vicar wakefield/page (123).png',
    'books/vicar wakefield/page (124).png',
    'books/vicar wakefield/page (125).png',
    'books/vicar wakefield/page (126).png',
    'books/vicar wakefield/page (127).png',
    'books/vicar wakefield/page (128).png',
    'books/vicar wakefield/page (129).png',
    'books/vicar wakefield/page (130).png',
    'books/vicar wakefield/page (131).png',
    'books/vicar wakefield/page (132).png',
    'books/vicar wakefield/page (133).png',
    'books/vicar wakefield/page (134).png',
    'books/vicar wakefield/page (135).png',
    'books/vicar wakefield/page (136).png',
    'books/vicar wakefield/page (137).png',
    'books/vicar wakefield/page (138).png',
    'books/vicar wakefield/page (139).png',
    'books/vicar wakefield/page (140).png',
    'books/vicar wakefield/page (141).png',
    'books/vicar wakefield/page (142).png',
    'books/vicar wakefield/page (143).png',
    'books/vicar wakefield/page (144).png',
    'books/vicar wakefield/page (145).png',
    'books/vicar wakefield/page (146).png',
    'books/vicar wakefield/page (147).png',
    'books/vicar wakefield/page (148).png',
    'books/vicar wakefield/page (149).png',
    'books/vicar wakefield/page (150).png',
    'books/vicar wakefield/page (151).png',
    'books/vicar wakefield/page (152).png',
    'books/vicar wakefield/page (153).png',
    'books/vicar wakefield/page (154).png',
    'books/vicar wakefield/page (155).png',
    'books/vicar wakefield/page (156).png',
    'books/vicar wakefield/page (157).png',
    'books/vicar wakefield/page (158).png',
    'books/vicar wakefield/page (159).png',
    'books/vicar wakefield/page (160).png',
    'books/vicar wakefield/page (161).png',
    'books/vicar wakefield/page (162).png',
    'books/vicar wakefield/page (163).png',

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
