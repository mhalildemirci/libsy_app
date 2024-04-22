import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class warworlds extends StatefulWidget {
  const warworlds({Key? key}) : super(key: key);

  @override
  State<warworlds> createState() => _warworldsState();
}

class _warworldsState extends State<warworlds> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/war worlds/page (1).png',
    'books/war worlds/page (2).png',
    'books/war worlds/page (3).png',
    'books/war worlds/page (4).png',
    'books/war worlds/page (5).png',
    'books/war worlds/page (6).png',
    'books/war worlds/page (7).png',
    'books/war worlds/page (8).png',
    'books/war worlds/page (9).png',
    'books/war worlds/page (10).png',
    'books/war worlds/page (11).png',
    'books/war worlds/page (12).png',
    'books/war worlds/page (13).png',
    'books/war worlds/page (14).png',
    'books/war worlds/page (15).png',
    'books/war worlds/page (16).png',
    'books/war worlds/page (17).png',
    'books/war worlds/page (18).png',
    'books/war worlds/page (19).png',
    'books/war worlds/page (20).png',
    'books/war worlds/page (21).png',
    'books/war worlds/page (22).png',
    'books/war worlds/page (23).png',
    'books/war worlds/page (24).png',
    'books/war worlds/page (25).png',
    'books/war worlds/page (26).png',
    'books/war worlds/page (27).png',
    'books/war worlds/page (28).png',
    'books/war worlds/page (29).png',
    'books/war worlds/page (30).png',
    'books/war worlds/page (31).png',
    'books/war worlds/page (32).png',
    'books/war worlds/page (33).png',
    'books/war worlds/page (34).png',
    'books/war worlds/page (35).png',
    'books/war worlds/page (36).png',
    'books/war worlds/page (37).png',
    'books/war worlds/page (38).png',
    'books/war worlds/page (39).png',
    'books/war worlds/page (40).png',
    'books/war worlds/page (41).png',
    'books/war worlds/page (42).png',
    'books/war worlds/page (43).png',
    'books/war worlds/page (44).png',
    'books/war worlds/page (45).png',
    'books/war worlds/page (46).png',
    'books/war worlds/page (47).png',
    'books/war worlds/page (48).png',
    'books/war worlds/page (49).png',
    'books/war worlds/page (50).png',
    'books/war worlds/page (51).png',
    'books/war worlds/page (52).png',
    'books/war worlds/page (53).png',
    'books/war worlds/page (54).png',
    'books/war worlds/page (55).png',
    'books/war worlds/page (56).png',
    'books/war worlds/page (57).png',
    'books/war worlds/page (58).png',
    'books/war worlds/page (59).png',
    'books/war worlds/page (60).png',
    'books/war worlds/page (61).png',
    'books/war worlds/page (62).png',
    'books/war worlds/page (63).png',
    'books/war worlds/page (64).png',
    'books/war worlds/page (65).png',
    'books/war worlds/page (66).png',
    'books/war worlds/page (67).png',
    'books/war worlds/page (68).png',
    'books/war worlds/page (69).png',
    'books/war worlds/page (70).png',
    'books/war worlds/page (71).png',
    'books/war worlds/page (72).png',
    'books/war worlds/page (73).png',
    'books/war worlds/page (74).png',
    'books/war worlds/page (75).png',
    'books/war worlds/page (76).png',
    'books/war worlds/page (77).png',
    'books/war worlds/page (78).png',
    'books/war worlds/page (79).png',
    'books/war worlds/page (80).png',
    'books/war worlds/page (81).png',
    'books/war worlds/page (82).png',
    'books/war worlds/page (83).png',
    'books/war worlds/page (84).png',
    'books/war worlds/page (85).png',
    'books/war worlds/page (86).png',
    'books/war worlds/page (87).png',
    'books/war worlds/page (88).png',
    'books/war worlds/page (89).png',
    'books/war worlds/page (90).png',
    'books/war worlds/page (91).png',
    'books/war worlds/page (92).png',
    'books/war worlds/page (93).png',
    'books/war worlds/page (94).png',
    'books/war worlds/page (95).png',
    'books/war worlds/page (96).png',
    'books/war worlds/page (97).png',
    'books/war worlds/page (98).png',
    'books/war worlds/page (99).png',
    'books/war worlds/page (100).png',
    'books/war worlds/page (101).png',
    'books/war worlds/page (102).png',
    'books/war worlds/page (103).png',
    'books/war worlds/page (104).png',
    'books/war worlds/page (105).png',
    'books/war worlds/page (106).png',
    'books/war worlds/page (107).png',
    'books/war worlds/page (108).png',
    'books/war worlds/page (109).png',
    'books/war worlds/page (110).png',
    'books/war worlds/page (111).png',
    'books/war worlds/page (112).png',
    'books/war worlds/page (113).png',
    'books/war worlds/page (114).png',
    'books/war worlds/page (115).png',
    'books/war worlds/page (116).png',
    'books/war worlds/page (117).png',
    'books/war worlds/page (118).png',
    'books/war worlds/page (119).png',
    'books/war worlds/page (120).png',
    'books/war worlds/page (121).png',
    'books/war worlds/page (122).png',
    'books/war worlds/page (123).png',
    'books/war worlds/page (124).png',
    'books/war worlds/page (125).png',
    'books/war worlds/page (126).png',
    'books/war worlds/page (127).png',
    'books/war worlds/page (128).png',
    'books/war worlds/page (129).png',
    'books/war worlds/page (130).png',
    'books/war worlds/page (131).png',
    'books/war worlds/page (132).png',
    'books/war worlds/page (133).png',
    'books/war worlds/page (134).png',
    'books/war worlds/page (135).png',
    'books/war worlds/page (136).png',
    'books/war worlds/page (137).png',
    'books/war worlds/page (138).png',
    'books/war worlds/page (139).png',
    'books/war worlds/page (140).png',
    'books/war worlds/page (141).png',
    'books/war worlds/page (142).png',
    'books/war worlds/page (143).png',
    'books/war worlds/page (144).png',
    'books/war worlds/page (145).png',
    'books/war worlds/page (146).png',
    'books/war worlds/page (147).png',
    'books/war worlds/page (148).png',
    'books/war worlds/page (149).png',
    'books/war worlds/page (150).png',
    'books/war worlds/page (151).png',
    'books/war worlds/page (152).png',
    'books/war worlds/page (153).png',
    'books/war worlds/page (154).png',
    'books/war worlds/page (155).png',
    'books/war worlds/page (156).png',
    'books/war worlds/page (157).png',
    'books/war worlds/page (158).png',
    'books/war worlds/page (159).png',
    'books/war worlds/page (160).png',
    'books/war worlds/page (161).png',
    'books/war worlds/page (162).png',
    'books/war worlds/page (163).png',
    'books/war worlds/page (164).png',
    'books/war worlds/page (165).png',
    'books/war worlds/page (166).png',
    'books/war worlds/page (167).png',
    'books/war worlds/page (168).png',
    'books/war worlds/page (169).png',
    'books/war worlds/page (170).png',
    'books/war worlds/page (171).png',
    'books/war worlds/page (172).png',
    'books/war worlds/page (173).png',
    'books/war worlds/page (174).png',
    'books/war worlds/page (175).png',
    'books/war worlds/page (176).png',
    'books/war worlds/page (177).png',
    'books/war worlds/page (178).png',
    'books/war worlds/page (179).png',
    'books/war worlds/page (180).png',
    'books/war worlds/page (181).png',
    'books/war worlds/page (182).png',
    'books/war worlds/page (183).png',
    'books/war worlds/page (184).png',
    'books/war worlds/page (185).png',
    'books/war worlds/page (186).png',
    'books/war worlds/page (187).png',
    'books/war worlds/page (188).png',
    'books/war worlds/page (189).png',
    'books/war worlds/page (190).png',
    'books/war worlds/page (191).png',
    'books/war worlds/page (192).png',
    'books/war worlds/page (193).png',
    'books/war worlds/page (194).png',
    'books/war worlds/page (195).png',
    'books/war worlds/page (196).png',
    'books/war worlds/page (197).png',
    'books/war worlds/page (198).png',
    'books/war worlds/page (199).png',
    'books/war worlds/page (200).png',
    'books/war worlds/page (201).png',
    'books/war worlds/page (202).png',
    'books/war worlds/page (203).png',
    'books/war worlds/page (204).png',
    'books/war worlds/page (205).png',
    'books/war worlds/page (206).png',
    'books/war worlds/page (207).png',
    'books/war worlds/page (208).png',
    'books/war worlds/page (209).png',
    'books/war worlds/page (210).png',
    'books/war worlds/page (211).png',
    'books/war worlds/page (212).png',
    'books/war worlds/page (213).png',
    'books/war worlds/page (214).png',
    'books/war worlds/page (215).png',
    'books/war worlds/page (216).png',
    'books/war worlds/page (217).png',
    'books/war worlds/page (218).png',
    'books/war worlds/page (219).png',
    'books/war worlds/page (220).png',
    'books/war worlds/page (221).png',
    'books/war worlds/page (222).png',
    'books/war worlds/page (223).png',
    'books/war worlds/page (224).png',
    'books/war worlds/page (225).png',
    'books/war worlds/page (226).png',
    'books/war worlds/page (227).png',
    'books/war worlds/page (228).png',
    'books/war worlds/page (229).png',
    'books/war worlds/page (230).png',
    'books/war worlds/page (231).png',
    'books/war worlds/page (232).png',
    'books/war worlds/page (233).png',
    'books/war worlds/page (234).png',
    'books/war worlds/page (235).png',
    'books/war worlds/page (236).png',
    'books/war worlds/page (237).png',
    'books/war worlds/page (238).png',
    'books/war worlds/page (239).png',
    'books/war worlds/page (240).png',
    'books/war worlds/page (241).png',
    'books/war worlds/page (242).png',
    'books/war worlds/page (243).png',
    'books/war worlds/page (244).png',
    'books/war worlds/page (245).png',
    'books/war worlds/page (246).png',
    'books/war worlds/page (247).png',
    'books/war worlds/page (248).png',
    'books/war worlds/page (249).png',
    'books/war worlds/page (250).png',
    'books/war worlds/page (251).png',
    'books/war worlds/page (252).png',
    'books/war worlds/page (253).png',
    'books/war worlds/page (254).png',
    'books/war worlds/page (255).png',
    'books/war worlds/page (256).png',
    'books/war worlds/page (257).png',
    'books/war worlds/page (258).png',
    'books/war worlds/page (259).png',

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
