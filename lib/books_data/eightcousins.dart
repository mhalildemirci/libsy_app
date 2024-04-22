import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class eightcousins extends StatefulWidget {
  const eightcousins({Key? key}) : super(key: key);

  @override
  State<eightcousins> createState() => _eightcousinsState();
}

class _eightcousinsState extends State<eightcousins> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/eight cousins/page (1).png',
    'books/eight cousins/page (2).png',
    'books/eight cousins/page (3).png',
    'books/eight cousins/page (4).png',
    'books/eight cousins/page (5).png',
    'books/eight cousins/page (6).png',
    'books/eight cousins/page (7).png',
    'books/eight cousins/page (8).png',
    'books/eight cousins/page (9).png',
    'books/eight cousins/page (10).png',
    'books/eight cousins/page (11).png',
    'books/eight cousins/page (12).png',
    'books/eight cousins/page (13).png',
    'books/eight cousins/page (14).png',
    'books/eight cousins/page (15).png',
    'books/eight cousins/page (16).png',
    'books/eight cousins/page (17).png',
    'books/eight cousins/page (18).png',
    'books/eight cousins/page (19).png',
    'books/eight cousins/page (20).png',
    'books/eight cousins/page (21).png',
    'books/eight cousins/page (22).png',
    'books/eight cousins/page (23).png',
    'books/eight cousins/page (24).png',
    'books/eight cousins/page (25).png',
    'books/eight cousins/page (26).png',
    'books/eight cousins/page (27).png',
    'books/eight cousins/page (28).png',
    'books/eight cousins/page (29).png',
    'books/eight cousins/page (30).png',
    'books/eight cousins/page (31).png',
    'books/eight cousins/page (32).png',
    'books/eight cousins/page (33).png',
    'books/eight cousins/page (34).png',
    'books/eight cousins/page (35).png',
    'books/eight cousins/page (36).png',
    'books/eight cousins/page (37).png',
    'books/eight cousins/page (38).png',
    'books/eight cousins/page (39).png',
    'books/eight cousins/page (40).png',
    'books/eight cousins/page (41).png',
    'books/eight cousins/page (42).png',
    'books/eight cousins/page (43).png',
    'books/eight cousins/page (44).png',
    'books/eight cousins/page (45).png',
    'books/eight cousins/page (46).png',
    'books/eight cousins/page (47).png',
    'books/eight cousins/page (48).png',
    'books/eight cousins/page (49).png',
    'books/eight cousins/page (50).png',
    'books/eight cousins/page (51).png',
    'books/eight cousins/page (52).png',
    'books/eight cousins/page (53).png',
    'books/eight cousins/page (54).png',
    'books/eight cousins/page (55).png',
    'books/eight cousins/page (56).png',
    'books/eight cousins/page (57).png',
    'books/eight cousins/page (58).png',
    'books/eight cousins/page (59).png',
    'books/eight cousins/page (60).png',
    'books/eight cousins/page (61).png',
    'books/eight cousins/page (62).png',
    'books/eight cousins/page (63).png',
    'books/eight cousins/page (64).png',
    'books/eight cousins/page (65).png',
    'books/eight cousins/page (66).png',
    'books/eight cousins/page (67).png',
    'books/eight cousins/page (68).png',
    'books/eight cousins/page (69).png',
    'books/eight cousins/page (70).png',
    'books/eight cousins/page (71).png',
    'books/eight cousins/page (72).png',
    'books/eight cousins/page (73).png',
    'books/eight cousins/page (74).png',
    'books/eight cousins/page (75).png',
    'books/eight cousins/page (76).png',
    'books/eight cousins/page (77).png',
    'books/eight cousins/page (78).png',
    'books/eight cousins/page (79).png',
    'books/eight cousins/page (80).png',
    'books/eight cousins/page (81).png',
    'books/eight cousins/page (82).png',
    'books/eight cousins/page (83).png',
    'books/eight cousins/page (84).png',
    'books/eight cousins/page (85).png',
    'books/eight cousins/page (86).png',
    'books/eight cousins/page (87).png',
    'books/eight cousins/page (88).png',
    'books/eight cousins/page (89).png',
    'books/eight cousins/page (90).png',
    'books/eight cousins/page (91).png',
    'books/eight cousins/page (92).png',
    'books/eight cousins/page (93).png',
    'books/eight cousins/page (94).png',
    'books/eight cousins/page (95).png',
    'books/eight cousins/page (96).png',
    'books/eight cousins/page (97).png',
    'books/eight cousins/page (98).png',
    'books/eight cousins/page (99).png',
    'books/eight cousins/page (100).png',
    'books/eight cousins/page (101).png',
    'books/eight cousins/page (102).png',
    'books/eight cousins/page (103).png',
    'books/eight cousins/page (104).png',
    'books/eight cousins/page (105).png',
    'books/eight cousins/page (106).png',
    'books/eight cousins/page (107).png',
    'books/eight cousins/page (108).png',
    'books/eight cousins/page (109).png',
    'books/eight cousins/page (110).png',
    'books/eight cousins/page (111).png',
    'books/eight cousins/page (112).png',
    'books/eight cousins/page (113).png',
    'books/eight cousins/page (114).png',
    'books/eight cousins/page (115).png',
    'books/eight cousins/page (116).png',
    'books/eight cousins/page (117).png',
    'books/eight cousins/page (118).png',
    'books/eight cousins/page (119).png',
    'books/eight cousins/page (120).png',
    'books/eight cousins/page (121).png',
    'books/eight cousins/page (122).png',
    'books/eight cousins/page (123).png',
    'books/eight cousins/page (124).png',
    'books/eight cousins/page (125).png',
    'books/eight cousins/page (126).png',
    'books/eight cousins/page (127).png',
    'books/eight cousins/page (128).png',
    'books/eight cousins/page (129).png',
    'books/eight cousins/page (130).png',
    'books/eight cousins/page (131).png',
    'books/eight cousins/page (132).png',
    'books/eight cousins/page (133).png',
    'books/eight cousins/page (134).png',
    'books/eight cousins/page (135).png',
    'books/eight cousins/page (136).png',
    'books/eight cousins/page (137).png',
    'books/eight cousins/page (138).png',
    'books/eight cousins/page (139).png',
    'books/eight cousins/page (140).png',
    'books/eight cousins/page (141).png',
    'books/eight cousins/page (142).png',
    'books/eight cousins/page (143).png',
    'books/eight cousins/page (144).png',
    'books/eight cousins/page (145).png',
    'books/eight cousins/page (146).png',
    'books/eight cousins/page (147).png',
    'books/eight cousins/page (148).png',
    'books/eight cousins/page (149).png',
    'books/eight cousins/page (150).png',
    'books/eight cousins/page (151).png',
    'books/eight cousins/page (152).png',
    'books/eight cousins/page (153).png',
    'books/eight cousins/page (154).png',
    'books/eight cousins/page (155).png',
    'books/eight cousins/page (156).png',
    'books/eight cousins/page (157).png',
    'books/eight cousins/page (158).png',
    'books/eight cousins/page (159).png',
    'books/eight cousins/page (160).png',
    'books/eight cousins/page (161).png',
    'books/eight cousins/page (162).png',
    'books/eight cousins/page (163).png',
    'books/eight cousins/page (164).png',
    'books/eight cousins/page (165).png',
    'books/eight cousins/page (166).png',
    'books/eight cousins/page (167).png',
    'books/eight cousins/page (168).png',
    'books/eight cousins/page (169).png',
    'books/eight cousins/page (170).png',
    'books/eight cousins/page (171).png',
    'books/eight cousins/page (172).png',
    'books/eight cousins/page (173).png',
    'books/eight cousins/page (174).png',
    'books/eight cousins/page (175).png',
    'books/eight cousins/page (176).png',
    'books/eight cousins/page (177).png',
    'books/eight cousins/page (178).png',
    'books/eight cousins/page (179).png',
    'books/eight cousins/page (180).png',
    'books/eight cousins/page (181).png',
    'books/eight cousins/page (182).png',
    'books/eight cousins/page (183).png',
    'books/eight cousins/page (184).png',
    'books/eight cousins/page (185).png',
    'books/eight cousins/page (186).png',
    'books/eight cousins/page (187).png',
    'books/eight cousins/page (188).png',
    'books/eight cousins/page (189).png',
    'books/eight cousins/page (190).png',
    'books/eight cousins/page (191).png',
    'books/eight cousins/page (192).png',
    'books/eight cousins/page (193).png',
    'books/eight cousins/page (194).png',
    'books/eight cousins/page (195).png',
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
