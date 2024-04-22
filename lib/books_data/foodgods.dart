import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class foodgods extends StatefulWidget {
  const foodgods({Key? key}) : super(key: key);

  @override
  State<foodgods> createState() => _foodgodsState();
}

class _foodgodsState extends State<foodgods> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/food gods/page (1).png',
    'books/food gods/page (2).png',
    'books/food gods/page (3).png',
    'books/food gods/page (4).png',
    'books/food gods/page (5).png',
    'books/food gods/page (6).png',
    'books/food gods/page (7).png',
    'books/food gods/page (8).png',
    'books/food gods/page (9).png',
    'books/food gods/page (10).png',
    'books/food gods/page (11).png',
    'books/food gods/page (12).png',
    'books/food gods/page (13).png',
    'books/food gods/page (14).png',
    'books/food gods/page (15).png',
    'books/food gods/page (16).png',
    'books/food gods/page (17).png',
    'books/food gods/page (18).png',
    'books/food gods/page (19).png',
    'books/food gods/page (20).png',
    'books/food gods/page (21).png',
    'books/food gods/page (22).png',
    'books/food gods/page (23).png',
    'books/food gods/page (24).png',
    'books/food gods/page (25).png',
    'books/food gods/page (26).png',
    'books/food gods/page (27).png',
    'books/food gods/page (28).png',
    'books/food gods/page (29).png',
    'books/food gods/page (30).png',
    'books/food gods/page (31).png',
    'books/food gods/page (32).png',
    'books/food gods/page (33).png',
    'books/food gods/page (34).png',
    'books/food gods/page (35).png',
    'books/food gods/page (36).png',
    'books/food gods/page (37).png',
    'books/food gods/page (38).png',
    'books/food gods/page (39).png',
    'books/food gods/page (40).png',
    'books/food gods/page (41).png',
    'books/food gods/page (42).png',
    'books/food gods/page (43).png',
    'books/food gods/page (44).png',
    'books/food gods/page (45).png',
    'books/food gods/page (46).png',
    'books/food gods/page (47).png',
    'books/food gods/page (48).png',
    'books/food gods/page (49).png',
    'books/food gods/page (50).png',
    'books/food gods/page (51).png',
    'books/food gods/page (52).png',
    'books/food gods/page (53).png',
    'books/food gods/page (54).png',
    'books/food gods/page (55).png',
    'books/food gods/page (56).png',
    'books/food gods/page (57).png',
    'books/food gods/page (58).png',
    'books/food gods/page (59).png',
    'books/food gods/page (60).png',
    'books/food gods/page (61).png',
    'books/food gods/page (62).png',
    'books/food gods/page (63).png',
    'books/food gods/page (64).png',
    'books/food gods/page (65).png',
    'books/food gods/page (66).png',
    'books/food gods/page (67).png',
    'books/food gods/page (68).png',
    'books/food gods/page (69).png',
    'books/food gods/page (70).png',
    'books/food gods/page (71).png',
    'books/food gods/page (72).png',
    'books/food gods/page (73).png',
    'books/food gods/page (74).png',
    'books/food gods/page (75).png',
    'books/food gods/page (76).png',
    'books/food gods/page (77).png',
    'books/food gods/page (78).png',
    'books/food gods/page (79).png',
    'books/food gods/page (80).png',
    'books/food gods/page (81).png',
    'books/food gods/page (82).png',
    'books/food gods/page (83).png',
    'books/food gods/page (84).png',
    'books/food gods/page (85).png',
    'books/food gods/page (86).png',
    'books/food gods/page (87).png',
    'books/food gods/page (88).png',
    'books/food gods/page (89).png',
    'books/food gods/page (90).png',
    'books/food gods/page (91).png',
    'books/food gods/page (92).png',
    'books/food gods/page (93).png',
    'books/food gods/page (94).png',
    'books/food gods/page (95).png',
    'books/food gods/page (96).png',
    'books/food gods/page (97).png',
    'books/food gods/page (98).png',
    'books/food gods/page (99).png',
    'books/food gods/page (100).png',
    'books/food gods/page (101).png',
    'books/food gods/page (102).png',
    'books/food gods/page (103).png',
    'books/food gods/page (104).png',
    'books/food gods/page (105).png',
    'books/food gods/page (106).png',
    'books/food gods/page (107).png',
    'books/food gods/page (108).png',
    'books/food gods/page (109).png',
    'books/food gods/page (110).png',
    'books/food gods/page (111).png',
    'books/food gods/page (112).png',
    'books/food gods/page (113).png',
    'books/food gods/page (114).png',
    'books/food gods/page (115).png',
    'books/food gods/page (116).png',
    'books/food gods/page (117).png',
    'books/food gods/page (118).png',
    'books/food gods/page (119).png',
    'books/food gods/page (120).png',
    'books/food gods/page (121).png',
    'books/food gods/page (122).png',
    'books/food gods/page (123).png',
    'books/food gods/page (124).png',
    'books/food gods/page (125).png',
    'books/food gods/page (126).png',
    'books/food gods/page (127).png',
    'books/food gods/page (128).png',
    'books/food gods/page (129).png',
    'books/food gods/page (130).png',
    'books/food gods/page (131).png',
    'books/food gods/page (132).png',
    'books/food gods/page (133).png',
    'books/food gods/page (134).png',
    'books/food gods/page (135).png',
    'books/food gods/page (136).png',
    'books/food gods/page (137).png',
    'books/food gods/page (138).png',
    'books/food gods/page (139).png',
    'books/food gods/page (140).png',
    'books/food gods/page (141).png',
    'books/food gods/page (142).png',
    'books/food gods/page (143).png',
    'books/food gods/page (144).png',
    'books/food gods/page (145).png',
    'books/food gods/page (146).png',
    'books/food gods/page (147).png',
    'books/food gods/page (148).png',
    'books/food gods/page (149).png',
    'books/food gods/page (150).png',
    'books/food gods/page (151).png',
    'books/food gods/page (152).png',
    'books/food gods/page (153).png',
    'books/food gods/page (154).png',
    'books/food gods/page (155).png',
    'books/food gods/page (156).png',
    'books/food gods/page (157).png',
    'books/food gods/page (158).png',
    'books/food gods/page (159).png',
    'books/food gods/page (160).png',
    'books/food gods/page (161).png',
    'books/food gods/page (162).png',
    'books/food gods/page (163).png',
    'books/food gods/page (164).png',
    'books/food gods/page (165).png',
    'books/food gods/page (166).png',
    'books/food gods/page (167).png',
    'books/food gods/page (168).png',
    'books/food gods/page (169).png',
    'books/food gods/page (170).png',
    'books/food gods/page (171).png',
    'books/food gods/page (172).png',
    'books/food gods/page (173).png',
    'books/food gods/page (174).png',
    'books/food gods/page (175).png',
    'books/food gods/page (176).png',
    'books/food gods/page (177).png',
    'books/food gods/page (178).png',
    'books/food gods/page (179).png',
    'books/food gods/page (180).png',
    'books/food gods/page (181).png',
    'books/food gods/page (182).png',
    'books/food gods/page (183).png',
    'books/food gods/page (184).png',
    'books/food gods/page (185).png',
    'books/food gods/page (186).png',
    'books/food gods/page (187).png',
    'books/food gods/page (188).png',
    'books/food gods/page (189).png',
    'books/food gods/page (190).png',
    'books/food gods/page (191).png',
    'books/food gods/page (192).png',
    'books/food gods/page (193).png',
    'books/food gods/page (194).png',
    'books/food gods/page (195).png',
    'books/food gods/page (196).png',
    'books/food gods/page (197).png',
    'books/food gods/page (198).png',
    'books/food gods/page (199).png',
    'books/food gods/page (200).png',
    'books/food gods/page (201).png',
    'books/food gods/page (202).png',
    'books/food gods/page (203).png',
    'books/food gods/page (204).png',
    'books/food gods/page (205).png',
    'books/food gods/page (206).png',
    'books/food gods/page (207).png',
    'books/food gods/page (208).png',
    'books/food gods/page (209).png',
    'books/food gods/page (210).png',
    'books/food gods/page (211).png',
    'books/food gods/page (212).png',
    'books/food gods/page (213).png',
    'books/food gods/page (214).png',
    'books/food gods/page (215).png',
    'books/food gods/page (216).png',
    'books/food gods/page (217).png',
    'books/food gods/page (218).png',
    'books/food gods/page (219).png',
    'books/food gods/page (220).png',
    'books/food gods/page (221).png',
    'books/food gods/page (222).png',
    'books/food gods/page (223).png',
    'books/food gods/page (224).png',
    'books/food gods/page (225).png',
    'books/food gods/page (226).png',

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
