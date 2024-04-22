import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class littlemen extends StatefulWidget {
  const littlemen({Key? key}) : super(key: key);

  @override
  State<littlemen> createState() => _littlemenState();
}

class _littlemenState extends State<littlemen> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/little men/page (1).png',
    'books/little men/page (2).png',
    'books/little men/page (3).png',
    'books/little men/page (4).png',
    'books/little men/page (5).png',
    'books/little men/page (6).png',
    'books/little men/page (7).png',
    'books/little men/page (8).png',
    'books/little men/page (9).png',
    'books/little men/page (10).png',
    'books/little men/page (11).png',
    'books/little men/page (12).png',
    'books/little men/page (13).png',
    'books/little men/page (14).png',
    'books/little men/page (15).png',
    'books/little men/page (16).png',
    'books/little men/page (17).png',
    'books/little men/page (18).png',
    'books/little men/page (19).png',
    'books/little men/page (20).png',
    'books/little men/page (21).png',
    'books/little men/page (22).png',
    'books/little men/page (23).png',
    'books/little men/page (24).png',
    'books/little men/page (25).png',
    'books/little men/page (26).png',
    'books/little men/page (27).png',
    'books/little men/page (28).png',
    'books/little men/page (29).png',
    'books/little men/page (30).png',
    'books/little men/page (31).png',
    'books/little men/page (32).png',
    'books/little men/page (33).png',
    'books/little men/page (34).png',
    'books/little men/page (35).png',
    'books/little men/page (36).png',
    'books/little men/page (37).png',
    'books/little men/page (38).png',
    'books/little men/page (39).png',
    'books/little men/page (40).png',
    'books/little men/page (41).png',
    'books/little men/page (42).png',
    'books/little men/page (43).png',
    'books/little men/page (44).png',
    'books/little men/page (45).png',
    'books/little men/page (46).png',
    'books/little men/page (47).png',
    'books/little men/page (48).png',
    'books/little men/page (49).png',
    'books/little men/page (50).png',
    'books/little men/page (51).png',
    'books/little men/page (52).png',
    'books/little men/page (53).png',
    'books/little men/page (54).png',
    'books/little men/page (55).png',
    'books/little men/page (56).png',
    'books/little men/page (57).png',
    'books/little men/page (58).png',
    'books/little men/page (59).png',
    'books/little men/page (60).png',
    'books/little men/page (61).png',
    'books/little men/page (62).png',
    'books/little men/page (63).png',
    'books/little men/page (64).png',
    'books/little men/page (65).png',
    'books/little men/page (66).png',
    'books/little men/page (67).png',
    'books/little men/page (68).png',
    'books/little men/page (69).png',
    'books/little men/page (70).png',
    'books/little men/page (71).png',
    'books/little men/page (72).png',
    'books/little men/page (73).png',
    'books/little men/page (74).png',
    'books/little men/page (75).png',
    'books/little men/page (76).png',
    'books/little men/page (77).png',
    'books/little men/page (78).png',
    'books/little men/page (79).png',
    'books/little men/page (80).png',
    'books/little men/page (81).png',
    'books/little men/page (82).png',
    'books/little men/page (83).png',
    'books/little men/page (84).png',
    'books/little men/page (85).png',
    'books/little men/page (86).png',
    'books/little men/page (87).png',
    'books/little men/page (88).png',
    'books/little men/page (89).png',
    'books/little men/page (90).png',
    'books/little men/page (91).png',
    'books/little men/page (92).png',
    'books/little men/page (93).png',
    'books/little men/page (94).png',
    'books/little men/page (95).png',
    'books/little men/page (96).png',
    'books/little men/page (97).png',
    'books/little men/page (98).png',
    'books/little men/page (99).png',
    'books/little men/page (100).png',
    'books/little men/page (101).png',
    'books/little men/page (102).png',
    'books/little men/page (103).png',
    'books/little men/page (104).png',
    'books/little men/page (105).png',
    'books/little men/page (106).png',
    'books/little men/page (107).png',
    'books/little men/page (108).png',
    'books/little men/page (109).png',
    'books/little men/page (110).png',
    'books/little men/page (111).png',
    'books/little men/page (112).png',
    'books/little men/page (113).png',
    'books/little men/page (114).png',
    'books/little men/page (115).png',
    'books/little men/page (116).png',
    'books/little men/page (117).png',
    'books/little men/page (118).png',
    'books/little men/page (119).png',
    'books/little men/page (120).png',
    'books/little men/page (121).png',
    'books/little men/page (122).png',
    'books/little men/page (123).png',
    'books/little men/page (124).png',
    'books/little men/page (125).png',
    'books/little men/page (126).png',
    'books/little men/page (127).png',
    'books/little men/page (128).png',
    'books/little men/page (129).png',
    'books/little men/page (130).png',
    'books/little men/page (131).png',
    'books/little men/page (132).png',
    'books/little men/page (133).png',
    'books/little men/page (134).png',
    'books/little men/page (135).png',
    'books/little men/page (136).png',
    'books/little men/page (137).png',
    'books/little men/page (138).png',
    'books/little men/page (139).png',
    'books/little men/page (140).png',
    'books/little men/page (141).png',
    'books/little men/page (142).png',
    'books/little men/page (143).png',
    'books/little men/page (144).png',
    'books/little men/page (145).png',
    'books/little men/page (146).png',
    'books/little men/page (147).png',
    'books/little men/page (148).png',
    'books/little men/page (149).png',
    'books/little men/page (150).png',
    'books/little men/page (151).png',
    'books/little men/page (152).png',
    'books/little men/page (153).png',
    'books/little men/page (154).png',
    'books/little men/page (155).png',
    'books/little men/page (156).png',
    'books/little men/page (157).png',
    'books/little men/page (158).png',
    'books/little men/page (159).png',
    'books/little men/page (160).png',
    'books/little men/page (161).png',
    'books/little men/page (162).png',
    'books/little men/page (163).png',
    'books/little men/page (164).png',
    'books/little men/page (165).png',
    'books/little men/page (166).png',
    'books/little men/page (167).png',
    'books/little men/page (168).png',
    'books/little men/page (169).png',
    'books/little men/page (170).png',
    'books/little men/page (171).png',
    'books/little men/page (172).png',
    'books/little men/page (173).png',
    'books/little men/page (174).png',
    'books/little men/page (175).png',
    'books/little men/page (176).png',
    'books/little men/page (177).png',
    'books/little men/page (178).png',
    'books/little men/page (179).png',
    'books/little men/page (180).png',
    'books/little men/page (181).png',
    'books/little men/page (182).png',
    'books/little men/page (183).png',
    'books/little men/page (184).png',
    'books/little men/page (185).png',
    'books/little men/page (186).png',
    'books/little men/page (187).png',
    'books/little men/page (188).png',
    'books/little men/page (189).png',
    'books/little men/page (190).png',
    'books/little men/page (191).png',
    'books/little men/page (192).png',
    'books/little men/page (193).png',
    'books/little men/page (194).png',
    'books/little men/page (195).png',
    'books/little men/page (196).png',
    'books/little men/page (197).png',
    'books/little men/page (198).png',
    'books/little men/page (199).png',
    'books/little men/page (200).png',
    'books/little men/page (201).png',
    'books/little men/page (202).png',
    'books/little men/page (203).png',
    'books/little men/page (204).png',
    'books/little men/page (205).png',
    'books/little men/page (206).png',
    'books/little men/page (207).png',
    'books/little men/page (208).png',
    'books/little men/page (209).png',
    'books/little men/page (210).png',
    'books/little men/page (211).png',
    'books/little men/page (212).png',
    'books/little men/page (213).png',
    'books/little men/page (214).png',
    'books/little men/page (215).png',
    'books/little men/page (216).png',
    'books/little men/page (217).png',
    'books/little men/page (218).png',
    'books/little men/page (219).png',
    'books/little men/page (220).png',
    'books/little men/page (221).png',
    'books/little men/page (222).png',
    'books/little men/page (223).png',
    'books/little men/page (224).png',
    'books/little men/page (225).png',
    'books/little men/page (226).png',
    'books/little men/page (227).png',
    'books/little men/page (228).png',
    'books/little men/page (229).png',
    'books/little men/page (230).png',
    'books/little men/page (231).png',
    'books/little men/page (232).png',
    'books/little men/page (233).png',
    'books/little men/page (234).png',
    'books/little men/page (235).png',
    'books/little men/page (236).png',
    'books/little men/page (237).png',
    'books/little men/page (238).png',
    'books/little men/page (239).png',
    'books/little men/page (240).png',
    'books/little men/page (241).png',
    'books/little men/page (242).png',
    'books/little men/page (243).png',
    'books/little men/page (244).png',
    'books/little men/page (245).png',
    'books/little men/page (246).png',
    'books/little men/page (247).png',
    'books/little men/page (248).png',
    'books/little men/page (249).png',
    'books/little men/page (250).png',
    'books/little men/page (251).png',
    'books/little men/page (252).png',
    'books/little men/page (253).png',
    'books/little men/page (254).png',
    'books/little men/page (255).png',
    'books/little men/page (256).png',
    'books/little men/page (257).png',
    'books/little men/page (258).png',
    'books/little men/page (259).png',
    'books/little men/page (260).png',
    'books/little men/page (261).png',
    'books/little men/page (262).png',
    'books/little men/page (263).png',
    'books/little men/page (264).png',
    'books/little men/page (265).png',
    'books/little men/page (266).png',
    'books/little men/page (267).png',
    'books/little men/page (268).png',
    'books/little men/page (269).png',

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
