import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class roderic extends StatefulWidget {
  const roderic({Key? key}) : super(key: key);

  @override
  State<roderic> createState() => _rodericState();
}

class _rodericState extends State<roderic> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/roderic/page (1).png',
    'books/roderic/page (2).png',
    'books/roderic/page (3).png',
    'books/roderic/page (4).png',
    'books/roderic/page (5).png',
    'books/roderic/page (6).png',
    'books/roderic/page (7).png',
    'books/roderic/page (8).png',
    'books/roderic/page (9).png',
    'books/roderic/page (10).png',
    'books/roderic/page (11).png',
    'books/roderic/page (12).png',
    'books/roderic/page (13).png',
    'books/roderic/page (14).png',
    'books/roderic/page (15).png',
    'books/roderic/page (16).png',
    'books/roderic/page (17).png',
    'books/roderic/page (18).png',
    'books/roderic/page (19).png',
    'books/roderic/page (20).png',
    'books/roderic/page (21).png',
    'books/roderic/page (22).png',
    'books/roderic/page (23).png',
    'books/roderic/page (24).png',
    'books/roderic/page (25).png',
    'books/roderic/page (26).png',
    'books/roderic/page (27).png',
    'books/roderic/page (28).png',
    'books/roderic/page (29).png',
    'books/roderic/page (30).png',
    'books/roderic/page (31).png',
    'books/roderic/page (32).png',
    'books/roderic/page (33).png',
    'books/roderic/page (34).png',
    'books/roderic/page (35).png',
    'books/roderic/page (36).png',
    'books/roderic/page (37).png',
    'books/roderic/page (38).png',
    'books/roderic/page (39).png',
    'books/roderic/page (40).png',
    'books/roderic/page (41).png',
    'books/roderic/page (42).png',
    'books/roderic/page (43).png',
    'books/roderic/page (44).png',
    'books/roderic/page (45).png',
    'books/roderic/page (46).png',
    'books/roderic/page (47).png',
    'books/roderic/page (48).png',
    'books/roderic/page (49).png',
    'books/roderic/page (50).png',
    'books/roderic/page (51).png',
    'books/roderic/page (52).png',
    'books/roderic/page (53).png',
    'books/roderic/page (54).png',
    'books/roderic/page (55).png',
    'books/roderic/page (56).png',
    'books/roderic/page (57).png',
    'books/roderic/page (58).png',
    'books/roderic/page (59).png',
    'books/roderic/page (60).png',
    'books/roderic/page (61).png',
    'books/roderic/page (62).png',
    'books/roderic/page (63).png',
    'books/roderic/page (64).png',
    'books/roderic/page (65).png',
    'books/roderic/page (66).png',
    'books/roderic/page (67).png',
    'books/roderic/page (68).png',
    'books/roderic/page (69).png',
    'books/roderic/page (70).png',
    'books/roderic/page (71).png',
    'books/roderic/page (72).png',
    'books/roderic/page (73).png',
    'books/roderic/page (74).png',
    'books/roderic/page (75).png',
    'books/roderic/page (76).png',
    'books/roderic/page (77).png',
    'books/roderic/page (78).png',
    'books/roderic/page (79).png',
    'books/roderic/page (80).png',
    'books/roderic/page (81).png',
    'books/roderic/page (82).png',
    'books/roderic/page (83).png',
    'books/roderic/page (84).png',
    'books/roderic/page (85).png',
    'books/roderic/page (86).png',
    'books/roderic/page (87).png',
    'books/roderic/page (88).png',
    'books/roderic/page (89).png',
    'books/roderic/page (90).png',
    'books/roderic/page (91).png',
    'books/roderic/page (92).png',
    'books/roderic/page (93).png',
    'books/roderic/page (94).png',
    'books/roderic/page (95).png',
    'books/roderic/page (96).png',
    'books/roderic/page (97).png',
    'books/roderic/page (98).png',
    'books/roderic/page (99).png',
    'books/roderic/page (100).png',
    'books/roderic/page (101).png',
    'books/roderic/page (102).png',
    'books/roderic/page (103).png',
    'books/roderic/page (104).png',
    'books/roderic/page (105).png',
    'books/roderic/page (106).png',
    'books/roderic/page (107).png',
    'books/roderic/page (108).png',
    'books/roderic/page (109).png',
    'books/roderic/page (110).png',
    'books/roderic/page (111).png',
    'books/roderic/page (112).png',
    'books/roderic/page (113).png',
    'books/roderic/page (114).png',
    'books/roderic/page (115).png',
    'books/roderic/page (116).png',
    'books/roderic/page (117).png',
    'books/roderic/page (118).png',
    'books/roderic/page (119).png',
    'books/roderic/page (120).png',
    'books/roderic/page (121).png',
    'books/roderic/page (122).png',
    'books/roderic/page (123).png',
    'books/roderic/page (124).png',
    'books/roderic/page (125).png',
    'books/roderic/page (126).png',
    'books/roderic/page (127).png',
    'books/roderic/page (128).png',
    'books/roderic/page (129).png',
    'books/roderic/page (130).png',
    'books/roderic/page (131).png',
    'books/roderic/page (132).png',
    'books/roderic/page (133).png',
    'books/roderic/page (134).png',
    'books/roderic/page (135).png',
    'books/roderic/page (136).png',
    'books/roderic/page (137).png',
    'books/roderic/page (138).png',
    'books/roderic/page (139).png',
    'books/roderic/page (140).png',
    'books/roderic/page (141).png',
    'books/roderic/page (142).png',
    'books/roderic/page (143).png',
    'books/roderic/page (144).png',
    'books/roderic/page (145).png',
    'books/roderic/page (146).png',
    'books/roderic/page (147).png',
    'books/roderic/page (148).png',
    'books/roderic/page (149).png',
    'books/roderic/page (150).png',
    'books/roderic/page (151).png',
    'books/roderic/page (152).png',
    'books/roderic/page (153).png',
    'books/roderic/page (154).png',
    'books/roderic/page (155).png',
    'books/roderic/page (156).png',
    'books/roderic/page (157).png',
    'books/roderic/page (158).png',
    'books/roderic/page (159).png',
    'books/roderic/page (160).png',
    'books/roderic/page (161).png',
    'books/roderic/page (162).png',
    'books/roderic/page (163).png',
    'books/roderic/page (164).png',
    'books/roderic/page (165).png',
    'books/roderic/page (166).png',
    'books/roderic/page (167).png',
    'books/roderic/page (168).png',
    'books/roderic/page (169).png',
    'books/roderic/page (170).png',
    'books/roderic/page (171).png',
    'books/roderic/page (172).png',
    'books/roderic/page (173).png',
    'books/roderic/page (174).png',
    'books/roderic/page (175).png',
    'books/roderic/page (176).png',
    'books/roderic/page (177).png',
    'books/roderic/page (178).png',
    'books/roderic/page (179).png',
    'books/roderic/page (180).png',
    'books/roderic/page (181).png',
    'books/roderic/page (182).png',
    'books/roderic/page (183).png',
    'books/roderic/page (184).png',
    'books/roderic/page (185).png',
    'books/roderic/page (186).png',
    'books/roderic/page (187).png',
    'books/roderic/page (188).png',
    'books/roderic/page (189).png',
    'books/roderic/page (190).png',
    'books/roderic/page (191).png',
    'books/roderic/page (192).png',
    'books/roderic/page (193).png',
    'books/roderic/page (194).png',
    'books/roderic/page (195).png',
    'books/roderic/page (196).png',
    'books/roderic/page (197).png',
    'books/roderic/page (198).png',
    'books/roderic/page (199).png',
    'books/roderic/page (200).png',
    'books/roderic/page (201).png',
    'books/roderic/page (202).png',
    'books/roderic/page (203).png',
    'books/roderic/page (204).png',
    'books/roderic/page (205).png',
    'books/roderic/page (206).png',
    'books/roderic/page (207).png',
    'books/roderic/page (208).png',
    'books/roderic/page (209).png',
    'books/roderic/page (210).png',
    'books/roderic/page (211).png',
    'books/roderic/page (212).png',
    'books/roderic/page (213).png',
    'books/roderic/page (214).png',
    'books/roderic/page (215).png',
    'books/roderic/page (216).png',
    'books/roderic/page (217).png',
    'books/roderic/page (218).png',
    'books/roderic/page (219).png',
    'books/roderic/page (220).png',
    'books/roderic/page (221).png',
    'books/roderic/page (222).png',
    'books/roderic/page (223).png',
    'books/roderic/page (224).png',
    'books/roderic/page (225).png',
    'books/roderic/page (226).png',
    'books/roderic/page (227).png',
    'books/roderic/page (228).png',
    'books/roderic/page (229).png',
    'books/roderic/page (230).png',
    'books/roderic/page (231).png',
    'books/roderic/page (232).png',
    'books/roderic/page (233).png',
    'books/roderic/page (234).png',
    'books/roderic/page (235).png',
    'books/roderic/page (236).png',
    'books/roderic/page (237).png',
    'books/roderic/page (238).png',
    'books/roderic/page (239).png',
    'books/roderic/page (240).png',
    'books/roderic/page (241).png',
    'books/roderic/page (242).png',
    'books/roderic/page (243).png',
    'books/roderic/page (244).png',
    'books/roderic/page (245).png',
    'books/roderic/page (246).png',
    'books/roderic/page (247).png',
    'books/roderic/page (248).png',
    'books/roderic/page (249).png',
    'books/roderic/page (250).png',
    'books/roderic/page (251).png',
    'books/roderic/page (252).png',
    'books/roderic/page (253).png',

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
