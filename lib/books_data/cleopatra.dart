import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class cleopatra extends StatefulWidget {
  const cleopatra({Key? key}) : super(key: key);

  @override
  State<cleopatra> createState() => _cleopatraState();
}

class _cleopatraState extends State<cleopatra> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/cleopatra/page (1).png',
    'books/cleopatra/page (2).png',
    'books/cleopatra/page (3).png',
    'books/cleopatra/page (4).png',
    'books/cleopatra/page (5).png',
    'books/cleopatra/page (6).png',
    'books/cleopatra/page (7).png',
    'books/cleopatra/page (8).png',
    'books/cleopatra/page (9).png',
    'books/cleopatra/page (10).png',
    'books/cleopatra/page (11).png',
    'books/cleopatra/page (12).png',
    'books/cleopatra/page (13).png',
    'books/cleopatra/page (14).png',
    'books/cleopatra/page (15).png',
    'books/cleopatra/page (16).png',
    'books/cleopatra/page (17).png',
    'books/cleopatra/page (18).png',
    'books/cleopatra/page (19).png',
    'books/cleopatra/page (20).png',
    'books/cleopatra/page (21).png',
    'books/cleopatra/page (22).png',
    'books/cleopatra/page (23).png',
    'books/cleopatra/page (24).png',
    'books/cleopatra/page (25).png',
    'books/cleopatra/page (26).png',
    'books/cleopatra/page (27).png',
    'books/cleopatra/page (28).png',
    'books/cleopatra/page (29).png',
    'books/cleopatra/page (30).png',
    'books/cleopatra/page (31).png',
    'books/cleopatra/page (32).png',
    'books/cleopatra/page (33).png',
    'books/cleopatra/page (34).png',
    'books/cleopatra/page (35).png',
    'books/cleopatra/page (36).png',
    'books/cleopatra/page (37).png',
    'books/cleopatra/page (38).png',
    'books/cleopatra/page (39).png',
    'books/cleopatra/page (40).png',
    'books/cleopatra/page (41).png',
    'books/cleopatra/page (42).png',
    'books/cleopatra/page (43).png',
    'books/cleopatra/page (44).png',
    'books/cleopatra/page (45).png',
    'books/cleopatra/page (46).png',
    'books/cleopatra/page (47).png',
    'books/cleopatra/page (48).png',
    'books/cleopatra/page (49).png',
    'books/cleopatra/page (50).png',
    'books/cleopatra/page (51).png',
    'books/cleopatra/page (52).png',
    'books/cleopatra/page (53).png',
    'books/cleopatra/page (54).png',
    'books/cleopatra/page (55).png',
    'books/cleopatra/page (56).png',
    'books/cleopatra/page (57).png',
    'books/cleopatra/page (58).png',
    'books/cleopatra/page (59).png',
    'books/cleopatra/page (60).png',
    'books/cleopatra/page (61).png',
    'books/cleopatra/page (62).png',
    'books/cleopatra/page (63).png',
    'books/cleopatra/page (64).png',
    'books/cleopatra/page (65).png',
    'books/cleopatra/page (66).png',
    'books/cleopatra/page (67).png',
    'books/cleopatra/page (68).png',
    'books/cleopatra/page (69).png',
    'books/cleopatra/page (70).png',
    'books/cleopatra/page (71).png',
    'books/cleopatra/page (72).png',
    'books/cleopatra/page (73).png',
    'books/cleopatra/page (74).png',
    'books/cleopatra/page (75).png',
    'books/cleopatra/page (76).png',
    'books/cleopatra/page (77).png',
    'books/cleopatra/page (78).png',
    'books/cleopatra/page (79).png',
    'books/cleopatra/page (80).png',
    'books/cleopatra/page (81).png',
    'books/cleopatra/page (82).png',
    'books/cleopatra/page (83).png',
    'books/cleopatra/page (84).png',
    'books/cleopatra/page (85).png',
    'books/cleopatra/page (86).png',
    'books/cleopatra/page (87).png',
    'books/cleopatra/page (88).png',
    'books/cleopatra/page (89).png',
    'books/cleopatra/page (90).png',
    'books/cleopatra/page (91).png',
    'books/cleopatra/page (92).png',
    'books/cleopatra/page (93).png',
    'books/cleopatra/page (94).png',
    'books/cleopatra/page (95).png',
    'books/cleopatra/page (96).png',
    'books/cleopatra/page (97).png',
    'books/cleopatra/page (98).png',
    'books/cleopatra/page (99).png',
    'books/cleopatra/page (100).png',
    'books/cleopatra/page (101).png',
    'books/cleopatra/page (102).png',
    'books/cleopatra/page (103).png',
    'books/cleopatra/page (104).png',
    'books/cleopatra/page (105).png',
    'books/cleopatra/page (106).png',
    'books/cleopatra/page (107).png',
    'books/cleopatra/page (108).png',
    'books/cleopatra/page (109).png',
    'books/cleopatra/page (110).png',
    'books/cleopatra/page (111).png',
    'books/cleopatra/page (112).png',
    'books/cleopatra/page (113).png',
    'books/cleopatra/page (114).png',
    'books/cleopatra/page (115).png',
    'books/cleopatra/page (116).png',
    'books/cleopatra/page (117).png',
    'books/cleopatra/page (118).png',
    'books/cleopatra/page (119).png',
    'books/cleopatra/page (120).png',
    'books/cleopatra/page (121).png',
    'books/cleopatra/page (122).png',
    'books/cleopatra/page (123).png',
    'books/cleopatra/page (124).png',
    'books/cleopatra/page (125).png',
    'books/cleopatra/page (126).png',
    'books/cleopatra/page (127).png',
    'books/cleopatra/page (128).png',
    'books/cleopatra/page (129).png',
    'books/cleopatra/page (130).png',
    'books/cleopatra/page (131).png',
    'books/cleopatra/page (132).png',
    'books/cleopatra/page (133).png',
    'books/cleopatra/page (134).png',
    'books/cleopatra/page (135).png',
    'books/cleopatra/page (136).png',
    'books/cleopatra/page (137).png',
    'books/cleopatra/page (138).png',
    'books/cleopatra/page (139).png',
    'books/cleopatra/page (140).png',
    'books/cleopatra/page (141).png',
    'books/cleopatra/page (142).png',
    'books/cleopatra/page (143).png',
    'books/cleopatra/page (144).png',
    'books/cleopatra/page (145).png',
    'books/cleopatra/page (146).png',
    'books/cleopatra/page (147).png',
    'books/cleopatra/page (148).png',
    'books/cleopatra/page (149).png',
    'books/cleopatra/page (150).png',
    'books/cleopatra/page (151).png',
    'books/cleopatra/page (152).png',
    'books/cleopatra/page (153).png',
    'books/cleopatra/page (154).png',
    'books/cleopatra/page (155).png',
    'books/cleopatra/page (156).png',
    'books/cleopatra/page (157).png',
    'books/cleopatra/page (158).png',
    'books/cleopatra/page (159).png',
    'books/cleopatra/page (160).png',
    'books/cleopatra/page (161).png',
    'books/cleopatra/page (162).png',
    'books/cleopatra/page (163).png',
    'books/cleopatra/page (164).png',
    'books/cleopatra/page (165).png',
    'books/cleopatra/page (166).png',
    'books/cleopatra/page (167).png',
    'books/cleopatra/page (168).png',
    'books/cleopatra/page (169).png',
    'books/cleopatra/page (170).png',
    'books/cleopatra/page (171).png',
    'books/cleopatra/page (172).png',
    'books/cleopatra/page (173).png',
    'books/cleopatra/page (174).png',
    'books/cleopatra/page (175).png',
    'books/cleopatra/page (176).png',
    'books/cleopatra/page (177).png',
    'books/cleopatra/page (178).png',
    'books/cleopatra/page (179).png',
    'books/cleopatra/page (180).png',
    'books/cleopatra/page (181).png',
    'books/cleopatra/page (182).png',
    'books/cleopatra/page (183).png',
    'books/cleopatra/page (184).png',
    'books/cleopatra/page (185).png',
    'books/cleopatra/page (186).png',
    'books/cleopatra/page (187).png',
    'books/cleopatra/page (188).png',
    'books/cleopatra/page (189).png',
    'books/cleopatra/page (190).png',
    'books/cleopatra/page (191).png',
    'books/cleopatra/page (192).png',
    'books/cleopatra/page (193).png',
    'books/cleopatra/page (194).png',
    'books/cleopatra/page (195).png',
    'books/cleopatra/page (196).png',
    'books/cleopatra/page (197).png',
    'books/cleopatra/page (198).png',
    'books/cleopatra/page (199).png',
    'books/cleopatra/page (200).png',
    'books/cleopatra/page (201).png',
    'books/cleopatra/page (202).png',
    'books/cleopatra/page (203).png',
    'books/cleopatra/page (204).png',
    'books/cleopatra/page (205).png',
    'books/cleopatra/page (206).png',
    'books/cleopatra/page (207).png',
    'books/cleopatra/page (208).png',
    'books/cleopatra/page (209).png',
    'books/cleopatra/page (210).png',
    'books/cleopatra/page (211).png',
    'books/cleopatra/page (212).png',
    'books/cleopatra/page (213).png',
    'books/cleopatra/page (214).png',
    'books/cleopatra/page (215).png',
    'books/cleopatra/page (216).png',
    'books/cleopatra/page (217).png',
    'books/cleopatra/page (218).png',
    'books/cleopatra/page (219).png',
    'books/cleopatra/page (220).png',
    'books/cleopatra/page (221).png',
    'books/cleopatra/page (222).png',
    'books/cleopatra/page (223).png',
    'books/cleopatra/page (224).png',
    'books/cleopatra/page (225).png',
    'books/cleopatra/page (226).png',
    'books/cleopatra/page (227).png',
    'books/cleopatra/page (228).png',
    'books/cleopatra/page (229).png',
    'books/cleopatra/page (230).png',
    'books/cleopatra/page (231).png',
    'books/cleopatra/page (232).png',
    'books/cleopatra/page (233).png',
    'books/cleopatra/page (234).png',
    'books/cleopatra/page (235).png',
    'books/cleopatra/page (236).png',
    'books/cleopatra/page (237).png',
    'books/cleopatra/page (238).png',
    'books/cleopatra/page (239).png',
    'books/cleopatra/page (240).png',
    'books/cleopatra/page (241).png',
    'books/cleopatra/page (242).png',
    'books/cleopatra/page (243).png',
    'books/cleopatra/page (244).png',
    'books/cleopatra/page (245).png',
    'books/cleopatra/page (246).png',
    'books/cleopatra/page (247).png',
    'books/cleopatra/page (248).png',
    'books/cleopatra/page (249).png',
    'books/cleopatra/page (250).png',
    'books/cleopatra/page (251).png',
    'books/cleopatra/page (252).png',
    'books/cleopatra/page (253).png',

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
