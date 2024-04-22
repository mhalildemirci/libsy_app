import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class astudyscarlet extends StatefulWidget {
  const astudyscarlet({Key? key}) : super(key: key);

  @override
  State<astudyscarlet> createState() => _astudyscarletState();
}

class _astudyscarletState extends State<astudyscarlet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Study In Scarlet/page (1).png',
    'books/A Study In Scarlet/page (2).png',
    'books/A Study In Scarlet/page (3).png',
    'books/A Study In Scarlet/page (4).png',
    'books/A Study In Scarlet/page (5).png',
    'books/A Study In Scarlet/page (6).png',
    'books/A Study In Scarlet/page (7).png',
    'books/A Study In Scarlet/page (8).png',
    'books/A Study In Scarlet/page (9).png',
    'books/A Study In Scarlet/page (10).png',
    'books/A Study In Scarlet/page (11).png',
    'books/A Study In Scarlet/page (12).png',
    'books/A Study In Scarlet/page (13).png',
    'books/A Study In Scarlet/page (14).png',
    'books/A Study In Scarlet/page (15).png',
    'books/A Study In Scarlet/page (16).png',
    'books/A Study In Scarlet/page (17).png',
    'books/A Study In Scarlet/page (18).png',
    'books/A Study In Scarlet/page (19).png',
    'books/A Study In Scarlet/page (20).png',
    'books/A Study In Scarlet/page (21).png',
    'books/A Study In Scarlet/page (22).png',
    'books/A Study In Scarlet/page (23).png',
    'books/A Study In Scarlet/page (24).png',
    'books/A Study In Scarlet/page (25).png',
    'books/A Study In Scarlet/page (26).png',
    'books/A Study In Scarlet/page (27).png',
    'books/A Study In Scarlet/page (28).png',
    'books/A Study In Scarlet/page (29).png',
    'books/A Study In Scarlet/page (30).png',
    'books/A Study In Scarlet/page (31).png',
    'books/A Study In Scarlet/page (32).png',
    'books/A Study In Scarlet/page (33).png',
    'books/A Study In Scarlet/page (34).png',
    'books/A Study In Scarlet/page (35).png',
    'books/A Study In Scarlet/page (36).png',
    'books/A Study In Scarlet/page (37).png',
    'books/A Study In Scarlet/page (38).png',
    'books/A Study In Scarlet/page (39).png',
    'books/A Study In Scarlet/page (40).png',
    'books/A Study In Scarlet/page (41).png',
    'books/A Study In Scarlet/page (42).png',
    'books/A Study In Scarlet/page (43).png',
    'books/A Study In Scarlet/page (44).png',
    'books/A Study In Scarlet/page (45).png',
    'books/A Study In Scarlet/page (46).png',
    'books/A Study In Scarlet/page (47).png',
    'books/A Study In Scarlet/page (48).png',
    'books/A Study In Scarlet/page (49).png',
    'books/A Study In Scarlet/page (50).png',
    'books/A Study In Scarlet/page (51).png',
    'books/A Study In Scarlet/page (52).png',
    'books/A Study In Scarlet/page (53).png',
    'books/A Study In Scarlet/page (54).png',
    'books/A Study In Scarlet/page (55).png',
    'books/A Study In Scarlet/page (56).png',
    'books/A Study In Scarlet/page (57).png',
    'books/A Study In Scarlet/page (58).png',
    'books/A Study In Scarlet/page (59).png',
    'books/A Study In Scarlet/page (60).png',
    'books/A Study In Scarlet/page (61).png',
    'books/A Study In Scarlet/page (62).png',
    'books/A Study In Scarlet/page (63).png',
    'books/A Study In Scarlet/page (64).png',
    'books/A Study In Scarlet/page (65).png',
    'books/A Study In Scarlet/page (66).png',
    'books/A Study In Scarlet/page (67).png',
    'books/A Study In Scarlet/page (68).png',
    'books/A Study In Scarlet/page (69).png',
    'books/A Study In Scarlet/page (70).png',
    'books/A Study In Scarlet/page (71).png',
    'books/A Study In Scarlet/page (72).png',
    'books/A Study In Scarlet/page (73).png',
    'books/A Study In Scarlet/page (74).png',
    'books/A Study In Scarlet/page (75).png',
    'books/A Study In Scarlet/page (76).png',
    'books/A Study In Scarlet/page (77).png',
    'books/A Study In Scarlet/page (78).png',
    'books/A Study In Scarlet/page (79).png',
    'books/A Study In Scarlet/page (80).png',
    'books/A Study In Scarlet/page (81).png',
    'books/A Study In Scarlet/page (82).png',
    'books/A Study In Scarlet/page (83).png',
    'books/A Study In Scarlet/page (84).png',
    'books/A Study In Scarlet/page (85).png',
    'books/A Study In Scarlet/page (86).png',
    'books/A Study In Scarlet/page (87).png',
    'books/A Study In Scarlet/page (88).png',
    'books/A Study In Scarlet/page (89).png',
    'books/A Study In Scarlet/page (90).png',
    'books/A Study In Scarlet/page (91).png',
    'books/A Study In Scarlet/page (92).png',
    'books/A Study In Scarlet/page (93).png',
    'books/A Study In Scarlet/page (94).png',
    'books/A Study In Scarlet/page (95).png',
    'books/A Study In Scarlet/page (96).png',
    'books/A Study In Scarlet/page (97).png',
    'books/A Study In Scarlet/page (98).png',
    'books/A Study In Scarlet/page (99).png',
    'books/A Study In Scarlet/page (100).png',
    'books/A Study In Scarlet/page (101).png',
    'books/A Study In Scarlet/page (102).png',
    'books/A Study In Scarlet/page (103).png',
    'books/A Study In Scarlet/page (104).png',
    'books/A Study In Scarlet/page (105).png',
    'books/A Study In Scarlet/page (106).png',
    'books/A Study In Scarlet/page (107).png',
    'books/A Study In Scarlet/page (108).png',
    'books/A Study In Scarlet/page (109).png',
    'books/A Study In Scarlet/page (110).png',
    'books/A Study In Scarlet/page (111).png',
    'books/A Study In Scarlet/page (112).png',
    'books/A Study In Scarlet/page (113).png',
    'books/A Study In Scarlet/page (114).png',
    'books/A Study In Scarlet/page (115).png',
    'books/A Study In Scarlet/page (116).png',
    'books/A Study In Scarlet/page (117).png',
    'books/A Study In Scarlet/page (118).png',
    'books/A Study In Scarlet/page (119).png',
    'books/A Study In Scarlet/page (120).png',
    'books/A Study In Scarlet/page (121).png',
    'books/A Study In Scarlet/page (122).png',
    'books/A Study In Scarlet/page (123).png',
    'books/A Study In Scarlet/page (124).png',
    'books/A Study In Scarlet/page (125).png',
    'books/A Study In Scarlet/page (126).png',
    'books/A Study In Scarlet/page (127).png',
    'books/A Study In Scarlet/page (128).png',
    'books/A Study In Scarlet/page (129).png',
    'books/A Study In Scarlet/page (130).png',
    'books/A Study In Scarlet/page (131).png',
    'books/A Study In Scarlet/page (132).png',
    'books/A Study In Scarlet/page (133).png',
    'books/A Study In Scarlet/page (134).png',
    'books/A Study In Scarlet/page (135).png',
    'books/A Study In Scarlet/page (136).png',
    'books/A Study In Scarlet/page (137).png',
    'books/A Study In Scarlet/page (138).png',
    'books/A Study In Scarlet/page (139).png',
    'books/A Study In Scarlet/page (140).png',
    'books/A Study In Scarlet/page (141).png',
    'books/A Study In Scarlet/page (142).png',
    'books/A Study In Scarlet/page (143).png',
    'books/A Study In Scarlet/page (144).png',
    'books/A Study In Scarlet/page (145).png',
    'books/A Study In Scarlet/page (146).png',
    'books/A Study In Scarlet/page (147).png',
    'books/A Study In Scarlet/page (148).png',
    'books/A Study In Scarlet/page (149).png',
    'books/A Study In Scarlet/page (150).png',
    'books/A Study In Scarlet/page (151).png',
    'books/A Study In Scarlet/page (152).png',
    'books/A Study In Scarlet/page (153).png',
    'books/A Study In Scarlet/page (154).png',
    'books/A Study In Scarlet/page (155).png',
    'books/A Study In Scarlet/page (156).png',
    'books/A Study In Scarlet/page (157).png',
    'books/A Study In Scarlet/page (158).png',
    'books/A Study In Scarlet/page (159).png',
    'books/A Study In Scarlet/page (160).png',
    'books/A Study In Scarlet/page (161).png',
    'books/A Study In Scarlet/page (162).png',
    'books/A Study In Scarlet/page (163).png',
    'books/A Study In Scarlet/page (164).png',
    'books/A Study In Scarlet/page (165).png',
    'books/A Study In Scarlet/page (166).png',
    'books/A Study In Scarlet/page (167).png',
    'books/A Study In Scarlet/page (168).png',
    'books/A Study In Scarlet/page (169).png',
    'books/A Study In Scarlet/page (170).png',
    'books/A Study In Scarlet/page (171).png',
    'books/A Study In Scarlet/page (172).png',
    'books/A Study In Scarlet/page (173).png',
    'books/A Study In Scarlet/page (174).png',
    'books/A Study In Scarlet/page (175).png',
    'books/A Study In Scarlet/page (176).png',
    'books/A Study In Scarlet/page (177).png',
    'books/A Study In Scarlet/page (178).png',
    'books/A Study In Scarlet/page (179).png',
    'books/A Study In Scarlet/page (180).png',
    'books/A Study In Scarlet/page (181).png',
    'books/A Study In Scarlet/page (182).png',
    'books/A Study In Scarlet/page (183).png',
    'books/A Study In Scarlet/page (184).png',
    'books/A Study In Scarlet/page (185).png',
    'books/A Study In Scarlet/page (186).png',
    'books/A Study In Scarlet/page (187).png',
    'books/A Study In Scarlet/page (188).png',
    'books/A Study In Scarlet/page (189).png',
    'books/A Study In Scarlet/page (190).png',
    'books/A Study In Scarlet/page (191).png',
    'books/A Study In Scarlet/page (192).png',
    'books/A Study In Scarlet/page (193).png',
    'books/A Study In Scarlet/page (194).png',
    'books/A Study In Scarlet/page (195).png',
    'books/A Study In Scarlet/page (196).png',
    'books/A Study In Scarlet/page (197).png',
    'books/A Study In Scarlet/page (198).png',
    'books/A Study In Scarlet/page (199).png',
    'books/A Study In Scarlet/page (200).png',
    'books/A Study In Scarlet/page (201).png',
    'books/A Study In Scarlet/page (202).png',
    'books/A Study In Scarlet/page (203).png',
    'books/A Study In Scarlet/page (204).png',
    'books/A Study In Scarlet/page (205).png',
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
