import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class warair extends StatefulWidget {
  const warair({Key? key}) : super(key: key);

  @override
  State<warair> createState() => _warairState();
}

class _warairState extends State<warair> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/war in the air/page (1).png',
    'books/war in the air/page (2).png',
    'books/war in the air/page (3).png',
    'books/war in the air/page (4).png',
    'books/war in the air/page (5).png',
    'books/war in the air/page (6).png',
    'books/war in the air/page (7).png',
    'books/war in the air/page (8).png',
    'books/war in the air/page (9).png',
    'books/war in the air/page (10).png',
    'books/war in the air/page (11).png',
    'books/war in the air/page (12).png',
    'books/war in the air/page (13).png',
    'books/war in the air/page (14).png',
    'books/war in the air/page (15).png',
    'books/war in the air/page (16).png',
    'books/war in the air/page (17).png',
    'books/war in the air/page (18).png',
    'books/war in the air/page (19).png',
    'books/war in the air/page (20).png',
    'books/war in the air/page (21).png',
    'books/war in the air/page (22).png',
    'books/war in the air/page (23).png',
    'books/war in the air/page (24).png',
    'books/war in the air/page (25).png',
    'books/war in the air/page (26).png',
    'books/war in the air/page (27).png',
    'books/war in the air/page (28).png',
    'books/war in the air/page (29).png',
    'books/war in the air/page (30).png',
    'books/war in the air/page (31).png',
    'books/war in the air/page (32).png',
    'books/war in the air/page (33).png',
    'books/war in the air/page (34).png',
    'books/war in the air/page (35).png',
    'books/war in the air/page (36).png',
    'books/war in the air/page (37).png',
    'books/war in the air/page (38).png',
    'books/war in the air/page (39).png',
    'books/war in the air/page (40).png',
    'books/war in the air/page (41).png',
    'books/war in the air/page (42).png',
    'books/war in the air/page (43).png',
    'books/war in the air/page (44).png',
    'books/war in the air/page (45).png',
    'books/war in the air/page (46).png',
    'books/war in the air/page (47).png',
    'books/war in the air/page (48).png',
    'books/war in the air/page (49).png',
    'books/war in the air/page (50).png',
    'books/war in the air/page (51).png',
    'books/war in the air/page (52).png',
    'books/war in the air/page (53).png',
    'books/war in the air/page (54).png',
    'books/war in the air/page (55).png',
    'books/war in the air/page (56).png',
    'books/war in the air/page (57).png',
    'books/war in the air/page (58).png',
    'books/war in the air/page (59).png',
    'books/war in the air/page (60).png',
    'books/war in the air/page (61).png',
    'books/war in the air/page (62).png',
    'books/war in the air/page (63).png',
    'books/war in the air/page (64).png',
    'books/war in the air/page (65).png',
    'books/war in the air/page (66).png',
    'books/war in the air/page (67).png',
    'books/war in the air/page (68).png',
    'books/war in the air/page (69).png',
    'books/war in the air/page (70).png',
    'books/war in the air/page (71).png',
    'books/war in the air/page (72).png',
    'books/war in the air/page (73).png',
    'books/war in the air/page (74).png',
    'books/war in the air/page (75).png',
    'books/war in the air/page (76).png',
    'books/war in the air/page (77).png',
    'books/war in the air/page (78).png',
    'books/war in the air/page (79).png',
    'books/war in the air/page (80).png',
    'books/war in the air/page (81).png',
    'books/war in the air/page (82).png',
    'books/war in the air/page (83).png',
    'books/war in the air/page (84).png',
    'books/war in the air/page (85).png',
    'books/war in the air/page (86).png',
    'books/war in the air/page (87).png',
    'books/war in the air/page (88).png',
    'books/war in the air/page (89).png',
    'books/war in the air/page (90).png',
    'books/war in the air/page (91).png',
    'books/war in the air/page (92).png',
    'books/war in the air/page (93).png',
    'books/war in the air/page (94).png',
    'books/war in the air/page (95).png',
    'books/war in the air/page (96).png',
    'books/war in the air/page (97).png',
    'books/war in the air/page (98).png',
    'books/war in the air/page (99).png',
    'books/war in the air/page (100).png',
    'books/war in the air/page (101).png',
    'books/war in the air/page (102).png',
    'books/war in the air/page (103).png',
    'books/war in the air/page (104).png',
    'books/war in the air/page (105).png',
    'books/war in the air/page (106).png',
    'books/war in the air/page (107).png',
    'books/war in the air/page (108).png',
    'books/war in the air/page (109).png',
    'books/war in the air/page (110).png',
    'books/war in the air/page (111).png',
    'books/war in the air/page (112).png',
    'books/war in the air/page (113).png',
    'books/war in the air/page (114).png',
    'books/war in the air/page (115).png',
    'books/war in the air/page (116).png',
    'books/war in the air/page (117).png',
    'books/war in the air/page (118).png',
    'books/war in the air/page (119).png',
    'books/war in the air/page (120).png',
    'books/war in the air/page (121).png',
    'books/war in the air/page (122).png',
    'books/war in the air/page (123).png',
    'books/war in the air/page (124).png',
    'books/war in the air/page (125).png',
    'books/war in the air/page (126).png',
    'books/war in the air/page (127).png',
    'books/war in the air/page (128).png',
    'books/war in the air/page (129).png',
    'books/war in the air/page (130).png',
    'books/war in the air/page (131).png',
    'books/war in the air/page (132).png',
    'books/war in the air/page (133).png',
    'books/war in the air/page (134).png',
    'books/war in the air/page (135).png',
    'books/war in the air/page (136).png',
    'books/war in the air/page (137).png',
    'books/war in the air/page (138).png',
    'books/war in the air/page (139).png',
    'books/war in the air/page (140).png',
    'books/war in the air/page (141).png',
    'books/war in the air/page (142).png',
    'books/war in the air/page (143).png',
    'books/war in the air/page (144).png',
    'books/war in the air/page (145).png',
    'books/war in the air/page (146).png',
    'books/war in the air/page (147).png',
    'books/war in the air/page (148).png',
    'books/war in the air/page (149).png',
    'books/war in the air/page (150).png',
    'books/war in the air/page (151).png',
    'books/war in the air/page (152).png',
    'books/war in the air/page (153).png',
    'books/war in the air/page (154).png',
    'books/war in the air/page (155).png',
    'books/war in the air/page (156).png',
    'books/war in the air/page (157).png',
    'books/war in the air/page (158).png',
    'books/war in the air/page (159).png',
    'books/war in the air/page (160).png',
    'books/war in the air/page (161).png',
    'books/war in the air/page (162).png',
    'books/war in the air/page (163).png',
    'books/war in the air/page (164).png',
    'books/war in the air/page (165).png',
    'books/war in the air/page (166).png',
    'books/war in the air/page (167).png',
    'books/war in the air/page (168).png',
    'books/war in the air/page (169).png',
    'books/war in the air/page (170).png',
    'books/war in the air/page (171).png',
    'books/war in the air/page (172).png',
    'books/war in the air/page (173).png',
    'books/war in the air/page (174).png',
    'books/war in the air/page (175).png',
    'books/war in the air/page (176).png',
    'books/war in the air/page (177).png',
    'books/war in the air/page (178).png',
    'books/war in the air/page (179).png',
    'books/war in the air/page (180).png',
    'books/war in the air/page (181).png',
    'books/war in the air/page (182).png',
    'books/war in the air/page (183).png',
    'books/war in the air/page (184).png',
    'books/war in the air/page (185).png',
    'books/war in the air/page (186).png',
    'books/war in the air/page (187).png',
    'books/war in the air/page (188).png',
    'books/war in the air/page (189).png',
    'books/war in the air/page (190).png',
    'books/war in the air/page (191).png',
    'books/war in the air/page (192).png',
    'books/war in the air/page (193).png',
    'books/war in the air/page (194).png',
    'books/war in the air/page (195).png',
    'books/war in the air/page (196).png',
    'books/war in the air/page (197).png',
    'books/war in the air/page (198).png',
    'books/war in the air/page (199).png',
    'books/war in the air/page (200).png',
    'books/war in the air/page (201).png',
    'books/war in the air/page (202).png',
    'books/war in the air/page (203).png',
    'books/war in the air/page (204).png',
    'books/war in the air/page (205).png',
    'books/war in the air/page (206).png',
    'books/war in the air/page (207).png',
    'books/war in the air/page (208).png',
    'books/war in the air/page (209).png',
    'books/war in the air/page (210).png',
    'books/war in the air/page (211).png',
    'books/war in the air/page (212).png',
    'books/war in the air/page (213).png',
    'books/war in the air/page (214).png',
    'books/war in the air/page (215).png',
    'books/war in the air/page (216).png',
    'books/war in the air/page (217).png',
    'books/war in the air/page (218).png',
    'books/war in the air/page (219).png',
    'books/war in the air/page (220).png',
    'books/war in the air/page (221).png',
    'books/war in the air/page (222).png',
    'books/war in the air/page (223).png',
    'books/war in the air/page (224).png',
    'books/war in the air/page (225).png',
    'books/war in the air/page (226).png',
    'books/war in the air/page (227).png',
    'books/war in the air/page (228).png',
    'books/war in the air/page (229).png',
    'books/war in the air/page (230).png',
    'books/war in the air/page (231).png',
    'books/war in the air/page (232).png',
    'books/war in the air/page (233).png',
    'books/war in the air/page (234).png',
    'books/war in the air/page (235).png',
    'books/war in the air/page (236).png',
    'books/war in the air/page (237).png',
    'books/war in the air/page (238).png',
    'books/war in the air/page (239).png',
    'books/war in the air/page (240).png',
    'books/war in the air/page (241).png',
    'books/war in the air/page (242).png',
    'books/war in the air/page (243).png',
    'books/war in the air/page (244).png',
    'books/war in the air/page (245).png',
    'books/war in the air/page (246).png',
    'books/war in the air/page (247).png',
    'books/war in the air/page (248).png',
    'books/war in the air/page (249).png',
    'books/war in the air/page (250).png',
    'books/war in the air/page (251).png',
    'books/war in the air/page (252).png',
    'books/war in the air/page (253).png',
    'books/war in the air/page (254).png',
    'books/war in the air/page (255).png',
    'books/war in the air/page (256).png',
    'books/war in the air/page (257).png',
    'books/war in the air/page (258).png',
    'books/war in the air/page (259).png',
    'books/war in the air/page (260).png',
    'books/war in the air/page (261).png',
    'books/war in the air/page (262).png',
    'books/war in the air/page (263).png',
    'books/war in the air/page (264).png',
    'books/war in the air/page (265).png',
    'books/war in the air/page (266).png',
    'books/war in the air/page (267).png',
    'books/war in the air/page (268).png',
    'books/war in the air/page (269).png',

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
