import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class nadalily extends StatefulWidget {
  const nadalily({Key? key}) : super(key: key);

  @override
  State<nadalily> createState() => _nadalilyState();
}

class _nadalilyState extends State<nadalily> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/nada lily/page (1).png',
    'books/nada lily/page (2).png',
    'books/nada lily/page (3).png',
    'books/nada lily/page (4).png',
    'books/nada lily/page (5).png',
    'books/nada lily/page (6).png',
    'books/nada lily/page (7).png',
    'books/nada lily/page (8).png',
    'books/nada lily/page (9).png',
    'books/nada lily/page (10).png',
    'books/nada lily/page (11).png',
    'books/nada lily/page (12).png',
    'books/nada lily/page (13).png',
    'books/nada lily/page (14).png',
    'books/nada lily/page (15).png',
    'books/nada lily/page (16).png',
    'books/nada lily/page (17).png',
    'books/nada lily/page (18).png',
    'books/nada lily/page (19).png',
    'books/nada lily/page (20).png',
    'books/nada lily/page (21).png',
    'books/nada lily/page (22).png',
    'books/nada lily/page (23).png',
    'books/nada lily/page (24).png',
    'books/nada lily/page (25).png',
    'books/nada lily/page (26).png',
    'books/nada lily/page (27).png',
    'books/nada lily/page (28).png',
    'books/nada lily/page (29).png',
    'books/nada lily/page (30).png',
    'books/nada lily/page (31).png',
    'books/nada lily/page (32).png',
    'books/nada lily/page (33).png',
    'books/nada lily/page (34).png',
    'books/nada lily/page (35).png',
    'books/nada lily/page (36).png',
    'books/nada lily/page (37).png',
    'books/nada lily/page (38).png',
    'books/nada lily/page (39).png',
    'books/nada lily/page (40).png',
    'books/nada lily/page (41).png',
    'books/nada lily/page (42).png',
    'books/nada lily/page (43).png',
    'books/nada lily/page (44).png',
    'books/nada lily/page (45).png',
    'books/nada lily/page (46).png',
    'books/nada lily/page (47).png',
    'books/nada lily/page (48).png',
    'books/nada lily/page (49).png',
    'books/nada lily/page (50).png',
    'books/nada lily/page (51).png',
    'books/nada lily/page (52).png',
    'books/nada lily/page (53).png',
    'books/nada lily/page (54).png',
    'books/nada lily/page (55).png',
    'books/nada lily/page (56).png',
    'books/nada lily/page (57).png',
    'books/nada lily/page (58).png',
    'books/nada lily/page (59).png',
    'books/nada lily/page (60).png',
    'books/nada lily/page (61).png',
    'books/nada lily/page (62).png',
    'books/nada lily/page (63).png',
    'books/nada lily/page (64).png',
    'books/nada lily/page (65).png',
    'books/nada lily/page (66).png',
    'books/nada lily/page (67).png',
    'books/nada lily/page (68).png',
    'books/nada lily/page (69).png',
    'books/nada lily/page (70).png',
    'books/nada lily/page (71).png',
    'books/nada lily/page (72).png',
    'books/nada lily/page (73).png',
    'books/nada lily/page (74).png',
    'books/nada lily/page (75).png',
    'books/nada lily/page (76).png',
    'books/nada lily/page (77).png',
    'books/nada lily/page (78).png',
    'books/nada lily/page (79).png',
    'books/nada lily/page (80).png',
    'books/nada lily/page (81).png',
    'books/nada lily/page (82).png',
    'books/nada lily/page (83).png',
    'books/nada lily/page (84).png',
    'books/nada lily/page (85).png',
    'books/nada lily/page (86).png',
    'books/nada lily/page (87).png',
    'books/nada lily/page (88).png',
    'books/nada lily/page (89).png',
    'books/nada lily/page (90).png',
    'books/nada lily/page (91).png',
    'books/nada lily/page (92).png',
    'books/nada lily/page (93).png',
    'books/nada lily/page (94).png',
    'books/nada lily/page (95).png',
    'books/nada lily/page (96).png',
    'books/nada lily/page (97).png',
    'books/nada lily/page (98).png',
    'books/nada lily/page (99).png',
    'books/nada lily/page (100).png',
    'books/nada lily/page (101).png',
    'books/nada lily/page (102).png',
    'books/nada lily/page (103).png',
    'books/nada lily/page (104).png',
    'books/nada lily/page (105).png',
    'books/nada lily/page (106).png',
    'books/nada lily/page (107).png',
    'books/nada lily/page (108).png',
    'books/nada lily/page (109).png',
    'books/nada lily/page (110).png',
    'books/nada lily/page (111).png',
    'books/nada lily/page (112).png',
    'books/nada lily/page (113).png',
    'books/nada lily/page (114).png',
    'books/nada lily/page (115).png',
    'books/nada lily/page (116).png',
    'books/nada lily/page (117).png',
    'books/nada lily/page (118).png',
    'books/nada lily/page (119).png',
    'books/nada lily/page (120).png',
    'books/nada lily/page (121).png',
    'books/nada lily/page (122).png',
    'books/nada lily/page (123).png',
    'books/nada lily/page (124).png',
    'books/nada lily/page (125).png',
    'books/nada lily/page (126).png',
    'books/nada lily/page (127).png',
    'books/nada lily/page (128).png',
    'books/nada lily/page (129).png',
    'books/nada lily/page (130).png',
    'books/nada lily/page (131).png',
    'books/nada lily/page (132).png',
    'books/nada lily/page (133).png',
    'books/nada lily/page (134).png',
    'books/nada lily/page (135).png',
    'books/nada lily/page (136).png',
    'books/nada lily/page (137).png',
    'books/nada lily/page (138).png',
    'books/nada lily/page (139).png',
    'books/nada lily/page (140).png',
    'books/nada lily/page (141).png',
    'books/nada lily/page (142).png',
    'books/nada lily/page (143).png',
    'books/nada lily/page (144).png',
    'books/nada lily/page (145).png',
    'books/nada lily/page (146).png',
    'books/nada lily/page (147).png',
    'books/nada lily/page (148).png',
    'books/nada lily/page (149).png',
    'books/nada lily/page (150).png',
    'books/nada lily/page (151).png',
    'books/nada lily/page (152).png',
    'books/nada lily/page (153).png',
    'books/nada lily/page (154).png',
    'books/nada lily/page (155).png',
    'books/nada lily/page (156).png',
    'books/nada lily/page (157).png',
    'books/nada lily/page (158).png',
    'books/nada lily/page (159).png',
    'books/nada lily/page (160).png',
    'books/nada lily/page (161).png',
    'books/nada lily/page (162).png',
    'books/nada lily/page (163).png',
    'books/nada lily/page (164).png',
    'books/nada lily/page (165).png',
    'books/nada lily/page (166).png',
    'books/nada lily/page (167).png',
    'books/nada lily/page (168).png',
    'books/nada lily/page (169).png',
    'books/nada lily/page (170).png',
    'books/nada lily/page (171).png',
    'books/nada lily/page (172).png',
    'books/nada lily/page (173).png',
    'books/nada lily/page (174).png',
    'books/nada lily/page (175).png',
    'books/nada lily/page (176).png',
    'books/nada lily/page (177).png',
    'books/nada lily/page (178).png',
    'books/nada lily/page (179).png',
    'books/nada lily/page (180).png',
    'books/nada lily/page (181).png',
    'books/nada lily/page (182).png',
    'books/nada lily/page (183).png',
    'books/nada lily/page (184).png',
    'books/nada lily/page (185).png',
    'books/nada lily/page (186).png',
    'books/nada lily/page (187).png',
    'books/nada lily/page (188).png',
    'books/nada lily/page (189).png',
    'books/nada lily/page (190).png',
    'books/nada lily/page (191).png',
    'books/nada lily/page (192).png',
    'books/nada lily/page (193).png',
    'books/nada lily/page (194).png',
    'books/nada lily/page (195).png',
    'books/nada lily/page (196).png',
    'books/nada lily/page (197).png',
    'books/nada lily/page (198).png',
    'books/nada lily/page (199).png',
    'books/nada lily/page (200).png',
    'books/nada lily/page (201).png',
    'books/nada lily/page (202).png',
    'books/nada lily/page (203).png',
    'books/nada lily/page (204).png',
    'books/nada lily/page (205).png',
    'books/nada lily/page (206).png',
    'books/nada lily/page (207).png',
    'books/nada lily/page (208).png',
    'books/nada lily/page (209).png',
    'books/nada lily/page (210).png',
    'books/nada lily/page (211).png',
    'books/nada lily/page (212).png',
    'books/nada lily/page (213).png',
    'books/nada lily/page (214).png',
    'books/nada lily/page (215).png',
    'books/nada lily/page (216).png',
    'books/nada lily/page (217).png',
    'books/nada lily/page (218).png',
    'books/nada lily/page (219).png',
    'books/nada lily/page (220).png',
    'books/nada lily/page (221).png',
    'books/nada lily/page (222).png',
    'books/nada lily/page (223).png',
    'books/nada lily/page (224).png',
    'books/nada lily/page (225).png',
    'books/nada lily/page (226).png',
    'books/nada lily/page (227).png',
    'books/nada lily/page (228).png',
    'books/nada lily/page (229).png',
    'books/nada lily/page (230).png',
    'books/nada lily/page (231).png',
    'books/nada lily/page (232).png',
    'books/nada lily/page (233).png',
    'books/nada lily/page (234).png',
    'books/nada lily/page (235).png',
    'books/nada lily/page (236).png',
    'books/nada lily/page (237).png',
    'books/nada lily/page (238).png',
    'books/nada lily/page (239).png',
    'books/nada lily/page (240).png',
    'books/nada lily/page (241).png',
    'books/nada lily/page (242).png',
    'books/nada lily/page (243).png',
    'books/nada lily/page (244).png',
    'books/nada lily/page (245).png',
    'books/nada lily/page (246).png',
    'books/nada lily/page (247).png',
    'books/nada lily/page (248).png',
    'books/nada lily/page (249).png',
    'books/nada lily/page (250).png',
    'books/nada lily/page (251).png',
    'books/nada lily/page (252).png',
    'books/nada lily/page (253).png',
    'books/nada lily/page (254).png',
    'books/nada lily/page (255).png',
    'books/nada lily/page (256).png',
    'books/nada lily/page (257).png',
    'books/nada lily/page (258).png',
    'books/nada lily/page (259).png',
    'books/nada lily/page (260).png',
    'books/nada lily/page (261).png',
    'books/nada lily/page (262).png',
    'books/nada lily/page (263).png',
    'books/nada lily/page (264).png',
    'books/nada lily/page (265).png',
    'books/nada lily/page (266).png',
    'books/nada lily/page (267).png',
    'books/nada lily/page (268).png',
    'books/nada lily/page (269).png',
    'books/nada lily/page (270).png',
    'books/nada lily/page (271).png',
    'books/nada lily/page (272).png',
    'books/nada lily/page (273).png',
    'books/nada lily/page (274).png',
    'books/nada lily/page (275).png',
    'books/nada lily/page (276).png',
    'books/nada lily/page (277).png',
    'books/nada lily/page (278).png',
    'books/nada lily/page (279).png',
    'books/nada lily/page (280).png',

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
