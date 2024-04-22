import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bealby extends StatefulWidget {
  const bealby({Key? key}) : super(key: key);

  @override
  State<bealby> createState() => _bealbyState();
}

class _bealbyState extends State<bealby> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bealby/page (1).png',
    'books/bealby/page (2).png',
    'books/bealby/page (3).png',
    'books/bealby/page (4).png',
    'books/bealby/page (5).png',
    'books/bealby/page (6).png',
    'books/bealby/page (7).png',
    'books/bealby/page (8).png',
    'books/bealby/page (9).png',
    'books/bealby/page (10).png',
    'books/bealby/page (11).png',
    'books/bealby/page (12).png',
    'books/bealby/page (13).png',
    'books/bealby/page (14).png',
    'books/bealby/page (15).png',
    'books/bealby/page (16).png',
    'books/bealby/page (17).png',
    'books/bealby/page (18).png',
    'books/bealby/page (19).png',
    'books/bealby/page (20).png',
    'books/bealby/page (21).png',
    'books/bealby/page (22).png',
    'books/bealby/page (23).png',
    'books/bealby/page (24).png',
    'books/bealby/page (25).png',
    'books/bealby/page (26).png',
    'books/bealby/page (27).png',
    'books/bealby/page (28).png',
    'books/bealby/page (29).png',
    'books/bealby/page (30).png',
    'books/bealby/page (31).png',
    'books/bealby/page (32).png',
    'books/bealby/page (33).png',
    'books/bealby/page (34).png',
    'books/bealby/page (35).png',
    'books/bealby/page (36).png',
    'books/bealby/page (37).png',
    'books/bealby/page (38).png',
    'books/bealby/page (39).png',
    'books/bealby/page (40).png',
    'books/bealby/page (41).png',
    'books/bealby/page (42).png',
    'books/bealby/page (43).png',
    'books/bealby/page (44).png',
    'books/bealby/page (45).png',
    'books/bealby/page (46).png',
    'books/bealby/page (47).png',
    'books/bealby/page (48).png',
    'books/bealby/page (49).png',
    'books/bealby/page (50).png',
    'books/bealby/page (51).png',
    'books/bealby/page (52).png',
    'books/bealby/page (53).png',
    'books/bealby/page (54).png',
    'books/bealby/page (55).png',
    'books/bealby/page (56).png',
    'books/bealby/page (57).png',
    'books/bealby/page (58).png',
    'books/bealby/page (59).png',
    'books/bealby/page (60).png',
    'books/bealby/page (61).png',
    'books/bealby/page (62).png',
    'books/bealby/page (63).png',
    'books/bealby/page (64).png',
    'books/bealby/page (65).png',
    'books/bealby/page (66).png',
    'books/bealby/page (67).png',
    'books/bealby/page (68).png',
    'books/bealby/page (69).png',
    'books/bealby/page (70).png',
    'books/bealby/page (71).png',
    'books/bealby/page (72).png',
    'books/bealby/page (73).png',
    'books/bealby/page (74).png',
    'books/bealby/page (75).png',
    'books/bealby/page (76).png',
    'books/bealby/page (77).png',
    'books/bealby/page (78).png',
    'books/bealby/page (79).png',
    'books/bealby/page (80).png',
    'books/bealby/page (81).png',
    'books/bealby/page (82).png',
    'books/bealby/page (83).png',
    'books/bealby/page (84).png',
    'books/bealby/page (85).png',
    'books/bealby/page (86).png',
    'books/bealby/page (87).png',
    'books/bealby/page (88).png',
    'books/bealby/page (89).png',
    'books/bealby/page (90).png',
    'books/bealby/page (91).png',
    'books/bealby/page (92).png',
    'books/bealby/page (93).png',
    'books/bealby/page (94).png',
    'books/bealby/page (95).png',
    'books/bealby/page (96).png',
    'books/bealby/page (97).png',
    'books/bealby/page (98).png',
    'books/bealby/page (99).png',
    'books/bealby/page (100).png',
    'books/bealby/page (101).png',
    'books/bealby/page (102).png',
    'books/bealby/page (103).png',
    'books/bealby/page (104).png',
    'books/bealby/page (105).png',
    'books/bealby/page (106).png',
    'books/bealby/page (107).png',
    'books/bealby/page (108).png',
    'books/bealby/page (109).png',
    'books/bealby/page (110).png',
    'books/bealby/page (111).png',
    'books/bealby/page (112).png',
    'books/bealby/page (113).png',
    'books/bealby/page (114).png',
    'books/bealby/page (115).png',
    'books/bealby/page (116).png',
    'books/bealby/page (117).png',
    'books/bealby/page (118).png',
    'books/bealby/page (119).png',
    'books/bealby/page (120).png',
    'books/bealby/page (121).png',
    'books/bealby/page (122).png',
    'books/bealby/page (123).png',
    'books/bealby/page (124).png',
    'books/bealby/page (125).png',
    'books/bealby/page (126).png',
    'books/bealby/page (127).png',
    'books/bealby/page (128).png',
    'books/bealby/page (129).png',
    'books/bealby/page (130).png',
    'books/bealby/page (131).png',
    'books/bealby/page (132).png',
    'books/bealby/page (133).png',
    'books/bealby/page (134).png',
    'books/bealby/page (135).png',
    'books/bealby/page (136).png',
    'books/bealby/page (137).png',
    'books/bealby/page (138).png',
    'books/bealby/page (139).png',
    'books/bealby/page (140).png',
    'books/bealby/page (141).png',
    'books/bealby/page (142).png',
    'books/bealby/page (143).png',
    'books/bealby/page (144).png',
    'books/bealby/page (145).png',
    'books/bealby/page (146).png',
    'books/bealby/page (147).png',
    'books/bealby/page (148).png',
    'books/bealby/page (149).png',
    'books/bealby/page (150).png',
    'books/bealby/page (151).png',
    'books/bealby/page (152).png',
    'books/bealby/page (153).png',
    'books/bealby/page (154).png',
    'books/bealby/page (155).png',
    'books/bealby/page (156).png',
    'books/bealby/page (157).png',
    'books/bealby/page (158).png',
    'books/bealby/page (159).png',
    'books/bealby/page (160).png',
    'books/bealby/page (161).png',
    'books/bealby/page (162).png',
    'books/bealby/page (163).png',
    'books/bealby/page (164).png',
    'books/bealby/page (165).png',
    'books/bealby/page (166).png',
    'books/bealby/page (167).png',
    'books/bealby/page (168).png',
    'books/bealby/page (169).png',
    'books/bealby/page (170).png',
    'books/bealby/page (171).png',
    'books/bealby/page (172).png',
    'books/bealby/page (173).png',
    'books/bealby/page (174).png',
    'books/bealby/page (175).png',
    'books/bealby/page (176).png',
    'books/bealby/page (177).png',
    'books/bealby/page (178).png',
    'books/bealby/page (179).png',
    'books/bealby/page (180).png',
    'books/bealby/page (181).png',
    'books/bealby/page (182).png',
    'books/bealby/page (183).png',
    'books/bealby/page (184).png',
    'books/bealby/page (185).png',
    'books/bealby/page (186).png',
    'books/bealby/page (187).png',
    'books/bealby/page (188).png',
    'books/bealby/page (189).png',
    'books/bealby/page (190).png',
    'books/bealby/page (191).png',
    'books/bealby/page (192).png',
    'books/bealby/page (193).png',
    'books/bealby/page (194).png',
    'books/bealby/page (195).png',
    'books/bealby/page (196).png',
    'books/bealby/page (197).png',
    'books/bealby/page (198).png',
    'books/bealby/page (199).png',
    'books/bealby/page (200).png',
    'books/bealby/page (201).png',
    'books/bealby/page (202).png',
    'books/bealby/page (203).png',
    'books/bealby/page (204).png',
    'books/bealby/page (205).png',
    'books/bealby/page (206).png',
    'books/bealby/page (207).png',
    'books/bealby/page (208).png',
    'books/bealby/page (209).png',
    'books/bealby/page (210).png',
    'books/bealby/page (211).png',
    'books/bealby/page (212).png',
    'books/bealby/page (213).png',

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
