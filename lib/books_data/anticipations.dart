import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class anticipations extends StatefulWidget {
  const anticipations({Key? key}) : super(key: key);

  @override
  State<anticipations> createState() => _anticipationsState();
}

class _anticipationsState extends State<anticipations> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Anticipations/page (1).png',
    'books/Anticipations/page (2).png',
    'books/Anticipations/page (3).png',
    'books/Anticipations/page (4).png',
    'books/Anticipations/page (5).png',
    'books/Anticipations/page (6).png',
    'books/Anticipations/page (7).png',
    'books/Anticipations/page (8).png',
    'books/Anticipations/page (9).png',
    'books/Anticipations/page (10).png',
    'books/Anticipations/page (11).png',
    'books/Anticipations/page (12).png',
    'books/Anticipations/page (13).png',
    'books/Anticipations/page (14).png',
    'books/Anticipations/page (15).png',
    'books/Anticipations/page (16).png',
    'books/Anticipations/page (17).png',
    'books/Anticipations/page (18).png',
    'books/Anticipations/page (19).png',
    'books/Anticipations/page (20).png',
    'books/Anticipations/page (21).png',
    'books/Anticipations/page (22).png',
    'books/Anticipations/page (23).png',
    'books/Anticipations/page (24).png',
    'books/Anticipations/page (25).png',
    'books/Anticipations/page (26).png',
    'books/Anticipations/page (27).png',
    'books/Anticipations/page (28).png',
    'books/Anticipations/page (29).png',
    'books/Anticipations/page (30).png',
    'books/Anticipations/page (31).png',
    'books/Anticipations/page (32).png',
    'books/Anticipations/page (33).png',
    'books/Anticipations/page (34).png',
    'books/Anticipations/page (35).png',
    'books/Anticipations/page (36).png',
    'books/Anticipations/page (37).png',
    'books/Anticipations/page (38).png',
    'books/Anticipations/page (39).png',
    'books/Anticipations/page (40).png',
    'books/Anticipations/page (41).png',
    'books/Anticipations/page (42).png',
    'books/Anticipations/page (43).png',
    'books/Anticipations/page (44).png',
    'books/Anticipations/page (45).png',
    'books/Anticipations/page (46).png',
    'books/Anticipations/page (47).png',
    'books/Anticipations/page (48).png',
    'books/Anticipations/page (49).png',
    'books/Anticipations/page (50).png',
    'books/Anticipations/page (51).png',
    'books/Anticipations/page (52).png',
    'books/Anticipations/page (53).png',
    'books/Anticipations/page (54).png',
    'books/Anticipations/page (55).png',
    'books/Anticipations/page (56).png',
    'books/Anticipations/page (57).png',
    'books/Anticipations/page (58).png',
    'books/Anticipations/page (59).png',
    'books/Anticipations/page (60).png',
    'books/Anticipations/page (61).png',
    'books/Anticipations/page (62).png',
    'books/Anticipations/page (63).png',
    'books/Anticipations/page (64).png',
    'books/Anticipations/page (65).png',
    'books/Anticipations/page (66).png',
    'books/Anticipations/page (67).png',
    'books/Anticipations/page (68).png',
    'books/Anticipations/page (69).png',
    'books/Anticipations/page (70).png',
    'books/Anticipations/page (71).png',
    'books/Anticipations/page (72).png',
    'books/Anticipations/page (73).png',
    'books/Anticipations/page (74).png',
    'books/Anticipations/page (75).png',
    'books/Anticipations/page (76).png',
    'books/Anticipations/page (77).png',
    'books/Anticipations/page (78).png',
    'books/Anticipations/page (79).png',
    'books/Anticipations/page (80).png',
    'books/Anticipations/page (81).png',
    'books/Anticipations/page (82).png',
    'books/Anticipations/page (83).png',
    'books/Anticipations/page (84).png',
    'books/Anticipations/page (85).png',
    'books/Anticipations/page (86).png',
    'books/Anticipations/page (87).png',
    'books/Anticipations/page (88).png',
    'books/Anticipations/page (89).png',
    'books/Anticipations/page (90).png',
    'books/Anticipations/page (91).png',
    'books/Anticipations/page (92).png',
    'books/Anticipations/page (93).png',
    'books/Anticipations/page (94).png',
    'books/Anticipations/page (95).png',
    'books/Anticipations/page (96).png',
    'books/Anticipations/page (97).png',
    'books/Anticipations/page (98).png',
    'books/Anticipations/page (99).png',
    'books/Anticipations/page (100).png',
    'books/Anticipations/page (101).png',
    'books/Anticipations/page (102).png',
    'books/Anticipations/page (103).png',
    'books/Anticipations/page (104).png',
    'books/Anticipations/page (105).png',
    'books/Anticipations/page (106).png',
    'books/Anticipations/page (107).png',
    'books/Anticipations/page (108).png',
    'books/Anticipations/page (109).png',
    'books/Anticipations/page (110).png',
    'books/Anticipations/page (111).png',
    'books/Anticipations/page (112).png',
    'books/Anticipations/page (113).png',
    'books/Anticipations/page (114).png',
    'books/Anticipations/page (115).png',
    'books/Anticipations/page (116).png',
    'books/Anticipations/page (117).png',
    'books/Anticipations/page (118).png',
    'books/Anticipations/page (119).png',
    'books/Anticipations/page (120).png',
    'books/Anticipations/page (121).png',
    'books/Anticipations/page (122).png',
    'books/Anticipations/page (123).png',
    'books/Anticipations/page (124).png',
    'books/Anticipations/page (125).png',
    'books/Anticipations/page (126).png',
    'books/Anticipations/page (127).png',
    'books/Anticipations/page (128).png',
    'books/Anticipations/page (129).png',
    'books/Anticipations/page (130).png',
    'books/Anticipations/page (131).png',
    'books/Anticipations/page (132).png',
    'books/Anticipations/page (133).png',
    'books/Anticipations/page (134).png',
    'books/Anticipations/page (135).png',
    'books/Anticipations/page (136).png',
    'books/Anticipations/page (137).png',
    'books/Anticipations/page (138).png',
    'books/Anticipations/page (139).png',
    'books/Anticipations/page (140).png',
    'books/Anticipations/page (141).png',
    'books/Anticipations/page (142).png',
    'books/Anticipations/page (143).png',
    'books/Anticipations/page (144).png',
    'books/Anticipations/page (145).png',
    'books/Anticipations/page (146).png',
    'books/Anticipations/page (147).png',
    'books/Anticipations/page (148).png',
    'books/Anticipations/page (149).png',
    'books/Anticipations/page (150).png',
    'books/Anticipations/page (151).png',
    'books/Anticipations/page (152).png',
    'books/Anticipations/page (153).png',
    'books/Anticipations/page (154).png',
    'books/Anticipations/page (155).png',
    'books/Anticipations/page (156).png',
    'books/Anticipations/page (157).png',
    'books/Anticipations/page (158).png',
    'books/Anticipations/page (159).png',
    'books/Anticipations/page (160).png',
    'books/Anticipations/page (161).png',
    'books/Anticipations/page (162).png',
    'books/Anticipations/page (163).png',
    'books/Anticipations/page (164).png',
    'books/Anticipations/page (165).png',
    'books/Anticipations/page (166).png',
    'books/Anticipations/page (167).png',
    'books/Anticipations/page (168).png',
    'books/Anticipations/page (169).png',
    'books/Anticipations/page (170).png',
    'books/Anticipations/page (171).png',
    'books/Anticipations/page (172).png',
    'books/Anticipations/page (173).png',
    'books/Anticipations/page (174).png',
    'books/Anticipations/page (175).png',
    'books/Anticipations/page (176).png',
    'books/Anticipations/page (177).png',
    'books/Anticipations/page (178).png',
    'books/Anticipations/page (179).png',
    'books/Anticipations/page (180).png',
    'books/Anticipations/page (181).png',
    'books/Anticipations/page (182).png',
    'books/Anticipations/page (183).png',
    'books/Anticipations/page (184).png',
    'books/Anticipations/page (185).png',
    'books/Anticipations/page (186).png',
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
