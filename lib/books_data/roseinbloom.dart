import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class roseinbloom extends StatefulWidget {
  const roseinbloom({Key? key}) : super(key: key);

  @override
  State<roseinbloom> createState() => _roseinbloomState();
}

class _roseinbloomState extends State<roseinbloom> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/rose in bloom/page (1).png',
    'books/rose in bloom/page (2).png',
    'books/rose in bloom/page (3).png',
    'books/rose in bloom/page (4).png',
    'books/rose in bloom/page (5).png',
    'books/rose in bloom/page (6).png',
    'books/rose in bloom/page (7).png',
    'books/rose in bloom/page (8).png',
    'books/rose in bloom/page (9).png',
    'books/rose in bloom/page (10).png',
    'books/rose in bloom/page (11).png',
    'books/rose in bloom/page (12).png',
    'books/rose in bloom/page (13).png',
    'books/rose in bloom/page (14).png',
    'books/rose in bloom/page (15).png',
    'books/rose in bloom/page (16).png',
    'books/rose in bloom/page (17).png',
    'books/rose in bloom/page (18).png',
    'books/rose in bloom/page (19).png',
    'books/rose in bloom/page (20).png',
    'books/rose in bloom/page (21).png',
    'books/rose in bloom/page (22).png',
    'books/rose in bloom/page (23).png',
    'books/rose in bloom/page (24).png',
    'books/rose in bloom/page (25).png',
    'books/rose in bloom/page (26).png',
    'books/rose in bloom/page (27).png',
    'books/rose in bloom/page (28).png',
    'books/rose in bloom/page (29).png',
    'books/rose in bloom/page (30).png',
    'books/rose in bloom/page (31).png',
    'books/rose in bloom/page (32).png',
    'books/rose in bloom/page (33).png',
    'books/rose in bloom/page (34).png',
    'books/rose in bloom/page (35).png',
    'books/rose in bloom/page (36).png',
    'books/rose in bloom/page (37).png',
    'books/rose in bloom/page (38).png',
    'books/rose in bloom/page (39).png',
    'books/rose in bloom/page (40).png',
    'books/rose in bloom/page (41).png',
    'books/rose in bloom/page (42).png',
    'books/rose in bloom/page (43).png',
    'books/rose in bloom/page (44).png',
    'books/rose in bloom/page (45).png',
    'books/rose in bloom/page (46).png',
    'books/rose in bloom/page (47).png',
    'books/rose in bloom/page (48).png',
    'books/rose in bloom/page (49).png',
    'books/rose in bloom/page (50).png',
    'books/rose in bloom/page (51).png',
    'books/rose in bloom/page (52).png',
    'books/rose in bloom/page (53).png',
    'books/rose in bloom/page (54).png',
    'books/rose in bloom/page (55).png',
    'books/rose in bloom/page (56).png',
    'books/rose in bloom/page (57).png',
    'books/rose in bloom/page (58).png',
    'books/rose in bloom/page (59).png',
    'books/rose in bloom/page (60).png',
    'books/rose in bloom/page (61).png',
    'books/rose in bloom/page (62).png',
    'books/rose in bloom/page (63).png',
    'books/rose in bloom/page (64).png',
    'books/rose in bloom/page (65).png',
    'books/rose in bloom/page (66).png',
    'books/rose in bloom/page (67).png',
    'books/rose in bloom/page (68).png',
    'books/rose in bloom/page (69).png',
    'books/rose in bloom/page (70).png',
    'books/rose in bloom/page (71).png',
    'books/rose in bloom/page (72).png',
    'books/rose in bloom/page (73).png',
    'books/rose in bloom/page (74).png',
    'books/rose in bloom/page (75).png',
    'books/rose in bloom/page (76).png',
    'books/rose in bloom/page (77).png',
    'books/rose in bloom/page (78).png',
    'books/rose in bloom/page (79).png',
    'books/rose in bloom/page (80).png',
    'books/rose in bloom/page (81).png',
    'books/rose in bloom/page (82).png',
    'books/rose in bloom/page (83).png',
    'books/rose in bloom/page (84).png',
    'books/rose in bloom/page (85).png',
    'books/rose in bloom/page (86).png',
    'books/rose in bloom/page (87).png',
    'books/rose in bloom/page (88).png',
    'books/rose in bloom/page (89).png',
    'books/rose in bloom/page (90).png',
    'books/rose in bloom/page (91).png',
    'books/rose in bloom/page (92).png',
    'books/rose in bloom/page (93).png',
    'books/rose in bloom/page (94).png',
    'books/rose in bloom/page (95).png',
    'books/rose in bloom/page (96).png',
    'books/rose in bloom/page (97).png',
    'books/rose in bloom/page (98).png',
    'books/rose in bloom/page (99).png',
    'books/rose in bloom/page (100).png',
    'books/rose in bloom/page (101).png',
    'books/rose in bloom/page (102).png',
    'books/rose in bloom/page (103).png',
    'books/rose in bloom/page (104).png',
    'books/rose in bloom/page (105).png',
    'books/rose in bloom/page (106).png',
    'books/rose in bloom/page (107).png',
    'books/rose in bloom/page (108).png',
    'books/rose in bloom/page (109).png',
    'books/rose in bloom/page (110).png',
    'books/rose in bloom/page (111).png',
    'books/rose in bloom/page (112).png',
    'books/rose in bloom/page (113).png',
    'books/rose in bloom/page (114).png',
    'books/rose in bloom/page (115).png',
    'books/rose in bloom/page (116).png',
    'books/rose in bloom/page (117).png',
    'books/rose in bloom/page (118).png',
    'books/rose in bloom/page (119).png',
    'books/rose in bloom/page (120).png',
    'books/rose in bloom/page (121).png',
    'books/rose in bloom/page (122).png',
    'books/rose in bloom/page (123).png',
    'books/rose in bloom/page (124).png',
    'books/rose in bloom/page (125).png',
    'books/rose in bloom/page (126).png',
    'books/rose in bloom/page (127).png',
    'books/rose in bloom/page (128).png',
    'books/rose in bloom/page (129).png',
    'books/rose in bloom/page (130).png',
    'books/rose in bloom/page (131).png',
    'books/rose in bloom/page (132).png',
    'books/rose in bloom/page (133).png',
    'books/rose in bloom/page (134).png',
    'books/rose in bloom/page (135).png',
    'books/rose in bloom/page (136).png',
    'books/rose in bloom/page (137).png',
    'books/rose in bloom/page (138).png',
    'books/rose in bloom/page (139).png',
    'books/rose in bloom/page (140).png',
    'books/rose in bloom/page (141).png',
    'books/rose in bloom/page (142).png',
    'books/rose in bloom/page (143).png',
    'books/rose in bloom/page (144).png',
    'books/rose in bloom/page (145).png',
    'books/rose in bloom/page (146).png',
    'books/rose in bloom/page (147).png',
    'books/rose in bloom/page (148).png',
    'books/rose in bloom/page (149).png',
    'books/rose in bloom/page (150).png',
    'books/rose in bloom/page (151).png',
    'books/rose in bloom/page (152).png',
    'books/rose in bloom/page (153).png',
    'books/rose in bloom/page (154).png',
    'books/rose in bloom/page (155).png',
    'books/rose in bloom/page (156).png',
    'books/rose in bloom/page (157).png',
    'books/rose in bloom/page (158).png',
    'books/rose in bloom/page (159).png',
    'books/rose in bloom/page (160).png',
    'books/rose in bloom/page (161).png',
    'books/rose in bloom/page (162).png',
    'books/rose in bloom/page (163).png',
    'books/rose in bloom/page (164).png',
    'books/rose in bloom/page (165).png',
    'books/rose in bloom/page (166).png',
    'books/rose in bloom/page (167).png',
    'books/rose in bloom/page (168).png',
    'books/rose in bloom/page (169).png',
    'books/rose in bloom/page (170).png',
    'books/rose in bloom/page (171).png',
    'books/rose in bloom/page (172).png',
    'books/rose in bloom/page (173).png',
    'books/rose in bloom/page (174).png',
    'books/rose in bloom/page (175).png',
    'books/rose in bloom/page (176).png',
    'books/rose in bloom/page (177).png',
    'books/rose in bloom/page (178).png',
    'books/rose in bloom/page (179).png',
    'books/rose in bloom/page (180).png',
    'books/rose in bloom/page (181).png',
    'books/rose in bloom/page (182).png',
    'books/rose in bloom/page (183).png',
    'books/rose in bloom/page (184).png',
    'books/rose in bloom/page (185).png',
    'books/rose in bloom/page (186).png',
    'books/rose in bloom/page (187).png',
    'books/rose in bloom/page (188).png',
    'books/rose in bloom/page (189).png',
    'books/rose in bloom/page (190).png',
    'books/rose in bloom/page (191).png',
    'books/rose in bloom/page (192).png',
    'books/rose in bloom/page (193).png',
    'books/rose in bloom/page (194).png',
    'books/rose in bloom/page (195).png',
    'books/rose in bloom/page (196).png',
    'books/rose in bloom/page (197).png',
    'books/rose in bloom/page (198).png',
    'books/rose in bloom/page (199).png',
    'books/rose in bloom/page (200).png',
    'books/rose in bloom/page (201).png',
    'books/rose in bloom/page (202).png',
    'books/rose in bloom/page (203).png',
    'books/rose in bloom/page (204).png',
    'books/rose in bloom/page (205).png',
    'books/rose in bloom/page (206).png',
    'books/rose in bloom/page (207).png',
    'books/rose in bloom/page (208).png',
    'books/rose in bloom/page (209).png',
    'books/rose in bloom/page (210).png',
    'books/rose in bloom/page (211).png',
    'books/rose in bloom/page (212).png',
    'books/rose in bloom/page (213).png',
    'books/rose in bloom/page (214).png',
    'books/rose in bloom/page (215).png',
    'books/rose in bloom/page (216).png',
    'books/rose in bloom/page (217).png',
    'books/rose in bloom/page (218).png',
    'books/rose in bloom/page (219).png',
    'books/rose in bloom/page (220).png',
    'books/rose in bloom/page (221).png',
    'books/rose in bloom/page (222).png',
    'books/rose in bloom/page (223).png',
    'books/rose in bloom/page (224).png',
    'books/rose in bloom/page (225).png',
    'books/rose in bloom/page (226).png',
    'books/rose in bloom/page (227).png',
    'books/rose in bloom/page (228).png',
    'books/rose in bloom/page (229).png',
    'books/rose in bloom/page (230).png',
    'books/rose in bloom/page (231).png',
    'books/rose in bloom/page (232).png',
    'books/rose in bloom/page (233).png',
    'books/rose in bloom/page (234).png',
    'books/rose in bloom/page (235).png',
    'books/rose in bloom/page (236).png',
    'books/rose in bloom/page (237).png',

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
