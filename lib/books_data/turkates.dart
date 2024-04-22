import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class turkates extends StatefulWidget {
  const turkates({Key? key}) : super(key: key);

  @override
  State<turkates> createState() => _turkatesState();
}

class _turkatesState extends State<turkates> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/turkun atesle imtihani/page (1).png',
    'books/turkun atesle imtihani/page (2).png',
    'books/turkun atesle imtihani/page (3).png',
    'books/turkun atesle imtihani/page (4).png',
    'books/turkun atesle imtihani/page (5).png',
    'books/turkun atesle imtihani/page (6).png',
    'books/turkun atesle imtihani/page (7).png',
    'books/turkun atesle imtihani/page (8).png',
    'books/turkun atesle imtihani/page (9).png',
    'books/turkun atesle imtihani/page (10).png',
    'books/turkun atesle imtihani/page (11).png',
    'books/turkun atesle imtihani/page (12).png',
    'books/turkun atesle imtihani/page (13).png',
    'books/turkun atesle imtihani/page (14).png',
    'books/turkun atesle imtihani/page (15).png',
    'books/turkun atesle imtihani/page (16).png',
    'books/turkun atesle imtihani/page (17).png',
    'books/turkun atesle imtihani/page (18).png',
    'books/turkun atesle imtihani/page (19).png',
    'books/turkun atesle imtihani/page (20).png',
    'books/turkun atesle imtihani/page (21).png',
    'books/turkun atesle imtihani/page (22).png',
    'books/turkun atesle imtihani/page (23).png',
    'books/turkun atesle imtihani/page (24).png',
    'books/turkun atesle imtihani/page (25).png',
    'books/turkun atesle imtihani/page (26).png',
    'books/turkun atesle imtihani/page (27).png',
    'books/turkun atesle imtihani/page (28).png',
    'books/turkun atesle imtihani/page (29).png',
    'books/turkun atesle imtihani/page (30).png',
    'books/turkun atesle imtihani/page (31).png',
    'books/turkun atesle imtihani/page (32).png',
    'books/turkun atesle imtihani/page (33).png',
    'books/turkun atesle imtihani/page (34).png',
    'books/turkun atesle imtihani/page (35).png',
    'books/turkun atesle imtihani/page (36).png',
    'books/turkun atesle imtihani/page (37).png',
    'books/turkun atesle imtihani/page (38).png',
    'books/turkun atesle imtihani/page (39).png',
    'books/turkun atesle imtihani/page (40).png',
    'books/turkun atesle imtihani/page (41).png',
    'books/turkun atesle imtihani/page (42).png',
    'books/turkun atesle imtihani/page (43).png',
    'books/turkun atesle imtihani/page (44).png',
    'books/turkun atesle imtihani/page (45).png',
    'books/turkun atesle imtihani/page (46).png',
    'books/turkun atesle imtihani/page (47).png',
    'books/turkun atesle imtihani/page (48).png',
    'books/turkun atesle imtihani/page (49).png',
    'books/turkun atesle imtihani/page (50).png',
    'books/turkun atesle imtihani/page (51).png',
    'books/turkun atesle imtihani/page (52).png',
    'books/turkun atesle imtihani/page (53).png',
    'books/turkun atesle imtihani/page (54).png',
    'books/turkun atesle imtihani/page (55).png',
    'books/turkun atesle imtihani/page (56).png',
    'books/turkun atesle imtihani/page (57).png',
    'books/turkun atesle imtihani/page (58).png',
    'books/turkun atesle imtihani/page (59).png',
    'books/turkun atesle imtihani/page (60).png',
    'books/turkun atesle imtihani/page (61).png',
    'books/turkun atesle imtihani/page (62).png',
    'books/turkun atesle imtihani/page (63).png',
    'books/turkun atesle imtihani/page (64).png',
    'books/turkun atesle imtihani/page (65).png',
    'books/turkun atesle imtihani/page (66).png',
    'books/turkun atesle imtihani/page (67).png',
    'books/turkun atesle imtihani/page (68).png',
    'books/turkun atesle imtihani/page (69).png',
    'books/turkun atesle imtihani/page (70).png',
    'books/turkun atesle imtihani/page (71).png',
    'books/turkun atesle imtihani/page (72).png',
    'books/turkun atesle imtihani/page (73).png',
    'books/turkun atesle imtihani/page (74).png',
    'books/turkun atesle imtihani/page (75).png',
    'books/turkun atesle imtihani/page (76).png',
    'books/turkun atesle imtihani/page (77).png',
    'books/turkun atesle imtihani/page (78).png',
    'books/turkun atesle imtihani/page (79).png',
    'books/turkun atesle imtihani/page (80).png',
    'books/turkun atesle imtihani/page (81).png',
    'books/turkun atesle imtihani/page (82).png',
    'books/turkun atesle imtihani/page (83).png',
    'books/turkun atesle imtihani/page (84).png',
    'books/turkun atesle imtihani/page (85).png',
    'books/turkun atesle imtihani/page (86).png',
    'books/turkun atesle imtihani/page (87).png',
    'books/turkun atesle imtihani/page (88).png',
    'books/turkun atesle imtihani/page (89).png',
    'books/turkun atesle imtihani/page (90).png',
    'books/turkun atesle imtihani/page (91).png',
    'books/turkun atesle imtihani/page (92).png',
    'books/turkun atesle imtihani/page (93).png',
    'books/turkun atesle imtihani/page (94).png',
    'books/turkun atesle imtihani/page (95).png',
    'books/turkun atesle imtihani/page (96).png',
    'books/turkun atesle imtihani/page (97).png',
    'books/turkun atesle imtihani/page (98).png',
    'books/turkun atesle imtihani/page (99).png',
    'books/turkun atesle imtihani/page (100).png',
    'books/turkun atesle imtihani/page (101).png',
    'books/turkun atesle imtihani/page (102).png',
    'books/turkun atesle imtihani/page (103).png',
    'books/turkun atesle imtihani/page (104).png',
    'books/turkun atesle imtihani/page (105).png',
    'books/turkun atesle imtihani/page (106).png',
    'books/turkun atesle imtihani/page (107).png',
    'books/turkun atesle imtihani/page (108).png',
    'books/turkun atesle imtihani/page (109).png',
    'books/turkun atesle imtihani/page (110).png',
    'books/turkun atesle imtihani/page (111).png',
    'books/turkun atesle imtihani/page (112).png',
    'books/turkun atesle imtihani/page (113).png',
    'books/turkun atesle imtihani/page (114).png',
    'books/turkun atesle imtihani/page (115).png',
    'books/turkun atesle imtihani/page (116).png',
    'books/turkun atesle imtihani/page (117).png',
    'books/turkun atesle imtihani/page (118).png',
    'books/turkun atesle imtihani/page (119).png',
    'books/turkun atesle imtihani/page (120).png',
    'books/turkun atesle imtihani/page (121).png',
    'books/turkun atesle imtihani/page (122).png',
    'books/turkun atesle imtihani/page (123).png',
    'books/turkun atesle imtihani/page (124).png',
    'books/turkun atesle imtihani/page (125).png',
    'books/turkun atesle imtihani/page (126).png',
    'books/turkun atesle imtihani/page (127).png',
    'books/turkun atesle imtihani/page (128).png',
    'books/turkun atesle imtihani/page (129).png',
    'books/turkun atesle imtihani/page (130).png',
    'books/turkun atesle imtihani/page (131).png',
    'books/turkun atesle imtihani/page (132).png',
    'books/turkun atesle imtihani/page (133).png',
    'books/turkun atesle imtihani/page (134).png',
    'books/turkun atesle imtihani/page (135).png',
    'books/turkun atesle imtihani/page (136).png',
    'books/turkun atesle imtihani/page (137).png',
    'books/turkun atesle imtihani/page (138).png',
    'books/turkun atesle imtihani/page (139).png',
    'books/turkun atesle imtihani/page (140).png',
    'books/turkun atesle imtihani/page (141).png',
    'books/turkun atesle imtihani/page (142).png',
    'books/turkun atesle imtihani/page (143).png',
    'books/turkun atesle imtihani/page (144).png',
    'books/turkun atesle imtihani/page (145).png',
    'books/turkun atesle imtihani/page (146).png',
    'books/turkun atesle imtihani/page (147).png',
    'books/turkun atesle imtihani/page (148).png',
    'books/turkun atesle imtihani/page (149).png',
    'books/turkun atesle imtihani/page (150).png',
    'books/turkun atesle imtihani/page (151).png',
    'books/turkun atesle imtihani/page (152).png',
    'books/turkun atesle imtihani/page (153).png',
    'books/turkun atesle imtihani/page (154).png',
    'books/turkun atesle imtihani/page (155).png',
    'books/turkun atesle imtihani/page (156).png',
    'books/turkun atesle imtihani/page (157).png',
    'books/turkun atesle imtihani/page (158).png',
    'books/turkun atesle imtihani/page (159).png',
    'books/turkun atesle imtihani/page (160).png',
    'books/turkun atesle imtihani/page (161).png',
    'books/turkun atesle imtihani/page (162).png',
    'books/turkun atesle imtihani/page (163).png',
    'books/turkun atesle imtihani/page (164).png',
    'books/turkun atesle imtihani/page (165).png',
    'books/turkun atesle imtihani/page (166).png',
    'books/turkun atesle imtihani/page (167).png',
    'books/turkun atesle imtihani/page (168).png',
    'books/turkun atesle imtihani/page (169).png',
    'books/turkun atesle imtihani/page (170).png',
    'books/turkun atesle imtihani/page (171).png',
    'books/turkun atesle imtihani/page (172).png',
    'books/turkun atesle imtihani/page (173).png',
    'books/turkun atesle imtihani/page (174).png',
    'books/turkun atesle imtihani/page (175).png',
    'books/turkun atesle imtihani/page (176).png',
    'books/turkun atesle imtihani/page (177).png',
    'books/turkun atesle imtihani/page (178).png',
    'books/turkun atesle imtihani/page (179).png',
    'books/turkun atesle imtihani/page (180).png',
    'books/turkun atesle imtihani/page (181).png',
    'books/turkun atesle imtihani/page (182).png',
    'books/turkun atesle imtihani/page (183).png',
    'books/turkun atesle imtihani/page (184).png',
    'books/turkun atesle imtihani/page (185).png',
    'books/turkun atesle imtihani/page (186).png',
    'books/turkun atesle imtihani/page (187).png',
    'books/turkun atesle imtihani/page (188).png',
    'books/turkun atesle imtihani/page (189).png',
    'books/turkun atesle imtihani/page (190).png',
    'books/turkun atesle imtihani/page (191).png',
    'books/turkun atesle imtihani/page (192).png',
    'books/turkun atesle imtihani/page (193).png',
    'books/turkun atesle imtihani/page (194).png',
    'books/turkun atesle imtihani/page (195).png',

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
