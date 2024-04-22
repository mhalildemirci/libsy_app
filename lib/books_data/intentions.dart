import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class intentions extends StatefulWidget {
  const intentions({Key? key}) : super(key: key);

  @override
  State<intentions> createState() => _intentionsState();
}

class _intentionsState extends State<intentions> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/intentions/page (1).png',
    'books/intentions/page (2).png',
    'books/intentions/page (3).png',
    'books/intentions/page (4).png',
    'books/intentions/page (5).png',
    'books/intentions/page (6).png',
    'books/intentions/page (7).png',
    'books/intentions/page (8).png',
    'books/intentions/page (9).png',
    'books/intentions/page (10).png',
    'books/intentions/page (11).png',
    'books/intentions/page (12).png',
    'books/intentions/page (13).png',
    'books/intentions/page (14).png',
    'books/intentions/page (15).png',
    'books/intentions/page (16).png',
    'books/intentions/page (17).png',
    'books/intentions/page (18).png',
    'books/intentions/page (19).png',
    'books/intentions/page (20).png',
    'books/intentions/page (21).png',
    'books/intentions/page (22).png',
    'books/intentions/page (23).png',
    'books/intentions/page (24).png',
    'books/intentions/page (25).png',
    'books/intentions/page (26).png',
    'books/intentions/page (27).png',
    'books/intentions/page (28).png',
    'books/intentions/page (29).png',
    'books/intentions/page (30).png',
    'books/intentions/page (31).png',
    'books/intentions/page (32).png',
    'books/intentions/page (33).png',
    'books/intentions/page (34).png',
    'books/intentions/page (35).png',
    'books/intentions/page (36).png',
    'books/intentions/page (37).png',
    'books/intentions/page (38).png',
    'books/intentions/page (39).png',
    'books/intentions/page (40).png',
    'books/intentions/page (41).png',
    'books/intentions/page (42).png',
    'books/intentions/page (43).png',
    'books/intentions/page (44).png',
    'books/intentions/page (45).png',
    'books/intentions/page (46).png',
    'books/intentions/page (47).png',
    'books/intentions/page (48).png',
    'books/intentions/page (49).png',
    'books/intentions/page (50).png',
    'books/intentions/page (51).png',
    'books/intentions/page (52).png',
    'books/intentions/page (53).png',
    'books/intentions/page (54).png',
    'books/intentions/page (55).png',
    'books/intentions/page (56).png',
    'books/intentions/page (57).png',
    'books/intentions/page (58).png',
    'books/intentions/page (59).png',
    'books/intentions/page (60).png',
    'books/intentions/page (61).png',
    'books/intentions/page (62).png',
    'books/intentions/page (63).png',
    'books/intentions/page (64).png',
    'books/intentions/page (65).png',
    'books/intentions/page (66).png',
    'books/intentions/page (67).png',
    'books/intentions/page (68).png',
    'books/intentions/page (69).png',
    'books/intentions/page (70).png',
    'books/intentions/page (71).png',
    'books/intentions/page (72).png',
    'books/intentions/page (73).png',
    'books/intentions/page (74).png',
    'books/intentions/page (75).png',
    'books/intentions/page (76).png',
    'books/intentions/page (77).png',
    'books/intentions/page (78).png',
    'books/intentions/page (79).png',
    'books/intentions/page (80).png',
    'books/intentions/page (81).png',
    'books/intentions/page (82).png',
    'books/intentions/page (83).png',
    'books/intentions/page (84).png',
    'books/intentions/page (85).png',
    'books/intentions/page (86).png',
    'books/intentions/page (87).png',
    'books/intentions/page (88).png',
    'books/intentions/page (89).png',
    'books/intentions/page (90).png',
    'books/intentions/page (91).png',
    'books/intentions/page (92).png',
    'books/intentions/page (93).png',
    'books/intentions/page (94).png',
    'books/intentions/page (95).png',
    'books/intentions/page (96).png',
    'books/intentions/page (97).png',
    'books/intentions/page (98).png',
    'books/intentions/page (99).png',
    'books/intentions/page (100).png',
    'books/intentions/page (101).png',
    'books/intentions/page (102).png',
    'books/intentions/page (103).png',
    'books/intentions/page (104).png',
    'books/intentions/page (105).png',
    'books/intentions/page (106).png',
    'books/intentions/page (107).png',
    'books/intentions/page (108).png',
    'books/intentions/page (109).png',
    'books/intentions/page (110).png',
    'books/intentions/page (111).png',
    'books/intentions/page (112).png',
    'books/intentions/page (113).png',
    'books/intentions/page (114).png',
    'books/intentions/page (115).png',
    'books/intentions/page (116).png',
    'books/intentions/page (117).png',
    'books/intentions/page (118).png',
    'books/intentions/page (119).png',
    'books/intentions/page (120).png',
    'books/intentions/page (121).png',
    'books/intentions/page (122).png',
    'books/intentions/page (123).png',
    'books/intentions/page (124).png',
    'books/intentions/page (125).png',
    'books/intentions/page (126).png',
    'books/intentions/page (127).png',
    'books/intentions/page (128).png',
    'books/intentions/page (129).png',
    'books/intentions/page (130).png',
    'books/intentions/page (131).png',
    'books/intentions/page (132).png',
    'books/intentions/page (133).png',
    'books/intentions/page (134).png',
    'books/intentions/page (135).png',
    'books/intentions/page (136).png',
    'books/intentions/page (137).png',
    'books/intentions/page (138).png',
    'books/intentions/page (139).png',
    'books/intentions/page (140).png',
    'books/intentions/page (141).png',
    'books/intentions/page (142).png',
    'books/intentions/page (143).png',
    'books/intentions/page (144).png',
    'books/intentions/page (145).png',
    'books/intentions/page (146).png',
    'books/intentions/page (147).png',
    'books/intentions/page (148).png',
    'books/intentions/page (149).png',
    'books/intentions/page (150).png',
    'books/intentions/page (151).png',
    'books/intentions/page (152).png',
    'books/intentions/page (153).png',
    'books/intentions/page (154).png',
    'books/intentions/page (155).png',
    'books/intentions/page (156).png',
    'books/intentions/page (157).png',
    'books/intentions/page (158).png',
    'books/intentions/page (159).png',
    'books/intentions/page (160).png',
    'books/intentions/page (161).png',
    'books/intentions/page (162).png',
    'books/intentions/page (163).png',
    'books/intentions/page (164).png',
    'books/intentions/page (165).png',
    'books/intentions/page (166).png',
    'books/intentions/page (167).png',
    'books/intentions/page (168).png',
    'books/intentions/page (169).png',
    'books/intentions/page (170).png',
    'books/intentions/page (171).png',
    'books/intentions/page (172).png',
    'books/intentions/page (173).png',
    'books/intentions/page (174).png',
    'books/intentions/page (175).png',
    'books/intentions/page (176).png',
    'books/intentions/page (177).png',
    'books/intentions/page (178).png',
    'books/intentions/page (179).png',
    'books/intentions/page (180).png',
    'books/intentions/page (181).png',
    'books/intentions/page (182).png',
    'books/intentions/page (183).png',
    'books/intentions/page (184).png',
    'books/intentions/page (185).png',
    'books/intentions/page (186).png',
    'books/intentions/page (187).png',
    'books/intentions/page (188).png',
    'books/intentions/page (189).png',
    'books/intentions/page (190).png',
    'books/intentions/page (191).png',
    'books/intentions/page (192).png',
    'books/intentions/page (193).png',
    'books/intentions/page (194).png',
    'books/intentions/page (195).png',
    'books/intentions/page (196).png',
    'books/intentions/page (197).png',
    'books/intentions/page (198).png',
    'books/intentions/page (199).png',
    'books/intentions/page (200).png',
    'books/intentions/page (201).png',
    'books/intentions/page (202).png',
    'books/intentions/page (203).png',
    'books/intentions/page (204).png',
    'books/intentions/page (205).png',
    'books/intentions/page (206).png',
    'books/intentions/page (207).png',
    'books/intentions/page (208).png',
    'books/intentions/page (209).png',
    'books/intentions/page (210).png',
    'books/intentions/page (211).png',
    'books/intentions/page (212).png',
    'books/intentions/page (213).png',
    'books/intentions/page (214).png',
    'books/intentions/page (215).png',
    'books/intentions/page (216).png',
    'books/intentions/page (217).png',
    'books/intentions/page (218).png',
    'books/intentions/page (219).png',
    'books/intentions/page (220).png',
    'books/intentions/page (221).png',
    'books/intentions/page (222).png',
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
