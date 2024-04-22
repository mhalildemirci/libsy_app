import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class grandmeulnes extends StatefulWidget {
  const grandmeulnes({Key? key}) : super(key: key);

  @override
  State<grandmeulnes> createState() => _grandmeulnesState();
}

class _grandmeulnesState extends State<grandmeulnes> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/le grand meulnes/page (1).png',
    'books/le grand meulnes/page (2).png',
    'books/le grand meulnes/page (3).png',
    'books/le grand meulnes/page (4).png',
    'books/le grand meulnes/page (5).png',
    'books/le grand meulnes/page (6).png',
    'books/le grand meulnes/page (7).png',
    'books/le grand meulnes/page (8).png',
    'books/le grand meulnes/page (9).png',
    'books/le grand meulnes/page (10).png',
    'books/le grand meulnes/page (11).png',
    'books/le grand meulnes/page (12).png',
    'books/le grand meulnes/page (13).png',
    'books/le grand meulnes/page (14).png',
    'books/le grand meulnes/page (15).png',
    'books/le grand meulnes/page (16).png',
    'books/le grand meulnes/page (17).png',
    'books/le grand meulnes/page (18).png',
    'books/le grand meulnes/page (19).png',
    'books/le grand meulnes/page (20).png',
    'books/le grand meulnes/page (21).png',
    'books/le grand meulnes/page (22).png',
    'books/le grand meulnes/page (23).png',
    'books/le grand meulnes/page (24).png',
    'books/le grand meulnes/page (25).png',
    'books/le grand meulnes/page (26).png',
    'books/le grand meulnes/page (27).png',
    'books/le grand meulnes/page (28).png',
    'books/le grand meulnes/page (29).png',
    'books/le grand meulnes/page (30).png',
    'books/le grand meulnes/page (31).png',
    'books/le grand meulnes/page (32).png',
    'books/le grand meulnes/page (33).png',
    'books/le grand meulnes/page (34).png',
    'books/le grand meulnes/page (35).png',
    'books/le grand meulnes/page (36).png',
    'books/le grand meulnes/page (37).png',
    'books/le grand meulnes/page (38).png',
    'books/le grand meulnes/page (39).png',
    'books/le grand meulnes/page (40).png',
    'books/le grand meulnes/page (41).png',
    'books/le grand meulnes/page (42).png',
    'books/le grand meulnes/page (43).png',
    'books/le grand meulnes/page (44).png',
    'books/le grand meulnes/page (45).png',
    'books/le grand meulnes/page (46).png',
    'books/le grand meulnes/page (47).png',
    'books/le grand meulnes/page (48).png',
    'books/le grand meulnes/page (49).png',
    'books/le grand meulnes/page (50).png',
    'books/le grand meulnes/page (51).png',
    'books/le grand meulnes/page (52).png',
    'books/le grand meulnes/page (53).png',
    'books/le grand meulnes/page (54).png',
    'books/le grand meulnes/page (55).png',
    'books/le grand meulnes/page (56).png',
    'books/le grand meulnes/page (57).png',
    'books/le grand meulnes/page (58).png',
    'books/le grand meulnes/page (59).png',
    'books/le grand meulnes/page (60).png',
    'books/le grand meulnes/page (61).png',
    'books/le grand meulnes/page (62).png',
    'books/le grand meulnes/page (63).png',
    'books/le grand meulnes/page (64).png',
    'books/le grand meulnes/page (65).png',
    'books/le grand meulnes/page (66).png',
    'books/le grand meulnes/page (67).png',
    'books/le grand meulnes/page (68).png',
    'books/le grand meulnes/page (69).png',
    'books/le grand meulnes/page (70).png',
    'books/le grand meulnes/page (71).png',
    'books/le grand meulnes/page (72).png',
    'books/le grand meulnes/page (73).png',
    'books/le grand meulnes/page (74).png',
    'books/le grand meulnes/page (75).png',
    'books/le grand meulnes/page (76).png',
    'books/le grand meulnes/page (77).png',
    'books/le grand meulnes/page (78).png',
    'books/le grand meulnes/page (79).png',
    'books/le grand meulnes/page (80).png',
    'books/le grand meulnes/page (81).png',
    'books/le grand meulnes/page (82).png',
    'books/le grand meulnes/page (83).png',
    'books/le grand meulnes/page (84).png',
    'books/le grand meulnes/page (85).png',
    'books/le grand meulnes/page (86).png',
    'books/le grand meulnes/page (87).png',
    'books/le grand meulnes/page (88).png',
    'books/le grand meulnes/page (89).png',
    'books/le grand meulnes/page (90).png',
    'books/le grand meulnes/page (91).png',
    'books/le grand meulnes/page (92).png',
    'books/le grand meulnes/page (93).png',
    'books/le grand meulnes/page (94).png',
    'books/le grand meulnes/page (95).png',
    'books/le grand meulnes/page (96).png',
    'books/le grand meulnes/page (97).png',
    'books/le grand meulnes/page (98).png',
    'books/le grand meulnes/page (99).png',
    'books/le grand meulnes/page (100).png',
    'books/le grand meulnes/page (101).png',
    'books/le grand meulnes/page (102).png',
    'books/le grand meulnes/page (103).png',
    'books/le grand meulnes/page (104).png',
    'books/le grand meulnes/page (105).png',
    'books/le grand meulnes/page (106).png',
    'books/le grand meulnes/page (107).png',
    'books/le grand meulnes/page (108).png',
    'books/le grand meulnes/page (109).png',
    'books/le grand meulnes/page (110).png',
    'books/le grand meulnes/page (111).png',
    'books/le grand meulnes/page (112).png',
    'books/le grand meulnes/page (113).png',
    'books/le grand meulnes/page (114).png',
    'books/le grand meulnes/page (115).png',
    'books/le grand meulnes/page (116).png',
    'books/le grand meulnes/page (117).png',
    'books/le grand meulnes/page (118).png',
    'books/le grand meulnes/page (119).png',
    'books/le grand meulnes/page (120).png',
    'books/le grand meulnes/page (121).png',
    'books/le grand meulnes/page (122).png',
    'books/le grand meulnes/page (123).png',
    'books/le grand meulnes/page (124).png',
    'books/le grand meulnes/page (125).png',
    'books/le grand meulnes/page (126).png',
    'books/le grand meulnes/page (127).png',
    'books/le grand meulnes/page (128).png',
    'books/le grand meulnes/page (129).png',
    'books/le grand meulnes/page (130).png',
    'books/le grand meulnes/page (131).png',
    'books/le grand meulnes/page (132).png',
    'books/le grand meulnes/page (133).png',
    'books/le grand meulnes/page (134).png',
    'books/le grand meulnes/page (135).png',
    'books/le grand meulnes/page (136).png',
    'books/le grand meulnes/page (137).png',
    'books/le grand meulnes/page (138).png',
    'books/le grand meulnes/page (139).png',
    'books/le grand meulnes/page (140).png',
    'books/le grand meulnes/page (141).png',
    'books/le grand meulnes/page (142).png',
    'books/le grand meulnes/page (143).png',
    'books/le grand meulnes/page (144).png',
    'books/le grand meulnes/page (145).png',
    'books/le grand meulnes/page (146).png',
    'books/le grand meulnes/page (147).png',
    'books/le grand meulnes/page (148).png',
    'books/le grand meulnes/page (149).png',
    'books/le grand meulnes/page (150).png',
    'books/le grand meulnes/page (151).png',
    'books/le grand meulnes/page (152).png',
    'books/le grand meulnes/page (153).png',
    'books/le grand meulnes/page (154).png',
    'books/le grand meulnes/page (155).png',
    'books/le grand meulnes/page (156).png',
    'books/le grand meulnes/page (157).png',
    'books/le grand meulnes/page (158).png',
    'books/le grand meulnes/page (159).png',
    'books/le grand meulnes/page (160).png',
    'books/le grand meulnes/page (161).png',
    'books/le grand meulnes/page (162).png',
    'books/le grand meulnes/page (163).png',
    'books/le grand meulnes/page (164).png',
    'books/le grand meulnes/page (165).png',
    'books/le grand meulnes/page (166).png',
    'books/le grand meulnes/page (167).png',
    'books/le grand meulnes/page (168).png',
    'books/le grand meulnes/page (169).png',
    'books/le grand meulnes/page (170).png',
    'books/le grand meulnes/page (171).png',
    'books/le grand meulnes/page (172).png',
    'books/le grand meulnes/page (173).png',
    'books/le grand meulnes/page (174).png',
    'books/le grand meulnes/page (175).png',
    'books/le grand meulnes/page (176).png',
    'books/le grand meulnes/page (177).png',
    'books/le grand meulnes/page (178).png',
    'books/le grand meulnes/page (179).png',
    'books/le grand meulnes/page (180).png',
    'books/le grand meulnes/page (181).png',
    'books/le grand meulnes/page (182).png',
    'books/le grand meulnes/page (183).png',
    'books/le grand meulnes/page (184).png',
    'books/le grand meulnes/page (185).png',
    'books/le grand meulnes/page (186).png',
    'books/le grand meulnes/page (187).png',
    'books/le grand meulnes/page (188).png',
    'books/le grand meulnes/page (189).png',
    'books/le grand meulnes/page (190).png',
    'books/le grand meulnes/page (191).png',
    'books/le grand meulnes/page (192).png',
    'books/le grand meulnes/page (193).png',
    'books/le grand meulnes/page (194).png',
    'books/le grand meulnes/page (195).png',
    'books/le grand meulnes/page (196).png',
    'books/le grand meulnes/page (197).png',
    'books/le grand meulnes/page (198).png',
    'books/le grand meulnes/page (199).png',
    'books/le grand meulnes/page (200).png',
    'books/le grand meulnes/page (201).png',
    'books/le grand meulnes/page (202).png',
    'books/le grand meulnes/page (203).png',
    'books/le grand meulnes/page (204).png',
    'books/le grand meulnes/page (205).png',
    'books/le grand meulnes/page (206).png',
    'books/le grand meulnes/page (207).png',
    'books/le grand meulnes/page (208).png',
    'books/le grand meulnes/page (209).png',
    'books/le grand meulnes/page (210).png',
    'books/le grand meulnes/page (211).png',
    'books/le grand meulnes/page (212).png',
    'books/le grand meulnes/page (213).png',
    'books/le grand meulnes/page (214).png',

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
