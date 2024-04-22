import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hardtimes extends StatefulWidget {
  const hardtimes({Key? key}) : super(key: key);

  @override
  State<hardtimes> createState() => _hardtimesState();
}

class _hardtimesState extends State<hardtimes> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/hard times/page (1).png',
    'books/hard times/page (2).png',
    'books/hard times/page (3).png',
    'books/hard times/page (4).png',
    'books/hard times/page (5).png',
    'books/hard times/page (6).png',
    'books/hard times/page (7).png',
    'books/hard times/page (8).png',
    'books/hard times/page (9).png',
    'books/hard times/page (10).png',
    'books/hard times/page (11).png',
    'books/hard times/page (12).png',
    'books/hard times/page (13).png',
    'books/hard times/page (14).png',
    'books/hard times/page (15).png',
    'books/hard times/page (16).png',
    'books/hard times/page (17).png',
    'books/hard times/page (18).png',
    'books/hard times/page (19).png',
    'books/hard times/page (20).png',
    'books/hard times/page (21).png',
    'books/hard times/page (22).png',
    'books/hard times/page (23).png',
    'books/hard times/page (24).png',
    'books/hard times/page (25).png',
    'books/hard times/page (26).png',
    'books/hard times/page (27).png',
    'books/hard times/page (28).png',
    'books/hard times/page (29).png',
    'books/hard times/page (30).png',
    'books/hard times/page (31).png',
    'books/hard times/page (32).png',
    'books/hard times/page (33).png',
    'books/hard times/page (34).png',
    'books/hard times/page (35).png',
    'books/hard times/page (36).png',
    'books/hard times/page (37).png',
    'books/hard times/page (38).png',
    'books/hard times/page (39).png',
    'books/hard times/page (40).png',
    'books/hard times/page (41).png',
    'books/hard times/page (42).png',
    'books/hard times/page (43).png',
    'books/hard times/page (44).png',
    'books/hard times/page (45).png',
    'books/hard times/page (46).png',
    'books/hard times/page (47).png',
    'books/hard times/page (48).png',
    'books/hard times/page (49).png',
    'books/hard times/page (50).png',
    'books/hard times/page (51).png',
    'books/hard times/page (52).png',
    'books/hard times/page (53).png',
    'books/hard times/page (54).png',
    'books/hard times/page (55).png',
    'books/hard times/page (56).png',
    'books/hard times/page (57).png',
    'books/hard times/page (58).png',
    'books/hard times/page (59).png',
    'books/hard times/page (60).png',
    'books/hard times/page (61).png',
    'books/hard times/page (62).png',
    'books/hard times/page (63).png',
    'books/hard times/page (64).png',
    'books/hard times/page (65).png',
    'books/hard times/page (66).png',
    'books/hard times/page (67).png',
    'books/hard times/page (68).png',
    'books/hard times/page (69).png',
    'books/hard times/page (70).png',
    'books/hard times/page (71).png',
    'books/hard times/page (72).png',
    'books/hard times/page (73).png',
    'books/hard times/page (74).png',
    'books/hard times/page (75).png',
    'books/hard times/page (76).png',
    'books/hard times/page (77).png',
    'books/hard times/page (78).png',
    'books/hard times/page (79).png',
    'books/hard times/page (80).png',
    'books/hard times/page (81).png',
    'books/hard times/page (82).png',
    'books/hard times/page (83).png',
    'books/hard times/page (84).png',
    'books/hard times/page (85).png',
    'books/hard times/page (86).png',
    'books/hard times/page (87).png',
    'books/hard times/page (88).png',
    'books/hard times/page (89).png',
    'books/hard times/page (90).png',
    'books/hard times/page (91).png',
    'books/hard times/page (92).png',
    'books/hard times/page (93).png',
    'books/hard times/page (94).png',
    'books/hard times/page (95).png',
    'books/hard times/page (96).png',
    'books/hard times/page (97).png',
    'books/hard times/page (98).png',
    'books/hard times/page (99).png',
    'books/hard times/page (100).png',
    'books/hard times/page (101).png',
    'books/hard times/page (102).png',
    'books/hard times/page (103).png',
    'books/hard times/page (104).png',
    'books/hard times/page (105).png',
    'books/hard times/page (106).png',
    'books/hard times/page (107).png',
    'books/hard times/page (108).png',
    'books/hard times/page (109).png',
    'books/hard times/page (110).png',
    'books/hard times/page (111).png',
    'books/hard times/page (112).png',
    'books/hard times/page (113).png',
    'books/hard times/page (114).png',
    'books/hard times/page (115).png',
    'books/hard times/page (116).png',
    'books/hard times/page (117).png',
    'books/hard times/page (118).png',
    'books/hard times/page (119).png',
    'books/hard times/page (120).png',
    'books/hard times/page (121).png',
    'books/hard times/page (122).png',
    'books/hard times/page (123).png',
    'books/hard times/page (124).png',
    'books/hard times/page (125).png',
    'books/hard times/page (126).png',
    'books/hard times/page (127).png',
    'books/hard times/page (128).png',
    'books/hard times/page (129).png',
    'books/hard times/page (130).png',
    'books/hard times/page (131).png',
    'books/hard times/page (132).png',
    'books/hard times/page (133).png',
    'books/hard times/page (134).png',
    'books/hard times/page (135).png',
    'books/hard times/page (136).png',
    'books/hard times/page (137).png',
    'books/hard times/page (138).png',
    'books/hard times/page (139).png',
    'books/hard times/page (140).png',
    'books/hard times/page (141).png',
    'books/hard times/page (142).png',
    'books/hard times/page (143).png',
    'books/hard times/page (144).png',
    'books/hard times/page (145).png',
    'books/hard times/page (146).png',
    'books/hard times/page (147).png',
    'books/hard times/page (148).png',
    'books/hard times/page (149).png',
    'books/hard times/page (150).png',
    'books/hard times/page (151).png',
    'books/hard times/page (152).png',
    'books/hard times/page (153).png',
    'books/hard times/page (154).png',
    'books/hard times/page (155).png',
    'books/hard times/page (156).png',
    'books/hard times/page (157).png',
    'books/hard times/page (158).png',
    'books/hard times/page (159).png',
    'books/hard times/page (160).png',
    'books/hard times/page (161).png',
    'books/hard times/page (162).png',
    'books/hard times/page (163).png',
    'books/hard times/page (164).png',
    'books/hard times/page (165).png',
    'books/hard times/page (166).png',
    'books/hard times/page (167).png',
    'books/hard times/page (168).png',
    'books/hard times/page (169).png',
    'books/hard times/page (170).png',
    'books/hard times/page (171).png',
    'books/hard times/page (172).png',
    'books/hard times/page (173).png',
    'books/hard times/page (174).png',
    'books/hard times/page (175).png',
    'books/hard times/page (176).png',
    'books/hard times/page (177).png',
    'books/hard times/page (178).png',
    'books/hard times/page (179).png',
    'books/hard times/page (180).png',
    'books/hard times/page (181).png',
    'books/hard times/page (182).png',
    'books/hard times/page (183).png',
    'books/hard times/page (184).png',
    'books/hard times/page (185).png',
    'books/hard times/page (186).png',
    'books/hard times/page (187).png',
    'books/hard times/page (188).png',
    'books/hard times/page (189).png',
    'books/hard times/page (190).png',
    'books/hard times/page (191).png',
    'books/hard times/page (192).png',
    'books/hard times/page (193).png',
    'books/hard times/page (194).png',

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
