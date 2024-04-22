import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class icimizdekiseytan extends StatefulWidget {
  const icimizdekiseytan({Key? key}) : super(key: key);

  @override
  State<icimizdekiseytan> createState() => _icimizdekiseytanState();
}

class _icimizdekiseytanState extends State<icimizdekiseytan> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/icimizdeki seytan/page (1).png',
    'books/icimizdeki seytan/page (2).png',
    'books/icimizdeki seytan/page (3).png',
    'books/icimizdeki seytan/page (4).png',
    'books/icimizdeki seytan/page (5).png',
    'books/icimizdeki seytan/page (6).png',
    'books/icimizdeki seytan/page (7).png',
    'books/icimizdeki seytan/page (8).png',
    'books/icimizdeki seytan/page (9).png',
    'books/icimizdeki seytan/page (10).png',
    'books/icimizdeki seytan/page (11).png',
    'books/icimizdeki seytan/page (12).png',
    'books/icimizdeki seytan/page (13).png',
    'books/icimizdeki seytan/page (14).png',
    'books/icimizdeki seytan/page (15).png',
    'books/icimizdeki seytan/page (16).png',
    'books/icimizdeki seytan/page (17).png',
    'books/icimizdeki seytan/page (18).png',
    'books/icimizdeki seytan/page (19).png',
    'books/icimizdeki seytan/page (20).png',
    'books/icimizdeki seytan/page (21).png',
    'books/icimizdeki seytan/page (22).png',
    'books/icimizdeki seytan/page (23).png',
    'books/icimizdeki seytan/page (24).png',
    'books/icimizdeki seytan/page (25).png',
    'books/icimizdeki seytan/page (26).png',
    'books/icimizdeki seytan/page (27).png',
    'books/icimizdeki seytan/page (28).png',
    'books/icimizdeki seytan/page (29).png',
    'books/icimizdeki seytan/page (30).png',
    'books/icimizdeki seytan/page (31).png',
    'books/icimizdeki seytan/page (32).png',
    'books/icimizdeki seytan/page (33).png',
    'books/icimizdeki seytan/page (34).png',
    'books/icimizdeki seytan/page (35).png',
    'books/icimizdeki seytan/page (36).png',
    'books/icimizdeki seytan/page (37).png',
    'books/icimizdeki seytan/page (38).png',
    'books/icimizdeki seytan/page (39).png',
    'books/icimizdeki seytan/page (40).png',
    'books/icimizdeki seytan/page (41).png',
    'books/icimizdeki seytan/page (42).png',
    'books/icimizdeki seytan/page (43).png',
    'books/icimizdeki seytan/page (44).png',
    'books/icimizdeki seytan/page (45).png',
    'books/icimizdeki seytan/page (46).png',
    'books/icimizdeki seytan/page (47).png',
    'books/icimizdeki seytan/page (48).png',
    'books/icimizdeki seytan/page (49).png',
    'books/icimizdeki seytan/page (50).png',
    'books/icimizdeki seytan/page (51).png',
    'books/icimizdeki seytan/page (52).png',
    'books/icimizdeki seytan/page (53).png',
    'books/icimizdeki seytan/page (54).png',
    'books/icimizdeki seytan/page (55).png',
    'books/icimizdeki seytan/page (56).png',
    'books/icimizdeki seytan/page (57).png',
    'books/icimizdeki seytan/page (58).png',
    'books/icimizdeki seytan/page (59).png',
    'books/icimizdeki seytan/page (60).png',
    'books/icimizdeki seytan/page (61).png',
    'books/icimizdeki seytan/page (62).png',
    'books/icimizdeki seytan/page (63).png',
    'books/icimizdeki seytan/page (64).png',
    'books/icimizdeki seytan/page (65).png',
    'books/icimizdeki seytan/page (66).png',
    'books/icimizdeki seytan/page (67).png',
    'books/icimizdeki seytan/page (68).png',
    'books/icimizdeki seytan/page (69).png',
    'books/icimizdeki seytan/page (70).png',
    'books/icimizdeki seytan/page (71).png',
    'books/icimizdeki seytan/page (72).png',
    'books/icimizdeki seytan/page (73).png',
    'books/icimizdeki seytan/page (74).png',
    'books/icimizdeki seytan/page (75).png',
    'books/icimizdeki seytan/page (76).png',
    'books/icimizdeki seytan/page (77).png',
    'books/icimizdeki seytan/page (78).png',
    'books/icimizdeki seytan/page (79).png',
    'books/icimizdeki seytan/page (80).png',
    'books/icimizdeki seytan/page (81).png',
    'books/icimizdeki seytan/page (82).png',
    'books/icimizdeki seytan/page (83).png',
    'books/icimizdeki seytan/page (84).png',
    'books/icimizdeki seytan/page (85).png',
    'books/icimizdeki seytan/page (86).png',
    'books/icimizdeki seytan/page (87).png',
    'books/icimizdeki seytan/page (88).png',
    'books/icimizdeki seytan/page (89).png',
    'books/icimizdeki seytan/page (90).png',
    'books/icimizdeki seytan/page (91).png',
    'books/icimizdeki seytan/page (92).png',
    'books/icimizdeki seytan/page (93).png',
    'books/icimizdeki seytan/page (94).png',
    'books/icimizdeki seytan/page (95).png',
    'books/icimizdeki seytan/page (96).png',
    'books/icimizdeki seytan/page (97).png',
    'books/icimizdeki seytan/page (98).png',
    'books/icimizdeki seytan/page (99).png',
    'books/icimizdeki seytan/page (100).png',
    'books/icimizdeki seytan/page (101).png',
    'books/icimizdeki seytan/page (102).png',
    'books/icimizdeki seytan/page (103).png',
    'books/icimizdeki seytan/page (104).png',
    'books/icimizdeki seytan/page (105).png',
    'books/icimizdeki seytan/page (106).png',
    'books/icimizdeki seytan/page (107).png',
    'books/icimizdeki seytan/page (108).png',
    'books/icimizdeki seytan/page (109).png',
    'books/icimizdeki seytan/page (110).png',
    'books/icimizdeki seytan/page (111).png',
    'books/icimizdeki seytan/page (112).png',
    'books/icimizdeki seytan/page (113).png',
    'books/icimizdeki seytan/page (114).png',
    'books/icimizdeki seytan/page (115).png',
    'books/icimizdeki seytan/page (116).png',
    'books/icimizdeki seytan/page (117).png',
    'books/icimizdeki seytan/page (118).png',
    'books/icimizdeki seytan/page (119).png',
    'books/icimizdeki seytan/page (120).png',
    'books/icimizdeki seytan/page (121).png',
    'books/icimizdeki seytan/page (122).png',
    'books/icimizdeki seytan/page (123).png',
    'books/icimizdeki seytan/page (124).png',
    'books/icimizdeki seytan/page (125).png',
    'books/icimizdeki seytan/page (126).png',
    'books/icimizdeki seytan/page (127).png',
    'books/icimizdeki seytan/page (128).png',
    'books/icimizdeki seytan/page (129).png',
    'books/icimizdeki seytan/page (130).png',
    'books/icimizdeki seytan/page (131).png',
    'books/icimizdeki seytan/page (132).png',
    'books/icimizdeki seytan/page (133).png',
    'books/icimizdeki seytan/page (134).png',
    'books/icimizdeki seytan/page (135).png',
    'books/icimizdeki seytan/page (136).png',
    'books/icimizdeki seytan/page (137).png',
    'books/icimizdeki seytan/page (138).png',
    'books/icimizdeki seytan/page (139).png',
    'books/icimizdeki seytan/page (140).png',
    'books/icimizdeki seytan/page (141).png',
    'books/icimizdeki seytan/page (142).png',
    'books/icimizdeki seytan/page (143).png',
    'books/icimizdeki seytan/page (144).png',
    'books/icimizdeki seytan/page (145).png',
    'books/icimizdeki seytan/page (146).png',
    'books/icimizdeki seytan/page (147).png',
    'books/icimizdeki seytan/page (148).png',
    'books/icimizdeki seytan/page (149).png',
    'books/icimizdeki seytan/page (150).png',
    'books/icimizdeki seytan/page (151).png',
    'books/icimizdeki seytan/page (152).png',
    'books/icimizdeki seytan/page (153).png',
    'books/icimizdeki seytan/page (154).png',
    'books/icimizdeki seytan/page (155).png',
    'books/icimizdeki seytan/page (156).png',
    'books/icimizdeki seytan/page (157).png',
    'books/icimizdeki seytan/page (158).png',
    'books/icimizdeki seytan/page (159).png',
    'books/icimizdeki seytan/page (160).png',
    'books/icimizdeki seytan/page (161).png',
    'books/icimizdeki seytan/page (162).png',
    'books/icimizdeki seytan/page (163).png',
    'books/icimizdeki seytan/page (164).png',
    'books/icimizdeki seytan/page (165).png',
    'books/icimizdeki seytan/page (166).png',
    'books/icimizdeki seytan/page (167).png',
    'books/icimizdeki seytan/page (168).png',
    'books/icimizdeki seytan/page (169).png',
    'books/icimizdeki seytan/page (170).png',
    'books/icimizdeki seytan/page (171).png',
    'books/icimizdeki seytan/page (172).png',
    'books/icimizdeki seytan/page (173).png',
    'books/icimizdeki seytan/page (174).png',
    'books/icimizdeki seytan/page (175).png',
    'books/icimizdeki seytan/page (176).png',
    'books/icimizdeki seytan/page (177).png',
    'books/icimizdeki seytan/page (178).png',

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
