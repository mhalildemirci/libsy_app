import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class secretadversary extends StatefulWidget {
  const secretadversary({Key? key}) : super(key: key);

  @override
  State<secretadversary> createState() => _secretadversaryState();
}

class _secretadversaryState extends State<secretadversary> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/secret adversary/page (1).png',
    'books/secret adversary/page (2).png',
    'books/secret adversary/page (3).png',
    'books/secret adversary/page (4).png',
    'books/secret adversary/page (5).png',
    'books/secret adversary/page (6).png',
    'books/secret adversary/page (7).png',
    'books/secret adversary/page (8).png',
    'books/secret adversary/page (9).png',
    'books/secret adversary/page (10).png',
    'books/secret adversary/page (11).png',
    'books/secret adversary/page (12).png',
    'books/secret adversary/page (13).png',
    'books/secret adversary/page (14).png',
    'books/secret adversary/page (15).png',
    'books/secret adversary/page (16).png',
    'books/secret adversary/page (17).png',
    'books/secret adversary/page (18).png',
    'books/secret adversary/page (19).png',
    'books/secret adversary/page (20).png',
    'books/secret adversary/page (21).png',
    'books/secret adversary/page (22).png',
    'books/secret adversary/page (23).png',
    'books/secret adversary/page (24).png',
    'books/secret adversary/page (25).png',
    'books/secret adversary/page (26).png',
    'books/secret adversary/page (27).png',
    'books/secret adversary/page (28).png',
    'books/secret adversary/page (29).png',
    'books/secret adversary/page (30).png',
    'books/secret adversary/page (31).png',
    'books/secret adversary/page (32).png',
    'books/secret adversary/page (33).png',
    'books/secret adversary/page (34).png',
    'books/secret adversary/page (35).png',
    'books/secret adversary/page (36).png',
    'books/secret adversary/page (37).png',
    'books/secret adversary/page (38).png',
    'books/secret adversary/page (39).png',
    'books/secret adversary/page (40).png',
    'books/secret adversary/page (41).png',
    'books/secret adversary/page (42).png',
    'books/secret adversary/page (43).png',
    'books/secret adversary/page (44).png',
    'books/secret adversary/page (45).png',
    'books/secret adversary/page (46).png',
    'books/secret adversary/page (47).png',
    'books/secret adversary/page (48).png',
    'books/secret adversary/page (49).png',
    'books/secret adversary/page (50).png',
    'books/secret adversary/page (51).png',
    'books/secret adversary/page (52).png',
    'books/secret adversary/page (53).png',
    'books/secret adversary/page (54).png',
    'books/secret adversary/page (55).png',
    'books/secret adversary/page (56).png',
    'books/secret adversary/page (57).png',
    'books/secret adversary/page (58).png',
    'books/secret adversary/page (59).png',
    'books/secret adversary/page (60).png',
    'books/secret adversary/page (61).png',
    'books/secret adversary/page (62).png',
    'books/secret adversary/page (63).png',
    'books/secret adversary/page (64).png',
    'books/secret adversary/page (65).png',
    'books/secret adversary/page (66).png',
    'books/secret adversary/page (67).png',
    'books/secret adversary/page (68).png',
    'books/secret adversary/page (69).png',
    'books/secret adversary/page (70).png',
    'books/secret adversary/page (71).png',
    'books/secret adversary/page (72).png',
    'books/secret adversary/page (73).png',
    'books/secret adversary/page (74).png',
    'books/secret adversary/page (75).png',
    'books/secret adversary/page (76).png',
    'books/secret adversary/page (77).png',
    'books/secret adversary/page (78).png',
    'books/secret adversary/page (79).png',
    'books/secret adversary/page (80).png',
    'books/secret adversary/page (81).png',
    'books/secret adversary/page (82).png',
    'books/secret adversary/page (83).png',
    'books/secret adversary/page (84).png',
    'books/secret adversary/page (85).png',
    'books/secret adversary/page (86).png',
    'books/secret adversary/page (87).png',
    'books/secret adversary/page (88).png',
    'books/secret adversary/page (89).png',
    'books/secret adversary/page (90).png',
    'books/secret adversary/page (91).png',
    'books/secret adversary/page (92).png',
    'books/secret adversary/page (93).png',
    'books/secret adversary/page (94).png',
    'books/secret adversary/page (95).png',
    'books/secret adversary/page (96).png',
    'books/secret adversary/page (97).png',
    'books/secret adversary/page (98).png',
    'books/secret adversary/page (99).png',
    'books/secret adversary/page (100).png',
    'books/secret adversary/page (101).png',
    'books/secret adversary/page (102).png',
    'books/secret adversary/page (103).png',
    'books/secret adversary/page (104).png',
    'books/secret adversary/page (105).png',
    'books/secret adversary/page (106).png',
    'books/secret adversary/page (107).png',
    'books/secret adversary/page (108).png',
    'books/secret adversary/page (109).png',
    'books/secret adversary/page (110).png',
    'books/secret adversary/page (111).png',
    'books/secret adversary/page (112).png',
    'books/secret adversary/page (113).png',
    'books/secret adversary/page (114).png',
    'books/secret adversary/page (115).png',
    'books/secret adversary/page (116).png',
    'books/secret adversary/page (117).png',
    'books/secret adversary/page (118).png',
    'books/secret adversary/page (119).png',
    'books/secret adversary/page (120).png',
    'books/secret adversary/page (121).png',
    'books/secret adversary/page (122).png',
    'books/secret adversary/page (123).png',
    'books/secret adversary/page (124).png',
    'books/secret adversary/page (125).png',
    'books/secret adversary/page (126).png',
    'books/secret adversary/page (127).png',
    'books/secret adversary/page (128).png',
    'books/secret adversary/page (129).png',
    'books/secret adversary/page (130).png',
    'books/secret adversary/page (131).png',
    'books/secret adversary/page (132).png',
    'books/secret adversary/page (133).png',
    'books/secret adversary/page (134).png',
    'books/secret adversary/page (135).png',
    'books/secret adversary/page (136).png',
    'books/secret adversary/page (137).png',
    'books/secret adversary/page (138).png',
    'books/secret adversary/page (139).png',
    'books/secret adversary/page (140).png',
    'books/secret adversary/page (141).png',
    'books/secret adversary/page (142).png',
    'books/secret adversary/page (143).png',
    'books/secret adversary/page (144).png',
    'books/secret adversary/page (145).png',
    'books/secret adversary/page (146).png',
    'books/secret adversary/page (147).png',
    'books/secret adversary/page (148).png',
    'books/secret adversary/page (149).png',
    'books/secret adversary/page (150).png',
    'books/secret adversary/page (151).png',
    'books/secret adversary/page (152).png',
    'books/secret adversary/page (153).png',
    'books/secret adversary/page (154).png',
    'books/secret adversary/page (155).png',
    'books/secret adversary/page (156).png',
    'books/secret adversary/page (157).png',
    'books/secret adversary/page (158).png',
    'books/secret adversary/page (159).png',
    'books/secret adversary/page (160).png',
    'books/secret adversary/page (161).png',
    'books/secret adversary/page (162).png',
    'books/secret adversary/page (163).png',
    'books/secret adversary/page (164).png',
    'books/secret adversary/page (165).png',
    'books/secret adversary/page (166).png',
    'books/secret adversary/page (167).png',
    'books/secret adversary/page (168).png',
    'books/secret adversary/page (169).png',
    'books/secret adversary/page (170).png',
    'books/secret adversary/page (171).png',
    'books/secret adversary/page (172).png',
    'books/secret adversary/page (173).png',
    'books/secret adversary/page (174).png',
    'books/secret adversary/page (175).png',
    'books/secret adversary/page (176).png',
    'books/secret adversary/page (177).png',
    'books/secret adversary/page (178).png',
    'books/secret adversary/page (179).png',
    'books/secret adversary/page (180).png',
    'books/secret adversary/page (181).png',
    'books/secret adversary/page (182).png',
    'books/secret adversary/page (183).png',
    'books/secret adversary/page (184).png',
    'books/secret adversary/page (185).png',
    'books/secret adversary/page (186).png',
    'books/secret adversary/page (187).png',
    'books/secret adversary/page (188).png',
    'books/secret adversary/page (189).png',
    'books/secret adversary/page (190).png',
    'books/secret adversary/page (191).png',
    'books/secret adversary/page (192).png',
    'books/secret adversary/page (193).png',
    'books/secret adversary/page (194).png',
    'books/secret adversary/page (195).png',
    'books/secret adversary/page (196).png',
    'books/secret adversary/page (197).png',
    'books/secret adversary/page (198).png',
    'books/secret adversary/page (199).png',
    'books/secret adversary/page (200).png',
    'books/secret adversary/page (201).png',
    'books/secret adversary/page (202).png',
    'books/secret adversary/page (203).png',
    'books/secret adversary/page (204).png',
    'books/secret adversary/page (205).png',
    'books/secret adversary/page (206).png',
    'books/secret adversary/page (207).png',
    'books/secret adversary/page (208).png',
    'books/secret adversary/page (209).png',
    'books/secret adversary/page (210).png',
    'books/secret adversary/page (211).png',
    'books/secret adversary/page (212).png',
    'books/secret adversary/page (213).png',
    'books/secret adversary/page (214).png',
    'books/secret adversary/page (215).png',
    'books/secret adversary/page (216).png',
    'books/secret adversary/page (217).png',
    'books/secret adversary/page (218).png',
    'books/secret adversary/page (219).png',
    'books/secret adversary/page (220).png',
    'books/secret adversary/page (221).png',
    'books/secret adversary/page (222).png',
    'books/secret adversary/page (223).png',
    'books/secret adversary/page (224).png',
    'books/secret adversary/page (225).png',
    'books/secret adversary/page (226).png',
    'books/secret adversary/page (227).png',
    'books/secret adversary/page (228).png',
    'books/secret adversary/page (229).png',
    'books/secret adversary/page (230).png',
    'books/secret adversary/page (231).png',
    'books/secret adversary/page (232).png',
    'books/secret adversary/page (233).png',
    'books/secret adversary/page (234).png',
    'books/secret adversary/page (235).png',
    'books/secret adversary/page (236).png',
    'books/secret adversary/page (237).png',
    'books/secret adversary/page (238).png',
    'books/secret adversary/page (239).png',
    'books/secret adversary/page (240).png',
    'books/secret adversary/page (241).png',
    'books/secret adversary/page (242).png',
    'books/secret adversary/page (243).png',
    'books/secret adversary/page (244).png',
    'books/secret adversary/page (245).png',
    'books/secret adversary/page (246).png',
    'books/secret adversary/page (247).png',
    'books/secret adversary/page (248).png',
    'books/secret adversary/page (249).png',
    'books/secret adversary/page (250).png',
    'books/secret adversary/page (251).png',
    'books/secret adversary/page (252).png',
    'books/secret adversary/page (253).png',
    'books/secret adversary/page (254).png',
    'books/secret adversary/page (255).png',

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
