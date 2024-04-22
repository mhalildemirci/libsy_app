import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sleeperawakes extends StatefulWidget {
  const sleeperawakes({Key? key}) : super(key: key);

  @override
  State<sleeperawakes> createState() => _sleeperawakesState();
}

class _sleeperawakesState extends State<sleeperawakes> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sleeper awakes/page (1).png',
    'books/sleeper awakes/page (2).png',
    'books/sleeper awakes/page (3).png',
    'books/sleeper awakes/page (4).png',
    'books/sleeper awakes/page (5).png',
    'books/sleeper awakes/page (6).png',
    'books/sleeper awakes/page (7).png',
    'books/sleeper awakes/page (8).png',
    'books/sleeper awakes/page (9).png',
    'books/sleeper awakes/page (10).png',
    'books/sleeper awakes/page (11).png',
    'books/sleeper awakes/page (12).png',
    'books/sleeper awakes/page (13).png',
    'books/sleeper awakes/page (14).png',
    'books/sleeper awakes/page (15).png',
    'books/sleeper awakes/page (16).png',
    'books/sleeper awakes/page (17).png',
    'books/sleeper awakes/page (18).png',
    'books/sleeper awakes/page (19).png',
    'books/sleeper awakes/page (20).png',
    'books/sleeper awakes/page (21).png',
    'books/sleeper awakes/page (22).png',
    'books/sleeper awakes/page (23).png',
    'books/sleeper awakes/page (24).png',
    'books/sleeper awakes/page (25).png',
    'books/sleeper awakes/page (26).png',
    'books/sleeper awakes/page (27).png',
    'books/sleeper awakes/page (28).png',
    'books/sleeper awakes/page (29).png',
    'books/sleeper awakes/page (30).png',
    'books/sleeper awakes/page (31).png',
    'books/sleeper awakes/page (32).png',
    'books/sleeper awakes/page (33).png',
    'books/sleeper awakes/page (34).png',
    'books/sleeper awakes/page (35).png',
    'books/sleeper awakes/page (36).png',
    'books/sleeper awakes/page (37).png',
    'books/sleeper awakes/page (38).png',
    'books/sleeper awakes/page (39).png',
    'books/sleeper awakes/page (40).png',
    'books/sleeper awakes/page (41).png',
    'books/sleeper awakes/page (42).png',
    'books/sleeper awakes/page (43).png',
    'books/sleeper awakes/page (44).png',
    'books/sleeper awakes/page (45).png',
    'books/sleeper awakes/page (46).png',
    'books/sleeper awakes/page (47).png',
    'books/sleeper awakes/page (48).png',
    'books/sleeper awakes/page (49).png',
    'books/sleeper awakes/page (50).png',
    'books/sleeper awakes/page (51).png',
    'books/sleeper awakes/page (52).png',
    'books/sleeper awakes/page (53).png',
    'books/sleeper awakes/page (54).png',
    'books/sleeper awakes/page (55).png',
    'books/sleeper awakes/page (56).png',
    'books/sleeper awakes/page (57).png',
    'books/sleeper awakes/page (58).png',
    'books/sleeper awakes/page (59).png',
    'books/sleeper awakes/page (60).png',
    'books/sleeper awakes/page (61).png',
    'books/sleeper awakes/page (62).png',
    'books/sleeper awakes/page (63).png',
    'books/sleeper awakes/page (64).png',
    'books/sleeper awakes/page (65).png',
    'books/sleeper awakes/page (66).png',
    'books/sleeper awakes/page (67).png',
    'books/sleeper awakes/page (68).png',
    'books/sleeper awakes/page (69).png',
    'books/sleeper awakes/page (70).png',
    'books/sleeper awakes/page (71).png',
    'books/sleeper awakes/page (72).png',
    'books/sleeper awakes/page (73).png',
    'books/sleeper awakes/page (74).png',
    'books/sleeper awakes/page (75).png',
    'books/sleeper awakes/page (76).png',
    'books/sleeper awakes/page (77).png',
    'books/sleeper awakes/page (78).png',
    'books/sleeper awakes/page (79).png',
    'books/sleeper awakes/page (80).png',
    'books/sleeper awakes/page (81).png',
    'books/sleeper awakes/page (82).png',
    'books/sleeper awakes/page (83).png',
    'books/sleeper awakes/page (84).png',
    'books/sleeper awakes/page (85).png',
    'books/sleeper awakes/page (86).png',
    'books/sleeper awakes/page (87).png',
    'books/sleeper awakes/page (88).png',
    'books/sleeper awakes/page (89).png',
    'books/sleeper awakes/page (90).png',
    'books/sleeper awakes/page (91).png',
    'books/sleeper awakes/page (92).png',
    'books/sleeper awakes/page (93).png',
    'books/sleeper awakes/page (94).png',
    'books/sleeper awakes/page (95).png',
    'books/sleeper awakes/page (96).png',
    'books/sleeper awakes/page (97).png',
    'books/sleeper awakes/page (98).png',
    'books/sleeper awakes/page (99).png',
    'books/sleeper awakes/page (100).png',
    'books/sleeper awakes/page (101).png',
    'books/sleeper awakes/page (102).png',
    'books/sleeper awakes/page (103).png',
    'books/sleeper awakes/page (104).png',
    'books/sleeper awakes/page (105).png',
    'books/sleeper awakes/page (106).png',
    'books/sleeper awakes/page (107).png',
    'books/sleeper awakes/page (108).png',
    'books/sleeper awakes/page (109).png',
    'books/sleeper awakes/page (110).png',
    'books/sleeper awakes/page (111).png',
    'books/sleeper awakes/page (112).png',
    'books/sleeper awakes/page (113).png',
    'books/sleeper awakes/page (114).png',
    'books/sleeper awakes/page (115).png',
    'books/sleeper awakes/page (116).png',
    'books/sleeper awakes/page (117).png',
    'books/sleeper awakes/page (118).png',
    'books/sleeper awakes/page (119).png',
    'books/sleeper awakes/page (120).png',
    'books/sleeper awakes/page (121).png',
    'books/sleeper awakes/page (122).png',
    'books/sleeper awakes/page (123).png',
    'books/sleeper awakes/page (124).png',
    'books/sleeper awakes/page (125).png',
    'books/sleeper awakes/page (126).png',
    'books/sleeper awakes/page (127).png',
    'books/sleeper awakes/page (128).png',
    'books/sleeper awakes/page (129).png',
    'books/sleeper awakes/page (130).png',
    'books/sleeper awakes/page (131).png',
    'books/sleeper awakes/page (132).png',
    'books/sleeper awakes/page (133).png',
    'books/sleeper awakes/page (134).png',
    'books/sleeper awakes/page (135).png',
    'books/sleeper awakes/page (136).png',
    'books/sleeper awakes/page (137).png',
    'books/sleeper awakes/page (138).png',
    'books/sleeper awakes/page (139).png',
    'books/sleeper awakes/page (140).png',
    'books/sleeper awakes/page (141).png',
    'books/sleeper awakes/page (142).png',
    'books/sleeper awakes/page (143).png',
    'books/sleeper awakes/page (144).png',
    'books/sleeper awakes/page (145).png',
    'books/sleeper awakes/page (146).png',
    'books/sleeper awakes/page (147).png',
    'books/sleeper awakes/page (148).png',
    'books/sleeper awakes/page (149).png',
    'books/sleeper awakes/page (150).png',
    'books/sleeper awakes/page (151).png',
    'books/sleeper awakes/page (152).png',
    'books/sleeper awakes/page (153).png',
    'books/sleeper awakes/page (154).png',
    'books/sleeper awakes/page (155).png',
    'books/sleeper awakes/page (156).png',
    'books/sleeper awakes/page (157).png',
    'books/sleeper awakes/page (158).png',
    'books/sleeper awakes/page (159).png',
    'books/sleeper awakes/page (160).png',
    'books/sleeper awakes/page (161).png',
    'books/sleeper awakes/page (162).png',
    'books/sleeper awakes/page (163).png',
    'books/sleeper awakes/page (164).png',
    'books/sleeper awakes/page (165).png',
    'books/sleeper awakes/page (166).png',
    'books/sleeper awakes/page (167).png',
    'books/sleeper awakes/page (168).png',
    'books/sleeper awakes/page (169).png',
    'books/sleeper awakes/page (170).png',
    'books/sleeper awakes/page (171).png',
    'books/sleeper awakes/page (172).png',
    'books/sleeper awakes/page (173).png',
    'books/sleeper awakes/page (174).png',
    'books/sleeper awakes/page (175).png',
    'books/sleeper awakes/page (176).png',
    'books/sleeper awakes/page (177).png',
    'books/sleeper awakes/page (178).png',
    'books/sleeper awakes/page (179).png',
    'books/sleeper awakes/page (180).png',
    'books/sleeper awakes/page (181).png',
    'books/sleeper awakes/page (182).png',
    'books/sleeper awakes/page (183).png',
    'books/sleeper awakes/page (184).png',
    'books/sleeper awakes/page (185).png',
    'books/sleeper awakes/page (186).png',
    'books/sleeper awakes/page (187).png',
    'books/sleeper awakes/page (188).png',
    'books/sleeper awakes/page (189).png',
    'books/sleeper awakes/page (190).png',
    'books/sleeper awakes/page (191).png',
    'books/sleeper awakes/page (192).png',
    'books/sleeper awakes/page (193).png',
    'books/sleeper awakes/page (194).png',
    'books/sleeper awakes/page (195).png',
    'books/sleeper awakes/page (196).png',
    'books/sleeper awakes/page (197).png',
    'books/sleeper awakes/page (198).png',
    'books/sleeper awakes/page (199).png',
    'books/sleeper awakes/page (200).png',
    'books/sleeper awakes/page (201).png',
    'books/sleeper awakes/page (202).png',
    'books/sleeper awakes/page (203).png',
    'books/sleeper awakes/page (204).png',
    'books/sleeper awakes/page (205).png',
    'books/sleeper awakes/page (206).png',
    'books/sleeper awakes/page (207).png',
    'books/sleeper awakes/page (208).png',
    'books/sleeper awakes/page (209).png',
    'books/sleeper awakes/page (210).png',
    'books/sleeper awakes/page (211).png',
    'books/sleeper awakes/page (212).png',
    'books/sleeper awakes/page (213).png',
    'books/sleeper awakes/page (214).png',
    'books/sleeper awakes/page (215).png',
    'books/sleeper awakes/page (216).png',
    'books/sleeper awakes/page (217).png',
    'books/sleeper awakes/page (218).png',
    'books/sleeper awakes/page (219).png',
    'books/sleeper awakes/page (220).png',
    'books/sleeper awakes/page (221).png',
    'books/sleeper awakes/page (222).png',
    'books/sleeper awakes/page (223).png',
    'books/sleeper awakes/page (224).png',
    'books/sleeper awakes/page (225).png',
    'books/sleeper awakes/page (226).png',
    'books/sleeper awakes/page (227).png',
    'books/sleeper awakes/page (228).png',
    'books/sleeper awakes/page (229).png',

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
