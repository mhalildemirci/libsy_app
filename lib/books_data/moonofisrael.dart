import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class moonofisrael extends StatefulWidget {
  const moonofisrael({Key? key}) : super(key: key);

  @override
  State<moonofisrael> createState() => _moonofisraelState();
}

class _moonofisraelState extends State<moonofisrael> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/moon of israel/page (1).png',
    'books/moon of israel/page (2).png',
    'books/moon of israel/page (3).png',
    'books/moon of israel/page (4).png',
    'books/moon of israel/page (5).png',
    'books/moon of israel/page (6).png',
    'books/moon of israel/page (7).png',
    'books/moon of israel/page (8).png',
    'books/moon of israel/page (9).png',
    'books/moon of israel/page (10).png',
    'books/moon of israel/page (11).png',
    'books/moon of israel/page (12).png',
    'books/moon of israel/page (13).png',
    'books/moon of israel/page (14).png',
    'books/moon of israel/page (15).png',
    'books/moon of israel/page (16).png',
    'books/moon of israel/page (17).png',
    'books/moon of israel/page (18).png',
    'books/moon of israel/page (19).png',
    'books/moon of israel/page (20).png',
    'books/moon of israel/page (21).png',
    'books/moon of israel/page (22).png',
    'books/moon of israel/page (23).png',
    'books/moon of israel/page (24).png',
    'books/moon of israel/page (25).png',
    'books/moon of israel/page (26).png',
    'books/moon of israel/page (27).png',
    'books/moon of israel/page (28).png',
    'books/moon of israel/page (29).png',
    'books/moon of israel/page (30).png',
    'books/moon of israel/page (31).png',
    'books/moon of israel/page (32).png',
    'books/moon of israel/page (33).png',
    'books/moon of israel/page (34).png',
    'books/moon of israel/page (35).png',
    'books/moon of israel/page (36).png',
    'books/moon of israel/page (37).png',
    'books/moon of israel/page (38).png',
    'books/moon of israel/page (39).png',
    'books/moon of israel/page (40).png',
    'books/moon of israel/page (41).png',
    'books/moon of israel/page (42).png',
    'books/moon of israel/page (43).png',
    'books/moon of israel/page (44).png',
    'books/moon of israel/page (45).png',
    'books/moon of israel/page (46).png',
    'books/moon of israel/page (47).png',
    'books/moon of israel/page (48).png',
    'books/moon of israel/page (49).png',
    'books/moon of israel/page (50).png',
    'books/moon of israel/page (51).png',
    'books/moon of israel/page (52).png',
    'books/moon of israel/page (53).png',
    'books/moon of israel/page (54).png',
    'books/moon of israel/page (55).png',
    'books/moon of israel/page (56).png',
    'books/moon of israel/page (57).png',
    'books/moon of israel/page (58).png',
    'books/moon of israel/page (59).png',
    'books/moon of israel/page (60).png',
    'books/moon of israel/page (61).png',
    'books/moon of israel/page (62).png',
    'books/moon of israel/page (63).png',
    'books/moon of israel/page (64).png',
    'books/moon of israel/page (65).png',
    'books/moon of israel/page (66).png',
    'books/moon of israel/page (67).png',
    'books/moon of israel/page (68).png',
    'books/moon of israel/page (69).png',
    'books/moon of israel/page (70).png',
    'books/moon of israel/page (71).png',
    'books/moon of israel/page (72).png',
    'books/moon of israel/page (73).png',
    'books/moon of israel/page (74).png',
    'books/moon of israel/page (75).png',
    'books/moon of israel/page (76).png',
    'books/moon of israel/page (77).png',
    'books/moon of israel/page (78).png',
    'books/moon of israel/page (79).png',
    'books/moon of israel/page (80).png',
    'books/moon of israel/page (81).png',
    'books/moon of israel/page (82).png',
    'books/moon of israel/page (83).png',
    'books/moon of israel/page (84).png',
    'books/moon of israel/page (85).png',
    'books/moon of israel/page (86).png',
    'books/moon of israel/page (87).png',
    'books/moon of israel/page (88).png',
    'books/moon of israel/page (89).png',
    'books/moon of israel/page (90).png',
    'books/moon of israel/page (91).png',
    'books/moon of israel/page (92).png',
    'books/moon of israel/page (93).png',
    'books/moon of israel/page (94).png',
    'books/moon of israel/page (95).png',
    'books/moon of israel/page (96).png',
    'books/moon of israel/page (97).png',
    'books/moon of israel/page (98).png',
    'books/moon of israel/page (99).png',
    'books/moon of israel/page (100).png',
    'books/moon of israel/page (101).png',
    'books/moon of israel/page (102).png',
    'books/moon of israel/page (103).png',
    'books/moon of israel/page (104).png',
    'books/moon of israel/page (105).png',
    'books/moon of israel/page (106).png',
    'books/moon of israel/page (107).png',
    'books/moon of israel/page (108).png',
    'books/moon of israel/page (109).png',
    'books/moon of israel/page (110).png',
    'books/moon of israel/page (111).png',
    'books/moon of israel/page (112).png',
    'books/moon of israel/page (113).png',
    'books/moon of israel/page (114).png',
    'books/moon of israel/page (115).png',
    'books/moon of israel/page (116).png',
    'books/moon of israel/page (117).png',
    'books/moon of israel/page (118).png',
    'books/moon of israel/page (119).png',
    'books/moon of israel/page (120).png',
    'books/moon of israel/page (121).png',
    'books/moon of israel/page (122).png',
    'books/moon of israel/page (123).png',
    'books/moon of israel/page (124).png',
    'books/moon of israel/page (125).png',
    'books/moon of israel/page (126).png',
    'books/moon of israel/page (127).png',
    'books/moon of israel/page (128).png',
    'books/moon of israel/page (129).png',
    'books/moon of israel/page (130).png',
    'books/moon of israel/page (131).png',
    'books/moon of israel/page (132).png',
    'books/moon of israel/page (133).png',
    'books/moon of israel/page (134).png',
    'books/moon of israel/page (135).png',
    'books/moon of israel/page (136).png',
    'books/moon of israel/page (137).png',
    'books/moon of israel/page (138).png',
    'books/moon of israel/page (139).png',
    'books/moon of israel/page (140).png',
    'books/moon of israel/page (141).png',
    'books/moon of israel/page (142).png',
    'books/moon of israel/page (143).png',
    'books/moon of israel/page (144).png',
    'books/moon of israel/page (145).png',
    'books/moon of israel/page (146).png',
    'books/moon of israel/page (147).png',
    'books/moon of israel/page (148).png',
    'books/moon of israel/page (149).png',
    'books/moon of israel/page (150).png',
    'books/moon of israel/page (151).png',
    'books/moon of israel/page (152).png',
    'books/moon of israel/page (153).png',
    'books/moon of israel/page (154).png',
    'books/moon of israel/page (155).png',
    'books/moon of israel/page (156).png',
    'books/moon of israel/page (157).png',
    'books/moon of israel/page (158).png',
    'books/moon of israel/page (159).png',
    'books/moon of israel/page (160).png',
    'books/moon of israel/page (161).png',
    'books/moon of israel/page (162).png',
    'books/moon of israel/page (163).png',
    'books/moon of israel/page (164).png',
    'books/moon of israel/page (165).png',
    'books/moon of israel/page (166).png',
    'books/moon of israel/page (167).png',
    'books/moon of israel/page (168).png',
    'books/moon of israel/page (169).png',
    'books/moon of israel/page (170).png',
    'books/moon of israel/page (171).png',
    'books/moon of israel/page (172).png',
    'books/moon of israel/page (173).png',
    'books/moon of israel/page (174).png',
    'books/moon of israel/page (175).png',
    'books/moon of israel/page (176).png',
    'books/moon of israel/page (177).png',
    'books/moon of israel/page (178).png',
    'books/moon of israel/page (179).png',
    'books/moon of israel/page (180).png',
    'books/moon of israel/page (181).png',
    'books/moon of israel/page (182).png',
    'books/moon of israel/page (183).png',
    'books/moon of israel/page (184).png',
    'books/moon of israel/page (185).png',
    'books/moon of israel/page (186).png',
    'books/moon of israel/page (187).png',
    'books/moon of israel/page (188).png',
    'books/moon of israel/page (189).png',
    'books/moon of israel/page (190).png',
    'books/moon of israel/page (191).png',
    'books/moon of israel/page (192).png',
    'books/moon of israel/page (193).png',
    'books/moon of israel/page (194).png',
    'books/moon of israel/page (195).png',
    'books/moon of israel/page (196).png',
    'books/moon of israel/page (197).png',
    'books/moon of israel/page (198).png',
    'books/moon of israel/page (199).png',
    'books/moon of israel/page (200).png',
    'books/moon of israel/page (201).png',
    'books/moon of israel/page (202).png',
    'books/moon of israel/page (203).png',
    'books/moon of israel/page (204).png',
    'books/moon of israel/page (205).png',
    'books/moon of israel/page (206).png',
    'books/moon of israel/page (207).png',
    'books/moon of israel/page (208).png',
    'books/moon of israel/page (209).png',
    'books/moon of israel/page (210).png',
    'books/moon of israel/page (211).png',
    'books/moon of israel/page (212).png',
    'books/moon of israel/page (213).png',
    'books/moon of israel/page (214).png',
    'books/moon of israel/page (215).png',
    'books/moon of israel/page (216).png',
    'books/moon of israel/page (217).png',
    'books/moon of israel/page (218).png',
    'books/moon of israel/page (219).png',

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
