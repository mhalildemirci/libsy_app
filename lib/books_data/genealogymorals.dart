import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class genealogymorals extends StatefulWidget {
  const genealogymorals({Key? key}) : super(key: key);

  @override
  State<genealogymorals> createState() => _genealogymoralsState();
}

class _genealogymoralsState extends State<genealogymorals> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/genealogy morals/page (1).png',
    'books/genealogy morals/page (2).png',
    'books/genealogy morals/page (3).png',
    'books/genealogy morals/page (4).png',
    'books/genealogy morals/page (5).png',
    'books/genealogy morals/page (6).png',
    'books/genealogy morals/page (7).png',
    'books/genealogy morals/page (8).png',
    'books/genealogy morals/page (9).png',
    'books/genealogy morals/page (10).png',
    'books/genealogy morals/page (11).png',
    'books/genealogy morals/page (12).png',
    'books/genealogy morals/page (13).png',
    'books/genealogy morals/page (14).png',
    'books/genealogy morals/page (15).png',
    'books/genealogy morals/page (16).png',
    'books/genealogy morals/page (17).png',
    'books/genealogy morals/page (18).png',
    'books/genealogy morals/page (19).png',
    'books/genealogy morals/page (20).png',
    'books/genealogy morals/page (21).png',
    'books/genealogy morals/page (22).png',
    'books/genealogy morals/page (23).png',
    'books/genealogy morals/page (24).png',
    'books/genealogy morals/page (25).png',
    'books/genealogy morals/page (26).png',
    'books/genealogy morals/page (27).png',
    'books/genealogy morals/page (28).png',
    'books/genealogy morals/page (29).png',
    'books/genealogy morals/page (30).png',
    'books/genealogy morals/page (31).png',
    'books/genealogy morals/page (32).png',
    'books/genealogy morals/page (33).png',
    'books/genealogy morals/page (34).png',
    'books/genealogy morals/page (35).png',
    'books/genealogy morals/page (36).png',
    'books/genealogy morals/page (37).png',
    'books/genealogy morals/page (38).png',
    'books/genealogy morals/page (39).png',
    'books/genealogy morals/page (40).png',
    'books/genealogy morals/page (41).png',
    'books/genealogy morals/page (42).png',
    'books/genealogy morals/page (43).png',
    'books/genealogy morals/page (44).png',
    'books/genealogy morals/page (45).png',
    'books/genealogy morals/page (46).png',
    'books/genealogy morals/page (47).png',
    'books/genealogy morals/page (48).png',
    'books/genealogy morals/page (49).png',
    'books/genealogy morals/page (50).png',
    'books/genealogy morals/page (51).png',
    'books/genealogy morals/page (52).png',
    'books/genealogy morals/page (53).png',
    'books/genealogy morals/page (54).png',
    'books/genealogy morals/page (55).png',
    'books/genealogy morals/page (56).png',
    'books/genealogy morals/page (57).png',
    'books/genealogy morals/page (58).png',
    'books/genealogy morals/page (59).png',
    'books/genealogy morals/page (60).png',
    'books/genealogy morals/page (61).png',
    'books/genealogy morals/page (62).png',
    'books/genealogy morals/page (63).png',
    'books/genealogy morals/page (64).png',
    'books/genealogy morals/page (65).png',
    'books/genealogy morals/page (66).png',
    'books/genealogy morals/page (67).png',
    'books/genealogy morals/page (68).png',
    'books/genealogy morals/page (69).png',
    'books/genealogy morals/page (70).png',
    'books/genealogy morals/page (71).png',
    'books/genealogy morals/page (72).png',
    'books/genealogy morals/page (73).png',
    'books/genealogy morals/page (74).png',
    'books/genealogy morals/page (75).png',
    'books/genealogy morals/page (76).png',
    'books/genealogy morals/page (77).png',
    'books/genealogy morals/page (78).png',
    'books/genealogy morals/page (79).png',
    'books/genealogy morals/page (80).png',
    'books/genealogy morals/page (81).png',
    'books/genealogy morals/page (82).png',
    'books/genealogy morals/page (83).png',
    'books/genealogy morals/page (84).png',
    'books/genealogy morals/page (85).png',
    'books/genealogy morals/page (86).png',
    'books/genealogy morals/page (87).png',
    'books/genealogy morals/page (88).png',
    'books/genealogy morals/page (89).png',
    'books/genealogy morals/page (90).png',
    'books/genealogy morals/page (91).png',
    'books/genealogy morals/page (92).png',
    'books/genealogy morals/page (93).png',
    'books/genealogy morals/page (94).png',
    'books/genealogy morals/page (95).png',
    'books/genealogy morals/page (96).png',
    'books/genealogy morals/page (97).png',
    'books/genealogy morals/page (98).png',
    'books/genealogy morals/page (99).png',
    'books/genealogy morals/page (100).png',
    'books/genealogy morals/page (101).png',
    'books/genealogy morals/page (102).png',
    'books/genealogy morals/page (103).png',
    'books/genealogy morals/page (104).png',
    'books/genealogy morals/page (105).png',
    'books/genealogy morals/page (106).png',
    'books/genealogy morals/page (107).png',
    'books/genealogy morals/page (108).png',
    'books/genealogy morals/page (109).png',
    'books/genealogy morals/page (110).png',
    'books/genealogy morals/page (111).png',
    'books/genealogy morals/page (112).png',
    'books/genealogy morals/page (113).png',
    'books/genealogy morals/page (114).png',
    'books/genealogy morals/page (115).png',
    'books/genealogy morals/page (116).png',
    'books/genealogy morals/page (117).png',
    'books/genealogy morals/page (118).png',
    'books/genealogy morals/page (119).png',
    'books/genealogy morals/page (120).png',
    'books/genealogy morals/page (121).png',
    'books/genealogy morals/page (122).png',
    'books/genealogy morals/page (123).png',
    'books/genealogy morals/page (124).png',
    'books/genealogy morals/page (125).png',
    'books/genealogy morals/page (126).png',
    'books/genealogy morals/page (127).png',
    'books/genealogy morals/page (128).png',
    'books/genealogy morals/page (129).png',
    'books/genealogy morals/page (130).png',
    'books/genealogy morals/page (131).png',
    'books/genealogy morals/page (132).png',
    'books/genealogy morals/page (133).png',
    'books/genealogy morals/page (134).png',
    'books/genealogy morals/page (135).png',
    'books/genealogy morals/page (136).png',
    'books/genealogy morals/page (137).png',
    'books/genealogy morals/page (138).png',
    'books/genealogy morals/page (139).png',
    'books/genealogy morals/page (140).png',
    'books/genealogy morals/page (141).png',
    'books/genealogy morals/page (142).png',
    'books/genealogy morals/page (143).png',
    'books/genealogy morals/page (144).png',
    'books/genealogy morals/page (145).png',
    'books/genealogy morals/page (146).png',
    'books/genealogy morals/page (147).png',
    'books/genealogy morals/page (148).png',
    'books/genealogy morals/page (149).png',
    'books/genealogy morals/page (150).png',
    'books/genealogy morals/page (151).png',
    'books/genealogy morals/page (152).png',
    'books/genealogy morals/page (153).png',
    'books/genealogy morals/page (154).png',
    'books/genealogy morals/page (155).png',
    'books/genealogy morals/page (156).png',
    'books/genealogy morals/page (157).png',
    'books/genealogy morals/page (158).png',
    'books/genealogy morals/page (159).png',
    'books/genealogy morals/page (160).png',
    'books/genealogy morals/page (161).png',
    'books/genealogy morals/page (162).png',
    'books/genealogy morals/page (163).png',
    'books/genealogy morals/page (164).png',
    'books/genealogy morals/page (165).png',
    'books/genealogy morals/page (166).png',
    'books/genealogy morals/page (167).png',
    'books/genealogy morals/page (168).png',
    'books/genealogy morals/page (169).png',
    'books/genealogy morals/page (170).png',
    'books/genealogy morals/page (171).png',
    'books/genealogy morals/page (172).png',
    'books/genealogy morals/page (173).png',
    'books/genealogy morals/page (174).png',
    'books/genealogy morals/page (175).png',
    'books/genealogy morals/page (176).png',

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
