import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class youngwerther extends StatefulWidget {
  const youngwerther({Key? key}) : super(key: key);

  @override
  State<youngwerther> createState() => _youngwertherState();
}

class _youngwertherState extends State<youngwerther> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sarrow werther/page (1).png',
    'books/sarrow werther/page (2).png',
    'books/sarrow werther/page (3).png',
    'books/sarrow werther/page (4).png',
    'books/sarrow werther/page (5).png',
    'books/sarrow werther/page (6).png',
    'books/sarrow werther/page (7).png',
    'books/sarrow werther/page (8).png',
    'books/sarrow werther/page (9).png',
    'books/sarrow werther/page (10).png',
    'books/sarrow werther/page (11).png',
    'books/sarrow werther/page (12).png',
    'books/sarrow werther/page (13).png',
    'books/sarrow werther/page (14).png',
    'books/sarrow werther/page (15).png',
    'books/sarrow werther/page (16).png',
    'books/sarrow werther/page (17).png',
    'books/sarrow werther/page (18).png',
    'books/sarrow werther/page (19).png',
    'books/sarrow werther/page (20).png',
    'books/sarrow werther/page (21).png',
    'books/sarrow werther/page (22).png',
    'books/sarrow werther/page (23).png',
    'books/sarrow werther/page (24).png',
    'books/sarrow werther/page (25).png',
    'books/sarrow werther/page (26).png',
    'books/sarrow werther/page (27).png',
    'books/sarrow werther/page (28).png',
    'books/sarrow werther/page (29).png',
    'books/sarrow werther/page (30).png',
    'books/sarrow werther/page (31).png',
    'books/sarrow werther/page (32).png',
    'books/sarrow werther/page (33).png',
    'books/sarrow werther/page (34).png',
    'books/sarrow werther/page (35).png',
    'books/sarrow werther/page (36).png',
    'books/sarrow werther/page (37).png',
    'books/sarrow werther/page (38).png',
    'books/sarrow werther/page (39).png',
    'books/sarrow werther/page (40).png',
    'books/sarrow werther/page (41).png',
    'books/sarrow werther/page (42).png',
    'books/sarrow werther/page (43).png',
    'books/sarrow werther/page (44).png',
    'books/sarrow werther/page (45).png',
    'books/sarrow werther/page (46).png',
    'books/sarrow werther/page (47).png',
    'books/sarrow werther/page (48).png',
    'books/sarrow werther/page (49).png',
    'books/sarrow werther/page (50).png',
    'books/sarrow werther/page (51).png',
    'books/sarrow werther/page (52).png',
    'books/sarrow werther/page (53).png',
    'books/sarrow werther/page (54).png',
    'books/sarrow werther/page (55).png',
    'books/sarrow werther/page (56).png',
    'books/sarrow werther/page (57).png',
    'books/sarrow werther/page (58).png',
    'books/sarrow werther/page (59).png',
    'books/sarrow werther/page (60).png',
    'books/sarrow werther/page (61).png',
    'books/sarrow werther/page (62).png',
    'books/sarrow werther/page (63).png',
    'books/sarrow werther/page (64).png',
    'books/sarrow werther/page (65).png',
    'books/sarrow werther/page (66).png',
    'books/sarrow werther/page (67).png',
    'books/sarrow werther/page (68).png',
    'books/sarrow werther/page (69).png',
    'books/sarrow werther/page (70).png',
    'books/sarrow werther/page (71).png',
    'books/sarrow werther/page (72).png',
    'books/sarrow werther/page (73).png',
    'books/sarrow werther/page (74).png',
    'books/sarrow werther/page (75).png',
    'books/sarrow werther/page (76).png',
    'books/sarrow werther/page (77).png',
    'books/sarrow werther/page (78).png',
    'books/sarrow werther/page (79).png',
    'books/sarrow werther/page (80).png',
    'books/sarrow werther/page (81).png',
    'books/sarrow werther/page (82).png',
    'books/sarrow werther/page (83).png',
    'books/sarrow werther/page (84).png',
    'books/sarrow werther/page (85).png',
    'books/sarrow werther/page (86).png',
    'books/sarrow werther/page (87).png',
    'books/sarrow werther/page (88).png',
    'books/sarrow werther/page (89).png',
    'books/sarrow werther/page (90).png',
    'books/sarrow werther/page (91).png',
    'books/sarrow werther/page (92).png',
    'books/sarrow werther/page (93).png',
    'books/sarrow werther/page (94).png',
    'books/sarrow werther/page (95).png',
    'books/sarrow werther/page (96).png',
    'books/sarrow werther/page (97).png',
    'books/sarrow werther/page (98).png',
    'books/sarrow werther/page (99).png',
    'books/sarrow werther/page (100).png',
    'books/sarrow werther/page (101).png',
    'books/sarrow werther/page (102).png',
    'books/sarrow werther/page (103).png',
    'books/sarrow werther/page (104).png',
    'books/sarrow werther/page (105).png',
    'books/sarrow werther/page (106).png',
    'books/sarrow werther/page (107).png',
    'books/sarrow werther/page (108).png',
    'books/sarrow werther/page (109).png',
    'books/sarrow werther/page (110).png',
    'books/sarrow werther/page (111).png',
    'books/sarrow werther/page (112).png',
    'books/sarrow werther/page (113).png',
    'books/sarrow werther/page (114).png',
    'books/sarrow werther/page (115).png',
    'books/sarrow werther/page (116).png',
    'books/sarrow werther/page (117).png',
    'books/sarrow werther/page (118).png',
    'books/sarrow werther/page (119).png',
    'books/sarrow werther/page (120).png',
    'books/sarrow werther/page (121).png',
    'books/sarrow werther/page (122).png',
    'books/sarrow werther/page (123).png',
    'books/sarrow werther/page (124).png',
    'books/sarrow werther/page (125).png',
    'books/sarrow werther/page (126).png',
    'books/sarrow werther/page (127).png',
    'books/sarrow werther/page (128).png',
    'books/sarrow werther/page (129).png',
    'books/sarrow werther/page (130).png',
    'books/sarrow werther/page (131).png',
    'books/sarrow werther/page (132).png',
    'books/sarrow werther/page (133).png',
    'books/sarrow werther/page (134).png',
    'books/sarrow werther/page (135).png',
    'books/sarrow werther/page (136).png',
    'books/sarrow werther/page (137).png',
    'books/sarrow werther/page (138).png',
    'books/sarrow werther/page (139).png',
    'books/sarrow werther/page (140).png',
    'books/sarrow werther/page (141).png',
    'books/sarrow werther/page (142).png',
    'books/sarrow werther/page (143).png',
    'books/sarrow werther/page (144).png',
    'books/sarrow werther/page (145).png',
    'books/sarrow werther/page (146).png',
    'books/sarrow werther/page (147).png',
    'books/sarrow werther/page (148).png',
    'books/sarrow werther/page (149).png',
    'books/sarrow werther/page (150).png',
    'books/sarrow werther/page (151).png',
    'books/sarrow werther/page (152).png',
    'books/sarrow werther/page (153).png',
    'books/sarrow werther/page (154).png',
    'books/sarrow werther/page (155).png',
    'books/sarrow werther/page (156).png',
    'books/sarrow werther/page (157).png',
    'books/sarrow werther/page (158).png',
    'books/sarrow werther/page (159).png',
    'books/sarrow werther/page (160).png',
    'books/sarrow werther/page (161).png',
    'books/sarrow werther/page (162).png',
    'books/sarrow werther/page (163).png',
    'books/sarrow werther/page (164).png',
    'books/sarrow werther/page (165).png',
    'books/sarrow werther/page (166).png',
    'books/sarrow werther/page (167).png',
    'books/sarrow werther/page (168).png',
    'books/sarrow werther/page (169).png',
    'books/sarrow werther/page (170).png',
    'books/sarrow werther/page (171).png',
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
