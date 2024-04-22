import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ruhadam extends StatefulWidget {
  const ruhadam({Key? key}) : super(key: key);

  @override
  State<ruhadam> createState() => _ruhadamState();
}

class _ruhadamState extends State<ruhadam> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/ruh adam/page (1).png',
    'books/ruh adam/page (2).png',
    'books/ruh adam/page (3).png',
    'books/ruh adam/page (4).png',
    'books/ruh adam/page (5).png',
    'books/ruh adam/page (6).png',
    'books/ruh adam/page (7).png',
    'books/ruh adam/page (8).png',
    'books/ruh adam/page (9).png',
    'books/ruh adam/page (10).png',
    'books/ruh adam/page (11).png',
    'books/ruh adam/page (12).png',
    'books/ruh adam/page (13).png',
    'books/ruh adam/page (14).png',
    'books/ruh adam/page (15).png',
    'books/ruh adam/page (16).png',
    'books/ruh adam/page (17).png',
    'books/ruh adam/page (18).png',
    'books/ruh adam/page (19).png',
    'books/ruh adam/page (20).png',
    'books/ruh adam/page (21).png',
    'books/ruh adam/page (22).png',
    'books/ruh adam/page (23).png',
    'books/ruh adam/page (24).png',
    'books/ruh adam/page (25).png',
    'books/ruh adam/page (26).png',
    'books/ruh adam/page (27).png',
    'books/ruh adam/page (28).png',
    'books/ruh adam/page (29).png',
    'books/ruh adam/page (30).png',
    'books/ruh adam/page (31).png',
    'books/ruh adam/page (32).png',
    'books/ruh adam/page (33).png',
    'books/ruh adam/page (34).png',
    'books/ruh adam/page (35).png',
    'books/ruh adam/page (36).png',
    'books/ruh adam/page (37).png',
    'books/ruh adam/page (38).png',
    'books/ruh adam/page (39).png',
    'books/ruh adam/page (40).png',
    'books/ruh adam/page (41).png',
    'books/ruh adam/page (42).png',
    'books/ruh adam/page (43).png',
    'books/ruh adam/page (44).png',
    'books/ruh adam/page (45).png',
    'books/ruh adam/page (46).png',
    'books/ruh adam/page (47).png',
    'books/ruh adam/page (48).png',
    'books/ruh adam/page (49).png',
    'books/ruh adam/page (50).png',
    'books/ruh adam/page (51).png',
    'books/ruh adam/page (52).png',
    'books/ruh adam/page (53).png',
    'books/ruh adam/page (54).png',
    'books/ruh adam/page (55).png',
    'books/ruh adam/page (56).png',
    'books/ruh adam/page (57).png',
    'books/ruh adam/page (58).png',
    'books/ruh adam/page (59).png',
    'books/ruh adam/page (60).png',
    'books/ruh adam/page (61).png',
    'books/ruh adam/page (62).png',
    'books/ruh adam/page (63).png',
    'books/ruh adam/page (64).png',
    'books/ruh adam/page (65).png',
    'books/ruh adam/page (66).png',
    'books/ruh adam/page (67).png',
    'books/ruh adam/page (68).png',
    'books/ruh adam/page (69).png',
    'books/ruh adam/page (70).png',
    'books/ruh adam/page (71).png',
    'books/ruh adam/page (72).png',
    'books/ruh adam/page (73).png',
    'books/ruh adam/page (74).png',
    'books/ruh adam/page (75).png',
    'books/ruh adam/page (76).png',
    'books/ruh adam/page (77).png',
    'books/ruh adam/page (78).png',
    'books/ruh adam/page (79).png',
    'books/ruh adam/page (80).png',
    'books/ruh adam/page (81).png',
    'books/ruh adam/page (82).png',
    'books/ruh adam/page (83).png',
    'books/ruh adam/page (84).png',
    'books/ruh adam/page (85).png',
    'books/ruh adam/page (86).png',
    'books/ruh adam/page (87).png',
    'books/ruh adam/page (88).png',
    'books/ruh adam/page (89).png',
    'books/ruh adam/page (90).png',
    'books/ruh adam/page (91).png',
    'books/ruh adam/page (92).png',
    'books/ruh adam/page (93).png',
    'books/ruh adam/page (94).png',
    'books/ruh adam/page (95).png',
    'books/ruh adam/page (96).png',
    'books/ruh adam/page (97).png',
    'books/ruh adam/page (98).png',
    'books/ruh adam/page (99).png',
    'books/ruh adam/page (100).png',
    'books/ruh adam/page (101).png',
    'books/ruh adam/page (102).png',
    'books/ruh adam/page (103).png',
    'books/ruh adam/page (104).png',
    'books/ruh adam/page (105).png',
    'books/ruh adam/page (106).png',
    'books/ruh adam/page (107).png',
    'books/ruh adam/page (108).png',
    'books/ruh adam/page (109).png',
    'books/ruh adam/page (110).png',
    'books/ruh adam/page (111).png',
    'books/ruh adam/page (112).png',
    'books/ruh adam/page (113).png',
    'books/ruh adam/page (114).png',
    'books/ruh adam/page (115).png',
    'books/ruh adam/page (116).png',
    'books/ruh adam/page (117).png',
    'books/ruh adam/page (118).png',
    'books/ruh adam/page (119).png',
    'books/ruh adam/page (120).png',
    'books/ruh adam/page (121).png',
    'books/ruh adam/page (122).png',
    'books/ruh adam/page (123).png',
    'books/ruh adam/page (124).png',
    'books/ruh adam/page (125).png',
    'books/ruh adam/page (126).png',
    'books/ruh adam/page (127).png',
    'books/ruh adam/page (128).png',
    'books/ruh adam/page (129).png',
    'books/ruh adam/page (130).png',
    'books/ruh adam/page (131).png',
    'books/ruh adam/page (132).png',
    'books/ruh adam/page (133).png',
    'books/ruh adam/page (134).png',
    'books/ruh adam/page (135).png',
    'books/ruh adam/page (136).png',
    'books/ruh adam/page (137).png',
    'books/ruh adam/page (138).png',
    'books/ruh adam/page (139).png',
    'books/ruh adam/page (140).png',
    'books/ruh adam/page (141).png',
    'books/ruh adam/page (142).png',
    'books/ruh adam/page (143).png',
    'books/ruh adam/page (144).png',
    'books/ruh adam/page (145).png',
    'books/ruh adam/page (146).png',
    'books/ruh adam/page (147).png',
    'books/ruh adam/page (148).png',
    'books/ruh adam/page (149).png',
    'books/ruh adam/page (150).png',
    'books/ruh adam/page (151).png',
    'books/ruh adam/page (152).png',
    'books/ruh adam/page (153).png',
    'books/ruh adam/page (154).png',
    'books/ruh adam/page (155).png',
    'books/ruh adam/page (156).png',
    'books/ruh adam/page (157).png',
    'books/ruh adam/page (158).png',
    'books/ruh adam/page (159).png',
    'books/ruh adam/page (160).png',
    'books/ruh adam/page (161).png',
    'books/ruh adam/page (162).png',
    'books/ruh adam/page (163).png',
    'books/ruh adam/page (164).png',
    'books/ruh adam/page (165).png',
    'books/ruh adam/page (166).png',
    'books/ruh adam/page (167).png',
    'books/ruh adam/page (168).png',
    'books/ruh adam/page (169).png',
    'books/ruh adam/page (170).png',
    'books/ruh adam/page (171).png',
    'books/ruh adam/page (172).png',
    'books/ruh adam/page (173).png',
    'books/ruh adam/page (174).png',
    'books/ruh adam/page (175).png',
    'books/ruh adam/page (176).png',

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
