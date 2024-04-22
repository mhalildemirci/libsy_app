import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class adventruressherlock extends StatefulWidget {
  const adventruressherlock({Key? key}) : super(key: key);

  @override
  State<adventruressherlock> createState() => _adventruressherlockState();
}

class _adventruressherlockState extends State<adventruressherlock> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/the adventrures sherlock/page (1).png',
    'books/the adventrures sherlock/page (2).png',
    'books/the adventrures sherlock/page (3).png',
    'books/the adventrures sherlock/page (4).png',
    'books/the adventrures sherlock/page (5).png',
    'books/the adventrures sherlock/page (6).png',
    'books/the adventrures sherlock/page (7).png',
    'books/the adventrures sherlock/page (8).png',
    'books/the adventrures sherlock/page (9).png',
    'books/the adventrures sherlock/page (10).png',
    'books/the adventrures sherlock/page (11).png',
    'books/the adventrures sherlock/page (12).png',
    'books/the adventrures sherlock/page (13).png',
    'books/the adventrures sherlock/page (14).png',
    'books/the adventrures sherlock/page (15).png',
    'books/the adventrures sherlock/page (16).png',
    'books/the adventrures sherlock/page (17).png',
    'books/the adventrures sherlock/page (18).png',
    'books/the adventrures sherlock/page (19).png',
    'books/the adventrures sherlock/page (20).png',
    'books/the adventrures sherlock/page (21).png',
    'books/the adventrures sherlock/page (22).png',
    'books/the adventrures sherlock/page (23).png',
    'books/the adventrures sherlock/page (24).png',
    'books/the adventrures sherlock/page (25).png',
    'books/the adventrures sherlock/page (26).png',
    'books/the adventrures sherlock/page (27).png',
    'books/the adventrures sherlock/page (28).png',
    'books/the adventrures sherlock/page (29).png',
    'books/the adventrures sherlock/page (30).png',
    'books/the adventrures sherlock/page (31).png',
    'books/the adventrures sherlock/page (32).png',
    'books/the adventrures sherlock/page (33).png',
    'books/the adventrures sherlock/page (34).png',
    'books/the adventrures sherlock/page (35).png',
    'books/the adventrures sherlock/page (36).png',
    'books/the adventrures sherlock/page (37).png',
    'books/the adventrures sherlock/page (38).png',
    'books/the adventrures sherlock/page (39).png',
    'books/the adventrures sherlock/page (40).png',
    'books/the adventrures sherlock/page (41).png',
    'books/the adventrures sherlock/page (42).png',
    'books/the adventrures sherlock/page (43).png',
    'books/the adventrures sherlock/page (44).png',
    'books/the adventrures sherlock/page (45).png',
    'books/the adventrures sherlock/page (46).png',
    'books/the adventrures sherlock/page (47).png',
    'books/the adventrures sherlock/page (48).png',
    'books/the adventrures sherlock/page (49).png',
    'books/the adventrures sherlock/page (50).png',
    'books/the adventrures sherlock/page (51).png',
    'books/the adventrures sherlock/page (52).png',
    'books/the adventrures sherlock/page (53).png',
    'books/the adventrures sherlock/page (54).png',
    'books/the adventrures sherlock/page (55).png',
    'books/the adventrures sherlock/page (56).png',
    'books/the adventrures sherlock/page (57).png',
    'books/the adventrures sherlock/page (58).png',
    'books/the adventrures sherlock/page (59).png',
    'books/the adventrures sherlock/page (60).png',
    'books/the adventrures sherlock/page (61).png',
    'books/the adventrures sherlock/page (62).png',
    'books/the adventrures sherlock/page (63).png',
    'books/the adventrures sherlock/page (64).png',
    'books/the adventrures sherlock/page (65).png',
    'books/the adventrures sherlock/page (66).png',
    'books/the adventrures sherlock/page (67).png',
    'books/the adventrures sherlock/page (68).png',
    'books/the adventrures sherlock/page (69).png',
    'books/the adventrures sherlock/page (70).png',
    'books/the adventrures sherlock/page (71).png',
    'books/the adventrures sherlock/page (72).png',
    'books/the adventrures sherlock/page (73).png',
    'books/the adventrures sherlock/page (74).png',
    'books/the adventrures sherlock/page (75).png',
    'books/the adventrures sherlock/page (76).png',
    'books/the adventrures sherlock/page (77).png',
    'books/the adventrures sherlock/page (78).png',
    'books/the adventrures sherlock/page (79).png',
    'books/the adventrures sherlock/page (80).png',
    'books/the adventrures sherlock/page (81).png',
    'books/the adventrures sherlock/page (82).png',
    'books/the adventrures sherlock/page (83).png',
    'books/the adventrures sherlock/page (84).png',
    'books/the adventrures sherlock/page (85).png',
    'books/the adventrures sherlock/page (86).png',
    'books/the adventrures sherlock/page (87).png',
    'books/the adventrures sherlock/page (88).png',
    'books/the adventrures sherlock/page (89).png',
    'books/the adventrures sherlock/page (90).png',
    'books/the adventrures sherlock/page (91).png',
    'books/the adventrures sherlock/page (92).png',
    'books/the adventrures sherlock/page (93).png',
    'books/the adventrures sherlock/page (94).png',
    'books/the adventrures sherlock/page (95).png',
    'books/the adventrures sherlock/page (96).png',
    'books/the adventrures sherlock/page (97).png',
    'books/the adventrures sherlock/page (98).png',
    'books/the adventrures sherlock/page (99).png',
    'books/the adventrures sherlock/page (100).png',
    'books/the adventrures sherlock/page (101).png',
    'books/the adventrures sherlock/page (102).png',
    'books/the adventrures sherlock/page (103).png',
    'books/the adventrures sherlock/page (104).png',
    'books/the adventrures sherlock/page (105).png',
    'books/the adventrures sherlock/page (106).png',
    'books/the adventrures sherlock/page (107).png',
    'books/the adventrures sherlock/page (108).png',
    'books/the adventrures sherlock/page (109).png',
    'books/the adventrures sherlock/page (110).png',
    'books/the adventrures sherlock/page (111).png',
    'books/the adventrures sherlock/page (112).png',
    'books/the adventrures sherlock/page (113).png',
    'books/the adventrures sherlock/page (114).png',
    'books/the adventrures sherlock/page (115).png',
    'books/the adventrures sherlock/page (116).png',
    'books/the adventrures sherlock/page (117).png',
    'books/the adventrures sherlock/page (118).png',
    'books/the adventrures sherlock/page (119).png',
    'books/the adventrures sherlock/page (120).png',
    'books/the adventrures sherlock/page (121).png',
    'books/the adventrures sherlock/page (122).png',
    'books/the adventrures sherlock/page (123).png',
    'books/the adventrures sherlock/page (124).png',
    'books/the adventrures sherlock/page (125).png',
    'books/the adventrures sherlock/page (126).png',
    'books/the adventrures sherlock/page (127).png',
    'books/the adventrures sherlock/page (128).png',
    'books/the adventrures sherlock/page (129).png',
    'books/the adventrures sherlock/page (130).png',
    'books/the adventrures sherlock/page (131).png',
    'books/the adventrures sherlock/page (132).png',
    'books/the adventrures sherlock/page (133).png',
    'books/the adventrures sherlock/page (134).png',
    'books/the adventrures sherlock/page (135).png',
    'books/the adventrures sherlock/page (136).png',
    'books/the adventrures sherlock/page (137).png',
    'books/the adventrures sherlock/page (138).png',
    'books/the adventrures sherlock/page (139).png',
    'books/the adventrures sherlock/page (140).png',
    'books/the adventrures sherlock/page (141).png',
    'books/the adventrures sherlock/page (142).png',
    'books/the adventrures sherlock/page (143).png',
    'books/the adventrures sherlock/page (144).png',
    'books/the adventrures sherlock/page (145).png',
    'books/the adventrures sherlock/page (146).png',
    'books/the adventrures sherlock/page (147).png',
    'books/the adventrures sherlock/page (148).png',
    'books/the adventrures sherlock/page (149).png',
    'books/the adventrures sherlock/page (150).png',
    'books/the adventrures sherlock/page (151).png',
    'books/the adventrures sherlock/page (152).png',
    'books/the adventrures sherlock/page (153).png',
    'books/the adventrures sherlock/page (154).png',
    'books/the adventrures sherlock/page (155).png',
    'books/the adventrures sherlock/page (156).png',
    'books/the adventrures sherlock/page (157).png',
    'books/the adventrures sherlock/page (158).png',
    'books/the adventrures sherlock/page (159).png',
    'books/the adventrures sherlock/page (160).png',
    'books/the adventrures sherlock/page (161).png',
    'books/the adventrures sherlock/page (162).png',
    'books/the adventrures sherlock/page (163).png',
    'books/the adventrures sherlock/page (164).png',
    'books/the adventrures sherlock/page (165).png',
    'books/the adventrures sherlock/page (166).png',
    'books/the adventrures sherlock/page (167).png',
    'books/the adventrures sherlock/page (168).png',
    'books/the adventrures sherlock/page (169).png',
    'books/the adventrures sherlock/page (170).png',
    'books/the adventrures sherlock/page (171).png',
    'books/the adventrures sherlock/page (172).png',
    'books/the adventrures sherlock/page (173).png',
    'books/the adventrures sherlock/page (174).png',
    'books/the adventrures sherlock/page (175).png',
    'books/the adventrures sherlock/page (176).png',
    'books/the adventrures sherlock/page (177).png',
    'books/the adventrures sherlock/page (178).png',
    'books/the adventrures sherlock/page (179).png',
    'books/the adventrures sherlock/page (180).png',
    'books/the adventrures sherlock/page (181).png',
    'books/the adventrures sherlock/page (182).png',
    'books/the adventrures sherlock/page (183).png',
    'books/the adventrures sherlock/page (184).png',
    'books/the adventrures sherlock/page (185).png',
    'books/the adventrures sherlock/page (186).png',
    'books/the adventrures sherlock/page (187).png',
    'books/the adventrures sherlock/page (188).png',
    'books/the adventrures sherlock/page (189).png',
    'books/the adventrures sherlock/page (190).png',
    'books/the adventrures sherlock/page (191).png',

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
