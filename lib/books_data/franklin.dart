import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class franklin extends StatefulWidget {
  const franklin({Key? key}) : super(key: key);

  @override
  State<franklin> createState() => _franklinState();
}

class _franklinState extends State<franklin> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Franklin Biography/page (1).png',
    'books/Franklin Biography/page (2).png',
    'books/Franklin Biography/page (3).png',
    'books/Franklin Biography/page (4).png',
    'books/Franklin Biography/page (5).png',
    'books/Franklin Biography/page (6).png',
    'books/Franklin Biography/page (7).png',
    'books/Franklin Biography/page (8).png',
    'books/Franklin Biography/page (9).png',
    'books/Franklin Biography/page (10).png',
    'books/Franklin Biography/page (11).png',
    'books/Franklin Biography/page (12).png',
    'books/Franklin Biography/page (13).png',
    'books/Franklin Biography/page (14).png',
    'books/Franklin Biography/page (15).png',
    'books/Franklin Biography/page (16).png',
    'books/Franklin Biography/page (17).png',
    'books/Franklin Biography/page (18).png',
    'books/Franklin Biography/page (19).png',
    'books/Franklin Biography/page (20).png',
    'books/Franklin Biography/page (21).png',
    'books/Franklin Biography/page (22).png',
    'books/Franklin Biography/page (23).png',
    'books/Franklin Biography/page (24).png',
    'books/Franklin Biography/page (25).png',
    'books/Franklin Biography/page (26).png',
    'books/Franklin Biography/page (27).png',
    'books/Franklin Biography/page (28).png',
    'books/Franklin Biography/page (29).png',
    'books/Franklin Biography/page (30).png',
    'books/Franklin Biography/page (31).png',
    'books/Franklin Biography/page (32).png',
    'books/Franklin Biography/page (33).png',
    'books/Franklin Biography/page (34).png',
    'books/Franklin Biography/page (35).png',
    'books/Franklin Biography/page (36).png',
    'books/Franklin Biography/page (37).png',
    'books/Franklin Biography/page (38).png',
    'books/Franklin Biography/page (39).png',
    'books/Franklin Biography/page (40).png',
    'books/Franklin Biography/page (41).png',
    'books/Franklin Biography/page (42).png',
    'books/Franklin Biography/page (43).png',
    'books/Franklin Biography/page (44).png',
    'books/Franklin Biography/page (45).png',
    'books/Franklin Biography/page (46).png',
    'books/Franklin Biography/page (47).png',
    'books/Franklin Biography/page (48).png',
    'books/Franklin Biography/page (49).png',
    'books/Franklin Biography/page (50).png',
    'books/Franklin Biography/page (51).png',
    'books/Franklin Biography/page (52).png',
    'books/Franklin Biography/page (53).png',
    'books/Franklin Biography/page (54).png',
    'books/Franklin Biography/page (55).png',
    'books/Franklin Biography/page (56).png',
    'books/Franklin Biography/page (57).png',
    'books/Franklin Biography/page (58).png',
    'books/Franklin Biography/page (59).png',
    'books/Franklin Biography/page (60).png',
    'books/Franklin Biography/page (61).png',
    'books/Franklin Biography/page (62).png',
    'books/Franklin Biography/page (63).png',
    'books/Franklin Biography/page (64).png',
    'books/Franklin Biography/page (65).png',
    'books/Franklin Biography/page (66).png',
    'books/Franklin Biography/page (67).png',
    'books/Franklin Biography/page (68).png',
    'books/Franklin Biography/page (69).png',
    'books/Franklin Biography/page (70).png',
    'books/Franklin Biography/page (71).png',
    'books/Franklin Biography/page (72).png',
    'books/Franklin Biography/page (73).png',
    'books/Franklin Biography/page (74).png',
    'books/Franklin Biography/page (75).png',
    'books/Franklin Biography/page (76).png',
    'books/Franklin Biography/page (77).png',
    'books/Franklin Biography/page (78).png',
    'books/Franklin Biography/page (79).png',
    'books/Franklin Biography/page (80).png',
    'books/Franklin Biography/page (81).png',
    'books/Franklin Biography/page (82).png',
    'books/Franklin Biography/page (83).png',
    'books/Franklin Biography/page (84).png',
    'books/Franklin Biography/page (85).png',
    'books/Franklin Biography/page (86).png',
    'books/Franklin Biography/page (87).png',
    'books/Franklin Biography/page (88).png',
    'books/Franklin Biography/page (89).png',
    'books/Franklin Biography/page (90).png',
    'books/Franklin Biography/page (91).png',
    'books/Franklin Biography/page (92).png',
    'books/Franklin Biography/page (93).png',
    'books/Franklin Biography/page (94).png',
    'books/Franklin Biography/page (95).png',
    'books/Franklin Biography/page (96).png',
    'books/Franklin Biography/page (97).png',
    'books/Franklin Biography/page (98).png',
    'books/Franklin Biography/page (99).png',
    'books/Franklin Biography/page (100).png',
    'books/Franklin Biography/page (101).png',
    'books/Franklin Biography/page (102).png',
    'books/Franklin Biography/page (103).png',
    'books/Franklin Biography/page (104).png',
    'books/Franklin Biography/page (105).png',
    'books/Franklin Biography/page (106).png',
    'books/Franklin Biography/page (107).png',
    'books/Franklin Biography/page (108).png',
    'books/Franklin Biography/page (109).png',
    'books/Franklin Biography/page (110).png',
    'books/Franklin Biography/page (111).png',
    'books/Franklin Biography/page (112).png',
    'books/Franklin Biography/page (113).png',
    'books/Franklin Biography/page (114).png',
    'books/Franklin Biography/page (115).png',
    'books/Franklin Biography/page (116).png',
    'books/Franklin Biography/page (117).png',
    'books/Franklin Biography/page (118).png',
    'books/Franklin Biography/page (119).png',
    'books/Franklin Biography/page (120).png',
    'books/Franklin Biography/page (121).png',
    'books/Franklin Biography/page (122).png',
    'books/Franklin Biography/page (123).png',
    'books/Franklin Biography/page (124).png',
    'books/Franklin Biography/page (125).png',
    'books/Franklin Biography/page (126).png',
    'books/Franklin Biography/page (127).png',
    'books/Franklin Biography/page (128).png',
    'books/Franklin Biography/page (129).png',
    'books/Franklin Biography/page (130).png',
    'books/Franklin Biography/page (131).png',
    'books/Franklin Biography/page (132).png',
    'books/Franklin Biography/page (133).png',
    'books/Franklin Biography/page (134).png',
    'books/Franklin Biography/page (135).png',
    'books/Franklin Biography/page (136).png',
    'books/Franklin Biography/page (137).png',
    'books/Franklin Biography/page (138).png',
    'books/Franklin Biography/page (139).png',
    'books/Franklin Biography/page (140).png',
    'books/Franklin Biography/page (141).png',
    'books/Franklin Biography/page (142).png',
    'books/Franklin Biography/page (143).png',
    'books/Franklin Biography/page (144).png',
    'books/Franklin Biography/page (145).png',
    'books/Franklin Biography/page (146).png',
    'books/Franklin Biography/page (147).png',
    'books/Franklin Biography/page (148).png',
    'books/Franklin Biography/page (149).png',
    'books/Franklin Biography/page (150).png',
    'books/Franklin Biography/page (151).png',
    'books/Franklin Biography/page (152).png',
    'books/Franklin Biography/page (153).png',
    'books/Franklin Biography/page (154).png',
    'books/Franklin Biography/page (155).png',
    'books/Franklin Biography/page (156).png',
    'books/Franklin Biography/page (157).png',
    'books/Franklin Biography/page (158).png',
    'books/Franklin Biography/page (159).png',
    'books/Franklin Biography/page (160).png',
    'books/Franklin Biography/page (161).png',
    'books/Franklin Biography/page (162).png',
    'books/Franklin Biography/page (163).png',
    'books/Franklin Biography/page (164).png',
    'books/Franklin Biography/page (165).png',
    'books/Franklin Biography/page (166).png',
    'books/Franklin Biography/page (167).png',
    'books/Franklin Biography/page (168).png',
    'books/Franklin Biography/page (169).png',
    'books/Franklin Biography/page (170).png',
    'books/Franklin Biography/page (171).png',
    'books/Franklin Biography/page (172).png',

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
