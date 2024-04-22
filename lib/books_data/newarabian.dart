import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class newarabian extends StatefulWidget {
  const newarabian({Key? key}) : super(key: key);

  @override
  State<newarabian> createState() => _newarabianState();
}

class _newarabianState extends State<newarabian> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/new arabian/page (1).png',
    'books/new arabian/page (2).png',
    'books/new arabian/page (3).png',
    'books/new arabian/page (4).png',
    'books/new arabian/page (5).png',
    'books/new arabian/page (6).png',
    'books/new arabian/page (7).png',
    'books/new arabian/page (8).png',
    'books/new arabian/page (9).png',
    'books/new arabian/page (10).png',
    'books/new arabian/page (11).png',
    'books/new arabian/page (12).png',
    'books/new arabian/page (13).png',
    'books/new arabian/page (14).png',
    'books/new arabian/page (15).png',
    'books/new arabian/page (16).png',
    'books/new arabian/page (17).png',
    'books/new arabian/page (18).png',
    'books/new arabian/page (19).png',
    'books/new arabian/page (20).png',
    'books/new arabian/page (21).png',
    'books/new arabian/page (22).png',
    'books/new arabian/page (23).png',
    'books/new arabian/page (24).png',
    'books/new arabian/page (25).png',
    'books/new arabian/page (26).png',
    'books/new arabian/page (27).png',
    'books/new arabian/page (28).png',
    'books/new arabian/page (29).png',
    'books/new arabian/page (30).png',
    'books/new arabian/page (31).png',
    'books/new arabian/page (32).png',
    'books/new arabian/page (33).png',
    'books/new arabian/page (34).png',
    'books/new arabian/page (35).png',
    'books/new arabian/page (36).png',
    'books/new arabian/page (37).png',
    'books/new arabian/page (38).png',
    'books/new arabian/page (39).png',
    'books/new arabian/page (40).png',
    'books/new arabian/page (41).png',
    'books/new arabian/page (42).png',
    'books/new arabian/page (43).png',
    'books/new arabian/page (44).png',
    'books/new arabian/page (45).png',
    'books/new arabian/page (46).png',
    'books/new arabian/page (47).png',
    'books/new arabian/page (48).png',
    'books/new arabian/page (49).png',
    'books/new arabian/page (50).png',
    'books/new arabian/page (51).png',
    'books/new arabian/page (52).png',
    'books/new arabian/page (53).png',
    'books/new arabian/page (54).png',
    'books/new arabian/page (55).png',
    'books/new arabian/page (56).png',
    'books/new arabian/page (57).png',
    'books/new arabian/page (58).png',
    'books/new arabian/page (59).png',
    'books/new arabian/page (60).png',
    'books/new arabian/page (61).png',
    'books/new arabian/page (62).png',
    'books/new arabian/page (63).png',
    'books/new arabian/page (64).png',
    'books/new arabian/page (65).png',
    'books/new arabian/page (66).png',
    'books/new arabian/page (67).png',
    'books/new arabian/page (68).png',
    'books/new arabian/page (69).png',
    'books/new arabian/page (70).png',
    'books/new arabian/page (71).png',
    'books/new arabian/page (72).png',
    'books/new arabian/page (73).png',
    'books/new arabian/page (74).png',
    'books/new arabian/page (75).png',
    'books/new arabian/page (76).png',
    'books/new arabian/page (77).png',
    'books/new arabian/page (78).png',
    'books/new arabian/page (79).png',
    'books/new arabian/page (80).png',
    'books/new arabian/page (81).png',
    'books/new arabian/page (82).png',
    'books/new arabian/page (83).png',
    'books/new arabian/page (84).png',
    'books/new arabian/page (85).png',
    'books/new arabian/page (86).png',
    'books/new arabian/page (87).png',
    'books/new arabian/page (88).png',
    'books/new arabian/page (89).png',
    'books/new arabian/page (90).png',
    'books/new arabian/page (91).png',
    'books/new arabian/page (92).png',
    'books/new arabian/page (93).png',
    'books/new arabian/page (94).png',
    'books/new arabian/page (95).png',
    'books/new arabian/page (96).png',
    'books/new arabian/page (97).png',
    'books/new arabian/page (98).png',
    'books/new arabian/page (99).png',
    'books/new arabian/page (100).png',
    'books/new arabian/page (101).png',
    'books/new arabian/page (102).png',
    'books/new arabian/page (103).png',
    'books/new arabian/page (104).png',
    'books/new arabian/page (105).png',
    'books/new arabian/page (106).png',
    'books/new arabian/page (107).png',
    'books/new arabian/page (108).png',
    'books/new arabian/page (109).png',
    'books/new arabian/page (110).png',
    'books/new arabian/page (111).png',
    'books/new arabian/page (112).png',
    'books/new arabian/page (113).png',
    'books/new arabian/page (114).png',
    'books/new arabian/page (115).png',
    'books/new arabian/page (116).png',
    'books/new arabian/page (117).png',
    'books/new arabian/page (118).png',
    'books/new arabian/page (119).png',
    'books/new arabian/page (120).png',
    'books/new arabian/page (121).png',
    'books/new arabian/page (122).png',
    'books/new arabian/page (123).png',
    'books/new arabian/page (124).png',
    'books/new arabian/page (125).png',
    'books/new arabian/page (126).png',
    'books/new arabian/page (127).png',
    'books/new arabian/page (128).png',
    'books/new arabian/page (129).png',
    'books/new arabian/page (130).png',
    'books/new arabian/page (131).png',
    'books/new arabian/page (132).png',
    'books/new arabian/page (133).png',
    'books/new arabian/page (134).png',
    'books/new arabian/page (135).png',
    'books/new arabian/page (136).png',
    'books/new arabian/page (137).png',
    'books/new arabian/page (138).png',
    'books/new arabian/page (139).png',
    'books/new arabian/page (140).png',
    'books/new arabian/page (141).png',
    'books/new arabian/page (142).png',
    'books/new arabian/page (143).png',
    'books/new arabian/page (144).png',
    'books/new arabian/page (145).png',
    'books/new arabian/page (146).png',
    'books/new arabian/page (147).png',
    'books/new arabian/page (148).png',
    'books/new arabian/page (149).png',
    'books/new arabian/page (150).png',
    'books/new arabian/page (151).png',
    'books/new arabian/page (152).png',
    'books/new arabian/page (153).png',
    'books/new arabian/page (154).png',
    'books/new arabian/page (155).png',
    'books/new arabian/page (156).png',
    'books/new arabian/page (157).png',
    'books/new arabian/page (158).png',
    'books/new arabian/page (159).png',
    'books/new arabian/page (160).png',
    'books/new arabian/page (161).png',
    'books/new arabian/page (162).png',
    'books/new arabian/page (163).png',
    'books/new arabian/page (164).png',
    'books/new arabian/page (165).png',
    'books/new arabian/page (166).png',
    'books/new arabian/page (167).png',
    'books/new arabian/page (168).png',
    'books/new arabian/page (169).png',
    'books/new arabian/page (170).png',
    'books/new arabian/page (171).png',
    'books/new arabian/page (172).png',
    'books/new arabian/page (173).png',
    'books/new arabian/page (174).png',
    'books/new arabian/page (175).png',
    'books/new arabian/page (176).png',
    'books/new arabian/page (177).png',
    'books/new arabian/page (178).png',
    'books/new arabian/page (179).png',
    'books/new arabian/page (180).png',
    'books/new arabian/page (181).png',
    'books/new arabian/page (182).png',
    'books/new arabian/page (183).png',
    'books/new arabian/page (184).png',
    'books/new arabian/page (185).png',
    'books/new arabian/page (186).png',
    'books/new arabian/page (187).png',
    'books/new arabian/page (188).png',
    'books/new arabian/page (189).png',
    'books/new arabian/page (190).png',
    'books/new arabian/page (191).png',
    'books/new arabian/page (192).png',
    'books/new arabian/page (193).png',
    'books/new arabian/page (194).png',
    'books/new arabian/page (195).png',
    'books/new arabian/page (196).png',
    'books/new arabian/page (197).png',
    'books/new arabian/page (198).png',
    'books/new arabian/page (199).png',
    'books/new arabian/page (200).png',
    'books/new arabian/page (201).png',
    'books/new arabian/page (202).png',
    'books/new arabian/page (203).png',
    'books/new arabian/page (204).png',
    'books/new arabian/page (205).png',
    'books/new arabian/page (206).png',
    'books/new arabian/page (207).png',
    'books/new arabian/page (208).png',
    'books/new arabian/page (209).png',
    'books/new arabian/page (210).png',
    'books/new arabian/page (211).png',
    'books/new arabian/page (212).png',
    'books/new arabian/page (213).png',
    'books/new arabian/page (214).png',
    'books/new arabian/page (215).png',
    'books/new arabian/page (216).png',
    'books/new arabian/page (217).png',
    'books/new arabian/page (218).png',
    'books/new arabian/page (219).png',
    'books/new arabian/page (220).png',
    'books/new arabian/page (221).png',
    'books/new arabian/page (222).png',

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
