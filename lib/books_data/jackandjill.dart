import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class jackandjill extends StatefulWidget {
  const jackandjill({Key? key}) : super(key: key);

  @override
  State<jackandjill> createState() => _jackandjillState();
}

class _jackandjillState extends State<jackandjill> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/jack and jill/page (1).png',
    'books/jack and jill/page (2).png',
    'books/jack and jill/page (3).png',
    'books/jack and jill/page (4).png',
    'books/jack and jill/page (5).png',
    'books/jack and jill/page (6).png',
    'books/jack and jill/page (7).png',
    'books/jack and jill/page (8).png',
    'books/jack and jill/page (9).png',
    'books/jack and jill/page (10).png',
    'books/jack and jill/page (11).png',
    'books/jack and jill/page (12).png',
    'books/jack and jill/page (13).png',
    'books/jack and jill/page (14).png',
    'books/jack and jill/page (15).png',
    'books/jack and jill/page (16).png',
    'books/jack and jill/page (17).png',
    'books/jack and jill/page (18).png',
    'books/jack and jill/page (19).png',
    'books/jack and jill/page (20).png',
    'books/jack and jill/page (21).png',
    'books/jack and jill/page (22).png',
    'books/jack and jill/page (23).png',
    'books/jack and jill/page (24).png',
    'books/jack and jill/page (25).png',
    'books/jack and jill/page (26).png',
    'books/jack and jill/page (27).png',
    'books/jack and jill/page (28).png',
    'books/jack and jill/page (29).png',
    'books/jack and jill/page (30).png',
    'books/jack and jill/page (31).png',
    'books/jack and jill/page (32).png',
    'books/jack and jill/page (33).png',
    'books/jack and jill/page (34).png',
    'books/jack and jill/page (35).png',
    'books/jack and jill/page (36).png',
    'books/jack and jill/page (37).png',
    'books/jack and jill/page (38).png',
    'books/jack and jill/page (39).png',
    'books/jack and jill/page (40).png',
    'books/jack and jill/page (41).png',
    'books/jack and jill/page (42).png',
    'books/jack and jill/page (43).png',
    'books/jack and jill/page (44).png',
    'books/jack and jill/page (45).png',
    'books/jack and jill/page (46).png',
    'books/jack and jill/page (47).png',
    'books/jack and jill/page (48).png',
    'books/jack and jill/page (49).png',
    'books/jack and jill/page (50).png',
    'books/jack and jill/page (51).png',
    'books/jack and jill/page (52).png',
    'books/jack and jill/page (53).png',
    'books/jack and jill/page (54).png',
    'books/jack and jill/page (55).png',
    'books/jack and jill/page (56).png',
    'books/jack and jill/page (57).png',
    'books/jack and jill/page (58).png',
    'books/jack and jill/page (59).png',
    'books/jack and jill/page (60).png',
    'books/jack and jill/page (61).png',
    'books/jack and jill/page (62).png',
    'books/jack and jill/page (63).png',
    'books/jack and jill/page (64).png',
    'books/jack and jill/page (65).png',
    'books/jack and jill/page (66).png',
    'books/jack and jill/page (67).png',
    'books/jack and jill/page (68).png',
    'books/jack and jill/page (69).png',
    'books/jack and jill/page (70).png',
    'books/jack and jill/page (71).png',
    'books/jack and jill/page (72).png',
    'books/jack and jill/page (73).png',
    'books/jack and jill/page (74).png',
    'books/jack and jill/page (75).png',
    'books/jack and jill/page (76).png',
    'books/jack and jill/page (77).png',
    'books/jack and jill/page (78).png',
    'books/jack and jill/page (79).png',
    'books/jack and jill/page (80).png',
    'books/jack and jill/page (81).png',
    'books/jack and jill/page (82).png',
    'books/jack and jill/page (83).png',
    'books/jack and jill/page (84).png',
    'books/jack and jill/page (85).png',
    'books/jack and jill/page (86).png',
    'books/jack and jill/page (87).png',
    'books/jack and jill/page (88).png',
    'books/jack and jill/page (89).png',
    'books/jack and jill/page (90).png',
    'books/jack and jill/page (91).png',
    'books/jack and jill/page (92).png',
    'books/jack and jill/page (93).png',
    'books/jack and jill/page (94).png',
    'books/jack and jill/page (95).png',
    'books/jack and jill/page (96).png',
    'books/jack and jill/page (97).png',
    'books/jack and jill/page (98).png',
    'books/jack and jill/page (99).png',
    'books/jack and jill/page (100).png',
    'books/jack and jill/page (101).png',
    'books/jack and jill/page (102).png',
    'books/jack and jill/page (103).png',
    'books/jack and jill/page (104).png',
    'books/jack and jill/page (105).png',
    'books/jack and jill/page (106).png',
    'books/jack and jill/page (107).png',
    'books/jack and jill/page (108).png',
    'books/jack and jill/page (109).png',
    'books/jack and jill/page (110).png',
    'books/jack and jill/page (111).png',
    'books/jack and jill/page (112).png',
    'books/jack and jill/page (113).png',
    'books/jack and jill/page (114).png',
    'books/jack and jill/page (115).png',
    'books/jack and jill/page (116).png',
    'books/jack and jill/page (117).png',
    'books/jack and jill/page (118).png',
    'books/jack and jill/page (119).png',
    'books/jack and jill/page (120).png',
    'books/jack and jill/page (121).png',
    'books/jack and jill/page (122).png',
    'books/jack and jill/page (123).png',
    'books/jack and jill/page (124).png',
    'books/jack and jill/page (125).png',
    'books/jack and jill/page (126).png',
    'books/jack and jill/page (127).png',
    'books/jack and jill/page (128).png',
    'books/jack and jill/page (129).png',
    'books/jack and jill/page (130).png',
    'books/jack and jill/page (131).png',
    'books/jack and jill/page (132).png',
    'books/jack and jill/page (133).png',
    'books/jack and jill/page (134).png',
    'books/jack and jill/page (135).png',
    'books/jack and jill/page (136).png',
    'books/jack and jill/page (137).png',
    'books/jack and jill/page (138).png',
    'books/jack and jill/page (139).png',
    'books/jack and jill/page (140).png',
    'books/jack and jill/page (141).png',
    'books/jack and jill/page (142).png',
    'books/jack and jill/page (143).png',
    'books/jack and jill/page (144).png',
    'books/jack and jill/page (145).png',
    'books/jack and jill/page (146).png',
    'books/jack and jill/page (147).png',
    'books/jack and jill/page (148).png',
    'books/jack and jill/page (149).png',
    'books/jack and jill/page (150).png',
    'books/jack and jill/page (151).png',
    'books/jack and jill/page (152).png',
    'books/jack and jill/page (153).png',
    'books/jack and jill/page (154).png',
    'books/jack and jill/page (155).png',
    'books/jack and jill/page (156).png',
    'books/jack and jill/page (157).png',
    'books/jack and jill/page (158).png',
    'books/jack and jill/page (159).png',
    'books/jack and jill/page (160).png',
    'books/jack and jill/page (161).png',
    'books/jack and jill/page (162).png',
    'books/jack and jill/page (163).png',
    'books/jack and jill/page (164).png',
    'books/jack and jill/page (165).png',
    'books/jack and jill/page (166).png',
    'books/jack and jill/page (167).png',
    'books/jack and jill/page (168).png',
    'books/jack and jill/page (169).png',
    'books/jack and jill/page (170).png',
    'books/jack and jill/page (171).png',
    'books/jack and jill/page (172).png',
    'books/jack and jill/page (173).png',
    'books/jack and jill/page (174).png',
    'books/jack and jill/page (175).png',
    'books/jack and jill/page (176).png',
    'books/jack and jill/page (177).png',
    'books/jack and jill/page (178).png',
    'books/jack and jill/page (179).png',
    'books/jack and jill/page (180).png',
    'books/jack and jill/page (181).png',
    'books/jack and jill/page (182).png',
    'books/jack and jill/page (183).png',
    'books/jack and jill/page (184).png',
    'books/jack and jill/page (185).png',
    'books/jack and jill/page (186).png',
    'books/jack and jill/page (187).png',
    'books/jack and jill/page (188).png',
    'books/jack and jill/page (189).png',
    'books/jack and jill/page (190).png',
    'books/jack and jill/page (191).png',
    'books/jack and jill/page (192).png',
    'books/jack and jill/page (193).png',
    'books/jack and jill/page (194).png',
    'books/jack and jill/page (195).png',
    'books/jack and jill/page (196).png',
    'books/jack and jill/page (197).png',
    'books/jack and jill/page (198).png',
    'books/jack and jill/page (199).png',
    'books/jack and jill/page (200).png',
    'books/jack and jill/page (201).png',
    'books/jack and jill/page (202).png',
    'books/jack and jill/page (203).png',
    'books/jack and jill/page (204).png',
    'books/jack and jill/page (205).png',
    'books/jack and jill/page (206).png',
    'books/jack and jill/page (207).png',
    'books/jack and jill/page (208).png',
    'books/jack and jill/page (209).png',
    'books/jack and jill/page (210).png',
    'books/jack and jill/page (211).png',
    'books/jack and jill/page (212).png',
    'books/jack and jill/page (213).png',
    'books/jack and jill/page (214).png',
    'books/jack and jill/page (215).png',
    'books/jack and jill/page (216).png',
    'books/jack and jill/page (217).png',
    'books/jack and jill/page (218).png',
    'books/jack and jill/page (219).png',
    'books/jack and jill/page (220).png',
    'books/jack and jill/page (221).png',
    'books/jack and jill/page (222).png',
    'books/jack and jill/page (223).png',
    'books/jack and jill/page (224).png',
    'books/jack and jill/page (225).png',
    'books/jack and jill/page (226).png',
    'books/jack and jill/page (227).png',
    'books/jack and jill/page (228).png',
    'books/jack and jill/page (229).png',
    'books/jack and jill/page (230).png',
    'books/jack and jill/page (231).png',
    'books/jack and jill/page (232).png',
    'books/jack and jill/page (233).png',
    'books/jack and jill/page (234).png',
    'books/jack and jill/page (235).png',

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
