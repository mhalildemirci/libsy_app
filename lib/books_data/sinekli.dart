import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sinekli extends StatefulWidget {
  const sinekli({Key? key}) : super(key: key);

  @override
  State<sinekli> createState() => _sinekliState();
}

class _sinekliState extends State<sinekli> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sinekli/page (1).png',
    'books/sinekli/page (2).png',
    'books/sinekli/page (3).png',
    'books/sinekli/page (4).png',
    'books/sinekli/page (5).png',
    'books/sinekli/page (6).png',
    'books/sinekli/page (7).png',
    'books/sinekli/page (8).png',
    'books/sinekli/page (9).png',
    'books/sinekli/page (10).png',
    'books/sinekli/page (11).png',
    'books/sinekli/page (12).png',
    'books/sinekli/page (13).png',
    'books/sinekli/page (14).png',
    'books/sinekli/page (15).png',
    'books/sinekli/page (16).png',
    'books/sinekli/page (17).png',
    'books/sinekli/page (18).png',
    'books/sinekli/page (19).png',
    'books/sinekli/page (20).png',
    'books/sinekli/page (21).png',
    'books/sinekli/page (22).png',
    'books/sinekli/page (23).png',
    'books/sinekli/page (24).png',
    'books/sinekli/page (25).png',
    'books/sinekli/page (26).png',
    'books/sinekli/page (27).png',
    'books/sinekli/page (28).png',
    'books/sinekli/page (29).png',
    'books/sinekli/page (30).png',
    'books/sinekli/page (31).png',
    'books/sinekli/page (32).png',
    'books/sinekli/page (33).png',
    'books/sinekli/page (34).png',
    'books/sinekli/page (35).png',
    'books/sinekli/page (36).png',
    'books/sinekli/page (37).png',
    'books/sinekli/page (38).png',
    'books/sinekli/page (39).png',
    'books/sinekli/page (40).png',
    'books/sinekli/page (41).png',
    'books/sinekli/page (42).png',
    'books/sinekli/page (43).png',
    'books/sinekli/page (44).png',
    'books/sinekli/page (45).png',
    'books/sinekli/page (46).png',
    'books/sinekli/page (47).png',
    'books/sinekli/page (48).png',
    'books/sinekli/page (49).png',
    'books/sinekli/page (50).png',
    'books/sinekli/page (51).png',
    'books/sinekli/page (52).png',
    'books/sinekli/page (53).png',
    'books/sinekli/page (54).png',
    'books/sinekli/page (55).png',
    'books/sinekli/page (56).png',
    'books/sinekli/page (57).png',
    'books/sinekli/page (58).png',
    'books/sinekli/page (59).png',
    'books/sinekli/page (60).png',
    'books/sinekli/page (61).png',
    'books/sinekli/page (62).png',
    'books/sinekli/page (63).png',
    'books/sinekli/page (64).png',
    'books/sinekli/page (65).png',
    'books/sinekli/page (66).png',
    'books/sinekli/page (67).png',
    'books/sinekli/page (68).png',
    'books/sinekli/page (69).png',
    'books/sinekli/page (70).png',
    'books/sinekli/page (71).png',
    'books/sinekli/page (72).png',
    'books/sinekli/page (73).png',
    'books/sinekli/page (74).png',
    'books/sinekli/page (75).png',
    'books/sinekli/page (76).png',
    'books/sinekli/page (77).png',
    'books/sinekli/page (78).png',
    'books/sinekli/page (79).png',
    'books/sinekli/page (80).png',
    'books/sinekli/page (81).png',
    'books/sinekli/page (82).png',
    'books/sinekli/page (83).png',
    'books/sinekli/page (84).png',
    'books/sinekli/page (85).png',
    'books/sinekli/page (86).png',
    'books/sinekli/page (87).png',
    'books/sinekli/page (88).png',
    'books/sinekli/page (89).png',
    'books/sinekli/page (90).png',
    'books/sinekli/page (91).png',
    'books/sinekli/page (92).png',
    'books/sinekli/page (93).png',
    'books/sinekli/page (94).png',
    'books/sinekli/page (95).png',
    'books/sinekli/page (96).png',
    'books/sinekli/page (97).png',
    'books/sinekli/page (98).png',
    'books/sinekli/page (99).png',
    'books/sinekli/page (100).png',
    'books/sinekli/page (101).png',
    'books/sinekli/page (102).png',
    'books/sinekli/page (103).png',
    'books/sinekli/page (104).png',
    'books/sinekli/page (105).png',
    'books/sinekli/page (106).png',
    'books/sinekli/page (107).png',
    'books/sinekli/page (108).png',
    'books/sinekli/page (109).png',
    'books/sinekli/page (110).png',
    'books/sinekli/page (111).png',
    'books/sinekli/page (112).png',
    'books/sinekli/page (113).png',
    'books/sinekli/page (114).png',
    'books/sinekli/page (115).png',
    'books/sinekli/page (116).png',
    'books/sinekli/page (117).png',
    'books/sinekli/page (118).png',
    'books/sinekli/page (119).png',
    'books/sinekli/page (120).png',
    'books/sinekli/page (121).png',
    'books/sinekli/page (122).png',
    'books/sinekli/page (123).png',
    'books/sinekli/page (124).png',
    'books/sinekli/page (125).png',
    'books/sinekli/page (126).png',
    'books/sinekli/page (127).png',
    'books/sinekli/page (128).png',
    'books/sinekli/page (129).png',
    'books/sinekli/page (130).png',
    'books/sinekli/page (131).png',
    'books/sinekli/page (132).png',
    'books/sinekli/page (133).png',
    'books/sinekli/page (134).png',
    'books/sinekli/page (135).png',
    'books/sinekli/page (136).png',
    'books/sinekli/page (137).png',
    'books/sinekli/page (138).png',
    'books/sinekli/page (139).png',
    'books/sinekli/page (140).png',
    'books/sinekli/page (141).png',
    'books/sinekli/page (142).png',
    'books/sinekli/page (143).png',
    'books/sinekli/page (144).png',
    'books/sinekli/page (145).png',
    'books/sinekli/page (146).png',
    'books/sinekli/page (147).png',
    'books/sinekli/page (148).png',
    'books/sinekli/page (149).png',
    'books/sinekli/page (150).png',
    'books/sinekli/page (151).png',
    'books/sinekli/page (152).png',
    'books/sinekli/page (153).png',
    'books/sinekli/page (154).png',
    'books/sinekli/page (155).png',
    'books/sinekli/page (156).png',
    'books/sinekli/page (157).png',
    'books/sinekli/page (158).png',
    'books/sinekli/page (159).png',
    'books/sinekli/page (160).png',
    'books/sinekli/page (161).png',
    'books/sinekli/page (162).png',
    'books/sinekli/page (163).png',
    'books/sinekli/page (164).png',
    'books/sinekli/page (165).png',
    'books/sinekli/page (166).png',
    'books/sinekli/page (167).png',
    'books/sinekli/page (168).png',
    'books/sinekli/page (169).png',
    'books/sinekli/page (170).png',
    'books/sinekli/page (171).png',
    'books/sinekli/page (172).png',
    'books/sinekli/page (173).png',
    'books/sinekli/page (174).png',
    'books/sinekli/page (175).png',
    'books/sinekli/page (176).png',
    'books/sinekli/page (177).png',
    'books/sinekli/page (178).png',
    'books/sinekli/page (179).png',
    'books/sinekli/page (180).png',
    'books/sinekli/page (181).png',
    'books/sinekli/page (182).png',
    'books/sinekli/page (183).png',
    'books/sinekli/page (184).png',
    'books/sinekli/page (185).png',
    'books/sinekli/page (186).png',
    'books/sinekli/page (187).png',
    'books/sinekli/page (188).png',
    'books/sinekli/page (189).png',
    'books/sinekli/page (190).png',
    'books/sinekli/page (191).png',
    'books/sinekli/page (192).png',
    'books/sinekli/page (193).png',
    'books/sinekli/page (194).png',
    'books/sinekli/page (195).png',
    'books/sinekli/page (196).png',
    'books/sinekli/page (197).png',
    'books/sinekli/page (198).png',
    'books/sinekli/page (199).png',
    'books/sinekli/page (200).png',
    'books/sinekli/page (201).png',
    'books/sinekli/page (202).png',
    'books/sinekli/page (203).png',
    'books/sinekli/page (204).png',
    'books/sinekli/page (205).png',
    'books/sinekli/page (206).png',
    'books/sinekli/page (207).png',
    'books/sinekli/page (208).png',
    'books/sinekli/page (209).png',
    'books/sinekli/page (210).png',
    'books/sinekli/page (211).png',
    'books/sinekli/page (212).png',
    'books/sinekli/page (213).png',
    'books/sinekli/page (214).png',
    'books/sinekli/page (215).png',
    'books/sinekli/page (216).png',
    'books/sinekli/page (217).png',
    'books/sinekli/page (218).png',
    'books/sinekli/page (219).png',
    'books/sinekli/page (220).png',
    'books/sinekli/page (221).png',
    'books/sinekli/page (222).png',
    'books/sinekli/page (223).png',
    'books/sinekli/page (224).png',
    'books/sinekli/page (225).png',
    'books/sinekli/page (226).png',
    'books/sinekli/page (227).png',
    'books/sinekli/page (228).png',
    'books/sinekli/page (229).png',
    'books/sinekli/page (230).png',
    'books/sinekli/page (231).png',
    'books/sinekli/page (232).png',
    'books/sinekli/page (233).png',
    'books/sinekli/page (234).png',
    'books/sinekli/page (235).png',
    'books/sinekli/page (236).png',
    'books/sinekli/page (237).png',
    'books/sinekli/page (238).png',
    'books/sinekli/page (239).png',
    'books/sinekli/page (240).png',
    'books/sinekli/page (241).png',
    'books/sinekli/page (242).png',
    'books/sinekli/page (243).png',
    'books/sinekli/page (244).png',
    'books/sinekli/page (245).png',
    'books/sinekli/page (246).png',
    'books/sinekli/page (247).png',
    'books/sinekli/page (248).png',
    'books/sinekli/page (249).png',
    'books/sinekli/page (250).png',
    'books/sinekli/page (251).png',
    'books/sinekli/page (252).png',
    'books/sinekli/page (253).png',
    'books/sinekli/page (254).png',
    'books/sinekli/page (255).png',
    'books/sinekli/page (256).png',
    'books/sinekli/page (257).png',
    'books/sinekli/page (258).png',
    'books/sinekli/page (259).png',
    'books/sinekli/page (260).png',
    'books/sinekli/page (261).png',
    'books/sinekli/page (262).png',
    'books/sinekli/page (263).png',
    'books/sinekli/page (264).png',
    'books/sinekli/page (265).png',
    'books/sinekli/page (266).png',
    'books/sinekli/page (267).png',
    'books/sinekli/page (268).png',
    'books/sinekli/page (269).png',
    'books/sinekli/page (270).png',
    'books/sinekli/page (271).png',
    'books/sinekli/page (272).png',

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
