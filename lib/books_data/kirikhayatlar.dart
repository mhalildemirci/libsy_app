import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kirikhayatlar extends StatefulWidget {
  const kirikhayatlar({Key? key}) : super(key: key);

  @override
  State<kirikhayatlar> createState() => _kirikhayatlarState();
}

class _kirikhayatlarState extends State<kirikhayatlar> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kirik hayatlar/page (1).png',
    'books/kirik hayatlar/page (2).png',
    'books/kirik hayatlar/page (3).png',
    'books/kirik hayatlar/page (4).png',
    'books/kirik hayatlar/page (5).png',
    'books/kirik hayatlar/page (6).png',
    'books/kirik hayatlar/page (7).png',
    'books/kirik hayatlar/page (8).png',
    'books/kirik hayatlar/page (9).png',
    'books/kirik hayatlar/page (10).png',
    'books/kirik hayatlar/page (11).png',
    'books/kirik hayatlar/page (12).png',
    'books/kirik hayatlar/page (13).png',
    'books/kirik hayatlar/page (14).png',
    'books/kirik hayatlar/page (15).png',
    'books/kirik hayatlar/page (16).png',
    'books/kirik hayatlar/page (17).png',
    'books/kirik hayatlar/page (18).png',
    'books/kirik hayatlar/page (19).png',
    'books/kirik hayatlar/page (20).png',
    'books/kirik hayatlar/page (21).png',
    'books/kirik hayatlar/page (22).png',
    'books/kirik hayatlar/page (23).png',
    'books/kirik hayatlar/page (24).png',
    'books/kirik hayatlar/page (25).png',
    'books/kirik hayatlar/page (26).png',
    'books/kirik hayatlar/page (27).png',
    'books/kirik hayatlar/page (28).png',
    'books/kirik hayatlar/page (29).png',
    'books/kirik hayatlar/page (30).png',
    'books/kirik hayatlar/page (31).png',
    'books/kirik hayatlar/page (32).png',
    'books/kirik hayatlar/page (33).png',
    'books/kirik hayatlar/page (34).png',
    'books/kirik hayatlar/page (35).png',
    'books/kirik hayatlar/page (36).png',
    'books/kirik hayatlar/page (37).png',
    'books/kirik hayatlar/page (38).png',
    'books/kirik hayatlar/page (39).png',
    'books/kirik hayatlar/page (40).png',
    'books/kirik hayatlar/page (41).png',
    'books/kirik hayatlar/page (42).png',
    'books/kirik hayatlar/page (43).png',
    'books/kirik hayatlar/page (44).png',
    'books/kirik hayatlar/page (45).png',
    'books/kirik hayatlar/page (46).png',
    'books/kirik hayatlar/page (47).png',
    'books/kirik hayatlar/page (48).png',
    'books/kirik hayatlar/page (49).png',
    'books/kirik hayatlar/page (50).png',
    'books/kirik hayatlar/page (51).png',
    'books/kirik hayatlar/page (52).png',
    'books/kirik hayatlar/page (53).png',
    'books/kirik hayatlar/page (54).png',
    'books/kirik hayatlar/page (55).png',
    'books/kirik hayatlar/page (56).png',
    'books/kirik hayatlar/page (57).png',
    'books/kirik hayatlar/page (58).png',
    'books/kirik hayatlar/page (59).png',
    'books/kirik hayatlar/page (60).png',
    'books/kirik hayatlar/page (61).png',
    'books/kirik hayatlar/page (62).png',
    'books/kirik hayatlar/page (63).png',
    'books/kirik hayatlar/page (64).png',
    'books/kirik hayatlar/page (65).png',
    'books/kirik hayatlar/page (66).png',
    'books/kirik hayatlar/page (67).png',
    'books/kirik hayatlar/page (68).png',
    'books/kirik hayatlar/page (69).png',
    'books/kirik hayatlar/page (70).png',
    'books/kirik hayatlar/page (71).png',
    'books/kirik hayatlar/page (72).png',
    'books/kirik hayatlar/page (73).png',
    'books/kirik hayatlar/page (74).png',
    'books/kirik hayatlar/page (75).png',
    'books/kirik hayatlar/page (76).png',
    'books/kirik hayatlar/page (77).png',
    'books/kirik hayatlar/page (78).png',
    'books/kirik hayatlar/page (79).png',
    'books/kirik hayatlar/page (80).png',
    'books/kirik hayatlar/page (81).png',
    'books/kirik hayatlar/page (82).png',
    'books/kirik hayatlar/page (83).png',
    'books/kirik hayatlar/page (84).png',
    'books/kirik hayatlar/page (85).png',
    'books/kirik hayatlar/page (86).png',
    'books/kirik hayatlar/page (87).png',
    'books/kirik hayatlar/page (88).png',
    'books/kirik hayatlar/page (89).png',
    'books/kirik hayatlar/page (90).png',
    'books/kirik hayatlar/page (91).png',
    'books/kirik hayatlar/page (92).png',
    'books/kirik hayatlar/page (93).png',
    'books/kirik hayatlar/page (94).png',
    'books/kirik hayatlar/page (95).png',
    'books/kirik hayatlar/page (96).png',
    'books/kirik hayatlar/page (97).png',
    'books/kirik hayatlar/page (98).png',
    'books/kirik hayatlar/page (99).png',
    'books/kirik hayatlar/page (100).png',
    'books/kirik hayatlar/page (101).png',
    'books/kirik hayatlar/page (102).png',
    'books/kirik hayatlar/page (103).png',
    'books/kirik hayatlar/page (104).png',
    'books/kirik hayatlar/page (105).png',
    'books/kirik hayatlar/page (106).png',
    'books/kirik hayatlar/page (107).png',
    'books/kirik hayatlar/page (108).png',
    'books/kirik hayatlar/page (109).png',
    'books/kirik hayatlar/page (110).png',
    'books/kirik hayatlar/page (111).png',
    'books/kirik hayatlar/page (112).png',
    'books/kirik hayatlar/page (113).png',
    'books/kirik hayatlar/page (114).png',
    'books/kirik hayatlar/page (115).png',
    'books/kirik hayatlar/page (116).png',
    'books/kirik hayatlar/page (117).png',
    'books/kirik hayatlar/page (118).png',
    'books/kirik hayatlar/page (119).png',
    'books/kirik hayatlar/page (120).png',
    'books/kirik hayatlar/page (121).png',
    'books/kirik hayatlar/page (122).png',
    'books/kirik hayatlar/page (123).png',
    'books/kirik hayatlar/page (124).png',
    'books/kirik hayatlar/page (125).png',
    'books/kirik hayatlar/page (126).png',
    'books/kirik hayatlar/page (127).png',
    'books/kirik hayatlar/page (128).png',
    'books/kirik hayatlar/page (129).png',
    'books/kirik hayatlar/page (130).png',
    'books/kirik hayatlar/page (131).png',
    'books/kirik hayatlar/page (132).png',
    'books/kirik hayatlar/page (133).png',
    'books/kirik hayatlar/page (134).png',
    'books/kirik hayatlar/page (135).png',
    'books/kirik hayatlar/page (136).png',
    'books/kirik hayatlar/page (137).png',
    'books/kirik hayatlar/page (138).png',
    'books/kirik hayatlar/page (139).png',
    'books/kirik hayatlar/page (140).png',
    'books/kirik hayatlar/page (141).png',
    'books/kirik hayatlar/page (142).png',
    'books/kirik hayatlar/page (143).png',
    'books/kirik hayatlar/page (144).png',
    'books/kirik hayatlar/page (145).png',
    'books/kirik hayatlar/page (146).png',
    'books/kirik hayatlar/page (147).png',
    'books/kirik hayatlar/page (148).png',
    'books/kirik hayatlar/page (149).png',
    'books/kirik hayatlar/page (150).png',
    'books/kirik hayatlar/page (151).png',
    'books/kirik hayatlar/page (152).png',
    'books/kirik hayatlar/page (153).png',
    'books/kirik hayatlar/page (154).png',
    'books/kirik hayatlar/page (155).png',
    'books/kirik hayatlar/page (156).png',
    'books/kirik hayatlar/page (157).png',
    'books/kirik hayatlar/page (158).png',
    'books/kirik hayatlar/page (159).png',
    'books/kirik hayatlar/page (160).png',
    'books/kirik hayatlar/page (161).png',
    'books/kirik hayatlar/page (162).png',
    'books/kirik hayatlar/page (163).png',
    'books/kirik hayatlar/page (164).png',
    'books/kirik hayatlar/page (165).png',
    'books/kirik hayatlar/page (166).png',
    'books/kirik hayatlar/page (167).png',
    'books/kirik hayatlar/page (168).png',
    'books/kirik hayatlar/page (169).png',
    'books/kirik hayatlar/page (170).png',
    'books/kirik hayatlar/page (171).png',
    'books/kirik hayatlar/page (172).png',
    'books/kirik hayatlar/page (173).png',
    'books/kirik hayatlar/page (174).png',
    'books/kirik hayatlar/page (175).png',
    'books/kirik hayatlar/page (176).png',
    'books/kirik hayatlar/page (177).png',
    'books/kirik hayatlar/page (178).png',
    'books/kirik hayatlar/page (179).png',
    'books/kirik hayatlar/page (180).png',
    'books/kirik hayatlar/page (181).png',
    'books/kirik hayatlar/page (182).png',
    'books/kirik hayatlar/page (183).png',
    'books/kirik hayatlar/page (184).png',
    'books/kirik hayatlar/page (185).png',
    'books/kirik hayatlar/page (186).png',
    'books/kirik hayatlar/page (187).png',
    'books/kirik hayatlar/page (188).png',
    'books/kirik hayatlar/page (189).png',
    'books/kirik hayatlar/page (190).png',
    'books/kirik hayatlar/page (191).png',
    'books/kirik hayatlar/page (192).png',
    'books/kirik hayatlar/page (193).png',
    'books/kirik hayatlar/page (194).png',
    'books/kirik hayatlar/page (195).png',
    'books/kirik hayatlar/page (196).png',
    'books/kirik hayatlar/page (197).png',
    'books/kirik hayatlar/page (198).png',
    'books/kirik hayatlar/page (199).png',
    'books/kirik hayatlar/page (200).png',
    'books/kirik hayatlar/page (201).png',
    'books/kirik hayatlar/page (202).png',
    'books/kirik hayatlar/page (203).png',
    'books/kirik hayatlar/page (204).png',
    'books/kirik hayatlar/page (205).png',
    'books/kirik hayatlar/page (206).png',
    'books/kirik hayatlar/page (207).png',
    'books/kirik hayatlar/page (208).png',
    'books/kirik hayatlar/page (209).png',
    'books/kirik hayatlar/page (210).png',
    'books/kirik hayatlar/page (211).png',
    'books/kirik hayatlar/page (212).png',
    'books/kirik hayatlar/page (213).png',
    'books/kirik hayatlar/page (214).png',
    'books/kirik hayatlar/page (215).png',
    'books/kirik hayatlar/page (216).png',
    'books/kirik hayatlar/page (217).png',
    'books/kirik hayatlar/page (218).png',
    'books/kirik hayatlar/page (219).png',
    'books/kirik hayatlar/page (220).png',
    'books/kirik hayatlar/page (221).png',
    'books/kirik hayatlar/page (222).png',
    'books/kirik hayatlar/page (223).png',
    'books/kirik hayatlar/page (224).png',
    'books/kirik hayatlar/page (225).png',
    'books/kirik hayatlar/page (226).png',
    'books/kirik hayatlar/page (227).png',
    'books/kirik hayatlar/page (228).png',
    'books/kirik hayatlar/page (229).png',
    'books/kirik hayatlar/page (230).png',
    'books/kirik hayatlar/page (231).png',
    'books/kirik hayatlar/page (232).png',
    'books/kirik hayatlar/page (233).png',
    'books/kirik hayatlar/page (234).png',
    'books/kirik hayatlar/page (235).png',
    'books/kirik hayatlar/page (236).png',
    'books/kirik hayatlar/page (237).png',
    'books/kirik hayatlar/page (238).png',
    'books/kirik hayatlar/page (239).png',
    'books/kirik hayatlar/page (240).png',
    'books/kirik hayatlar/page (241).png',
    'books/kirik hayatlar/page (242).png',
    'books/kirik hayatlar/page (243).png',
    'books/kirik hayatlar/page (244).png',
    'books/kirik hayatlar/page (245).png',
    'books/kirik hayatlar/page (246).png',
    'books/kirik hayatlar/page (247).png',
    'books/kirik hayatlar/page (248).png',
    'books/kirik hayatlar/page (249).png',
    'books/kirik hayatlar/page (250).png',
    'books/kirik hayatlar/page (251).png',
    'books/kirik hayatlar/page (252).png',
    'books/kirik hayatlar/page (253).png',
    'books/kirik hayatlar/page (254).png',
    'books/kirik hayatlar/page (255).png',
    'books/kirik hayatlar/page (256).png',
    'books/kirik hayatlar/page (257).png',
    'books/kirik hayatlar/page (258).png',
    'books/kirik hayatlar/page (259).png',

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
