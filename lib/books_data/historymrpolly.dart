import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class historymrpolly extends StatefulWidget {
  const historymrpolly({Key? key}) : super(key: key);

  @override
  State<historymrpolly> createState() => _historymrpollyState();
}

class _historymrpollyState extends State<historymrpolly> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/history mr polly/page (1).png',
    'books/history mr polly/page (2).png',
    'books/history mr polly/page (3).png',
    'books/history mr polly/page (4).png',
    'books/history mr polly/page (5).png',
    'books/history mr polly/page (6).png',
    'books/history mr polly/page (7).png',
    'books/history mr polly/page (8).png',
    'books/history mr polly/page (9).png',
    'books/history mr polly/page (10).png',
    'books/history mr polly/page (11).png',
    'books/history mr polly/page (12).png',
    'books/history mr polly/page (13).png',
    'books/history mr polly/page (14).png',
    'books/history mr polly/page (15).png',
    'books/history mr polly/page (16).png',
    'books/history mr polly/page (17).png',
    'books/history mr polly/page (18).png',
    'books/history mr polly/page (19).png',
    'books/history mr polly/page (20).png',
    'books/history mr polly/page (21).png',
    'books/history mr polly/page (22).png',
    'books/history mr polly/page (23).png',
    'books/history mr polly/page (24).png',
    'books/history mr polly/page (25).png',
    'books/history mr polly/page (26).png',
    'books/history mr polly/page (27).png',
    'books/history mr polly/page (28).png',
    'books/history mr polly/page (29).png',
    'books/history mr polly/page (30).png',
    'books/history mr polly/page (31).png',
    'books/history mr polly/page (32).png',
    'books/history mr polly/page (33).png',
    'books/history mr polly/page (34).png',
    'books/history mr polly/page (35).png',
    'books/history mr polly/page (36).png',
    'books/history mr polly/page (37).png',
    'books/history mr polly/page (38).png',
    'books/history mr polly/page (39).png',
    'books/history mr polly/page (40).png',
    'books/history mr polly/page (41).png',
    'books/history mr polly/page (42).png',
    'books/history mr polly/page (43).png',
    'books/history mr polly/page (44).png',
    'books/history mr polly/page (45).png',
    'books/history mr polly/page (46).png',
    'books/history mr polly/page (47).png',
    'books/history mr polly/page (48).png',
    'books/history mr polly/page (49).png',
    'books/history mr polly/page (50).png',
    'books/history mr polly/page (51).png',
    'books/history mr polly/page (52).png',
    'books/history mr polly/page (53).png',
    'books/history mr polly/page (54).png',
    'books/history mr polly/page (55).png',
    'books/history mr polly/page (56).png',
    'books/history mr polly/page (57).png',
    'books/history mr polly/page (58).png',
    'books/history mr polly/page (59).png',
    'books/history mr polly/page (60).png',
    'books/history mr polly/page (61).png',
    'books/history mr polly/page (62).png',
    'books/history mr polly/page (63).png',
    'books/history mr polly/page (64).png',
    'books/history mr polly/page (65).png',
    'books/history mr polly/page (66).png',
    'books/history mr polly/page (67).png',
    'books/history mr polly/page (68).png',
    'books/history mr polly/page (69).png',
    'books/history mr polly/page (70).png',
    'books/history mr polly/page (71).png',
    'books/history mr polly/page (72).png',
    'books/history mr polly/page (73).png',
    'books/history mr polly/page (74).png',
    'books/history mr polly/page (75).png',
    'books/history mr polly/page (76).png',
    'books/history mr polly/page (77).png',
    'books/history mr polly/page (78).png',
    'books/history mr polly/page (79).png',
    'books/history mr polly/page (80).png',
    'books/history mr polly/page (81).png',
    'books/history mr polly/page (82).png',
    'books/history mr polly/page (83).png',
    'books/history mr polly/page (84).png',
    'books/history mr polly/page (85).png',
    'books/history mr polly/page (86).png',
    'books/history mr polly/page (87).png',
    'books/history mr polly/page (88).png',
    'books/history mr polly/page (89).png',
    'books/history mr polly/page (90).png',
    'books/history mr polly/page (91).png',
    'books/history mr polly/page (92).png',
    'books/history mr polly/page (93).png',
    'books/history mr polly/page (94).png',
    'books/history mr polly/page (95).png',
    'books/history mr polly/page (96).png',
    'books/history mr polly/page (97).png',
    'books/history mr polly/page (98).png',
    'books/history mr polly/page (99).png',
    'books/history mr polly/page (100).png',
    'books/history mr polly/page (101).png',
    'books/history mr polly/page (102).png',
    'books/history mr polly/page (103).png',
    'books/history mr polly/page (104).png',
    'books/history mr polly/page (105).png',
    'books/history mr polly/page (106).png',
    'books/history mr polly/page (107).png',
    'books/history mr polly/page (108).png',
    'books/history mr polly/page (109).png',
    'books/history mr polly/page (110).png',
    'books/history mr polly/page (111).png',
    'books/history mr polly/page (112).png',
    'books/history mr polly/page (113).png',
    'books/history mr polly/page (114).png',
    'books/history mr polly/page (115).png',
    'books/history mr polly/page (116).png',
    'books/history mr polly/page (117).png',
    'books/history mr polly/page (118).png',
    'books/history mr polly/page (119).png',
    'books/history mr polly/page (120).png',
    'books/history mr polly/page (121).png',
    'books/history mr polly/page (122).png',
    'books/history mr polly/page (123).png',
    'books/history mr polly/page (124).png',
    'books/history mr polly/page (125).png',
    'books/history mr polly/page (126).png',
    'books/history mr polly/page (127).png',
    'books/history mr polly/page (128).png',
    'books/history mr polly/page (129).png',
    'books/history mr polly/page (130).png',
    'books/history mr polly/page (131).png',
    'books/history mr polly/page (132).png',
    'books/history mr polly/page (133).png',
    'books/history mr polly/page (134).png',
    'books/history mr polly/page (135).png',
    'books/history mr polly/page (136).png',
    'books/history mr polly/page (137).png',
    'books/history mr polly/page (138).png',
    'books/history mr polly/page (139).png',
    'books/history mr polly/page (140).png',
    'books/history mr polly/page (141).png',
    'books/history mr polly/page (142).png',
    'books/history mr polly/page (143).png',
    'books/history mr polly/page (144).png',
    'books/history mr polly/page (145).png',
    'books/history mr polly/page (146).png',
    'books/history mr polly/page (147).png',
    'books/history mr polly/page (148).png',
    'books/history mr polly/page (149).png',
    'books/history mr polly/page (150).png',
    'books/history mr polly/page (151).png',
    'books/history mr polly/page (152).png',
    'books/history mr polly/page (153).png',
    'books/history mr polly/page (154).png',
    'books/history mr polly/page (155).png',
    'books/history mr polly/page (156).png',
    'books/history mr polly/page (157).png',
    'books/history mr polly/page (158).png',
    'books/history mr polly/page (159).png',
    'books/history mr polly/page (160).png',
    'books/history mr polly/page (161).png',
    'books/history mr polly/page (162).png',
    'books/history mr polly/page (163).png',
    'books/history mr polly/page (164).png',
    'books/history mr polly/page (165).png',
    'books/history mr polly/page (166).png',
    'books/history mr polly/page (167).png',
    'books/history mr polly/page (168).png',
    'books/history mr polly/page (169).png',
    'books/history mr polly/page (170).png',
    'books/history mr polly/page (171).png',
    'books/history mr polly/page (172).png',
    'books/history mr polly/page (173).png',
    'books/history mr polly/page (174).png',
    'books/history mr polly/page (175).png',
    'books/history mr polly/page (176).png',
    'books/history mr polly/page (177).png',
    'books/history mr polly/page (178).png',
    'books/history mr polly/page (179).png',
    'books/history mr polly/page (180).png',
    'books/history mr polly/page (181).png',
    'books/history mr polly/page (182).png',
    'books/history mr polly/page (183).png',
    'books/history mr polly/page (184).png',
    'books/history mr polly/page (185).png',
    'books/history mr polly/page (186).png',
    'books/history mr polly/page (187).png',
    'books/history mr polly/page (188).png',
    'books/history mr polly/page (189).png',
    'books/history mr polly/page (190).png',
    'books/history mr polly/page (191).png',
    'books/history mr polly/page (192).png',
    'books/history mr polly/page (193).png',
    'books/history mr polly/page (194).png',
    'books/history mr polly/page (195).png',
    'books/history mr polly/page (196).png',
    'books/history mr polly/page (197).png',
    'books/history mr polly/page (198).png',
    'books/history mr polly/page (199).png',
    'books/history mr polly/page (200).png',
    'books/history mr polly/page (201).png',
    'books/history mr polly/page (202).png',
    'books/history mr polly/page (203).png',
    'books/history mr polly/page (204).png',
    'books/history mr polly/page (205).png',
    'books/history mr polly/page (206).png',
    'books/history mr polly/page (207).png',
    'books/history mr polly/page (208).png',
    'books/history mr polly/page (209).png',
    'books/history mr polly/page (210).png',
    'books/history mr polly/page (211).png',
    'books/history mr polly/page (212).png',

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
