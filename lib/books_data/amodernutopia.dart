import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class amodernutopia extends StatefulWidget {
  const amodernutopia({Key? key}) : super(key: key);

  @override
  State<amodernutopia> createState() => _amodernutopiaState();
}

class _amodernutopiaState extends State<amodernutopia> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Modern Utopia/page (1).png',
    'books/A Modern Utopia/page (2).png',
    'books/A Modern Utopia/page (3).png',
    'books/A Modern Utopia/page (4).png',
    'books/A Modern Utopia/page (5).png',
    'books/A Modern Utopia/page (6).png',
    'books/A Modern Utopia/page (7).png',
    'books/A Modern Utopia/page (8).png',
    'books/A Modern Utopia/page (9).png',
    'books/A Modern Utopia/page (10).png',
    'books/A Modern Utopia/page (11).png',
    'books/A Modern Utopia/page (12).png',
    'books/A Modern Utopia/page (13).png',
    'books/A Modern Utopia/page (14).png',
    'books/A Modern Utopia/page (15).png',
    'books/A Modern Utopia/page (16).png',
    'books/A Modern Utopia/page (17).png',
    'books/A Modern Utopia/page (18).png',
    'books/A Modern Utopia/page (19).png',
    'books/A Modern Utopia/page (20).png',
    'books/A Modern Utopia/page (21).png',
    'books/A Modern Utopia/page (22).png',
    'books/A Modern Utopia/page (23).png',
    'books/A Modern Utopia/page (24).png',
    'books/A Modern Utopia/page (25).png',
    'books/A Modern Utopia/page (26).png',
    'books/A Modern Utopia/page (27).png',
    'books/A Modern Utopia/page (28).png',
    'books/A Modern Utopia/page (29).png',
    'books/A Modern Utopia/page (30).png',
    'books/A Modern Utopia/page (31).png',
    'books/A Modern Utopia/page (32).png',
    'books/A Modern Utopia/page (33).png',
    'books/A Modern Utopia/page (34).png',
    'books/A Modern Utopia/page (35).png',
    'books/A Modern Utopia/page (36).png',
    'books/A Modern Utopia/page (37).png',
    'books/A Modern Utopia/page (38).png',
    'books/A Modern Utopia/page (39).png',
    'books/A Modern Utopia/page (40).png',
    'books/A Modern Utopia/page (41).png',
    'books/A Modern Utopia/page (42).png',
    'books/A Modern Utopia/page (43).png',
    'books/A Modern Utopia/page (44).png',
    'books/A Modern Utopia/page (45).png',
    'books/A Modern Utopia/page (46).png',
    'books/A Modern Utopia/page (47).png',
    'books/A Modern Utopia/page (48).png',
    'books/A Modern Utopia/page (49).png',
    'books/A Modern Utopia/page (50).png',
    'books/A Modern Utopia/page (51).png',
    'books/A Modern Utopia/page (52).png',
    'books/A Modern Utopia/page (53).png',
    'books/A Modern Utopia/page (54).png',
    'books/A Modern Utopia/page (55).png',
    'books/A Modern Utopia/page (56).png',
    'books/A Modern Utopia/page (57).png',
    'books/A Modern Utopia/page (58).png',
    'books/A Modern Utopia/page (59).png',
    'books/A Modern Utopia/page (60).png',
    'books/A Modern Utopia/page (61).png',
    'books/A Modern Utopia/page (62).png',
    'books/A Modern Utopia/page (63).png',
    'books/A Modern Utopia/page (64).png',
    'books/A Modern Utopia/page (65).png',
    'books/A Modern Utopia/page (66).png',
    'books/A Modern Utopia/page (67).png',
    'books/A Modern Utopia/page (68).png',
    'books/A Modern Utopia/page (69).png',
    'books/A Modern Utopia/page (70).png',
    'books/A Modern Utopia/page (71).png',
    'books/A Modern Utopia/page (72).png',
    'books/A Modern Utopia/page (73).png',
    'books/A Modern Utopia/page (74).png',
    'books/A Modern Utopia/page (75).png',
    'books/A Modern Utopia/page (76).png',
    'books/A Modern Utopia/page (77).png',
    'books/A Modern Utopia/page (78).png',
    'books/A Modern Utopia/page (79).png',
    'books/A Modern Utopia/page (80).png',
    'books/A Modern Utopia/page (81).png',
    'books/A Modern Utopia/page (82).png',
    'books/A Modern Utopia/page (83).png',
    'books/A Modern Utopia/page (84).png',
    'books/A Modern Utopia/page (85).png',
    'books/A Modern Utopia/page (86).png',
    'books/A Modern Utopia/page (87).png',
    'books/A Modern Utopia/page (88).png',
    'books/A Modern Utopia/page (89).png',
    'books/A Modern Utopia/page (90).png',
    'books/A Modern Utopia/page (91).png',
    'books/A Modern Utopia/page (92).png',
    'books/A Modern Utopia/page (93).png',
    'books/A Modern Utopia/page (94).png',
    'books/A Modern Utopia/page (95).png',
    'books/A Modern Utopia/page (96).png',
    'books/A Modern Utopia/page (97).png',
    'books/A Modern Utopia/page (98).png',
    'books/A Modern Utopia/page (99).png',
    'books/A Modern Utopia/page (100).png',
    'books/A Modern Utopia/page (101).png',
    'books/A Modern Utopia/page (102).png',
    'books/A Modern Utopia/page (103).png',
    'books/A Modern Utopia/page (104).png',
    'books/A Modern Utopia/page (105).png',
    'books/A Modern Utopia/page (106).png',
    'books/A Modern Utopia/page (107).png',
    'books/A Modern Utopia/page (108).png',
    'books/A Modern Utopia/page (109).png',
    'books/A Modern Utopia/page (110).png',
    'books/A Modern Utopia/page (111).png',
    'books/A Modern Utopia/page (112).png',
    'books/A Modern Utopia/page (113).png',
    'books/A Modern Utopia/page (114).png',
    'books/A Modern Utopia/page (115).png',
    'books/A Modern Utopia/page (116).png',
    'books/A Modern Utopia/page (117).png',
    'books/A Modern Utopia/page (118).png',
    'books/A Modern Utopia/page (119).png',
    'books/A Modern Utopia/page (120).png',
    'books/A Modern Utopia/page (121).png',
    'books/A Modern Utopia/page (122).png',
    'books/A Modern Utopia/page (123).png',
    'books/A Modern Utopia/page (124).png',
    'books/A Modern Utopia/page (125).png',
    'books/A Modern Utopia/page (126).png',
    'books/A Modern Utopia/page (127).png',
    'books/A Modern Utopia/page (128).png',
    'books/A Modern Utopia/page (129).png',
    'books/A Modern Utopia/page (130).png',
    'books/A Modern Utopia/page (131).png',
    'books/A Modern Utopia/page (132).png',
    'books/A Modern Utopia/page (133).png',
    'books/A Modern Utopia/page (134).png',
    'books/A Modern Utopia/page (135).png',
    'books/A Modern Utopia/page (136).png',
    'books/A Modern Utopia/page (137).png',
    'books/A Modern Utopia/page (138).png',
    'books/A Modern Utopia/page (139).png',
    'books/A Modern Utopia/page (140).png',
    'books/A Modern Utopia/page (141).png',
    'books/A Modern Utopia/page (142).png',
    'books/A Modern Utopia/page (143).png',
    'books/A Modern Utopia/page (144).png',
    'books/A Modern Utopia/page (145).png',
    'books/A Modern Utopia/page (146).png',
    'books/A Modern Utopia/page (147).png',
    'books/A Modern Utopia/page (148).png',
    'books/A Modern Utopia/page (149).png',
    'books/A Modern Utopia/page (150).png',
    'books/A Modern Utopia/page (151).png',
    'books/A Modern Utopia/page (152).png',
    'books/A Modern Utopia/page (153).png',
    'books/A Modern Utopia/page (154).png',
    'books/A Modern Utopia/page (155).png',
    'books/A Modern Utopia/page (156).png',
    'books/A Modern Utopia/page (157).png',
    'books/A Modern Utopia/page (158).png',
    'books/A Modern Utopia/page (159).png',
    'books/A Modern Utopia/page (160).png',
    'books/A Modern Utopia/page (161).png',
    'books/A Modern Utopia/page (162).png',
    'books/A Modern Utopia/page (163).png',
    'books/A Modern Utopia/page (164).png',
    'books/A Modern Utopia/page (165).png',
    'books/A Modern Utopia/page (166).png',
    'books/A Modern Utopia/page (167).png',
    'books/A Modern Utopia/page (168).png',
    'books/A Modern Utopia/page (169).png',
    'books/A Modern Utopia/page (170).png',
    'books/A Modern Utopia/page (171).png',
    'books/A Modern Utopia/page (172).png',
    'books/A Modern Utopia/page (173).png',
    'books/A Modern Utopia/page (174).png',
    'books/A Modern Utopia/page (175).png',
    'books/A Modern Utopia/page (176).png',
    'books/A Modern Utopia/page (177).png',
    'books/A Modern Utopia/page (178).png',
    'books/A Modern Utopia/page (179).png',
    'books/A Modern Utopia/page (180).png',
    'books/A Modern Utopia/page (181).png',
    'books/A Modern Utopia/page (182).png',
    'books/A Modern Utopia/page (183).png',
    'books/A Modern Utopia/page (184).png',
    'books/A Modern Utopia/page (185).png',
    'books/A Modern Utopia/page (186).png',
    'books/A Modern Utopia/page (187).png',
    'books/A Modern Utopia/page (188).png',
    'books/A Modern Utopia/page (189).png',
    'books/A Modern Utopia/page (190).png',
    'books/A Modern Utopia/page (191).png',
    'books/A Modern Utopia/page (192).png',
    'books/A Modern Utopia/page (193).png',
    'books/A Modern Utopia/page (194).png',
    'books/A Modern Utopia/page (195).png',
    'books/A Modern Utopia/page (196).png',
    'books/A Modern Utopia/page (197).png',
    'books/A Modern Utopia/page (198).png',
    'books/A Modern Utopia/page (199).png',
    'books/A Modern Utopia/page (200).png',
    'books/A Modern Utopia/page (201).png',
    'books/A Modern Utopia/page (202).png',
    'books/A Modern Utopia/page (203).png',
    'books/A Modern Utopia/page (204).png',
    'books/A Modern Utopia/page (205).png',
    'books/A Modern Utopia/page (206).png',
    'books/A Modern Utopia/page (207).png',
    'books/A Modern Utopia/page (208).png',
    'books/A Modern Utopia/page (209).png',
    'books/A Modern Utopia/page (210).png',
    'books/A Modern Utopia/page (211).png',
    'books/A Modern Utopia/page (212).png',
    'books/A Modern Utopia/page (213).png',
    'books/A Modern Utopia/page (214).png',
    'books/A Modern Utopia/page (215).png',
    'books/A Modern Utopia/page (216).png',
    'books/A Modern Utopia/page (217).png',
    'books/A Modern Utopia/page (218).png',
    'books/A Modern Utopia/page (219).png',
    'books/A Modern Utopia/page (220).png',
    'books/A Modern Utopia/page (221).png',
    'books/A Modern Utopia/page (222).png',
    'books/A Modern Utopia/page (223).png',
    'books/A Modern Utopia/page (224).png',
    'books/A Modern Utopia/page (225).png',
    'books/A Modern Utopia/page (226).png',
    'books/A Modern Utopia/page (227).png',
    'books/A Modern Utopia/page (228).png',
    'books/A Modern Utopia/page (229).png',
    'books/A Modern Utopia/page (230).png',
    'books/A Modern Utopia/page (231).png',
    'books/A Modern Utopia/page (232).png',
    'books/A Modern Utopia/page (233).png',
    'books/A Modern Utopia/page (234).png',
    'books/A Modern Utopia/page (235).png',
    'books/A Modern Utopia/page (236).png',
    'books/A Modern Utopia/page (237).png',
    'books/A Modern Utopia/page (238).png',
    'books/A Modern Utopia/page (239).png',
    'books/A Modern Utopia/page (240).png',
    'books/A Modern Utopia/page (241).png',
    'books/A Modern Utopia/page (242).png',
    'books/A Modern Utopia/page (243).png',
    'books/A Modern Utopia/page (244).png',
    'books/A Modern Utopia/page (245).png',

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
