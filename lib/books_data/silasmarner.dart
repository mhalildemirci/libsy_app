import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class silasmarner extends StatefulWidget {
  const silasmarner({Key? key}) : super(key: key);

  @override
  State<silasmarner> createState() => _silasmarnerState();
}

class _silasmarnerState extends State<silasmarner> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/silas marner/page (1).png',
    'books/silas marner/page (2).png',
    'books/silas marner/page (3).png',
    'books/silas marner/page (4).png',
    'books/silas marner/page (5).png',
    'books/silas marner/page (6).png',
    'books/silas marner/page (7).png',
    'books/silas marner/page (8).png',
    'books/silas marner/page (9).png',
    'books/silas marner/page (10).png',
    'books/silas marner/page (11).png',
    'books/silas marner/page (12).png',
    'books/silas marner/page (13).png',
    'books/silas marner/page (14).png',
    'books/silas marner/page (15).png',
    'books/silas marner/page (16).png',
    'books/silas marner/page (17).png',
    'books/silas marner/page (18).png',
    'books/silas marner/page (19).png',
    'books/silas marner/page (20).png',
    'books/silas marner/page (21).png',
    'books/silas marner/page (22).png',
    'books/silas marner/page (23).png',
    'books/silas marner/page (24).png',
    'books/silas marner/page (25).png',
    'books/silas marner/page (26).png',
    'books/silas marner/page (27).png',
    'books/silas marner/page (28).png',
    'books/silas marner/page (29).png',
    'books/silas marner/page (30).png',
    'books/silas marner/page (31).png',
    'books/silas marner/page (32).png',
    'books/silas marner/page (33).png',
    'books/silas marner/page (34).png',
    'books/silas marner/page (35).png',
    'books/silas marner/page (36).png',
    'books/silas marner/page (37).png',
    'books/silas marner/page (38).png',
    'books/silas marner/page (39).png',
    'books/silas marner/page (40).png',
    'books/silas marner/page (41).png',
    'books/silas marner/page (42).png',
    'books/silas marner/page (43).png',
    'books/silas marner/page (44).png',
    'books/silas marner/page (45).png',
    'books/silas marner/page (46).png',
    'books/silas marner/page (47).png',
    'books/silas marner/page (48).png',
    'books/silas marner/page (49).png',
    'books/silas marner/page (50).png',
    'books/silas marner/page (51).png',
    'books/silas marner/page (52).png',
    'books/silas marner/page (53).png',
    'books/silas marner/page (54).png',
    'books/silas marner/page (55).png',
    'books/silas marner/page (56).png',
    'books/silas marner/page (57).png',
    'books/silas marner/page (58).png',
    'books/silas marner/page (59).png',
    'books/silas marner/page (60).png',
    'books/silas marner/page (61).png',
    'books/silas marner/page (62).png',
    'books/silas marner/page (63).png',
    'books/silas marner/page (64).png',
    'books/silas marner/page (65).png',
    'books/silas marner/page (66).png',
    'books/silas marner/page (67).png',
    'books/silas marner/page (68).png',
    'books/silas marner/page (69).png',
    'books/silas marner/page (70).png',
    'books/silas marner/page (71).png',
    'books/silas marner/page (72).png',
    'books/silas marner/page (73).png',
    'books/silas marner/page (74).png',
    'books/silas marner/page (75).png',
    'books/silas marner/page (76).png',
    'books/silas marner/page (77).png',
    'books/silas marner/page (78).png',
    'books/silas marner/page (79).png',
    'books/silas marner/page (80).png',
    'books/silas marner/page (81).png',
    'books/silas marner/page (82).png',
    'books/silas marner/page (83).png',
    'books/silas marner/page (84).png',
    'books/silas marner/page (85).png',
    'books/silas marner/page (86).png',
    'books/silas marner/page (87).png',
    'books/silas marner/page (88).png',
    'books/silas marner/page (89).png',
    'books/silas marner/page (90).png',
    'books/silas marner/page (91).png',
    'books/silas marner/page (92).png',
    'books/silas marner/page (93).png',
    'books/silas marner/page (94).png',
    'books/silas marner/page (95).png',
    'books/silas marner/page (96).png',
    'books/silas marner/page (97).png',
    'books/silas marner/page (98).png',
    'books/silas marner/page (99).png',
    'books/silas marner/page (100).png',
    'books/silas marner/page (101).png',
    'books/silas marner/page (102).png',
    'books/silas marner/page (103).png',
    'books/silas marner/page (104).png',
    'books/silas marner/page (105).png',
    'books/silas marner/page (106).png',
    'books/silas marner/page (107).png',
    'books/silas marner/page (108).png',
    'books/silas marner/page (109).png',
    'books/silas marner/page (110).png',
    'books/silas marner/page (111).png',
    'books/silas marner/page (112).png',
    'books/silas marner/page (113).png',
    'books/silas marner/page (114).png',
    'books/silas marner/page (115).png',
    'books/silas marner/page (116).png',
    'books/silas marner/page (117).png',
    'books/silas marner/page (118).png',
    'books/silas marner/page (119).png',
    'books/silas marner/page (120).png',
    'books/silas marner/page (121).png',
    'books/silas marner/page (122).png',
    'books/silas marner/page (123).png',
    'books/silas marner/page (124).png',
    'books/silas marner/page (125).png',
    'books/silas marner/page (126).png',
    'books/silas marner/page (127).png',
    'books/silas marner/page (128).png',
    'books/silas marner/page (129).png',
    'books/silas marner/page (130).png',
    'books/silas marner/page (131).png',
    'books/silas marner/page (132).png',
    'books/silas marner/page (133).png',
    'books/silas marner/page (134).png',
    'books/silas marner/page (135).png',
    'books/silas marner/page (136).png',
    'books/silas marner/page (137).png',
    'books/silas marner/page (138).png',
    'books/silas marner/page (139).png',
    'books/silas marner/page (140).png',
    'books/silas marner/page (141).png',
    'books/silas marner/page (142).png',
    'books/silas marner/page (143).png',
    'books/silas marner/page (144).png',
    'books/silas marner/page (145).png',
    'books/silas marner/page (146).png',
    'books/silas marner/page (147).png',
    'books/silas marner/page (148).png',
    'books/silas marner/page (149).png',
    'books/silas marner/page (150).png',
    'books/silas marner/page (151).png',
    'books/silas marner/page (152).png',
    'books/silas marner/page (153).png',
    'books/silas marner/page (154).png',
    'books/silas marner/page (155).png',
    'books/silas marner/page (156).png',
    'books/silas marner/page (157).png',
    'books/silas marner/page (158).png',
    'books/silas marner/page (159).png',
    'books/silas marner/page (160).png',
    'books/silas marner/page (161).png',
    'books/silas marner/page (162).png',
    'books/silas marner/page (163).png',
    'books/silas marner/page (164).png',
    'books/silas marner/page (165).png',
    'books/silas marner/page (166).png',
    'books/silas marner/page (167).png',
    'books/silas marner/page (168).png',
    'books/silas marner/page (169).png',
    'books/silas marner/page (170).png',
    'books/silas marner/page (171).png',
    'books/silas marner/page (172).png',
    'books/silas marner/page (173).png',
    'books/silas marner/page (174).png',
    'books/silas marner/page (175).png',
    'books/silas marner/page (176).png',
    'books/silas marner/page (177).png',
    'books/silas marner/page (178).png',
    'books/silas marner/page (179).png',
    'books/silas marner/page (180).png',
    'books/silas marner/page (181).png',
    'books/silas marner/page (182).png',
    'books/silas marner/page (183).png',

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
