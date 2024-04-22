import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class songs extends StatefulWidget {
  const songs({Key? key}) : super(key: key);

  @override
  State<songs> createState() => _songsState();
}

class _songsState extends State<songs> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/songs/page (1).png',
    'books/songs/page (2).png',
    'books/songs/page (3).png',
    'books/songs/page (4).png',
    'books/songs/page (5).png',
    'books/songs/page (6).png',
    'books/songs/page (7).png',
    'books/songs/page (8).png',
    'books/songs/page (9).png',
    'books/songs/page (10).png',
    'books/songs/page (11).png',
    'books/songs/page (12).png',
    'books/songs/page (13).png',
    'books/songs/page (14).png',
    'books/songs/page (15).png',
    'books/songs/page (16).png',
    'books/songs/page (17).png',
    'books/songs/page (18).png',
    'books/songs/page (19).png',
    'books/songs/page (20).png',
    'books/songs/page (21).png',
    'books/songs/page (22).png',
    'books/songs/page (23).png',
    'books/songs/page (24).png',
    'books/songs/page (25).png',
    'books/songs/page (26).png',
    'books/songs/page (27).png',
    'books/songs/page (28).png',
    'books/songs/page (29).png',
    'books/songs/page (30).png',
    'books/songs/page (31).png',
    'books/songs/page (32).png',
    'books/songs/page (33).png',
    'books/songs/page (34).png',
    'books/songs/page (35).png',
    'books/songs/page (36).png',
    'books/songs/page (37).png',
    'books/songs/page (38).png',
    'books/songs/page (39).png',
    'books/songs/page (40).png',
    'books/songs/page (41).png',
    'books/songs/page (42).png',
    'books/songs/page (43).png',
    'books/songs/page (44).png',
    'books/songs/page (45).png',
    'books/songs/page (46).png',
    'books/songs/page (47).png',
    'books/songs/page (48).png',
    'books/songs/page (49).png',
    'books/songs/page (50).png',
    'books/songs/page (51).png',
    'books/songs/page (52).png',
    'books/songs/page (53).png',
    'books/songs/page (54).png',
    'books/songs/page (55).png',
    'books/songs/page (56).png',
    'books/songs/page (57).png',
    'books/songs/page (58).png',
    'books/songs/page (59).png',
    'books/songs/page (60).png',
    'books/songs/page (61).png',
    'books/songs/page (62).png',
    'books/songs/page (63).png',
    'books/songs/page (64).png',
    'books/songs/page (65).png',
    'books/songs/page (66).png',
    'books/songs/page (67).png',
    'books/songs/page (68).png',
    'books/songs/page (69).png',
    'books/songs/page (70).png',
    'books/songs/page (71).png',
    'books/songs/page (72).png',
    'books/songs/page (73).png',
    'books/songs/page (74).png',
    'books/songs/page (75).png',
    'books/songs/page (76).png',
    'books/songs/page (77).png',
    'books/songs/page (78).png',
    'books/songs/page (79).png',
    'books/songs/page (80).png',
    'books/songs/page (81).png',
    'books/songs/page (82).png',
    'books/songs/page (83).png',
    'books/songs/page (84).png',
    'books/songs/page (85).png',
    'books/songs/page (86).png',
    'books/songs/page (87).png',
    'books/songs/page (88).png',
    'books/songs/page (89).png',
    'books/songs/page (90).png',
    'books/songs/page (91).png',
    'books/songs/page (92).png',
    'books/songs/page (93).png',
    'books/songs/page (94).png',
    'books/songs/page (95).png',
    'books/songs/page (96).png',
    'books/songs/page (97).png',
    'books/songs/page (98).png',
    'books/songs/page (99).png',
    'books/songs/page (100).png',
    'books/songs/page (101).png',
    'books/songs/page (102).png',
    'books/songs/page (103).png',
    'books/songs/page (104).png',
    'books/songs/page (105).png',
    'books/songs/page (106).png',
    'books/songs/page (107).png',
    'books/songs/page (108).png',
    'books/songs/page (109).png',
    'books/songs/page (110).png',
    'books/songs/page (111).png',
    'books/songs/page (112).png',
    'books/songs/page (113).png',
    'books/songs/page (114).png',
    'books/songs/page (115).png',
    'books/songs/page (116).png',
    'books/songs/page (117).png',
    'books/songs/page (118).png',
    'books/songs/page (119).png',
    'books/songs/page (120).png',
    'books/songs/page (121).png',
    'books/songs/page (122).png',
    'books/songs/page (123).png',
    'books/songs/page (124).png',
    'books/songs/page (125).png',
    'books/songs/page (126).png',
    'books/songs/page (127).png',
    'books/songs/page (128).png',
    'books/songs/page (129).png',
    'books/songs/page (130).png',
    'books/songs/page (131).png',
    'books/songs/page (132).png',
    'books/songs/page (133).png',
    'books/songs/page (134).png',
    'books/songs/page (135).png',
    'books/songs/page (136).png',
    'books/songs/page (137).png',
    'books/songs/page (138).png',
    'books/songs/page (139).png',
    'books/songs/page (140).png',
    'books/songs/page (141).png',
    'books/songs/page (142).png',
    'books/songs/page (143).png',
    'books/songs/page (144).png',
    'books/songs/page (145).png',
    'books/songs/page (146).png',
    'books/songs/page (147).png',
    'books/songs/page (148).png',
    'books/songs/page (149).png',
    'books/songs/page (150).png',
    'books/songs/page (151).png',
    'books/songs/page (152).png',
    'books/songs/page (153).png',
    'books/songs/page (154).png',
    'books/songs/page (155).png',
    'books/songs/page (156).png',
    'books/songs/page (157).png',
    'books/songs/page (158).png',
    'books/songs/page (159).png',
    'books/songs/page (160).png',
    'books/songs/page (161).png',
    'books/songs/page (162).png',
    'books/songs/page (163).png',
    'books/songs/page (164).png',
    'books/songs/page (165).png',
    'books/songs/page (166).png',
    'books/songs/page (167).png',
    'books/songs/page (168).png',
    'books/songs/page (169).png',
    'books/songs/page (170).png',
    'books/songs/page (171).png',
    'books/songs/page (172).png',
    'books/songs/page (173).png',
    'books/songs/page (174).png',
    'books/songs/page (175).png',
    'books/songs/page (176).png',
    'books/songs/page (177).png',
    'books/songs/page (178).png',
    'books/songs/page (179).png',
    'books/songs/page (180).png',
    'books/songs/page (181).png',
    'books/songs/page (182).png',
    'books/songs/page (183).png',
    'books/songs/page (184).png',
    'books/songs/page (185).png',
    'books/songs/page (186).png',
    'books/songs/page (187).png',
    'books/songs/page (188).png',
    'books/songs/page (189).png',
    'books/songs/page (190).png',
    'books/songs/page (191).png',
    'books/songs/page (192).png',
    'books/songs/page (193).png',
    'books/songs/page (194).png',
    'books/songs/page (195).png',
    'books/songs/page (196).png',
    'books/songs/page (197).png',
    'books/songs/page (198).png',
    'books/songs/page (199).png',
    'books/songs/page (200).png',
    'books/songs/page (201).png',
    'books/songs/page (202).png',
    'books/songs/page (203).png',
    'books/songs/page (204).png',
    'books/songs/page (205).png',
    'books/songs/page (206).png',
    'books/songs/page (207).png',
    'books/songs/page (208).png',
    'books/songs/page (209).png',
    'books/songs/page (210).png',
    'books/songs/page (211).png',
    'books/songs/page (212).png',
    'books/songs/page (213).png',
    'books/songs/page (214).png',
    'books/songs/page (215).png',
    'books/songs/page (216).png',
    'books/songs/page (217).png',
    'books/songs/page (218).png',
    'books/songs/page (219).png',
    'books/songs/page (220).png',
    'books/songs/page (221).png',
    'books/songs/page (222).png',
    'books/songs/page (223).png',
    'books/songs/page (224).png',
    'books/songs/page (225).png',
    'books/songs/page (226).png',
    'books/songs/page (227).png',
    'books/songs/page (228).png',
    'books/songs/page (229).png',
    'books/songs/page (230).png',
    'books/songs/page (231).png',
    'books/songs/page (232).png',

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
