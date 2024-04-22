import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class yasadigimgibi extends StatefulWidget {
  const yasadigimgibi({Key? key}) : super(key: key);

  @override
  State<yasadigimgibi> createState() => _yasadigimgibiState();
}

class _yasadigimgibiState extends State<yasadigimgibi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/yasadigim gibi/page (1).png',
    'books/yasadigim gibi/page (2).png',
    'books/yasadigim gibi/page (3).png',
    'books/yasadigim gibi/page (4).png',
    'books/yasadigim gibi/page (5).png',
    'books/yasadigim gibi/page (6).png',
    'books/yasadigim gibi/page (7).png',
    'books/yasadigim gibi/page (8).png',
    'books/yasadigim gibi/page (9).png',
    'books/yasadigim gibi/page (10).png',
    'books/yasadigim gibi/page (11).png',
    'books/yasadigim gibi/page (12).png',
    'books/yasadigim gibi/page (13).png',
    'books/yasadigim gibi/page (14).png',
    'books/yasadigim gibi/page (15).png',
    'books/yasadigim gibi/page (16).png',
    'books/yasadigim gibi/page (17).png',
    'books/yasadigim gibi/page (18).png',
    'books/yasadigim gibi/page (19).png',
    'books/yasadigim gibi/page (20).png',
    'books/yasadigim gibi/page (21).png',
    'books/yasadigim gibi/page (22).png',
    'books/yasadigim gibi/page (23).png',
    'books/yasadigim gibi/page (24).png',
    'books/yasadigim gibi/page (25).png',
    'books/yasadigim gibi/page (26).png',
    'books/yasadigim gibi/page (27).png',
    'books/yasadigim gibi/page (28).png',
    'books/yasadigim gibi/page (29).png',
    'books/yasadigim gibi/page (30).png',
    'books/yasadigim gibi/page (31).png',
    'books/yasadigim gibi/page (32).png',
    'books/yasadigim gibi/page (33).png',
    'books/yasadigim gibi/page (34).png',
    'books/yasadigim gibi/page (35).png',
    'books/yasadigim gibi/page (36).png',
    'books/yasadigim gibi/page (37).png',
    'books/yasadigim gibi/page (38).png',
    'books/yasadigim gibi/page (39).png',
    'books/yasadigim gibi/page (40).png',
    'books/yasadigim gibi/page (41).png',
    'books/yasadigim gibi/page (42).png',
    'books/yasadigim gibi/page (43).png',
    'books/yasadigim gibi/page (44).png',
    'books/yasadigim gibi/page (45).png',
    'books/yasadigim gibi/page (46).png',
    'books/yasadigim gibi/page (47).png',
    'books/yasadigim gibi/page (48).png',
    'books/yasadigim gibi/page (49).png',
    'books/yasadigim gibi/page (50).png',
    'books/yasadigim gibi/page (51).png',
    'books/yasadigim gibi/page (52).png',
    'books/yasadigim gibi/page (53).png',
    'books/yasadigim gibi/page (54).png',
    'books/yasadigim gibi/page (55).png',
    'books/yasadigim gibi/page (56).png',
    'books/yasadigim gibi/page (57).png',
    'books/yasadigim gibi/page (58).png',
    'books/yasadigim gibi/page (59).png',
    'books/yasadigim gibi/page (60).png',
    'books/yasadigim gibi/page (61).png',
    'books/yasadigim gibi/page (62).png',
    'books/yasadigim gibi/page (63).png',
    'books/yasadigim gibi/page (64).png',
    'books/yasadigim gibi/page (65).png',
    'books/yasadigim gibi/page (66).png',
    'books/yasadigim gibi/page (67).png',
    'books/yasadigim gibi/page (68).png',
    'books/yasadigim gibi/page (69).png',
    'books/yasadigim gibi/page (70).png',
    'books/yasadigim gibi/page (71).png',
    'books/yasadigim gibi/page (72).png',
    'books/yasadigim gibi/page (73).png',
    'books/yasadigim gibi/page (74).png',
    'books/yasadigim gibi/page (75).png',
    'books/yasadigim gibi/page (76).png',
    'books/yasadigim gibi/page (77).png',
    'books/yasadigim gibi/page (78).png',
    'books/yasadigim gibi/page (79).png',
    'books/yasadigim gibi/page (80).png',
    'books/yasadigim gibi/page (81).png',
    'books/yasadigim gibi/page (82).png',
    'books/yasadigim gibi/page (83).png',
    'books/yasadigim gibi/page (84).png',
    'books/yasadigim gibi/page (85).png',
    'books/yasadigim gibi/page (86).png',
    'books/yasadigim gibi/page (87).png',
    'books/yasadigim gibi/page (88).png',
    'books/yasadigim gibi/page (89).png',
    'books/yasadigim gibi/page (90).png',
    'books/yasadigim gibi/page (91).png',
    'books/yasadigim gibi/page (92).png',
    'books/yasadigim gibi/page (93).png',
    'books/yasadigim gibi/page (94).png',
    'books/yasadigim gibi/page (95).png',
    'books/yasadigim gibi/page (96).png',
    'books/yasadigim gibi/page (97).png',
    'books/yasadigim gibi/page (98).png',
    'books/yasadigim gibi/page (99).png',
    'books/yasadigim gibi/page (100).png',
    'books/yasadigim gibi/page (101).png',
    'books/yasadigim gibi/page (102).png',
    'books/yasadigim gibi/page (103).png',
    'books/yasadigim gibi/page (104).png',
    'books/yasadigim gibi/page (105).png',
    'books/yasadigim gibi/page (106).png',
    'books/yasadigim gibi/page (107).png',
    'books/yasadigim gibi/page (108).png',
    'books/yasadigim gibi/page (109).png',
    'books/yasadigim gibi/page (110).png',
    'books/yasadigim gibi/page (111).png',
    'books/yasadigim gibi/page (112).png',
    'books/yasadigim gibi/page (113).png',
    'books/yasadigim gibi/page (114).png',
    'books/yasadigim gibi/page (115).png',
    'books/yasadigim gibi/page (116).png',
    'books/yasadigim gibi/page (117).png',
    'books/yasadigim gibi/page (118).png',
    'books/yasadigim gibi/page (119).png',
    'books/yasadigim gibi/page (120).png',
    'books/yasadigim gibi/page (121).png',
    'books/yasadigim gibi/page (122).png',
    'books/yasadigim gibi/page (123).png',
    'books/yasadigim gibi/page (124).png',
    'books/yasadigim gibi/page (125).png',
    'books/yasadigim gibi/page (126).png',
    'books/yasadigim gibi/page (127).png',
    'books/yasadigim gibi/page (128).png',
    'books/yasadigim gibi/page (129).png',
    'books/yasadigim gibi/page (130).png',
    'books/yasadigim gibi/page (131).png',
    'books/yasadigim gibi/page (132).png',
    'books/yasadigim gibi/page (133).png',
    'books/yasadigim gibi/page (134).png',
    'books/yasadigim gibi/page (135).png',
    'books/yasadigim gibi/page (136).png',
    'books/yasadigim gibi/page (137).png',
    'books/yasadigim gibi/page (138).png',
    'books/yasadigim gibi/page (139).png',
    'books/yasadigim gibi/page (140).png',
    'books/yasadigim gibi/page (141).png',
    'books/yasadigim gibi/page (142).png',
    'books/yasadigim gibi/page (143).png',
    'books/yasadigim gibi/page (144).png',
    'books/yasadigim gibi/page (145).png',
    'books/yasadigim gibi/page (146).png',
    'books/yasadigim gibi/page (147).png',
    'books/yasadigim gibi/page (148).png',
    'books/yasadigim gibi/page (149).png',
    'books/yasadigim gibi/page (150).png',
    'books/yasadigim gibi/page (151).png',
    'books/yasadigim gibi/page (152).png',
    'books/yasadigim gibi/page (153).png',
    'books/yasadigim gibi/page (154).png',
    'books/yasadigim gibi/page (155).png',
    'books/yasadigim gibi/page (156).png',
    'books/yasadigim gibi/page (157).png',
    'books/yasadigim gibi/page (158).png',
    'books/yasadigim gibi/page (159).png',
    'books/yasadigim gibi/page (160).png',
    'books/yasadigim gibi/page (161).png',
    'books/yasadigim gibi/page (162).png',
    'books/yasadigim gibi/page (163).png',
    'books/yasadigim gibi/page (164).png',
    'books/yasadigim gibi/page (165).png',
    'books/yasadigim gibi/page (166).png',
    'books/yasadigim gibi/page (167).png',
    'books/yasadigim gibi/page (168).png',
    'books/yasadigim gibi/page (169).png',
    'books/yasadigim gibi/page (170).png',
    'books/yasadigim gibi/page (171).png',
    'books/yasadigim gibi/page (172).png',
    'books/yasadigim gibi/page (173).png',
    'books/yasadigim gibi/page (174).png',
    'books/yasadigim gibi/page (175).png',
    'books/yasadigim gibi/page (176).png',
    'books/yasadigim gibi/page (177).png',
    'books/yasadigim gibi/page (178).png',
    'books/yasadigim gibi/page (179).png',
    'books/yasadigim gibi/page (180).png',
    'books/yasadigim gibi/page (181).png',
    'books/yasadigim gibi/page (182).png',
    'books/yasadigim gibi/page (183).png',
    'books/yasadigim gibi/page (184).png',
    'books/yasadigim gibi/page (185).png',
    'books/yasadigim gibi/page (186).png',
    'books/yasadigim gibi/page (187).png',
    'books/yasadigim gibi/page (188).png',
    'books/yasadigim gibi/page (189).png',
    'books/yasadigim gibi/page (190).png',
    'books/yasadigim gibi/page (191).png',
    'books/yasadigim gibi/page (192).png',
    'books/yasadigim gibi/page (193).png',
    'books/yasadigim gibi/page (194).png',
    'books/yasadigim gibi/page (195).png',
    'books/yasadigim gibi/page (196).png',
    'books/yasadigim gibi/page (197).png',
    'books/yasadigim gibi/page (198).png',
    'books/yasadigim gibi/page (199).png',
    'books/yasadigim gibi/page (200).png',
    'books/yasadigim gibi/page (201).png',
    'books/yasadigim gibi/page (202).png',
    'books/yasadigim gibi/page (203).png',
    'books/yasadigim gibi/page (204).png',
    'books/yasadigim gibi/page (205).png',
    'books/yasadigim gibi/page (206).png',
    'books/yasadigim gibi/page (207).png',
    'books/yasadigim gibi/page (208).png',
    'books/yasadigim gibi/page (209).png',
    'books/yasadigim gibi/page (210).png',
    'books/yasadigim gibi/page (211).png',
    'books/yasadigim gibi/page (212).png',
    'books/yasadigim gibi/page (213).png',
    'books/yasadigim gibi/page (214).png',
    'books/yasadigim gibi/page (215).png',
    'books/yasadigim gibi/page (216).png',
    'books/yasadigim gibi/page (217).png',
    'books/yasadigim gibi/page (218).png',
    'books/yasadigim gibi/page (219).png',
    'books/yasadigim gibi/page (220).png',
    'books/yasadigim gibi/page (221).png',
    'books/yasadigim gibi/page (222).png',
    'books/yasadigim gibi/page (223).png',
    'books/yasadigim gibi/page (224).png',
    'books/yasadigim gibi/page (225).png',
    'books/yasadigim gibi/page (226).png',
    'books/yasadigim gibi/page (227).png',
    'books/yasadigim gibi/page (228).png',
    'books/yasadigim gibi/page (229).png',
    'books/yasadigim gibi/page (230).png',
    'books/yasadigim gibi/page (231).png',
    'books/yasadigim gibi/page (232).png',
    'books/yasadigim gibi/page (233).png',
    'books/yasadigim gibi/page (234).png',
    'books/yasadigim gibi/page (235).png',
    'books/yasadigim gibi/page (236).png',
    'books/yasadigim gibi/page (237).png',
    'books/yasadigim gibi/page (238).png',
    'books/yasadigim gibi/page (239).png',
    'books/yasadigim gibi/page (240).png',
    'books/yasadigim gibi/page (241).png',
    'books/yasadigim gibi/page (242).png',
    'books/yasadigim gibi/page (243).png',
    'books/yasadigim gibi/page (244).png',
    'books/yasadigim gibi/page (245).png',
    'books/yasadigim gibi/page (246).png',
    'books/yasadigim gibi/page (247).png',
    'books/yasadigim gibi/page (248).png',
    'books/yasadigim gibi/page (249).png',
    'books/yasadigim gibi/page (250).png',
    'books/yasadigim gibi/page (251).png',
    'books/yasadigim gibi/page (252).png',

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
