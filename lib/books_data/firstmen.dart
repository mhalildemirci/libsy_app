import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class firstmen extends StatefulWidget {
  const firstmen({Key? key}) : super(key: key);

  @override
  State<firstmen> createState() => _firstmenState();
}

class _firstmenState extends State<firstmen> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/first men/page (1).png',
    'books/first men/page (2).png',
    'books/first men/page (3).png',
    'books/first men/page (4).png',
    'books/first men/page (5).png',
    'books/first men/page (6).png',
    'books/first men/page (7).png',
    'books/first men/page (8).png',
    'books/first men/page (9).png',
    'books/first men/page (10).png',
    'books/first men/page (11).png',
    'books/first men/page (12).png',
    'books/first men/page (13).png',
    'books/first men/page (14).png',
    'books/first men/page (15).png',
    'books/first men/page (16).png',
    'books/first men/page (17).png',
    'books/first men/page (18).png',
    'books/first men/page (19).png',
    'books/first men/page (20).png',
    'books/first men/page (21).png',
    'books/first men/page (22).png',
    'books/first men/page (23).png',
    'books/first men/page (24).png',
    'books/first men/page (25).png',
    'books/first men/page (26).png',
    'books/first men/page (27).png',
    'books/first men/page (28).png',
    'books/first men/page (29).png',
    'books/first men/page (30).png',
    'books/first men/page (31).png',
    'books/first men/page (32).png',
    'books/first men/page (33).png',
    'books/first men/page (34).png',
    'books/first men/page (35).png',
    'books/first men/page (36).png',
    'books/first men/page (37).png',
    'books/first men/page (38).png',
    'books/first men/page (39).png',
    'books/first men/page (40).png',
    'books/first men/page (41).png',
    'books/first men/page (42).png',
    'books/first men/page (43).png',
    'books/first men/page (44).png',
    'books/first men/page (45).png',
    'books/first men/page (46).png',
    'books/first men/page (47).png',
    'books/first men/page (48).png',
    'books/first men/page (49).png',
    'books/first men/page (50).png',
    'books/first men/page (51).png',
    'books/first men/page (52).png',
    'books/first men/page (53).png',
    'books/first men/page (54).png',
    'books/first men/page (55).png',
    'books/first men/page (56).png',
    'books/first men/page (57).png',
    'books/first men/page (58).png',
    'books/first men/page (59).png',
    'books/first men/page (60).png',
    'books/first men/page (61).png',
    'books/first men/page (62).png',
    'books/first men/page (63).png',
    'books/first men/page (64).png',
    'books/first men/page (65).png',
    'books/first men/page (66).png',
    'books/first men/page (67).png',
    'books/first men/page (68).png',
    'books/first men/page (69).png',
    'books/first men/page (70).png',
    'books/first men/page (71).png',
    'books/first men/page (72).png',
    'books/first men/page (73).png',
    'books/first men/page (74).png',
    'books/first men/page (75).png',
    'books/first men/page (76).png',
    'books/first men/page (77).png',
    'books/first men/page (78).png',
    'books/first men/page (79).png',
    'books/first men/page (80).png',
    'books/first men/page (81).png',
    'books/first men/page (82).png',
    'books/first men/page (83).png',
    'books/first men/page (84).png',
    'books/first men/page (85).png',
    'books/first men/page (86).png',
    'books/first men/page (87).png',
    'books/first men/page (88).png',
    'books/first men/page (89).png',
    'books/first men/page (90).png',
    'books/first men/page (91).png',
    'books/first men/page (92).png',
    'books/first men/page (93).png',
    'books/first men/page (94).png',
    'books/first men/page (95).png',
    'books/first men/page (96).png',
    'books/first men/page (97).png',
    'books/first men/page (98).png',
    'books/first men/page (99).png',
    'books/first men/page (100).png',
    'books/first men/page (101).png',
    'books/first men/page (102).png',
    'books/first men/page (103).png',
    'books/first men/page (104).png',
    'books/first men/page (105).png',
    'books/first men/page (106).png',
    'books/first men/page (107).png',
    'books/first men/page (108).png',
    'books/first men/page (109).png',
    'books/first men/page (110).png',
    'books/first men/page (111).png',
    'books/first men/page (112).png',
    'books/first men/page (113).png',
    'books/first men/page (114).png',
    'books/first men/page (115).png',
    'books/first men/page (116).png',
    'books/first men/page (117).png',
    'books/first men/page (118).png',
    'books/first men/page (119).png',
    'books/first men/page (120).png',
    'books/first men/page (121).png',
    'books/first men/page (122).png',
    'books/first men/page (123).png',
    'books/first men/page (124).png',
    'books/first men/page (125).png',
    'books/first men/page (126).png',
    'books/first men/page (127).png',
    'books/first men/page (128).png',
    'books/first men/page (129).png',
    'books/first men/page (130).png',
    'books/first men/page (131).png',
    'books/first men/page (132).png',
    'books/first men/page (133).png',
    'books/first men/page (134).png',
    'books/first men/page (135).png',
    'books/first men/page (136).png',
    'books/first men/page (137).png',
    'books/first men/page (138).png',
    'books/first men/page (139).png',
    'books/first men/page (140).png',
    'books/first men/page (141).png',
    'books/first men/page (142).png',
    'books/first men/page (143).png',
    'books/first men/page (144).png',
    'books/first men/page (145).png',
    'books/first men/page (146).png',
    'books/first men/page (147).png',
    'books/first men/page (148).png',
    'books/first men/page (149).png',
    'books/first men/page (150).png',
    'books/first men/page (151).png',
    'books/first men/page (152).png',
    'books/first men/page (153).png',
    'books/first men/page (154).png',
    'books/first men/page (155).png',
    'books/first men/page (156).png',
    'books/first men/page (157).png',
    'books/first men/page (158).png',
    'books/first men/page (159).png',
    'books/first men/page (160).png',
    'books/first men/page (161).png',
    'books/first men/page (162).png',
    'books/first men/page (163).png',
    'books/first men/page (164).png',
    'books/first men/page (165).png',
    'books/first men/page (166).png',
    'books/first men/page (167).png',
    'books/first men/page (168).png',
    'books/first men/page (169).png',
    'books/first men/page (170).png',
    'books/first men/page (171).png',
    'books/first men/page (172).png',
    'books/first men/page (173).png',
    'books/first men/page (174).png',
    'books/first men/page (175).png',
    'books/first men/page (176).png',
    'books/first men/page (177).png',
    'books/first men/page (178).png',
    'books/first men/page (179).png',
    'books/first men/page (180).png',
    'books/first men/page (181).png',
    'books/first men/page (182).png',
    'books/first men/page (183).png',
    'books/first men/page (184).png',
    'books/first men/page (185).png',
    'books/first men/page (186).png',
    'books/first men/page (187).png',
    'books/first men/page (188).png',
    'books/first men/page (189).png',
    'books/first men/page (190).png',
    'books/first men/page (191).png',
    'books/first men/page (192).png',
    'books/first men/page (193).png',
    'books/first men/page (194).png',
    'books/first men/page (195).png',
    'books/first men/page (196).png',
    'books/first men/page (197).png',
    'books/first men/page (198).png',
    'books/first men/page (199).png',
    'books/first men/page (200).png',
    'books/first men/page (201).png',
    'books/first men/page (202).png',

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
