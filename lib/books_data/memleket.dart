import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class memleket extends StatefulWidget {
  const memleket({Key? key}) : super(key: key);

  @override
  State<memleket> createState() => _memleketState();
}

class _memleketState extends State<memleket> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/memleket/page (1).png',
    'books/memleket/page (2).png',
    'books/memleket/page (3).png',
    'books/memleket/page (4).png',
    'books/memleket/page (5).png',
    'books/memleket/page (6).png',
    'books/memleket/page (7).png',
    'books/memleket/page (8).png',
    'books/memleket/page (9).png',
    'books/memleket/page (10).png',
    'books/memleket/page (11).png',
    'books/memleket/page (12).png',
    'books/memleket/page (13).png',
    'books/memleket/page (14).png',
    'books/memleket/page (15).png',
    'books/memleket/page (16).png',
    'books/memleket/page (17).png',
    'books/memleket/page (18).png',
    'books/memleket/page (19).png',
    'books/memleket/page (20).png',
    'books/memleket/page (21).png',
    'books/memleket/page (22).png',
    'books/memleket/page (23).png',
    'books/memleket/page (24).png',
    'books/memleket/page (25).png',
    'books/memleket/page (26).png',
    'books/memleket/page (27).png',
    'books/memleket/page (28).png',
    'books/memleket/page (29).png',
    'books/memleket/page (30).png',
    'books/memleket/page (31).png',
    'books/memleket/page (32).png',
    'books/memleket/page (33).png',
    'books/memleket/page (34).png',
    'books/memleket/page (35).png',
    'books/memleket/page (36).png',
    'books/memleket/page (37).png',
    'books/memleket/page (38).png',
    'books/memleket/page (39).png',
    'books/memleket/page (40).png',
    'books/memleket/page (41).png',
    'books/memleket/page (42).png',
    'books/memleket/page (43).png',
    'books/memleket/page (44).png',
    'books/memleket/page (45).png',
    'books/memleket/page (46).png',
    'books/memleket/page (47).png',
    'books/memleket/page (48).png',
    'books/memleket/page (49).png',
    'books/memleket/page (50).png',
    'books/memleket/page (51).png',
    'books/memleket/page (52).png',
    'books/memleket/page (53).png',
    'books/memleket/page (54).png',
    'books/memleket/page (55).png',
    'books/memleket/page (56).png',
    'books/memleket/page (57).png',
    'books/memleket/page (58).png',
    'books/memleket/page (59).png',
    'books/memleket/page (60).png',
    'books/memleket/page (61).png',
    'books/memleket/page (62).png',
    'books/memleket/page (63).png',
    'books/memleket/page (64).png',
    'books/memleket/page (65).png',
    'books/memleket/page (66).png',
    'books/memleket/page (67).png',
    'books/memleket/page (68).png',
    'books/memleket/page (69).png',
    'books/memleket/page (70).png',
    'books/memleket/page (71).png',
    'books/memleket/page (72).png',
    'books/memleket/page (73).png',
    'books/memleket/page (74).png',
    'books/memleket/page (75).png',
    'books/memleket/page (76).png',
    'books/memleket/page (77).png',
    'books/memleket/page (78).png',
    'books/memleket/page (79).png',
    'books/memleket/page (80).png',
    'books/memleket/page (81).png',
    'books/memleket/page (82).png',
    'books/memleket/page (83).png',
    'books/memleket/page (84).png',
    'books/memleket/page (85).png',
    'books/memleket/page (86).png',
    'books/memleket/page (87).png',
    'books/memleket/page (88).png',
    'books/memleket/page (89).png',
    'books/memleket/page (90).png',
    'books/memleket/page (91).png',
    'books/memleket/page (92).png',
    'books/memleket/page (93).png',
    'books/memleket/page (94).png',
    'books/memleket/page (95).png',
    'books/memleket/page (96).png',
    'books/memleket/page (97).png',
    'books/memleket/page (98).png',
    'books/memleket/page (99).png',
    'books/memleket/page (100).png',
    'books/memleket/page (101).png',
    'books/memleket/page (102).png',
    'books/memleket/page (103).png',
    'books/memleket/page (104).png',
    'books/memleket/page (105).png',
    'books/memleket/page (106).png',
    'books/memleket/page (107).png',
    'books/memleket/page (108).png',
    'books/memleket/page (109).png',
    'books/memleket/page (110).png',
    'books/memleket/page (111).png',
    'books/memleket/page (112).png',
    'books/memleket/page (113).png',
    'books/memleket/page (114).png',
    'books/memleket/page (115).png',
    'books/memleket/page (116).png',
    'books/memleket/page (117).png',
    'books/memleket/page (118).png',
    'books/memleket/page (119).png',
    'books/memleket/page (120).png',
    'books/memleket/page (121).png',
    'books/memleket/page (122).png',
    'books/memleket/page (123).png',
    'books/memleket/page (124).png',
    'books/memleket/page (125).png',
    'books/memleket/page (126).png',
    'books/memleket/page (127).png',
    'books/memleket/page (128).png',
    'books/memleket/page (129).png',
    'books/memleket/page (130).png',
    'books/memleket/page (131).png',
    'books/memleket/page (132).png',
    'books/memleket/page (133).png',
    'books/memleket/page (134).png',
    'books/memleket/page (135).png',
    'books/memleket/page (136).png',
    'books/memleket/page (137).png',
    'books/memleket/page (138).png',
    'books/memleket/page (139).png',
    'books/memleket/page (140).png',
    'books/memleket/page (141).png',
    'books/memleket/page (142).png',
    'books/memleket/page (143).png',
    'books/memleket/page (144).png',
    'books/memleket/page (145).png',
    'books/memleket/page (146).png',
    'books/memleket/page (147).png',
    'books/memleket/page (148).png',
    'books/memleket/page (149).png',
    'books/memleket/page (150).png',
    'books/memleket/page (151).png',
    'books/memleket/page (152).png',
    'books/memleket/page (153).png',
    'books/memleket/page (154).png',
    'books/memleket/page (155).png',
    'books/memleket/page (156).png',
    'books/memleket/page (157).png',
    'books/memleket/page (158).png',
    'books/memleket/page (159).png',
    'books/memleket/page (160).png',
    'books/memleket/page (161).png',
    'books/memleket/page (162).png',
    'books/memleket/page (163).png',
    'books/memleket/page (164).png',
    'books/memleket/page (165).png',
    'books/memleket/page (166).png',
    'books/memleket/page (167).png',
    'books/memleket/page (168).png',
    'books/memleket/page (169).png',
    'books/memleket/page (170).png',
    'books/memleket/page (171).png',
    'books/memleket/page (172).png',
    'books/memleket/page (173).png',
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
