import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wallstreet extends StatefulWidget {
  const wallstreet({Key? key}) : super(key: key);

  @override
  State<wallstreet> createState() => _wallstreetState();
}

class _wallstreetState extends State<wallstreet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/wizard wall street/page (1).png',
    'books/wizard wall street/page (2).png',
    'books/wizard wall street/page (3).png',
    'books/wizard wall street/page (4).png',
    'books/wizard wall street/page (5).png',
    'books/wizard wall street/page (6).png',
    'books/wizard wall street/page (7).png',
    'books/wizard wall street/page (8).png',
    'books/wizard wall street/page (9).png',
    'books/wizard wall street/page (10).png',
    'books/wizard wall street/page (11).png',
    'books/wizard wall street/page (12).png',
    'books/wizard wall street/page (13).png',
    'books/wizard wall street/page (14).png',
    'books/wizard wall street/page (15).png',
    'books/wizard wall street/page (16).png',
    'books/wizard wall street/page (17).png',
    'books/wizard wall street/page (18).png',
    'books/wizard wall street/page (19).png',
    'books/wizard wall street/page (20).png',
    'books/wizard wall street/page (21).png',
    'books/wizard wall street/page (22).png',
    'books/wizard wall street/page (23).png',
    'books/wizard wall street/page (24).png',
    'books/wizard wall street/page (25).png',
    'books/wizard wall street/page (26).png',
    'books/wizard wall street/page (27).png',
    'books/wizard wall street/page (28).png',
    'books/wizard wall street/page (29).png',
    'books/wizard wall street/page (30).png',
    'books/wizard wall street/page (31).png',
    'books/wizard wall street/page (32).png',
    'books/wizard wall street/page (33).png',
    'books/wizard wall street/page (34).png',
    'books/wizard wall street/page (35).png',
    'books/wizard wall street/page (36).png',
    'books/wizard wall street/page (37).png',
    'books/wizard wall street/page (38).png',
    'books/wizard wall street/page (39).png',
    'books/wizard wall street/page (40).png',
    'books/wizard wall street/page (41).png',
    'books/wizard wall street/page (42).png',
    'books/wizard wall street/page (43).png',
    'books/wizard wall street/page (44).png',
    'books/wizard wall street/page (45).png',
    'books/wizard wall street/page (46).png',
    'books/wizard wall street/page (47).png',
    'books/wizard wall street/page (48).png',
    'books/wizard wall street/page (49).png',
    'books/wizard wall street/page (50).png',
    'books/wizard wall street/page (51).png',
    'books/wizard wall street/page (52).png',
    'books/wizard wall street/page (53).png',
    'books/wizard wall street/page (54).png',
    'books/wizard wall street/page (55).png',
    'books/wizard wall street/page (56).png',
    'books/wizard wall street/page (57).png',
    'books/wizard wall street/page (58).png',
    'books/wizard wall street/page (59).png',
    'books/wizard wall street/page (60).png',
    'books/wizard wall street/page (61).png',
    'books/wizard wall street/page (62).png',
    'books/wizard wall street/page (63).png',
    'books/wizard wall street/page (64).png',
    'books/wizard wall street/page (65).png',
    'books/wizard wall street/page (66).png',
    'books/wizard wall street/page (67).png',
    'books/wizard wall street/page (68).png',
    'books/wizard wall street/page (69).png',
    'books/wizard wall street/page (70).png',
    'books/wizard wall street/page (71).png',
    'books/wizard wall street/page (72).png',
    'books/wizard wall street/page (73).png',
    'books/wizard wall street/page (74).png',
    'books/wizard wall street/page (75).png',
    'books/wizard wall street/page (76).png',
    'books/wizard wall street/page (77).png',
    'books/wizard wall street/page (78).png',
    'books/wizard wall street/page (79).png',
    'books/wizard wall street/page (80).png',
    'books/wizard wall street/page (81).png',
    'books/wizard wall street/page (82).png',
    'books/wizard wall street/page (83).png',
    'books/wizard wall street/page (84).png',
    'books/wizard wall street/page (85).png',
    'books/wizard wall street/page (86).png',
    'books/wizard wall street/page (87).png',
    'books/wizard wall street/page (88).png',
    'books/wizard wall street/page (89).png',
    'books/wizard wall street/page (90).png',
    'books/wizard wall street/page (91).png',
    'books/wizard wall street/page (92).png',
    'books/wizard wall street/page (93).png',
    'books/wizard wall street/page (94).png',
    'books/wizard wall street/page (95).png',
    'books/wizard wall street/page (96).png',
    'books/wizard wall street/page (97).png',
    'books/wizard wall street/page (98).png',
    'books/wizard wall street/page (99).png',
    'books/wizard wall street/page (100).png',
    'books/wizard wall street/page (101).png',
    'books/wizard wall street/page (102).png',
    'books/wizard wall street/page (103).png',
    'books/wizard wall street/page (104).png',
    'books/wizard wall street/page (105).png',
    'books/wizard wall street/page (106).png',
    'books/wizard wall street/page (107).png',
    'books/wizard wall street/page (108).png',
    'books/wizard wall street/page (109).png',
    'books/wizard wall street/page (110).png',
    'books/wizard wall street/page (111).png',
    'books/wizard wall street/page (112).png',
    'books/wizard wall street/page (113).png',
    'books/wizard wall street/page (114).png',
    'books/wizard wall street/page (115).png',
    'books/wizard wall street/page (116).png',
    'books/wizard wall street/page (117).png',
    'books/wizard wall street/page (118).png',
    'books/wizard wall street/page (119).png',
    'books/wizard wall street/page (120).png',
    'books/wizard wall street/page (121).png',
    'books/wizard wall street/page (122).png',
    'books/wizard wall street/page (123).png',
    'books/wizard wall street/page (124).png',
    'books/wizard wall street/page (125).png',
    'books/wizard wall street/page (126).png',
    'books/wizard wall street/page (127).png',
    'books/wizard wall street/page (128).png',
    'books/wizard wall street/page (129).png',
    'books/wizard wall street/page (130).png',
    'books/wizard wall street/page (131).png',
    'books/wizard wall street/page (132).png',
    'books/wizard wall street/page (133).png',
    'books/wizard wall street/page (134).png',
    'books/wizard wall street/page (135).png',
    'books/wizard wall street/page (136).png',
    'books/wizard wall street/page (137).png',
    'books/wizard wall street/page (138).png',
    'books/wizard wall street/page (139).png',
    'books/wizard wall street/page (140).png',
    'books/wizard wall street/page (141).png',
    'books/wizard wall street/page (142).png',
    'books/wizard wall street/page (143).png',
    'books/wizard wall street/page (144).png',
    'books/wizard wall street/page (145).png',
    'books/wizard wall street/page (146).png',
    'books/wizard wall street/page (147).png',
    'books/wizard wall street/page (148).png',
    'books/wizard wall street/page (149).png',
    'books/wizard wall street/page (150).png',
    'books/wizard wall street/page (151).png',
    'books/wizard wall street/page (152).png',
    'books/wizard wall street/page (153).png',
    'books/wizard wall street/page (154).png',
    'books/wizard wall street/page (155).png',
    'books/wizard wall street/page (156).png',
    'books/wizard wall street/page (157).png',
    'books/wizard wall street/page (158).png',
    'books/wizard wall street/page (159).png',
    'books/wizard wall street/page (160).png',
    'books/wizard wall street/page (161).png',
    'books/wizard wall street/page (162).png',
    'books/wizard wall street/page (163).png',
    'books/wizard wall street/page (164).png',
    'books/wizard wall street/page (165).png',
    'books/wizard wall street/page (166).png',
    'books/wizard wall street/page (167).png',
    'books/wizard wall street/page (168).png',
    'books/wizard wall street/page (169).png',
    'books/wizard wall street/page (170).png',
    'books/wizard wall street/page (171).png',
    'books/wizard wall street/page (172).png',
    'books/wizard wall street/page (173).png',
    'books/wizard wall street/page (174).png',
    'books/wizard wall street/page (175).png',
    'books/wizard wall street/page (176).png',
    'books/wizard wall street/page (177).png',
    'books/wizard wall street/page (178).png',
    'books/wizard wall street/page (179).png',
    'books/wizard wall street/page (180).png',
    'books/wizard wall street/page (181).png',
    'books/wizard wall street/page (182).png',
    'books/wizard wall street/page (183).png',
    'books/wizard wall street/page (184).png',
    'books/wizard wall street/page (185).png',
    'books/wizard wall street/page (186).png',
    'books/wizard wall street/page (187).png',
    'books/wizard wall street/page (188).png',
    'books/wizard wall street/page (189).png',
    'books/wizard wall street/page (190).png',
    'books/wizard wall street/page (191).png',
    'books/wizard wall street/page (192).png',
    'books/wizard wall street/page (193).png',
    'books/wizard wall street/page (194).png',
    'books/wizard wall street/page (195).png',
    'books/wizard wall street/page (196).png',
    'books/wizard wall street/page (197).png',
    'books/wizard wall street/page (198).png',
    'books/wizard wall street/page (199).png',
    'books/wizard wall street/page (200).png',
    'books/wizard wall street/page (201).png',
    'books/wizard wall street/page (202).png',
    'books/wizard wall street/page (203).png',
    'books/wizard wall street/page (204).png',
    'books/wizard wall street/page (205).png',
    'books/wizard wall street/page (206).png',
    'books/wizard wall street/page (207).png',
    'books/wizard wall street/page (208).png',
    'books/wizard wall street/page (209).png',
    'books/wizard wall street/page (210).png',
    'books/wizard wall street/page (211).png',
    'books/wizard wall street/page (212).png',
    'books/wizard wall street/page (213).png',
    'books/wizard wall street/page (214).png',
    'books/wizard wall street/page (215).png',
    'books/wizard wall street/page (216).png',
    'books/wizard wall street/page (217).png',
    'books/wizard wall street/page (218).png',
    'books/wizard wall street/page (219).png',
    'books/wizard wall street/page (220).png',
    'books/wizard wall street/page (221).png',
    'books/wizard wall street/page (222).png',
    'books/wizard wall street/page (223).png',
    'books/wizard wall street/page (224).png',
    'books/wizard wall street/page (225).png',
    'books/wizard wall street/page (226).png',
    'books/wizard wall street/page (227).png',
    'books/wizard wall street/page (228).png',
    'books/wizard wall street/page (229).png',
    'books/wizard wall street/page (230).png',
    'books/wizard wall street/page (231).png',
    'books/wizard wall street/page (232).png',
    'books/wizard wall street/page (233).png',
    'books/wizard wall street/page (234).png',
    'books/wizard wall street/page (235).png',
    'books/wizard wall street/page (236).png',
    'books/wizard wall street/page (237).png',
    'books/wizard wall street/page (238).png',
    'books/wizard wall street/page (239).png',
    'books/wizard wall street/page (240).png',
    'books/wizard wall street/page (241).png',
    'books/wizard wall street/page (242).png',
    'books/wizard wall street/page (243).png',
    'books/wizard wall street/page (244).png',
    'books/wizard wall street/page (245).png',
    'books/wizard wall street/page (246).png',
    'books/wizard wall street/page (247).png',
    'books/wizard wall street/page (248).png',
    'books/wizard wall street/page (249).png',
    'books/wizard wall street/page (250).png',
    'books/wizard wall street/page (251).png',
    'books/wizard wall street/page (252).png',
    'books/wizard wall street/page (253).png',
    'books/wizard wall street/page (254).png',
    'books/wizard wall street/page (255).png',
    'books/wizard wall street/page (256).png',
    'books/wizard wall street/page (257).png',
    'books/wizard wall street/page (258).png',
    'books/wizard wall street/page (259).png',
    'books/wizard wall street/page (260).png',

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
