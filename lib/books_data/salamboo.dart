import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class salamboo extends StatefulWidget {
  const salamboo({Key? key}) : super(key: key);

  @override
  State<salamboo> createState() => _salambooState();
}

class _salambooState extends State<salamboo> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/salamboo/page (1).png',
    'books/salamboo/page (2).png',
    'books/salamboo/page (3).png',
    'books/salamboo/page (4).png',
    'books/salamboo/page (5).png',
    'books/salamboo/page (6).png',
    'books/salamboo/page (7).png',
    'books/salamboo/page (8).png',
    'books/salamboo/page (9).png',
    'books/salamboo/page (10).png',
    'books/salamboo/page (11).png',
    'books/salamboo/page (12).png',
    'books/salamboo/page (13).png',
    'books/salamboo/page (14).png',
    'books/salamboo/page (15).png',
    'books/salamboo/page (16).png',
    'books/salamboo/page (17).png',
    'books/salamboo/page (18).png',
    'books/salamboo/page (19).png',
    'books/salamboo/page (20).png',
    'books/salamboo/page (21).png',
    'books/salamboo/page (22).png',
    'books/salamboo/page (23).png',
    'books/salamboo/page (24).png',
    'books/salamboo/page (25).png',
    'books/salamboo/page (26).png',
    'books/salamboo/page (27).png',
    'books/salamboo/page (28).png',
    'books/salamboo/page (29).png',
    'books/salamboo/page (30).png',
    'books/salamboo/page (31).png',
    'books/salamboo/page (32).png',
    'books/salamboo/page (33).png',
    'books/salamboo/page (34).png',
    'books/salamboo/page (35).png',
    'books/salamboo/page (36).png',
    'books/salamboo/page (37).png',
    'books/salamboo/page (38).png',
    'books/salamboo/page (39).png',
    'books/salamboo/page (40).png',
    'books/salamboo/page (41).png',
    'books/salamboo/page (42).png',
    'books/salamboo/page (43).png',
    'books/salamboo/page (44).png',
    'books/salamboo/page (45).png',
    'books/salamboo/page (46).png',
    'books/salamboo/page (47).png',
    'books/salamboo/page (48).png',
    'books/salamboo/page (49).png',
    'books/salamboo/page (50).png',
    'books/salamboo/page (51).png',
    'books/salamboo/page (52).png',
    'books/salamboo/page (53).png',
    'books/salamboo/page (54).png',
    'books/salamboo/page (55).png',
    'books/salamboo/page (56).png',
    'books/salamboo/page (57).png',
    'books/salamboo/page (58).png',
    'books/salamboo/page (59).png',
    'books/salamboo/page (60).png',
    'books/salamboo/page (61).png',
    'books/salamboo/page (62).png',
    'books/salamboo/page (63).png',
    'books/salamboo/page (64).png',
    'books/salamboo/page (65).png',
    'books/salamboo/page (66).png',
    'books/salamboo/page (67).png',
    'books/salamboo/page (68).png',
    'books/salamboo/page (69).png',
    'books/salamboo/page (70).png',
    'books/salamboo/page (71).png',
    'books/salamboo/page (72).png',
    'books/salamboo/page (73).png',
    'books/salamboo/page (74).png',
    'books/salamboo/page (75).png',
    'books/salamboo/page (76).png',
    'books/salamboo/page (77).png',
    'books/salamboo/page (78).png',
    'books/salamboo/page (79).png',
    'books/salamboo/page (80).png',
    'books/salamboo/page (81).png',
    'books/salamboo/page (82).png',
    'books/salamboo/page (83).png',
    'books/salamboo/page (84).png',
    'books/salamboo/page (85).png',
    'books/salamboo/page (86).png',
    'books/salamboo/page (87).png',
    'books/salamboo/page (88).png',
    'books/salamboo/page (89).png',
    'books/salamboo/page (90).png',
    'books/salamboo/page (91).png',
    'books/salamboo/page (92).png',
    'books/salamboo/page (93).png',
    'books/salamboo/page (94).png',
    'books/salamboo/page (95).png',
    'books/salamboo/page (96).png',
    'books/salamboo/page (97).png',
    'books/salamboo/page (98).png',
    'books/salamboo/page (99).png',
    'books/salamboo/page (100).png',
    'books/salamboo/page (101).png',
    'books/salamboo/page (102).png',
    'books/salamboo/page (103).png',
    'books/salamboo/page (104).png',
    'books/salamboo/page (105).png',
    'books/salamboo/page (106).png',
    'books/salamboo/page (107).png',
    'books/salamboo/page (108).png',
    'books/salamboo/page (109).png',
    'books/salamboo/page (110).png',
    'books/salamboo/page (111).png',
    'books/salamboo/page (112).png',
    'books/salamboo/page (113).png',
    'books/salamboo/page (114).png',
    'books/salamboo/page (115).png',
    'books/salamboo/page (116).png',
    'books/salamboo/page (117).png',
    'books/salamboo/page (118).png',
    'books/salamboo/page (119).png',
    'books/salamboo/page (120).png',
    'books/salamboo/page (121).png',
    'books/salamboo/page (122).png',
    'books/salamboo/page (123).png',
    'books/salamboo/page (124).png',
    'books/salamboo/page (125).png',
    'books/salamboo/page (126).png',
    'books/salamboo/page (127).png',
    'books/salamboo/page (128).png',
    'books/salamboo/page (129).png',
    'books/salamboo/page (130).png',
    'books/salamboo/page (131).png',
    'books/salamboo/page (132).png',
    'books/salamboo/page (133).png',
    'books/salamboo/page (134).png',
    'books/salamboo/page (135).png',
    'books/salamboo/page (136).png',
    'books/salamboo/page (137).png',
    'books/salamboo/page (138).png',
    'books/salamboo/page (139).png',
    'books/salamboo/page (140).png',
    'books/salamboo/page (141).png',
    'books/salamboo/page (142).png',
    'books/salamboo/page (143).png',
    'books/salamboo/page (144).png',
    'books/salamboo/page (145).png',
    'books/salamboo/page (146).png',
    'books/salamboo/page (147).png',
    'books/salamboo/page (148).png',
    'books/salamboo/page (149).png',
    'books/salamboo/page (150).png',
    'books/salamboo/page (151).png',
    'books/salamboo/page (152).png',
    'books/salamboo/page (153).png',
    'books/salamboo/page (154).png',
    'books/salamboo/page (155).png',
    'books/salamboo/page (156).png',
    'books/salamboo/page (157).png',
    'books/salamboo/page (158).png',
    'books/salamboo/page (159).png',
    'books/salamboo/page (160).png',
    'books/salamboo/page (161).png',
    'books/salamboo/page (162).png',
    'books/salamboo/page (163).png',
    'books/salamboo/page (164).png',
    'books/salamboo/page (165).png',
    'books/salamboo/page (166).png',
    'books/salamboo/page (167).png',
    'books/salamboo/page (168).png',
    'books/salamboo/page (169).png',
    'books/salamboo/page (170).png',
    'books/salamboo/page (171).png',
    'books/salamboo/page (172).png',
    'books/salamboo/page (173).png',
    'books/salamboo/page (174).png',
    'books/salamboo/page (175).png',
    'books/salamboo/page (176).png',
    'books/salamboo/page (177).png',
    'books/salamboo/page (178).png',
    'books/salamboo/page (179).png',
    'books/salamboo/page (180).png',
    'books/salamboo/page (181).png',
    'books/salamboo/page (182).png',
    'books/salamboo/page (183).png',
    'books/salamboo/page (184).png',
    'books/salamboo/page (185).png',
    'books/salamboo/page (186).png',
    'books/salamboo/page (187).png',
    'books/salamboo/page (188).png',
    'books/salamboo/page (189).png',
    'books/salamboo/page (190).png',
    'books/salamboo/page (191).png',
    'books/salamboo/page (192).png',
    'books/salamboo/page (193).png',
    'books/salamboo/page (194).png',
    'books/salamboo/page (195).png',
    'books/salamboo/page (196).png',
    'books/salamboo/page (197).png',
    'books/salamboo/page (198).png',
    'books/salamboo/page (199).png',
    'books/salamboo/page (200).png',
    'books/salamboo/page (201).png',
    'books/salamboo/page (202).png',
    'books/salamboo/page (203).png',
    'books/salamboo/page (204).png',
    'books/salamboo/page (205).png',
    'books/salamboo/page (206).png',
    'books/salamboo/page (207).png',
    'books/salamboo/page (208).png',
    'books/salamboo/page (209).png',
    'books/salamboo/page (210).png',
    'books/salamboo/page (211).png',
    'books/salamboo/page (212).png',
    'books/salamboo/page (213).png',
    'books/salamboo/page (214).png',
    'books/salamboo/page (215).png',
    'books/salamboo/page (216).png',
    'books/salamboo/page (217).png',
    'books/salamboo/page (218).png',
    'books/salamboo/page (219).png',
    'books/salamboo/page (220).png',
    'books/salamboo/page (221).png',
    'books/salamboo/page (222).png',
    'books/salamboo/page (223).png',
    'books/salamboo/page (224).png',
    'books/salamboo/page (225).png',
    'books/salamboo/page (226).png',
    'books/salamboo/page (227).png',
    'books/salamboo/page (228).png',
    'books/salamboo/page (229).png',
    'books/salamboo/page (230).png',
    'books/salamboo/page (231).png',
    'books/salamboo/page (232).png',
    'books/salamboo/page (233).png',
    'books/salamboo/page (234).png',
    'books/salamboo/page (235).png',
    'books/salamboo/page (236).png',
    'books/salamboo/page (237).png',
    'books/salamboo/page (238).png',
    'books/salamboo/page (239).png',
    'books/salamboo/page (240).png',
    'books/salamboo/page (241).png',
    'books/salamboo/page (242).png',
    'books/salamboo/page (243).png',
    'books/salamboo/page (244).png',
    'books/salamboo/page (245).png',
    'books/salamboo/page (246).png',
    'books/salamboo/page (247).png',
    'books/salamboo/page (248).png',
    'books/salamboo/page (249).png',
    'books/salamboo/page (250).png',
    'books/salamboo/page (251).png',
    'books/salamboo/page (252).png',
    'books/salamboo/page (253).png',
    'books/salamboo/page (254).png',
    'books/salamboo/page (255).png',
    'books/salamboo/page (256).png',
    'books/salamboo/page (257).png',
    'books/salamboo/page (258).png',
    'books/salamboo/page (259).png',
    'books/salamboo/page (260).png',
    'books/salamboo/page (261).png',
    'books/salamboo/page (262).png',
    'books/salamboo/page (263).png',
    'books/salamboo/page (264).png',
    'books/salamboo/page (265).png',
    'books/salamboo/page (266).png',
    'books/salamboo/page (267).png',
    'books/salamboo/page (268).png',
    'books/salamboo/page (269).png',
    'books/salamboo/page (270).png',
    'books/salamboo/page (271).png',
    'books/salamboo/page (272).png',
    'books/salamboo/page (273).png',
    'books/salamboo/page (274).png',

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
