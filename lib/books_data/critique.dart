import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class critique extends StatefulWidget {
  const critique({Key? key}) : super(key: key);

  @override
  State<critique> createState() => _critiqueState();
}

class _critiqueState extends State<critique> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Critique/page (1).png',
    'books/Critique/page (2).png',
    'books/Critique/page (3).png',
    'books/Critique/page (4).png',
    'books/Critique/page (5).png',
    'books/Critique/page (6).png',
    'books/Critique/page (7).png',
    'books/Critique/page (8).png',
    'books/Critique/page (9).png',
    'books/Critique/page (10).png',
    'books/Critique/page (11).png',
    'books/Critique/page (12).png',
    'books/Critique/page (13).png',
    'books/Critique/page (14).png',
    'books/Critique/page (15).png',
    'books/Critique/page (16).png',
    'books/Critique/page (17).png',
    'books/Critique/page (18).png',
    'books/Critique/page (19).png',
    'books/Critique/page (20).png',
    'books/Critique/page (21).png',
    'books/Critique/page (22).png',
    'books/Critique/page (23).png',
    'books/Critique/page (24).png',
    'books/Critique/page (25).png',
    'books/Critique/page (26).png',
    'books/Critique/page (27).png',
    'books/Critique/page (28).png',
    'books/Critique/page (29).png',
    'books/Critique/page (30).png',
    'books/Critique/page (31).png',
    'books/Critique/page (32).png',
    'books/Critique/page (33).png',
    'books/Critique/page (34).png',
    'books/Critique/page (35).png',
    'books/Critique/page (36).png',
    'books/Critique/page (37).png',
    'books/Critique/page (38).png',
    'books/Critique/page (39).png',
    'books/Critique/page (40).png',
    'books/Critique/page (41).png',
    'books/Critique/page (42).png',
    'books/Critique/page (43).png',
    'books/Critique/page (44).png',
    'books/Critique/page (45).png',
    'books/Critique/page (46).png',
    'books/Critique/page (47).png',
    'books/Critique/page (48).png',
    'books/Critique/page (49).png',
    'books/Critique/page (50).png',
    'books/Critique/page (51).png',
    'books/Critique/page (52).png',
    'books/Critique/page (53).png',
    'books/Critique/page (54).png',
    'books/Critique/page (55).png',
    'books/Critique/page (56).png',
    'books/Critique/page (57).png',
    'books/Critique/page (58).png',
    'books/Critique/page (59).png',
    'books/Critique/page (60).png',
    'books/Critique/page (61).png',
    'books/Critique/page (62).png',
    'books/Critique/page (63).png',
    'books/Critique/page (64).png',
    'books/Critique/page (65).png',
    'books/Critique/page (66).png',
    'books/Critique/page (67).png',
    'books/Critique/page (68).png',
    'books/Critique/page (69).png',
    'books/Critique/page (70).png',
    'books/Critique/page (71).png',
    'books/Critique/page (72).png',
    'books/Critique/page (73).png',
    'books/Critique/page (74).png',
    'books/Critique/page (75).png',
    'books/Critique/page (76).png',
    'books/Critique/page (77).png',
    'books/Critique/page (78).png',
    'books/Critique/page (79).png',
    'books/Critique/page (80).png',
    'books/Critique/page (81).png',
    'books/Critique/page (82).png',
    'books/Critique/page (83).png',
    'books/Critique/page (84).png',
    'books/Critique/page (85).png',
    'books/Critique/page (86).png',
    'books/Critique/page (87).png',
    'books/Critique/page (88).png',
    'books/Critique/page (89).png',
    'books/Critique/page (90).png',
    'books/Critique/page (91).png',
    'books/Critique/page (92).png',
    'books/Critique/page (93).png',
    'books/Critique/page (94).png',
    'books/Critique/page (95).png',
    'books/Critique/page (96).png',
    'books/Critique/page (97).png',
    'books/Critique/page (98).png',
    'books/Critique/page (99).png',
    'books/Critique/page (100).png',
    'books/Critique/page (101).png',
    'books/Critique/page (102).png',
    'books/Critique/page (103).png',
    'books/Critique/page (104).png',
    'books/Critique/page (105).png',
    'books/Critique/page (106).png',
    'books/Critique/page (107).png',
    'books/Critique/page (108).png',
    'books/Critique/page (109).png',
    'books/Critique/page (110).png',
    'books/Critique/page (111).png',
    'books/Critique/page (112).png',
    'books/Critique/page (113).png',
    'books/Critique/page (114).png',
    'books/Critique/page (115).png',
    'books/Critique/page (116).png',
    'books/Critique/page (117).png',
    'books/Critique/page (118).png',
    'books/Critique/page (119).png',
    'books/Critique/page (120).png',
    'books/Critique/page (121).png',
    'books/Critique/page (122).png',
    'books/Critique/page (123).png',
    'books/Critique/page (124).png',
    'books/Critique/page (125).png',
    'books/Critique/page (126).png',
    'books/Critique/page (127).png',
    'books/Critique/page (128).png',
    'books/Critique/page (129).png',
    'books/Critique/page (130).png',
    'books/Critique/page (131).png',
    'books/Critique/page (132).png',
    'books/Critique/page (133).png',
    'books/Critique/page (134).png',
    'books/Critique/page (135).png',
    'books/Critique/page (136).png',
    'books/Critique/page (137).png',
    'books/Critique/page (138).png',
    'books/Critique/page (139).png',
    'books/Critique/page (140).png',
    'books/Critique/page (141).png',
    'books/Critique/page (142).png',
    'books/Critique/page (143).png',
    'books/Critique/page (144).png',
    'books/Critique/page (145).png',
    'books/Critique/page (146).png',
    'books/Critique/page (147).png',
    'books/Critique/page (148).png',
    'books/Critique/page (149).png',
    'books/Critique/page (150).png',
    'books/Critique/page (151).png',
    'books/Critique/page (152).png',
    'books/Critique/page (153).png',
    'books/Critique/page (154).png',
    'books/Critique/page (155).png',
    'books/Critique/page (156).png',
    'books/Critique/page (157).png',
    'books/Critique/page (158).png',
    'books/Critique/page (159).png',
    'books/Critique/page (160).png',
    'books/Critique/page (161).png',
    'books/Critique/page (162).png',
    'books/Critique/page (163).png',
    'books/Critique/page (164).png',
    'books/Critique/page (165).png',
    'books/Critique/page (166).png',
    'books/Critique/page (167).png',
    'books/Critique/page (168).png',
    'books/Critique/page (169).png',
    'books/Critique/page (170).png',
    'books/Critique/page (171).png',
    'books/Critique/page (172).png',
    'books/Critique/page (173).png',
    'books/Critique/page (174).png',
    'books/Critique/page (175).png',
    'books/Critique/page (176).png',
    'books/Critique/page (177).png',
    'books/Critique/page (178).png',
    'books/Critique/page (179).png',
    'books/Critique/page (180).png',
    'books/Critique/page (181).png',
    'books/Critique/page (182).png',
    'books/Critique/page (183).png',
    'books/Critique/page (184).png',
    'books/Critique/page (185).png',
    'books/Critique/page (186).png',
    'books/Critique/page (187).png',
    'books/Critique/page (188).png',
    'books/Critique/page (189).png',
    'books/Critique/page (190).png',
    'books/Critique/page (191).png',
    'books/Critique/page (192).png',
    'books/Critique/page (193).png',
    'books/Critique/page (194).png',
    'books/Critique/page (195).png',
    'books/Critique/page (196).png',
    'books/Critique/page (197).png',
    'books/Critique/page (198).png',
    'books/Critique/page (199).png',
    'books/Critique/page (200).png',
    'books/Critique/page (201).png',
    'books/Critique/page (202).png',
    'books/Critique/page (203).png',
    'books/Critique/page (204).png',
    'books/Critique/page (205).png',
    'books/Critique/page (206).png',
    'books/Critique/page (207).png',
    'books/Critique/page (208).png',
    'books/Critique/page (209).png',
    'books/Critique/page (210).png',
    'books/Critique/page (211).png',
    'books/Critique/page (212).png',
    'books/Critique/page (213).png',
    'books/Critique/page (214).png',
    'books/Critique/page (215).png',
    'books/Critique/page (216).png',
    'books/Critique/page (217).png',
    'books/Critique/page (218).png',
    'books/Critique/page (219).png',
    'books/Critique/page (220).png',
    'books/Critique/page (221).png',
    'books/Critique/page (222).png',
    'books/Critique/page (223).png',
    'books/Critique/page (224).png',
    'books/Critique/page (225).png',
    'books/Critique/page (226).png',
    'books/Critique/page (227).png',
    'books/Critique/page (228).png',
    'books/Critique/page (229).png',
    'books/Critique/page (230).png',
    'books/Critique/page (231).png',
    'books/Critique/page (232).png',
    'books/Critique/page (233).png',
    'books/Critique/page (234).png',

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
