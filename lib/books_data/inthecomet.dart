import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class inthecomet extends StatefulWidget {
  const inthecomet({Key? key}) : super(key: key);

  @override
  State<inthecomet> createState() => _inthecometState();
}

class _inthecometState extends State<inthecomet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/in the comet/page (1).png',
    'books/in the comet/page (2).png',
    'books/in the comet/page (3).png',
    'books/in the comet/page (4).png',
    'books/in the comet/page (5).png',
    'books/in the comet/page (6).png',
    'books/in the comet/page (7).png',
    'books/in the comet/page (8).png',
    'books/in the comet/page (9).png',
    'books/in the comet/page (10).png',
    'books/in the comet/page (11).png',
    'books/in the comet/page (12).png',
    'books/in the comet/page (13).png',
    'books/in the comet/page (14).png',
    'books/in the comet/page (15).png',
    'books/in the comet/page (16).png',
    'books/in the comet/page (17).png',
    'books/in the comet/page (18).png',
    'books/in the comet/page (19).png',
    'books/in the comet/page (20).png',
    'books/in the comet/page (21).png',
    'books/in the comet/page (22).png',
    'books/in the comet/page (23).png',
    'books/in the comet/page (24).png',
    'books/in the comet/page (25).png',
    'books/in the comet/page (26).png',
    'books/in the comet/page (27).png',
    'books/in the comet/page (28).png',
    'books/in the comet/page (29).png',
    'books/in the comet/page (30).png',
    'books/in the comet/page (31).png',
    'books/in the comet/page (32).png',
    'books/in the comet/page (33).png',
    'books/in the comet/page (34).png',
    'books/in the comet/page (35).png',
    'books/in the comet/page (36).png',
    'books/in the comet/page (37).png',
    'books/in the comet/page (38).png',
    'books/in the comet/page (39).png',
    'books/in the comet/page (40).png',
    'books/in the comet/page (41).png',
    'books/in the comet/page (42).png',
    'books/in the comet/page (43).png',
    'books/in the comet/page (44).png',
    'books/in the comet/page (45).png',
    'books/in the comet/page (46).png',
    'books/in the comet/page (47).png',
    'books/in the comet/page (48).png',
    'books/in the comet/page (49).png',
    'books/in the comet/page (50).png',
    'books/in the comet/page (51).png',
    'books/in the comet/page (52).png',
    'books/in the comet/page (53).png',
    'books/in the comet/page (54).png',
    'books/in the comet/page (55).png',
    'books/in the comet/page (56).png',
    'books/in the comet/page (57).png',
    'books/in the comet/page (58).png',
    'books/in the comet/page (59).png',
    'books/in the comet/page (60).png',
    'books/in the comet/page (61).png',
    'books/in the comet/page (62).png',
    'books/in the comet/page (63).png',
    'books/in the comet/page (64).png',
    'books/in the comet/page (65).png',
    'books/in the comet/page (66).png',
    'books/in the comet/page (67).png',
    'books/in the comet/page (68).png',
    'books/in the comet/page (69).png',
    'books/in the comet/page (70).png',
    'books/in the comet/page (71).png',
    'books/in the comet/page (72).png',
    'books/in the comet/page (73).png',
    'books/in the comet/page (74).png',
    'books/in the comet/page (75).png',
    'books/in the comet/page (76).png',
    'books/in the comet/page (77).png',
    'books/in the comet/page (78).png',
    'books/in the comet/page (79).png',
    'books/in the comet/page (80).png',
    'books/in the comet/page (81).png',
    'books/in the comet/page (82).png',
    'books/in the comet/page (83).png',
    'books/in the comet/page (84).png',
    'books/in the comet/page (85).png',
    'books/in the comet/page (86).png',
    'books/in the comet/page (87).png',
    'books/in the comet/page (88).png',
    'books/in the comet/page (89).png',
    'books/in the comet/page (90).png',
    'books/in the comet/page (91).png',
    'books/in the comet/page (92).png',
    'books/in the comet/page (93).png',
    'books/in the comet/page (94).png',
    'books/in the comet/page (95).png',
    'books/in the comet/page (96).png',
    'books/in the comet/page (97).png',
    'books/in the comet/page (98).png',
    'books/in the comet/page (99).png',
    'books/in the comet/page (100).png',
    'books/in the comet/page (101).png',
    'books/in the comet/page (102).png',
    'books/in the comet/page (103).png',
    'books/in the comet/page (104).png',
    'books/in the comet/page (105).png',
    'books/in the comet/page (106).png',
    'books/in the comet/page (107).png',
    'books/in the comet/page (108).png',
    'books/in the comet/page (109).png',
    'books/in the comet/page (110).png',
    'books/in the comet/page (111).png',
    'books/in the comet/page (112).png',
    'books/in the comet/page (113).png',
    'books/in the comet/page (114).png',
    'books/in the comet/page (115).png',
    'books/in the comet/page (116).png',
    'books/in the comet/page (117).png',
    'books/in the comet/page (118).png',
    'books/in the comet/page (119).png',
    'books/in the comet/page (120).png',
    'books/in the comet/page (121).png',
    'books/in the comet/page (122).png',
    'books/in the comet/page (123).png',
    'books/in the comet/page (124).png',
    'books/in the comet/page (125).png',
    'books/in the comet/page (126).png',
    'books/in the comet/page (127).png',
    'books/in the comet/page (128).png',
    'books/in the comet/page (129).png',
    'books/in the comet/page (130).png',
    'books/in the comet/page (131).png',
    'books/in the comet/page (132).png',
    'books/in the comet/page (133).png',
    'books/in the comet/page (134).png',
    'books/in the comet/page (135).png',
    'books/in the comet/page (136).png',
    'books/in the comet/page (137).png',
    'books/in the comet/page (138).png',
    'books/in the comet/page (139).png',
    'books/in the comet/page (140).png',
    'books/in the comet/page (141).png',
    'books/in the comet/page (142).png',
    'books/in the comet/page (143).png',
    'books/in the comet/page (144).png',
    'books/in the comet/page (145).png',
    'books/in the comet/page (146).png',
    'books/in the comet/page (147).png',
    'books/in the comet/page (148).png',
    'books/in the comet/page (149).png',
    'books/in the comet/page (150).png',
    'books/in the comet/page (151).png',
    'books/in the comet/page (152).png',
    'books/in the comet/page (153).png',
    'books/in the comet/page (154).png',
    'books/in the comet/page (155).png',
    'books/in the comet/page (156).png',
    'books/in the comet/page (157).png',
    'books/in the comet/page (158).png',
    'books/in the comet/page (159).png',
    'books/in the comet/page (160).png',
    'books/in the comet/page (161).png',
    'books/in the comet/page (162).png',
    'books/in the comet/page (163).png',
    'books/in the comet/page (164).png',
    'books/in the comet/page (165).png',
    'books/in the comet/page (166).png',
    'books/in the comet/page (167).png',
    'books/in the comet/page (168).png',
    'books/in the comet/page (169).png',
    'books/in the comet/page (170).png',
    'books/in the comet/page (171).png',
    'books/in the comet/page (172).png',
    'books/in the comet/page (173).png',
    'books/in the comet/page (174).png',
    'books/in the comet/page (175).png',
    'books/in the comet/page (176).png',
    'books/in the comet/page (177).png',
    'books/in the comet/page (178).png',
    'books/in the comet/page (179).png',
    'books/in the comet/page (180).png',
    'books/in the comet/page (181).png',
    'books/in the comet/page (182).png',
    'books/in the comet/page (183).png',
    'books/in the comet/page (184).png',
    'books/in the comet/page (185).png',
    'books/in the comet/page (186).png',
    'books/in the comet/page (187).png',
    'books/in the comet/page (188).png',
    'books/in the comet/page (189).png',
    'books/in the comet/page (190).png',
    'books/in the comet/page (191).png',
    'books/in the comet/page (192).png',
    'books/in the comet/page (193).png',
    'books/in the comet/page (194).png',
    'books/in the comet/page (195).png',
    'books/in the comet/page (196).png',
    'books/in the comet/page (197).png',
    'books/in the comet/page (198).png',
    'books/in the comet/page (199).png',
    'books/in the comet/page (200).png',
    'books/in the comet/page (201).png',
    'books/in the comet/page (202).png',
    'books/in the comet/page (203).png',
    'books/in the comet/page (204).png',
    'books/in the comet/page (205).png',
    'books/in the comet/page (206).png',
    'books/in the comet/page (207).png',
    'books/in the comet/page (208).png',
    'books/in the comet/page (209).png',
    'books/in the comet/page (210).png',
    'books/in the comet/page (211).png',
    'books/in the comet/page (212).png',
    'books/in the comet/page (213).png',
    'books/in the comet/page (214).png',
    'books/in the comet/page (215).png',
    'books/in the comet/page (216).png',
    'books/in the comet/page (217).png',
    'books/in the comet/page (218).png',
    'books/in the comet/page (219).png',
    'books/in the comet/page (220).png',
    'books/in the comet/page (221).png',
    'books/in the comet/page (222).png',
    'books/in the comet/page (223).png',

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
