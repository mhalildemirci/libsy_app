import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ajournal extends StatefulWidget {
  const ajournal({Key? key}) : super(key: key);

  @override
  State<ajournal> createState() => _ajournalState();
}

class _ajournalState extends State<ajournal> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Journal/page (1).png',
    'books/A Journal/page (2).png',
    'books/A Journal/page (3).png',
    'books/A Journal/page (4).png',
    'books/A Journal/page (5).png',
    'books/A Journal/page (6).png',
    'books/A Journal/page (7).png',
    'books/A Journal/page (8).png',
    'books/A Journal/page (9).png',
    'books/A Journal/page (10).png',
    'books/A Journal/page (11).png',
    'books/A Journal/page (12).png',
    'books/A Journal/page (13).png',
    'books/A Journal/page (14).png',
    'books/A Journal/page (15).png',
    'books/A Journal/page (16).png',
    'books/A Journal/page (17).png',
    'books/A Journal/page (18).png',
    'books/A Journal/page (19).png',
    'books/A Journal/page (20).png',
    'books/A Journal/page (21).png',
    'books/A Journal/page (22).png',
    'books/A Journal/page (23).png',
    'books/A Journal/page (24).png',
    'books/A Journal/page (25).png',
    'books/A Journal/page (26).png',
    'books/A Journal/page (27).png',
    'books/A Journal/page (28).png',
    'books/A Journal/page (29).png',
    'books/A Journal/page (30).png',
    'books/A Journal/page (31).png',
    'books/A Journal/page (32).png',
    'books/A Journal/page (33).png',
    'books/A Journal/page (34).png',
    'books/A Journal/page (35).png',
    'books/A Journal/page (36).png',
    'books/A Journal/page (37).png',
    'books/A Journal/page (38).png',
    'books/A Journal/page (39).png',
    'books/A Journal/page (40).png',
    'books/A Journal/page (41).png',
    'books/A Journal/page (42).png',
    'books/A Journal/page (43).png',
    'books/A Journal/page (44).png',
    'books/A Journal/page (45).png',
    'books/A Journal/page (46).png',
    'books/A Journal/page (47).png',
    'books/A Journal/page (48).png',
    'books/A Journal/page (49).png',
    'books/A Journal/page (50).png',
    'books/A Journal/page (51).png',
    'books/A Journal/page (52).png',
    'books/A Journal/page (53).png',
    'books/A Journal/page (54).png',
    'books/A Journal/page (55).png',
    'books/A Journal/page (56).png',
    'books/A Journal/page (57).png',
    'books/A Journal/page (58).png',
    'books/A Journal/page (59).png',
    'books/A Journal/page (60).png',
    'books/A Journal/page (61).png',
    'books/A Journal/page (62).png',
    'books/A Journal/page (63).png',
    'books/A Journal/page (64).png',
    'books/A Journal/page (65).png',
    'books/A Journal/page (66).png',
    'books/A Journal/page (67).png',
    'books/A Journal/page (68).png',
    'books/A Journal/page (69).png',
    'books/A Journal/page (70).png',
    'books/A Journal/page (71).png',
    'books/A Journal/page (72).png',
    'books/A Journal/page (73).png',
    'books/A Journal/page (74).png',
    'books/A Journal/page (75).png',
    'books/A Journal/page (76).png',
    'books/A Journal/page (77).png',
    'books/A Journal/page (78).png',
    'books/A Journal/page (79).png',
    'books/A Journal/page (80).png',
    'books/A Journal/page (81).png',
    'books/A Journal/page (82).png',
    'books/A Journal/page (83).png',
    'books/A Journal/page (84).png',
    'books/A Journal/page (85).png',
    'books/A Journal/page (86).png',
    'books/A Journal/page (87).png',
    'books/A Journal/page (88).png',
    'books/A Journal/page (89).png',
    'books/A Journal/page (90).png',
    'books/A Journal/page (91).png',
    'books/A Journal/page (92).png',
    'books/A Journal/page (93).png',
    'books/A Journal/page (94).png',
    'books/A Journal/page (95).png',
    'books/A Journal/page (96).png',
    'books/A Journal/page (97).png',
    'books/A Journal/page (98).png',
    'books/A Journal/page (99).png',
    'books/A Journal/page (100).png',
    'books/A Journal/page (101).png',
    'books/A Journal/page (102).png',
    'books/A Journal/page (103).png',
    'books/A Journal/page (104).png',
    'books/A Journal/page (105).png',
    'books/A Journal/page (106).png',
    'books/A Journal/page (107).png',
    'books/A Journal/page (108).png',
    'books/A Journal/page (109).png',
    'books/A Journal/page (110).png',
    'books/A Journal/page (111).png',
    'books/A Journal/page (112).png',
    'books/A Journal/page (113).png',
    'books/A Journal/page (114).png',
    'books/A Journal/page (115).png',
    'books/A Journal/page (116).png',
    'books/A Journal/page (117).png',
    'books/A Journal/page (118).png',
    'books/A Journal/page (119).png',
    'books/A Journal/page (120).png',
    'books/A Journal/page (121).png',
    'books/A Journal/page (122).png',
    'books/A Journal/page (123).png',
    'books/A Journal/page (124).png',
    'books/A Journal/page (125).png',
    'books/A Journal/page (126).png',
    'books/A Journal/page (127).png',
    'books/A Journal/page (128).png',
    'books/A Journal/page (129).png',
    'books/A Journal/page (130).png',
    'books/A Journal/page (131).png',
    'books/A Journal/page (132).png',
    'books/A Journal/page (133).png',
    'books/A Journal/page (134).png',
    'books/A Journal/page (135).png',
    'books/A Journal/page (136).png',
    'books/A Journal/page (137).png',
    'books/A Journal/page (138).png',
    'books/A Journal/page (139).png',
    'books/A Journal/page (140).png',
    'books/A Journal/page (141).png',
    'books/A Journal/page (142).png',
    'books/A Journal/page (143).png',
    'books/A Journal/page (144).png',
    'books/A Journal/page (145).png',
    'books/A Journal/page (146).png',
    'books/A Journal/page (147).png',
    'books/A Journal/page (148).png',
    'books/A Journal/page (149).png',
    'books/A Journal/page (150).png',
    'books/A Journal/page (151).png',
    'books/A Journal/page (152).png',
    'books/A Journal/page (153).png',
    'books/A Journal/page (154).png',
    'books/A Journal/page (155).png',
    'books/A Journal/page (156).png',
    'books/A Journal/page (157).png',
    'books/A Journal/page (158).png',
    'books/A Journal/page (159).png',
    'books/A Journal/page (160).png',
    'books/A Journal/page (161).png',
    'books/A Journal/page (162).png',
    'books/A Journal/page (163).png',
    'books/A Journal/page (164).png',
    'books/A Journal/page (165).png',
    'books/A Journal/page (166).png',
    'books/A Journal/page (167).png',
    'books/A Journal/page (168).png',
    'books/A Journal/page (169).png',
    'books/A Journal/page (170).png',
    'books/A Journal/page (171).png',
    'books/A Journal/page (172).png',
    'books/A Journal/page (173).png',
    'books/A Journal/page (174).png',
    'books/A Journal/page (175).png',
    'books/A Journal/page (176).png',
    'books/A Journal/page (177).png',
    'books/A Journal/page (178).png',
    'books/A Journal/page (179).png',
    'books/A Journal/page (180).png',
    'books/A Journal/page (181).png',
    'books/A Journal/page (182).png',
    'books/A Journal/page (183).png',
    'books/A Journal/page (184).png',
    'books/A Journal/page (185).png',
    'books/A Journal/page (186).png',
    'books/A Journal/page (187).png',
    'books/A Journal/page (188).png',
    'books/A Journal/page (189).png',
    'books/A Journal/page (190).png',
    'books/A Journal/page (191).png',
    'books/A Journal/page (192).png',
    'books/A Journal/page (193).png',
    'books/A Journal/page (194).png',
    'books/A Journal/page (195).png',
    'books/A Journal/page (196).png',
    'books/A Journal/page (197).png',
    'books/A Journal/page (198).png',
    'books/A Journal/page (199).png',
    'books/A Journal/page (200).png',
    'books/A Journal/page (201).png',
    'books/A Journal/page (202).png',
    'books/A Journal/page (203).png',
    'books/A Journal/page (204).png',
    'books/A Journal/page (205).png',
    'books/A Journal/page (206).png',
    'books/A Journal/page (207).png',
    'books/A Journal/page (208).png',
    'books/A Journal/page (209).png',
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
