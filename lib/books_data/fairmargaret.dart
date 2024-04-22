import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class fairmargaret extends StatefulWidget {
  const fairmargaret({Key? key}) : super(key: key);

  @override
  State<fairmargaret> createState() => _fairmargaretState();
}

class _fairmargaretState extends State<fairmargaret> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/fair margaret/page (1).png',
    'books/fair margaret/page (2).png',
    'books/fair margaret/page (3).png',
    'books/fair margaret/page (4).png',
    'books/fair margaret/page (5).png',
    'books/fair margaret/page (6).png',
    'books/fair margaret/page (7).png',
    'books/fair margaret/page (8).png',
    'books/fair margaret/page (9).png',
    'books/fair margaret/page (10).png',
    'books/fair margaret/page (11).png',
    'books/fair margaret/page (12).png',
    'books/fair margaret/page (13).png',
    'books/fair margaret/page (14).png',
    'books/fair margaret/page (15).png',
    'books/fair margaret/page (16).png',
    'books/fair margaret/page (17).png',
    'books/fair margaret/page (18).png',
    'books/fair margaret/page (19).png',
    'books/fair margaret/page (20).png',
    'books/fair margaret/page (21).png',
    'books/fair margaret/page (22).png',
    'books/fair margaret/page (23).png',
    'books/fair margaret/page (24).png',
    'books/fair margaret/page (25).png',
    'books/fair margaret/page (26).png',
    'books/fair margaret/page (27).png',
    'books/fair margaret/page (28).png',
    'books/fair margaret/page (29).png',
    'books/fair margaret/page (30).png',
    'books/fair margaret/page (31).png',
    'books/fair margaret/page (32).png',
    'books/fair margaret/page (33).png',
    'books/fair margaret/page (34).png',
    'books/fair margaret/page (35).png',
    'books/fair margaret/page (36).png',
    'books/fair margaret/page (37).png',
    'books/fair margaret/page (38).png',
    'books/fair margaret/page (39).png',
    'books/fair margaret/page (40).png',
    'books/fair margaret/page (41).png',
    'books/fair margaret/page (42).png',
    'books/fair margaret/page (43).png',
    'books/fair margaret/page (44).png',
    'books/fair margaret/page (45).png',
    'books/fair margaret/page (46).png',
    'books/fair margaret/page (47).png',
    'books/fair margaret/page (48).png',
    'books/fair margaret/page (49).png',
    'books/fair margaret/page (50).png',
    'books/fair margaret/page (51).png',
    'books/fair margaret/page (52).png',
    'books/fair margaret/page (53).png',
    'books/fair margaret/page (54).png',
    'books/fair margaret/page (55).png',
    'books/fair margaret/page (56).png',
    'books/fair margaret/page (57).png',
    'books/fair margaret/page (58).png',
    'books/fair margaret/page (59).png',
    'books/fair margaret/page (60).png',
    'books/fair margaret/page (61).png',
    'books/fair margaret/page (62).png',
    'books/fair margaret/page (63).png',
    'books/fair margaret/page (64).png',
    'books/fair margaret/page (65).png',
    'books/fair margaret/page (66).png',
    'books/fair margaret/page (67).png',
    'books/fair margaret/page (68).png',
    'books/fair margaret/page (69).png',
    'books/fair margaret/page (70).png',
    'books/fair margaret/page (71).png',
    'books/fair margaret/page (72).png',
    'books/fair margaret/page (73).png',
    'books/fair margaret/page (74).png',
    'books/fair margaret/page (75).png',
    'books/fair margaret/page (76).png',
    'books/fair margaret/page (77).png',
    'books/fair margaret/page (78).png',
    'books/fair margaret/page (79).png',
    'books/fair margaret/page (80).png',
    'books/fair margaret/page (81).png',
    'books/fair margaret/page (82).png',
    'books/fair margaret/page (83).png',
    'books/fair margaret/page (84).png',
    'books/fair margaret/page (85).png',
    'books/fair margaret/page (86).png',
    'books/fair margaret/page (87).png',
    'books/fair margaret/page (88).png',
    'books/fair margaret/page (89).png',
    'books/fair margaret/page (90).png',
    'books/fair margaret/page (91).png',
    'books/fair margaret/page (92).png',
    'books/fair margaret/page (93).png',
    'books/fair margaret/page (94).png',
    'books/fair margaret/page (95).png',
    'books/fair margaret/page (96).png',
    'books/fair margaret/page (97).png',
    'books/fair margaret/page (98).png',
    'books/fair margaret/page (99).png',
    'books/fair margaret/page (100).png',
    'books/fair margaret/page (101).png',
    'books/fair margaret/page (102).png',
    'books/fair margaret/page (103).png',
    'books/fair margaret/page (104).png',
    'books/fair margaret/page (105).png',
    'books/fair margaret/page (106).png',
    'books/fair margaret/page (107).png',
    'books/fair margaret/page (108).png',
    'books/fair margaret/page (109).png',
    'books/fair margaret/page (110).png',
    'books/fair margaret/page (111).png',
    'books/fair margaret/page (112).png',
    'books/fair margaret/page (113).png',
    'books/fair margaret/page (114).png',
    'books/fair margaret/page (115).png',
    'books/fair margaret/page (116).png',
    'books/fair margaret/page (117).png',
    'books/fair margaret/page (118).png',
    'books/fair margaret/page (119).png',
    'books/fair margaret/page (120).png',
    'books/fair margaret/page (121).png',
    'books/fair margaret/page (122).png',
    'books/fair margaret/page (123).png',
    'books/fair margaret/page (124).png',
    'books/fair margaret/page (125).png',
    'books/fair margaret/page (126).png',
    'books/fair margaret/page (127).png',
    'books/fair margaret/page (128).png',
    'books/fair margaret/page (129).png',
    'books/fair margaret/page (130).png',
    'books/fair margaret/page (131).png',
    'books/fair margaret/page (132).png',
    'books/fair margaret/page (133).png',
    'books/fair margaret/page (134).png',
    'books/fair margaret/page (135).png',
    'books/fair margaret/page (136).png',
    'books/fair margaret/page (137).png',
    'books/fair margaret/page (138).png',
    'books/fair margaret/page (139).png',
    'books/fair margaret/page (140).png',
    'books/fair margaret/page (141).png',
    'books/fair margaret/page (142).png',
    'books/fair margaret/page (143).png',
    'books/fair margaret/page (144).png',
    'books/fair margaret/page (145).png',
    'books/fair margaret/page (146).png',
    'books/fair margaret/page (147).png',
    'books/fair margaret/page (148).png',
    'books/fair margaret/page (149).png',
    'books/fair margaret/page (150).png',
    'books/fair margaret/page (151).png',
    'books/fair margaret/page (152).png',
    'books/fair margaret/page (153).png',
    'books/fair margaret/page (154).png',
    'books/fair margaret/page (155).png',
    'books/fair margaret/page (156).png',
    'books/fair margaret/page (157).png',
    'books/fair margaret/page (158).png',
    'books/fair margaret/page (159).png',
    'books/fair margaret/page (160).png',
    'books/fair margaret/page (161).png',
    'books/fair margaret/page (162).png',
    'books/fair margaret/page (163).png',
    'books/fair margaret/page (164).png',
    'books/fair margaret/page (165).png',
    'books/fair margaret/page (166).png',
    'books/fair margaret/page (167).png',
    'books/fair margaret/page (168).png',
    'books/fair margaret/page (169).png',
    'books/fair margaret/page (170).png',
    'books/fair margaret/page (171).png',
    'books/fair margaret/page (172).png',
    'books/fair margaret/page (173).png',
    'books/fair margaret/page (174).png',
    'books/fair margaret/page (175).png',
    'books/fair margaret/page (176).png',
    'books/fair margaret/page (177).png',
    'books/fair margaret/page (178).png',
    'books/fair margaret/page (179).png',
    'books/fair margaret/page (180).png',
    'books/fair margaret/page (181).png',
    'books/fair margaret/page (182).png',
    'books/fair margaret/page (183).png',
    'books/fair margaret/page (184).png',
    'books/fair margaret/page (185).png',
    'books/fair margaret/page (186).png',
    'books/fair margaret/page (187).png',
    'books/fair margaret/page (188).png',
    'books/fair margaret/page (189).png',
    'books/fair margaret/page (190).png',
    'books/fair margaret/page (191).png',
    'books/fair margaret/page (192).png',
    'books/fair margaret/page (193).png',
    'books/fair margaret/page (194).png',
    'books/fair margaret/page (195).png',
    'books/fair margaret/page (196).png',
    'books/fair margaret/page (197).png',
    'books/fair margaret/page (198).png',
    'books/fair margaret/page (199).png',
    'books/fair margaret/page (200).png',
    'books/fair margaret/page (201).png',
    'books/fair margaret/page (202).png',
    'books/fair margaret/page (203).png',
    'books/fair margaret/page (204).png',
    'books/fair margaret/page (205).png',
    'books/fair margaret/page (206).png',
    'books/fair margaret/page (207).png',
    'books/fair margaret/page (208).png',
    'books/fair margaret/page (209).png',
    'books/fair margaret/page (210).png',
    'books/fair margaret/page (211).png',
    'books/fair margaret/page (212).png',
    'books/fair margaret/page (213).png',
    'books/fair margaret/page (214).png',
    'books/fair margaret/page (215).png',
    'books/fair margaret/page (216).png',
    'books/fair margaret/page (217).png',
    'books/fair margaret/page (218).png',
    'books/fair margaret/page (219).png',
    'books/fair margaret/page (220).png',
    'books/fair margaret/page (221).png',
    'books/fair margaret/page (222).png',
    'books/fair margaret/page (223).png',
    'books/fair margaret/page (224).png',
    'books/fair margaret/page (225).png',
    'books/fair margaret/page (226).png',
    'books/fair margaret/page (227).png',
    'books/fair margaret/page (228).png',
    'books/fair margaret/page (229).png',
    'books/fair margaret/page (230).png',
    'books/fair margaret/page (231).png',
    'books/fair margaret/page (232).png',
    'books/fair margaret/page (233).png',
    'books/fair margaret/page (234).png',
    'books/fair margaret/page (235).png',
    'books/fair margaret/page (236).png',
    'books/fair margaret/page (237).png',
    'books/fair margaret/page (238).png',
    'books/fair margaret/page (239).png',
    'books/fair margaret/page (240).png',
    'books/fair margaret/page (241).png',
    'books/fair margaret/page (242).png',
    'books/fair margaret/page (243).png',
    'books/fair margaret/page (244).png',
    'books/fair margaret/page (245).png',
    'books/fair margaret/page (246).png',
    'books/fair margaret/page (247).png',
    'books/fair margaret/page (248).png',
    'books/fair margaret/page (249).png',
    'books/fair margaret/page (250).png',
    'books/fair margaret/page (251).png',
    'books/fair margaret/page (252).png',
    'books/fair margaret/page (253).png',
    'books/fair margaret/page (254).png',
    'books/fair margaret/page (255).png',
    'books/fair margaret/page (256).png',
    'books/fair margaret/page (257).png',
    'books/fair margaret/page (258).png',
    'books/fair margaret/page (259).png',
    'books/fair margaret/page (260).png',
    'books/fair margaret/page (261).png',
    'books/fair margaret/page (262).png',
    'books/fair margaret/page (263).png',
    'books/fair margaret/page (264).png',
    'books/fair margaret/page (265).png',
    'books/fair margaret/page (266).png',
    'books/fair margaret/page (267).png',
    'books/fair margaret/page (268).png',
    'books/fair margaret/page (269).png',
    'books/fair margaret/page (270).png',
    'books/fair margaret/page (271).png',
    'books/fair margaret/page (272).png',
    'books/fair margaret/page (273).png',
    'books/fair margaret/page (274).png',
    'books/fair margaret/page (275).png',
    'books/fair margaret/page (276).png',
    'books/fair margaret/page (277).png',
    'books/fair margaret/page (278).png',
    'books/fair margaret/page (279).png',
    'books/fair margaret/page (280).png',
    'books/fair margaret/page (281).png',

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
