import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class princepauper extends StatefulWidget {
  const princepauper({Key? key}) : super(key: key);

  @override
  State<princepauper> createState() => _princepauperState();
}

class _princepauperState extends State<princepauper> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/prince and pauper/page (1).png',
    'books/prince and pauper/page (2).png',
    'books/prince and pauper/page (3).png',
    'books/prince and pauper/page (4).png',
    'books/prince and pauper/page (5).png',
    'books/prince and pauper/page (6).png',
    'books/prince and pauper/page (7).png',
    'books/prince and pauper/page (8).png',
    'books/prince and pauper/page (9).png',
    'books/prince and pauper/page (10).png',
    'books/prince and pauper/page (11).png',
    'books/prince and pauper/page (12).png',
    'books/prince and pauper/page (13).png',
    'books/prince and pauper/page (14).png',
    'books/prince and pauper/page (15).png',
    'books/prince and pauper/page (16).png',
    'books/prince and pauper/page (17).png',
    'books/prince and pauper/page (18).png',
    'books/prince and pauper/page (19).png',
    'books/prince and pauper/page (20).png',
    'books/prince and pauper/page (21).png',
    'books/prince and pauper/page (22).png',
    'books/prince and pauper/page (23).png',
    'books/prince and pauper/page (24).png',
    'books/prince and pauper/page (25).png',
    'books/prince and pauper/page (26).png',
    'books/prince and pauper/page (27).png',
    'books/prince and pauper/page (28).png',
    'books/prince and pauper/page (29).png',
    'books/prince and pauper/page (30).png',
    'books/prince and pauper/page (31).png',
    'books/prince and pauper/page (32).png',
    'books/prince and pauper/page (33).png',
    'books/prince and pauper/page (34).png',
    'books/prince and pauper/page (35).png',
    'books/prince and pauper/page (36).png',
    'books/prince and pauper/page (37).png',
    'books/prince and pauper/page (38).png',
    'books/prince and pauper/page (39).png',
    'books/prince and pauper/page (40).png',
    'books/prince and pauper/page (41).png',
    'books/prince and pauper/page (42).png',
    'books/prince and pauper/page (43).png',
    'books/prince and pauper/page (44).png',
    'books/prince and pauper/page (45).png',
    'books/prince and pauper/page (46).png',
    'books/prince and pauper/page (47).png',
    'books/prince and pauper/page (48).png',
    'books/prince and pauper/page (49).png',
    'books/prince and pauper/page (50).png',
    'books/prince and pauper/page (51).png',
    'books/prince and pauper/page (52).png',
    'books/prince and pauper/page (53).png',
    'books/prince and pauper/page (54).png',
    'books/prince and pauper/page (55).png',
    'books/prince and pauper/page (56).png',
    'books/prince and pauper/page (57).png',
    'books/prince and pauper/page (58).png',
    'books/prince and pauper/page (59).png',
    'books/prince and pauper/page (60).png',
    'books/prince and pauper/page (61).png',
    'books/prince and pauper/page (62).png',
    'books/prince and pauper/page (63).png',
    'books/prince and pauper/page (64).png',
    'books/prince and pauper/page (65).png',
    'books/prince and pauper/page (66).png',
    'books/prince and pauper/page (67).png',
    'books/prince and pauper/page (68).png',
    'books/prince and pauper/page (69).png',
    'books/prince and pauper/page (70).png',
    'books/prince and pauper/page (71).png',
    'books/prince and pauper/page (72).png',
    'books/prince and pauper/page (73).png',
    'books/prince and pauper/page (74).png',
    'books/prince and pauper/page (75).png',
    'books/prince and pauper/page (76).png',
    'books/prince and pauper/page (77).png',
    'books/prince and pauper/page (78).png',
    'books/prince and pauper/page (79).png',
    'books/prince and pauper/page (80).png',
    'books/prince and pauper/page (81).png',
    'books/prince and pauper/page (82).png',
    'books/prince and pauper/page (83).png',
    'books/prince and pauper/page (84).png',
    'books/prince and pauper/page (85).png',
    'books/prince and pauper/page (86).png',
    'books/prince and pauper/page (87).png',
    'books/prince and pauper/page (88).png',
    'books/prince and pauper/page (89).png',
    'books/prince and pauper/page (90).png',
    'books/prince and pauper/page (91).png',
    'books/prince and pauper/page (92).png',
    'books/prince and pauper/page (93).png',
    'books/prince and pauper/page (94).png',
    'books/prince and pauper/page (95).png',
    'books/prince and pauper/page (96).png',
    'books/prince and pauper/page (97).png',
    'books/prince and pauper/page (98).png',
    'books/prince and pauper/page (99).png',
    'books/prince and pauper/page (100).png',
    'books/prince and pauper/page (101).png',
    'books/prince and pauper/page (102).png',
    'books/prince and pauper/page (103).png',
    'books/prince and pauper/page (104).png',
    'books/prince and pauper/page (105).png',
    'books/prince and pauper/page (106).png',
    'books/prince and pauper/page (107).png',
    'books/prince and pauper/page (108).png',
    'books/prince and pauper/page (109).png',
    'books/prince and pauper/page (110).png',
    'books/prince and pauper/page (111).png',
    'books/prince and pauper/page (112).png',
    'books/prince and pauper/page (113).png',
    'books/prince and pauper/page (114).png',
    'books/prince and pauper/page (115).png',
    'books/prince and pauper/page (116).png',
    'books/prince and pauper/page (117).png',
    'books/prince and pauper/page (118).png',
    'books/prince and pauper/page (119).png',
    'books/prince and pauper/page (120).png',
    'books/prince and pauper/page (121).png',
    'books/prince and pauper/page (122).png',
    'books/prince and pauper/page (123).png',
    'books/prince and pauper/page (124).png',
    'books/prince and pauper/page (125).png',
    'books/prince and pauper/page (126).png',
    'books/prince and pauper/page (127).png',
    'books/prince and pauper/page (128).png',
    'books/prince and pauper/page (129).png',
    'books/prince and pauper/page (130).png',
    'books/prince and pauper/page (131).png',
    'books/prince and pauper/page (132).png',
    'books/prince and pauper/page (133).png',
    'books/prince and pauper/page (134).png',
    'books/prince and pauper/page (135).png',
    'books/prince and pauper/page (136).png',
    'books/prince and pauper/page (137).png',
    'books/prince and pauper/page (138).png',
    'books/prince and pauper/page (139).png',
    'books/prince and pauper/page (140).png',
    'books/prince and pauper/page (141).png',
    'books/prince and pauper/page (142).png',
    'books/prince and pauper/page (143).png',
    'books/prince and pauper/page (144).png',
    'books/prince and pauper/page (145).png',
    'books/prince and pauper/page (146).png',
    'books/prince and pauper/page (147).png',
    'books/prince and pauper/page (148).png',
    'books/prince and pauper/page (149).png',
    'books/prince and pauper/page (150).png',
    'books/prince and pauper/page (151).png',
    'books/prince and pauper/page (152).png',
    'books/prince and pauper/page (153).png',
    'books/prince and pauper/page (154).png',
    'books/prince and pauper/page (155).png',
    'books/prince and pauper/page (156).png',
    'books/prince and pauper/page (157).png',
    'books/prince and pauper/page (158).png',
    'books/prince and pauper/page (159).png',
    'books/prince and pauper/page (160).png',
    'books/prince and pauper/page (161).png',
    'books/prince and pauper/page (162).png',
    'books/prince and pauper/page (163).png',
    'books/prince and pauper/page (164).png',
    'books/prince and pauper/page (165).png',
    'books/prince and pauper/page (166).png',
    'books/prince and pauper/page (167).png',
    'books/prince and pauper/page (168).png',
    'books/prince and pauper/page (169).png',
    'books/prince and pauper/page (170).png',
    'books/prince and pauper/page (171).png',
    'books/prince and pauper/page (172).png',
    'books/prince and pauper/page (173).png',
    'books/prince and pauper/page (174).png',
    'books/prince and pauper/page (175).png',
    'books/prince and pauper/page (176).png',
    'books/prince and pauper/page (177).png',
    'books/prince and pauper/page (178).png',
    'books/prince and pauper/page (179).png',
    'books/prince and pauper/page (180).png',
    'books/prince and pauper/page (181).png',
    'books/prince and pauper/page (182).png',
    'books/prince and pauper/page (183).png',
    'books/prince and pauper/page (184).png',
    'books/prince and pauper/page (185).png',
    'books/prince and pauper/page (186).png',
    'books/prince and pauper/page (187).png',
    'books/prince and pauper/page (188).png',
    'books/prince and pauper/page (189).png',
    'books/prince and pauper/page (190).png',
    'books/prince and pauper/page (191).png',
    'books/prince and pauper/page (192).png',
    'books/prince and pauper/page (193).png',
    'books/prince and pauper/page (194).png',
    'books/prince and pauper/page (195).png',
    'books/prince and pauper/page (196).png',
    'books/prince and pauper/page (197).png',
    'books/prince and pauper/page (198).png',
    'books/prince and pauper/page (199).png',
    'books/prince and pauper/page (200).png',
    'books/prince and pauper/page (201).png',
    'books/prince and pauper/page (202).png',

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
