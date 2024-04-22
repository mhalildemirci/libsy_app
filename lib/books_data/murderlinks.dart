import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class murderlinks extends StatefulWidget {
  const murderlinks({Key? key}) : super(key: key);

  @override
  State<murderlinks> createState() => _murderlinksState();
}

class _murderlinksState extends State<murderlinks> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/murder links/page (1).png',
    'books/murder links/page (2).png',
    'books/murder links/page (3).png',
    'books/murder links/page (4).png',
    'books/murder links/page (5).png',
    'books/murder links/page (6).png',
    'books/murder links/page (7).png',
    'books/murder links/page (8).png',
    'books/murder links/page (9).png',
    'books/murder links/page (10).png',
    'books/murder links/page (11).png',
    'books/murder links/page (12).png',
    'books/murder links/page (13).png',
    'books/murder links/page (14).png',
    'books/murder links/page (15).png',
    'books/murder links/page (16).png',
    'books/murder links/page (17).png',
    'books/murder links/page (18).png',
    'books/murder links/page (19).png',
    'books/murder links/page (20).png',
    'books/murder links/page (21).png',
    'books/murder links/page (22).png',
    'books/murder links/page (23).png',
    'books/murder links/page (24).png',
    'books/murder links/page (25).png',
    'books/murder links/page (26).png',
    'books/murder links/page (27).png',
    'books/murder links/page (28).png',
    'books/murder links/page (29).png',
    'books/murder links/page (30).png',
    'books/murder links/page (31).png',
    'books/murder links/page (32).png',
    'books/murder links/page (33).png',
    'books/murder links/page (34).png',
    'books/murder links/page (35).png',
    'books/murder links/page (36).png',
    'books/murder links/page (37).png',
    'books/murder links/page (38).png',
    'books/murder links/page (39).png',
    'books/murder links/page (40).png',
    'books/murder links/page (41).png',
    'books/murder links/page (42).png',
    'books/murder links/page (43).png',
    'books/murder links/page (44).png',
    'books/murder links/page (45).png',
    'books/murder links/page (46).png',
    'books/murder links/page (47).png',
    'books/murder links/page (48).png',
    'books/murder links/page (49).png',
    'books/murder links/page (50).png',
    'books/murder links/page (51).png',
    'books/murder links/page (52).png',
    'books/murder links/page (53).png',
    'books/murder links/page (54).png',
    'books/murder links/page (55).png',
    'books/murder links/page (56).png',
    'books/murder links/page (57).png',
    'books/murder links/page (58).png',
    'books/murder links/page (59).png',
    'books/murder links/page (60).png',
    'books/murder links/page (61).png',
    'books/murder links/page (62).png',
    'books/murder links/page (63).png',
    'books/murder links/page (64).png',
    'books/murder links/page (65).png',
    'books/murder links/page (66).png',
    'books/murder links/page (67).png',
    'books/murder links/page (68).png',
    'books/murder links/page (69).png',
    'books/murder links/page (70).png',
    'books/murder links/page (71).png',
    'books/murder links/page (72).png',
    'books/murder links/page (73).png',
    'books/murder links/page (74).png',
    'books/murder links/page (75).png',
    'books/murder links/page (76).png',
    'books/murder links/page (77).png',
    'books/murder links/page (78).png',
    'books/murder links/page (79).png',
    'books/murder links/page (80).png',
    'books/murder links/page (81).png',
    'books/murder links/page (82).png',
    'books/murder links/page (83).png',
    'books/murder links/page (84).png',
    'books/murder links/page (85).png',
    'books/murder links/page (86).png',
    'books/murder links/page (87).png',
    'books/murder links/page (88).png',
    'books/murder links/page (89).png',
    'books/murder links/page (90).png',
    'books/murder links/page (91).png',
    'books/murder links/page (92).png',
    'books/murder links/page (93).png',
    'books/murder links/page (94).png',
    'books/murder links/page (95).png',
    'books/murder links/page (96).png',
    'books/murder links/page (97).png',
    'books/murder links/page (98).png',
    'books/murder links/page (99).png',
    'books/murder links/page (100).png',
    'books/murder links/page (101).png',
    'books/murder links/page (102).png',
    'books/murder links/page (103).png',
    'books/murder links/page (104).png',
    'books/murder links/page (105).png',
    'books/murder links/page (106).png',
    'books/murder links/page (107).png',
    'books/murder links/page (108).png',
    'books/murder links/page (109).png',
    'books/murder links/page (110).png',
    'books/murder links/page (111).png',
    'books/murder links/page (112).png',
    'books/murder links/page (113).png',
    'books/murder links/page (114).png',
    'books/murder links/page (115).png',
    'books/murder links/page (116).png',
    'books/murder links/page (117).png',
    'books/murder links/page (118).png',
    'books/murder links/page (119).png',
    'books/murder links/page (120).png',
    'books/murder links/page (121).png',
    'books/murder links/page (122).png',
    'books/murder links/page (123).png',
    'books/murder links/page (124).png',
    'books/murder links/page (125).png',
    'books/murder links/page (126).png',
    'books/murder links/page (127).png',
    'books/murder links/page (128).png',
    'books/murder links/page (129).png',
    'books/murder links/page (130).png',
    'books/murder links/page (131).png',
    'books/murder links/page (132).png',
    'books/murder links/page (133).png',
    'books/murder links/page (134).png',
    'books/murder links/page (135).png',
    'books/murder links/page (136).png',
    'books/murder links/page (137).png',
    'books/murder links/page (138).png',
    'books/murder links/page (139).png',
    'books/murder links/page (140).png',
    'books/murder links/page (141).png',
    'books/murder links/page (142).png',
    'books/murder links/page (143).png',
    'books/murder links/page (144).png',
    'books/murder links/page (145).png',
    'books/murder links/page (146).png',
    'books/murder links/page (147).png',
    'books/murder links/page (148).png',
    'books/murder links/page (149).png',
    'books/murder links/page (150).png',
    'books/murder links/page (151).png',
    'books/murder links/page (152).png',
    'books/murder links/page (153).png',
    'books/murder links/page (154).png',
    'books/murder links/page (155).png',
    'books/murder links/page (156).png',
    'books/murder links/page (157).png',
    'books/murder links/page (158).png',
    'books/murder links/page (159).png',
    'books/murder links/page (160).png',
    'books/murder links/page (161).png',
    'books/murder links/page (162).png',
    'books/murder links/page (163).png',
    'books/murder links/page (164).png',
    'books/murder links/page (165).png',
    'books/murder links/page (166).png',
    'books/murder links/page (167).png',
    'books/murder links/page (168).png',
    'books/murder links/page (169).png',
    'books/murder links/page (170).png',
    'books/murder links/page (171).png',
    'books/murder links/page (172).png',
    'books/murder links/page (173).png',
    'books/murder links/page (174).png',
    'books/murder links/page (175).png',
    'books/murder links/page (176).png',
    'books/murder links/page (177).png',
    'books/murder links/page (178).png',
    'books/murder links/page (179).png',
    'books/murder links/page (180).png',
    'books/murder links/page (181).png',
    'books/murder links/page (182).png',
    'books/murder links/page (183).png',
    'books/murder links/page (184).png',
    'books/murder links/page (185).png',
    'books/murder links/page (186).png',
    'books/murder links/page (187).png',
    'books/murder links/page (188).png',
    'books/murder links/page (189).png',
    'books/murder links/page (190).png',
    'books/murder links/page (191).png',
    'books/murder links/page (192).png',
    'books/murder links/page (193).png',
    'books/murder links/page (194).png',
    'books/murder links/page (195).png',
    'books/murder links/page (196).png',
    'books/murder links/page (197).png',
    'books/murder links/page (198).png',
    'books/murder links/page (199).png',
    'books/murder links/page (200).png',
    'books/murder links/page (201).png',
    'books/murder links/page (202).png',
    'books/murder links/page (203).png',
    'books/murder links/page (204).png',
    'books/murder links/page (205).png',
    'books/murder links/page (206).png',
    'books/murder links/page (207).png',

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
