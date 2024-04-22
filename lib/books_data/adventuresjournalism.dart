import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class adventuresjournalism extends StatefulWidget {
  const adventuresjournalism({Key? key}) : super(key: key);

  @override
  State<adventuresjournalism> createState() => _adventuresjournalismState();
}

class _adventuresjournalismState extends State<adventuresjournalism> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/adventures journalism/page (1).png',
    'books/adventures journalism/page (2).png',
    'books/adventures journalism/page (3).png',
    'books/adventures journalism/page (4).png',
    'books/adventures journalism/page (5).png',
    'books/adventures journalism/page (6).png',
    'books/adventures journalism/page (7).png',
    'books/adventures journalism/page (8).png',
    'books/adventures journalism/page (9).png',
    'books/adventures journalism/page (10).png',
    'books/adventures journalism/page (11).png',
    'books/adventures journalism/page (12).png',
    'books/adventures journalism/page (13).png',
    'books/adventures journalism/page (14).png',
    'books/adventures journalism/page (15).png',
    'books/adventures journalism/page (16).png',
    'books/adventures journalism/page (17).png',
    'books/adventures journalism/page (18).png',
    'books/adventures journalism/page (19).png',
    'books/adventures journalism/page (20).png',
    'books/adventures journalism/page (21).png',
    'books/adventures journalism/page (22).png',
    'books/adventures journalism/page (23).png',
    'books/adventures journalism/page (24).png',
    'books/adventures journalism/page (25).png',
    'books/adventures journalism/page (26).png',
    'books/adventures journalism/page (27).png',
    'books/adventures journalism/page (28).png',
    'books/adventures journalism/page (29).png',
    'books/adventures journalism/page (30).png',
    'books/adventures journalism/page (31).png',
    'books/adventures journalism/page (32).png',
    'books/adventures journalism/page (33).png',
    'books/adventures journalism/page (34).png',
    'books/adventures journalism/page (35).png',
    'books/adventures journalism/page (36).png',
    'books/adventures journalism/page (37).png',
    'books/adventures journalism/page (38).png',
    'books/adventures journalism/page (39).png',
    'books/adventures journalism/page (40).png',
    'books/adventures journalism/page (41).png',
    'books/adventures journalism/page (42).png',
    'books/adventures journalism/page (43).png',
    'books/adventures journalism/page (44).png',
    'books/adventures journalism/page (45).png',
    'books/adventures journalism/page (46).png',
    'books/adventures journalism/page (47).png',
    'books/adventures journalism/page (48).png',
    'books/adventures journalism/page (49).png',
    'books/adventures journalism/page (50).png',
    'books/adventures journalism/page (51).png',
    'books/adventures journalism/page (52).png',
    'books/adventures journalism/page (53).png',
    'books/adventures journalism/page (54).png',
    'books/adventures journalism/page (55).png',
    'books/adventures journalism/page (56).png',
    'books/adventures journalism/page (57).png',
    'books/adventures journalism/page (58).png',
    'books/adventures journalism/page (59).png',
    'books/adventures journalism/page (60).png',
    'books/adventures journalism/page (61).png',
    'books/adventures journalism/page (62).png',
    'books/adventures journalism/page (63).png',
    'books/adventures journalism/page (64).png',
    'books/adventures journalism/page (65).png',
    'books/adventures journalism/page (66).png',
    'books/adventures journalism/page (67).png',
    'books/adventures journalism/page (68).png',
    'books/adventures journalism/page (69).png',
    'books/adventures journalism/page (70).png',
    'books/adventures journalism/page (71).png',
    'books/adventures journalism/page (72).png',
    'books/adventures journalism/page (73).png',
    'books/adventures journalism/page (74).png',
    'books/adventures journalism/page (75).png',
    'books/adventures journalism/page (76).png',
    'books/adventures journalism/page (77).png',
    'books/adventures journalism/page (78).png',
    'books/adventures journalism/page (79).png',
    'books/adventures journalism/page (80).png',
    'books/adventures journalism/page (81).png',
    'books/adventures journalism/page (82).png',
    'books/adventures journalism/page (83).png',
    'books/adventures journalism/page (84).png',
    'books/adventures journalism/page (85).png',
    'books/adventures journalism/page (86).png',
    'books/adventures journalism/page (87).png',
    'books/adventures journalism/page (88).png',
    'books/adventures journalism/page (89).png',
    'books/adventures journalism/page (90).png',
    'books/adventures journalism/page (91).png',
    'books/adventures journalism/page (92).png',
    'books/adventures journalism/page (93).png',
    'books/adventures journalism/page (94).png',
    'books/adventures journalism/page (95).png',
    'books/adventures journalism/page (96).png',
    'books/adventures journalism/page (97).png',
    'books/adventures journalism/page (98).png',
    'books/adventures journalism/page (99).png',
    'books/adventures journalism/page (100).png',
    'books/adventures journalism/page (101).png',
    'books/adventures journalism/page (102).png',
    'books/adventures journalism/page (103).png',
    'books/adventures journalism/page (104).png',
    'books/adventures journalism/page (105).png',
    'books/adventures journalism/page (106).png',
    'books/adventures journalism/page (107).png',
    'books/adventures journalism/page (108).png',
    'books/adventures journalism/page (109).png',
    'books/adventures journalism/page (110).png',
    'books/adventures journalism/page (111).png',
    'books/adventures journalism/page (112).png',
    'books/adventures journalism/page (113).png',
    'books/adventures journalism/page (114).png',
    'books/adventures journalism/page (115).png',
    'books/adventures journalism/page (116).png',
    'books/adventures journalism/page (117).png',
    'books/adventures journalism/page (118).png',
    'books/adventures journalism/page (119).png',
    'books/adventures journalism/page (120).png',
    'books/adventures journalism/page (121).png',
    'books/adventures journalism/page (122).png',
    'books/adventures journalism/page (123).png',
    'books/adventures journalism/page (124).png',
    'books/adventures journalism/page (125).png',
    'books/adventures journalism/page (126).png',
    'books/adventures journalism/page (127).png',
    'books/adventures journalism/page (128).png',
    'books/adventures journalism/page (129).png',
    'books/adventures journalism/page (130).png',
    'books/adventures journalism/page (131).png',
    'books/adventures journalism/page (132).png',
    'books/adventures journalism/page (133).png',
    'books/adventures journalism/page (134).png',
    'books/adventures journalism/page (135).png',
    'books/adventures journalism/page (136).png',
    'books/adventures journalism/page (137).png',
    'books/adventures journalism/page (138).png',
    'books/adventures journalism/page (139).png',
    'books/adventures journalism/page (140).png',
    'books/adventures journalism/page (141).png',
    'books/adventures journalism/page (142).png',
    'books/adventures journalism/page (143).png',
    'books/adventures journalism/page (144).png',
    'books/adventures journalism/page (145).png',
    'books/adventures journalism/page (146).png',
    'books/adventures journalism/page (147).png',
    'books/adventures journalism/page (148).png',
    'books/adventures journalism/page (149).png',
    'books/adventures journalism/page (150).png',
    'books/adventures journalism/page (151).png',
    'books/adventures journalism/page (152).png',
    'books/adventures journalism/page (153).png',
    'books/adventures journalism/page (154).png',
    'books/adventures journalism/page (155).png',
    'books/adventures journalism/page (156).png',
    'books/adventures journalism/page (157).png',
    'books/adventures journalism/page (158).png',
    'books/adventures journalism/page (159).png',
    'books/adventures journalism/page (160).png',
    'books/adventures journalism/page (161).png',
    'books/adventures journalism/page (162).png',
    'books/adventures journalism/page (163).png',
    'books/adventures journalism/page (164).png',
    'books/adventures journalism/page (165).png',
    'books/adventures journalism/page (166).png',
    'books/adventures journalism/page (167).png',
    'books/adventures journalism/page (168).png',
    'books/adventures journalism/page (169).png',
    'books/adventures journalism/page (170).png',
    'books/adventures journalism/page (171).png',
    'books/adventures journalism/page (172).png',
    'books/adventures journalism/page (173).png',
    'books/adventures journalism/page (174).png',
    'books/adventures journalism/page (175).png',
    'books/adventures journalism/page (176).png',
    'books/adventures journalism/page (177).png',
    'books/adventures journalism/page (178).png',
    'books/adventures journalism/page (179).png',
    'books/adventures journalism/page (180).png',
    'books/adventures journalism/page (181).png',
    'books/adventures journalism/page (182).png',
    'books/adventures journalism/page (183).png',
    'books/adventures journalism/page (184).png',
    'books/adventures journalism/page (185).png',
    'books/adventures journalism/page (186).png',
    'books/adventures journalism/page (187).png',
    'books/adventures journalism/page (188).png',
    'books/adventures journalism/page (189).png',
    'books/adventures journalism/page (190).png',
    'books/adventures journalism/page (191).png',
    'books/adventures journalism/page (192).png',
    'books/adventures journalism/page (193).png',
    'books/adventures journalism/page (194).png',
    'books/adventures journalism/page (195).png',
    'books/adventures journalism/page (196).png',
    'books/adventures journalism/page (197).png',
    'books/adventures journalism/page (198).png',
    'books/adventures journalism/page (199).png',
    'books/adventures journalism/page (200).png',
    'books/adventures journalism/page (201).png',
    'books/adventures journalism/page (202).png',
    'books/adventures journalism/page (203).png',
    'books/adventures journalism/page (204).png',
    'books/adventures journalism/page (205).png',
    'books/adventures journalism/page (206).png',
    'books/adventures journalism/page (207).png',
    'books/adventures journalism/page (208).png',
    'books/adventures journalism/page (209).png',
    'books/adventures journalism/page (210).png',
    'books/adventures journalism/page (211).png',
    'books/adventures journalism/page (212).png',
    'books/adventures journalism/page (213).png',
    'books/adventures journalism/page (214).png',
    'books/adventures journalism/page (215).png',
    'books/adventures journalism/page (216).png',
    'books/adventures journalism/page (217).png',
    'books/adventures journalism/page (218).png',
    'books/adventures journalism/page (219).png',
    'books/adventures journalism/page (220).png',
    'books/adventures journalism/page (221).png',
    'books/adventures journalism/page (222).png',
    'books/adventures journalism/page (223).png',
    'books/adventures journalism/page (224).png',
    'books/adventures journalism/page (225).png',
    'books/adventures journalism/page (226).png',
    'books/adventures journalism/page (227).png',
    'books/adventures journalism/page (228).png',
    'books/adventures journalism/page (229).png',
    'books/adventures journalism/page (230).png',
    'books/adventures journalism/page (231).png',
    'books/adventures journalism/page (232).png',
    'books/adventures journalism/page (233).png',
    'books/adventures journalism/page (234).png',
    'books/adventures journalism/page (235).png',
    'books/adventures journalism/page (236).png',
    'books/adventures journalism/page (237).png',
    'books/adventures journalism/page (238).png',
    'books/adventures journalism/page (239).png',
    'books/adventures journalism/page (240).png',
    'books/adventures journalism/page (241).png',
    'books/adventures journalism/page (242).png',
    'books/adventures journalism/page (243).png',
    'books/adventures journalism/page (244).png',
    'books/adventures journalism/page (245).png',
    'books/adventures journalism/page (246).png',
    'books/adventures journalism/page (247).png',
    'books/adventures journalism/page (248).png',
    'books/adventures journalism/page (249).png',
    'books/adventures journalism/page (250).png',
    'books/adventures journalism/page (251).png',
    'books/adventures journalism/page (252).png',
    'books/adventures journalism/page (253).png',
    'books/adventures journalism/page (254).png',
    'books/adventures journalism/page (255).png',
    'books/adventures journalism/page (256).png',
    'books/adventures journalism/page (257).png',
    'books/adventures journalism/page (258).png',
    'books/adventures journalism/page (259).png',
    'books/adventures journalism/page (260).png',
    'books/adventures journalism/page (261).png',
    'books/adventures journalism/page (262).png',
    'books/adventures journalism/page (263).png',
    'books/adventures journalism/page (264).png',
    'books/adventures journalism/page (265).png',
    'books/adventures journalism/page (266).png',
    'books/adventures journalism/page (267).png',
    'books/adventures journalism/page (268).png',
    'books/adventures journalism/page (269).png',
    'books/adventures journalism/page (270).png',
    'books/adventures journalism/page (271).png',
    'books/adventures journalism/page (272).png',
    'books/adventures journalism/page (273).png',
    'books/adventures journalism/page (274).png',
    'books/adventures journalism/page (275).png',
    'books/adventures journalism/page (276).png',
    'books/adventures journalism/page (277).png',
    'books/adventures journalism/page (278).png',
    'books/adventures journalism/page (279).png',
    'books/adventures journalism/page (280).png',
    'books/adventures journalism/page (281).png',
    'books/adventures journalism/page (282).png',
    'books/adventures journalism/page (283).png',
    'books/adventures journalism/page (284).png',
    'books/adventures journalism/page (285).png',
    'books/adventures journalism/page (286).png',
    'books/adventures journalism/page (287).png',
    'books/adventures journalism/page (288).png',
    'books/adventures journalism/page (289).png',
    'books/adventures journalism/page (290).png',
    'books/adventures journalism/page (291).png',
    'books/adventures journalism/page (292).png',
    'books/adventures journalism/page (293).png',
    'books/adventures journalism/page (294).png',
    'books/adventures journalism/page (295).png',
    'books/adventures journalism/page (296).png',
    'books/adventures journalism/page (297).png',
    'books/adventures journalism/page (298).png',
    'books/adventures journalism/page (299).png',
    'books/adventures journalism/page (300).png',

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
