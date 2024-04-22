import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bozkurtlaroluyor extends StatefulWidget {
  const bozkurtlaroluyor({Key? key}) : super(key: key);

  @override
  State<bozkurtlaroluyor> createState() => _bozkurtlaroluyorState();
}

class _bozkurtlaroluyorState extends State<bozkurtlaroluyor> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bozkurtlar olumu/page (1).png',
    'books/bozkurtlar olumu/page (2).png',
    'books/bozkurtlar olumu/page (3).png',
    'books/bozkurtlar olumu/page (4).png',
    'books/bozkurtlar olumu/page (5).png',
    'books/bozkurtlar olumu/page (6).png',
    'books/bozkurtlar olumu/page (7).png',
    'books/bozkurtlar olumu/page (8).png',
    'books/bozkurtlar olumu/page (9).png',
    'books/bozkurtlar olumu/page (10).png',
    'books/bozkurtlar olumu/page (11).png',
    'books/bozkurtlar olumu/page (12).png',
    'books/bozkurtlar olumu/page (13).png',
    'books/bozkurtlar olumu/page (14).png',
    'books/bozkurtlar olumu/page (15).png',
    'books/bozkurtlar olumu/page (16).png',
    'books/bozkurtlar olumu/page (17).png',
    'books/bozkurtlar olumu/page (18).png',
    'books/bozkurtlar olumu/page (19).png',
    'books/bozkurtlar olumu/page (20).png',
    'books/bozkurtlar olumu/page (21).png',
    'books/bozkurtlar olumu/page (22).png',
    'books/bozkurtlar olumu/page (23).png',
    'books/bozkurtlar olumu/page (24).png',
    'books/bozkurtlar olumu/page (25).png',
    'books/bozkurtlar olumu/page (26).png',
    'books/bozkurtlar olumu/page (27).png',
    'books/bozkurtlar olumu/page (28).png',
    'books/bozkurtlar olumu/page (29).png',
    'books/bozkurtlar olumu/page (30).png',
    'books/bozkurtlar olumu/page (31).png',
    'books/bozkurtlar olumu/page (32).png',
    'books/bozkurtlar olumu/page (33).png',
    'books/bozkurtlar olumu/page (34).png',
    'books/bozkurtlar olumu/page (35).png',
    'books/bozkurtlar olumu/page (36).png',
    'books/bozkurtlar olumu/page (37).png',
    'books/bozkurtlar olumu/page (38).png',
    'books/bozkurtlar olumu/page (39).png',
    'books/bozkurtlar olumu/page (40).png',
    'books/bozkurtlar olumu/page (41).png',
    'books/bozkurtlar olumu/page (42).png',
    'books/bozkurtlar olumu/page (43).png',
    'books/bozkurtlar olumu/page (44).png',
    'books/bozkurtlar olumu/page (45).png',
    'books/bozkurtlar olumu/page (46).png',
    'books/bozkurtlar olumu/page (47).png',
    'books/bozkurtlar olumu/page (48).png',
    'books/bozkurtlar olumu/page (49).png',
    'books/bozkurtlar olumu/page (50).png',
    'books/bozkurtlar olumu/page (51).png',
    'books/bozkurtlar olumu/page (52).png',
    'books/bozkurtlar olumu/page (53).png',
    'books/bozkurtlar olumu/page (54).png',
    'books/bozkurtlar olumu/page (55).png',
    'books/bozkurtlar olumu/page (56).png',
    'books/bozkurtlar olumu/page (57).png',
    'books/bozkurtlar olumu/page (58).png',
    'books/bozkurtlar olumu/page (59).png',
    'books/bozkurtlar olumu/page (60).png',
    'books/bozkurtlar olumu/page (61).png',
    'books/bozkurtlar olumu/page (62).png',
    'books/bozkurtlar olumu/page (63).png',
    'books/bozkurtlar olumu/page (64).png',
    'books/bozkurtlar olumu/page (65).png',
    'books/bozkurtlar olumu/page (66).png',
    'books/bozkurtlar olumu/page (67).png',
    'books/bozkurtlar olumu/page (68).png',
    'books/bozkurtlar olumu/page (69).png',
    'books/bozkurtlar olumu/page (70).png',
    'books/bozkurtlar olumu/page (71).png',
    'books/bozkurtlar olumu/page (72).png',
    'books/bozkurtlar olumu/page (73).png',
    'books/bozkurtlar olumu/page (74).png',
    'books/bozkurtlar olumu/page (75).png',
    'books/bozkurtlar olumu/page (76).png',
    'books/bozkurtlar olumu/page (77).png',
    'books/bozkurtlar olumu/page (78).png',
    'books/bozkurtlar olumu/page (79).png',
    'books/bozkurtlar olumu/page (80).png',
    'books/bozkurtlar olumu/page (81).png',
    'books/bozkurtlar olumu/page (82).png',
    'books/bozkurtlar olumu/page (83).png',
    'books/bozkurtlar olumu/page (84).png',
    'books/bozkurtlar olumu/page (85).png',
    'books/bozkurtlar olumu/page (86).png',
    'books/bozkurtlar olumu/page (87).png',
    'books/bozkurtlar olumu/page (88).png',
    'books/bozkurtlar olumu/page (89).png',
    'books/bozkurtlar olumu/page (90).png',
    'books/bozkurtlar olumu/page (91).png',
    'books/bozkurtlar olumu/page (92).png',
    'books/bozkurtlar olumu/page (93).png',
    'books/bozkurtlar olumu/page (94).png',
    'books/bozkurtlar olumu/page (95).png',
    'books/bozkurtlar olumu/page (96).png',
    'books/bozkurtlar olumu/page (97).png',
    'books/bozkurtlar olumu/page (98).png',
    'books/bozkurtlar olumu/page (99).png',
    'books/bozkurtlar olumu/page (100).png',
    'books/bozkurtlar olumu/page (101).png',
    'books/bozkurtlar olumu/page (102).png',
    'books/bozkurtlar olumu/page (103).png',
    'books/bozkurtlar olumu/page (104).png',
    'books/bozkurtlar olumu/page (105).png',
    'books/bozkurtlar olumu/page (106).png',
    'books/bozkurtlar olumu/page (107).png',
    'books/bozkurtlar olumu/page (108).png',
    'books/bozkurtlar olumu/page (109).png',
    'books/bozkurtlar olumu/page (110).png',
    'books/bozkurtlar olumu/page (111).png',
    'books/bozkurtlar olumu/page (112).png',
    'books/bozkurtlar olumu/page (113).png',
    'books/bozkurtlar olumu/page (114).png',
    'books/bozkurtlar olumu/page (115).png',
    'books/bozkurtlar olumu/page (116).png',
    'books/bozkurtlar olumu/page (117).png',
    'books/bozkurtlar olumu/page (118).png',
    'books/bozkurtlar olumu/page (119).png',
    'books/bozkurtlar olumu/page (120).png',
    'books/bozkurtlar olumu/page (121).png',
    'books/bozkurtlar olumu/page (122).png',
    'books/bozkurtlar olumu/page (123).png',
    'books/bozkurtlar olumu/page (124).png',
    'books/bozkurtlar olumu/page (125).png',
    'books/bozkurtlar olumu/page (126).png',
    'books/bozkurtlar olumu/page (127).png',
    'books/bozkurtlar olumu/page (128).png',
    'books/bozkurtlar olumu/page (129).png',
    'books/bozkurtlar olumu/page (130).png',
    'books/bozkurtlar olumu/page (131).png',
    'books/bozkurtlar olumu/page (132).png',
    'books/bozkurtlar olumu/page (133).png',
    'books/bozkurtlar olumu/page (134).png',
    'books/bozkurtlar olumu/page (135).png',
    'books/bozkurtlar olumu/page (136).png',
    'books/bozkurtlar olumu/page (137).png',
    'books/bozkurtlar olumu/page (138).png',
    'books/bozkurtlar olumu/page (139).png',
    'books/bozkurtlar olumu/page (140).png',
    'books/bozkurtlar olumu/page (141).png',
    'books/bozkurtlar olumu/page (142).png',
    'books/bozkurtlar olumu/page (143).png',
    'books/bozkurtlar olumu/page (144).png',
    'books/bozkurtlar olumu/page (145).png',
    'books/bozkurtlar olumu/page (146).png',
    'books/bozkurtlar olumu/page (147).png',
    'books/bozkurtlar olumu/page (148).png',
    'books/bozkurtlar olumu/page (149).png',
    'books/bozkurtlar olumu/page (150).png',
    'books/bozkurtlar olumu/page (151).png',
    'books/bozkurtlar olumu/page (152).png',
    'books/bozkurtlar olumu/page (153).png',
    'books/bozkurtlar olumu/page (154).png',
    'books/bozkurtlar olumu/page (155).png',
    'books/bozkurtlar olumu/page (156).png',
    'books/bozkurtlar olumu/page (157).png',
    'books/bozkurtlar olumu/page (158).png',
    'books/bozkurtlar olumu/page (159).png',
    'books/bozkurtlar olumu/page (160).png',
    'books/bozkurtlar olumu/page (161).png',
    'books/bozkurtlar olumu/page (162).png',
    'books/bozkurtlar olumu/page (163).png',
    'books/bozkurtlar olumu/page (164).png',
    'books/bozkurtlar olumu/page (165).png',
    'books/bozkurtlar olumu/page (166).png',
    'books/bozkurtlar olumu/page (167).png',
    'books/bozkurtlar olumu/page (168).png',
    'books/bozkurtlar olumu/page (169).png',
    'books/bozkurtlar olumu/page (170).png',
    'books/bozkurtlar olumu/page (171).png',
    'books/bozkurtlar olumu/page (172).png',
    'books/bozkurtlar olumu/page (173).png',
    'books/bozkurtlar olumu/page (174).png',
    'books/bozkurtlar olumu/page (175).png',
    'books/bozkurtlar olumu/page (176).png',
    'books/bozkurtlar olumu/page (177).png',
    'books/bozkurtlar olumu/page (178).png',
    'books/bozkurtlar olumu/page (179).png',
    'books/bozkurtlar olumu/page (180).png',
    'books/bozkurtlar olumu/page (181).png',
    'books/bozkurtlar olumu/page (182).png',
    'books/bozkurtlar olumu/page (183).png',
    'books/bozkurtlar olumu/page (184).png',
    'books/bozkurtlar olumu/page (185).png',
    'books/bozkurtlar olumu/page (186).png',
    'books/bozkurtlar olumu/page (187).png',
    'books/bozkurtlar olumu/page (188).png',
    'books/bozkurtlar olumu/page (189).png',
    'books/bozkurtlar olumu/page (190).png',
    'books/bozkurtlar olumu/page (191).png',
    'books/bozkurtlar olumu/page (192).png',
    'books/bozkurtlar olumu/page (193).png',
    'books/bozkurtlar olumu/page (194).png',
    'books/bozkurtlar olumu/page (195).png',
    'books/bozkurtlar olumu/page (196).png',
    'books/bozkurtlar olumu/page (197).png',
    'books/bozkurtlar olumu/page (198).png',
    'books/bozkurtlar olumu/page (199).png',
    'books/bozkurtlar olumu/page (200).png',
    'books/bozkurtlar olumu/page (201).png',
    'books/bozkurtlar olumu/page (202).png',
    'books/bozkurtlar olumu/page (203).png',
    'books/bozkurtlar olumu/page (204).png',
    'books/bozkurtlar olumu/page (205).png',
    'books/bozkurtlar olumu/page (206).png',
    'books/bozkurtlar olumu/page (207).png',
    'books/bozkurtlar olumu/page (208).png',
    'books/bozkurtlar olumu/page (209).png',
    'books/bozkurtlar olumu/page (210).png',
    'books/bozkurtlar olumu/page (211).png',
    'books/bozkurtlar olumu/page (212).png',
    'books/bozkurtlar olumu/page (213).png',
    'books/bozkurtlar olumu/page (214).png',
    'books/bozkurtlar olumu/page (215).png',
    'books/bozkurtlar olumu/page (216).png',
    'books/bozkurtlar olumu/page (217).png',
    'books/bozkurtlar olumu/page (218).png',
    'books/bozkurtlar olumu/page (219).png',
    'books/bozkurtlar olumu/page (220).png',
    'books/bozkurtlar olumu/page (221).png',
    'books/bozkurtlar olumu/page (222).png',
    'books/bozkurtlar olumu/page (223).png',
    'books/bozkurtlar olumu/page (224).png',
    'books/bozkurtlar olumu/page (225).png',
    'books/bozkurtlar olumu/page (226).png',
    'books/bozkurtlar olumu/page (227).png',
    'books/bozkurtlar olumu/page (228).png',
    'books/bozkurtlar olumu/page (229).png',
    'books/bozkurtlar olumu/page (230).png',
    'books/bozkurtlar olumu/page (231).png',
    'books/bozkurtlar olumu/page (232).png',
    'books/bozkurtlar olumu/page (233).png',
    'books/bozkurtlar olumu/page (234).png',
    'books/bozkurtlar olumu/page (235).png',
    'books/bozkurtlar olumu/page (236).png',
    'books/bozkurtlar olumu/page (237).png',
    'books/bozkurtlar olumu/page (238).png',
    'books/bozkurtlar olumu/page (239).png',
    'books/bozkurtlar olumu/page (240).png',
    'books/bozkurtlar olumu/page (241).png',
    'books/bozkurtlar olumu/page (242).png',
    'books/bozkurtlar olumu/page (243).png',
    'books/bozkurtlar olumu/page (244).png',
    'books/bozkurtlar olumu/page (245).png',
    'books/bozkurtlar olumu/page (246).png',
    'books/bozkurtlar olumu/page (247).png',
    'books/bozkurtlar olumu/page (248).png',
    'books/bozkurtlar olumu/page (249).png',
    'books/bozkurtlar olumu/page (250).png',
    'books/bozkurtlar olumu/page (251).png',
    'books/bozkurtlar olumu/page (252).png',
    'books/bozkurtlar olumu/page (253).png',
    'books/bozkurtlar olumu/page (254).png',
    'books/bozkurtlar olumu/page (255).png',
    'books/bozkurtlar olumu/page (256).png',
    'books/bozkurtlar olumu/page (257).png',
    'books/bozkurtlar olumu/page (258).png',
    'books/bozkurtlar olumu/page (259).png',
    'books/bozkurtlar olumu/page (260).png',
    'books/bozkurtlar olumu/page (261).png',
    'books/bozkurtlar olumu/page (262).png',
    'books/bozkurtlar olumu/page (263).png',
    'books/bozkurtlar olumu/page (264).png',
    'books/bozkurtlar olumu/page (265).png',
    'books/bozkurtlar olumu/page (266).png',
    'books/bozkurtlar olumu/page (267).png',
    'books/bozkurtlar olumu/page (268).png',
    'books/bozkurtlar olumu/page (269).png',
    'books/bozkurtlar olumu/page (270).png',
    'books/bozkurtlar olumu/page (271).png',
    'books/bozkurtlar olumu/page (272).png',
    'books/bozkurtlar olumu/page (273).png',
    'books/bozkurtlar olumu/page (274).png',
    'books/bozkurtlar olumu/page (275).png',
    'books/bozkurtlar olumu/page (276).png',
    'books/bozkurtlar olumu/page (277).png',
    'books/bozkurtlar olumu/page (278).png',
    'books/bozkurtlar olumu/page (279).png',
    'books/bozkurtlar olumu/page (280).png',
    'books/bozkurtlar olumu/page (281).png',

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
