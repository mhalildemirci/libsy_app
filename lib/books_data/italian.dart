import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class italian extends StatefulWidget {
  const italian({Key? key}) : super(key: key);

  @override
  State<italian> createState() => _italianState();
}

class _italianState extends State<italian> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/italian/page (1).png',
    'books/italian/page (2).png',
    'books/italian/page (3).png',
    'books/italian/page (4).png',
    'books/italian/page (5).png',
    'books/italian/page (6).png',
    'books/italian/page (7).png',
    'books/italian/page (8).png',
    'books/italian/page (9).png',
    'books/italian/page (10).png',
    'books/italian/page (11).png',
    'books/italian/page (12).png',
    'books/italian/page (13).png',
    'books/italian/page (14).png',
    'books/italian/page (15).png',
    'books/italian/page (16).png',
    'books/italian/page (17).png',
    'books/italian/page (18).png',
    'books/italian/page (19).png',
    'books/italian/page (20).png',
    'books/italian/page (21).png',
    'books/italian/page (22).png',
    'books/italian/page (23).png',
    'books/italian/page (24).png',
    'books/italian/page (25).png',
    'books/italian/page (26).png',
    'books/italian/page (27).png',
    'books/italian/page (28).png',
    'books/italian/page (29).png',
    'books/italian/page (30).png',
    'books/italian/page (31).png',
    'books/italian/page (32).png',
    'books/italian/page (33).png',
    'books/italian/page (34).png',
    'books/italian/page (35).png',
    'books/italian/page (36).png',
    'books/italian/page (37).png',
    'books/italian/page (38).png',
    'books/italian/page (39).png',
    'books/italian/page (40).png',
    'books/italian/page (41).png',
    'books/italian/page (42).png',
    'books/italian/page (43).png',
    'books/italian/page (44).png',
    'books/italian/page (45).png',
    'books/italian/page (46).png',
    'books/italian/page (47).png',
    'books/italian/page (48).png',
    'books/italian/page (49).png',
    'books/italian/page (50).png',
    'books/italian/page (51).png',
    'books/italian/page (52).png',
    'books/italian/page (53).png',
    'books/italian/page (54).png',
    'books/italian/page (55).png',
    'books/italian/page (56).png',
    'books/italian/page (57).png',
    'books/italian/page (58).png',
    'books/italian/page (59).png',
    'books/italian/page (60).png',
    'books/italian/page (61).png',
    'books/italian/page (62).png',
    'books/italian/page (63).png',
    'books/italian/page (64).png',
    'books/italian/page (65).png',
    'books/italian/page (66).png',
    'books/italian/page (67).png',
    'books/italian/page (68).png',
    'books/italian/page (69).png',
    'books/italian/page (70).png',
    'books/italian/page (71).png',
    'books/italian/page (72).png',
    'books/italian/page (73).png',
    'books/italian/page (74).png',
    'books/italian/page (75).png',
    'books/italian/page (76).png',
    'books/italian/page (77).png',
    'books/italian/page (78).png',
    'books/italian/page (79).png',
    'books/italian/page (80).png',
    'books/italian/page (81).png',
    'books/italian/page (82).png',
    'books/italian/page (83).png',
    'books/italian/page (84).png',
    'books/italian/page (85).png',
    'books/italian/page (86).png',
    'books/italian/page (87).png',
    'books/italian/page (88).png',
    'books/italian/page (89).png',
    'books/italian/page (90).png',
    'books/italian/page (91).png',
    'books/italian/page (92).png',
    'books/italian/page (93).png',
    'books/italian/page (94).png',
    'books/italian/page (95).png',
    'books/italian/page (96).png',
    'books/italian/page (97).png',
    'books/italian/page (98).png',
    'books/italian/page (99).png',
    'books/italian/page (100).png',
    'books/italian/page (101).png',
    'books/italian/page (102).png',
    'books/italian/page (103).png',
    'books/italian/page (104).png',
    'books/italian/page (105).png',
    'books/italian/page (106).png',
    'books/italian/page (107).png',
    'books/italian/page (108).png',
    'books/italian/page (109).png',
    'books/italian/page (110).png',
    'books/italian/page (111).png',
    'books/italian/page (112).png',
    'books/italian/page (113).png',
    'books/italian/page (114).png',
    'books/italian/page (115).png',
    'books/italian/page (116).png',
    'books/italian/page (117).png',
    'books/italian/page (118).png',
    'books/italian/page (119).png',
    'books/italian/page (120).png',
    'books/italian/page (121).png',
    'books/italian/page (122).png',
    'books/italian/page (123).png',
    'books/italian/page (124).png',
    'books/italian/page (125).png',
    'books/italian/page (126).png',
    'books/italian/page (127).png',
    'books/italian/page (128).png',
    'books/italian/page (129).png',
    'books/italian/page (130).png',
    'books/italian/page (131).png',
    'books/italian/page (132).png',
    'books/italian/page (133).png',
    'books/italian/page (134).png',
    'books/italian/page (135).png',
    'books/italian/page (136).png',
    'books/italian/page (137).png',
    'books/italian/page (138).png',
    'books/italian/page (139).png',
    'books/italian/page (140).png',
    'books/italian/page (141).png',
    'books/italian/page (142).png',
    'books/italian/page (143).png',
    'books/italian/page (144).png',
    'books/italian/page (145).png',
    'books/italian/page (146).png',
    'books/italian/page (147).png',
    'books/italian/page (148).png',
    'books/italian/page (149).png',
    'books/italian/page (150).png',
    'books/italian/page (151).png',
    'books/italian/page (152).png',
    'books/italian/page (153).png',
    'books/italian/page (154).png',
    'books/italian/page (155).png',
    'books/italian/page (156).png',
    'books/italian/page (157).png',
    'books/italian/page (158).png',
    'books/italian/page (159).png',
    'books/italian/page (160).png',
    'books/italian/page (161).png',
    'books/italian/page (162).png',
    'books/italian/page (163).png',
    'books/italian/page (164).png',
    'books/italian/page (165).png',
    'books/italian/page (166).png',
    'books/italian/page (167).png',
    'books/italian/page (168).png',
    'books/italian/page (169).png',
    'books/italian/page (170).png',
    'books/italian/page (171).png',
    'books/italian/page (172).png',
    'books/italian/page (173).png',
    'books/italian/page (174).png',
    'books/italian/page (175).png',
    'books/italian/page (176).png',
    'books/italian/page (177).png',
    'books/italian/page (178).png',
    'books/italian/page (179).png',
    'books/italian/page (180).png',
    'books/italian/page (181).png',
    'books/italian/page (182).png',
    'books/italian/page (183).png',
    'books/italian/page (184).png',
    'books/italian/page (185).png',
    'books/italian/page (186).png',
    'books/italian/page (187).png',
    'books/italian/page (188).png',
    'books/italian/page (189).png',
    'books/italian/page (190).png',
    'books/italian/page (191).png',
    'books/italian/page (192).png',
    'books/italian/page (193).png',
    'books/italian/page (194).png',
    'books/italian/page (195).png',
    'books/italian/page (196).png',
    'books/italian/page (197).png',
    'books/italian/page (198).png',
    'books/italian/page (199).png',
    'books/italian/page (200).png',
    'books/italian/page (201).png',
    'books/italian/page (202).png',
    'books/italian/page (203).png',
    'books/italian/page (204).png',
    'books/italian/page (205).png',
    'books/italian/page (206).png',
    'books/italian/page (207).png',
    'books/italian/page (208).png',
    'books/italian/page (209).png',
    'books/italian/page (210).png',
    'books/italian/page (211).png',
    'books/italian/page (212).png',
    'books/italian/page (213).png',
    'books/italian/page (214).png',
    'books/italian/page (215).png',
    'books/italian/page (216).png',
    'books/italian/page (217).png',
    'books/italian/page (218).png',
    'books/italian/page (219).png',
    'books/italian/page (220).png',
    'books/italian/page (221).png',
    'books/italian/page (222).png',
    'books/italian/page (223).png',
    'books/italian/page (224).png',
    'books/italian/page (225).png',
    'books/italian/page (226).png',
    'books/italian/page (227).png',
    'books/italian/page (228).png',
    'books/italian/page (229).png',
    'books/italian/page (230).png',
    'books/italian/page (231).png',
    'books/italian/page (232).png',
    'books/italian/page (233).png',
    'books/italian/page (234).png',
    'books/italian/page (235).png',
    'books/italian/page (236).png',
    'books/italian/page (237).png',
    'books/italian/page (238).png',
    'books/italian/page (239).png',
    'books/italian/page (240).png',

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
