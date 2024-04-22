import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class ashorthistory extends StatefulWidget {
  const ashorthistory({Key? key}) : super(key: key);

  @override
  State<ashorthistory> createState() => _ashorthistoryState();
}

class _ashorthistoryState extends State<ashorthistory> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Short History of The World/page (1).png',
    'books/A Short History of The World/page (2).png',
    'books/A Short History of The World/page (3).png',
    'books/A Short History of The World/page (4).png',
    'books/A Short History of The World/page (5).png',
    'books/A Short History of The World/page (6).png',
    'books/A Short History of The World/page (7).png',
    'books/A Short History of The World/page (8).png',
    'books/A Short History of The World/page (9).png',
    'books/A Short History of The World/page (10).png',
    'books/A Short History of The World/page (11).png',
    'books/A Short History of The World/page (12).png',
    'books/A Short History of The World/page (13).png',
    'books/A Short History of The World/page (14).png',
    'books/A Short History of The World/page (15).png',
    'books/A Short History of The World/page (16).png',
    'books/A Short History of The World/page (17).png',
    'books/A Short History of The World/page (18).png',
    'books/A Short History of The World/page (19).png',
    'books/A Short History of The World/page (20).png',
    'books/A Short History of The World/page (21).png',
    'books/A Short History of The World/page (22).png',
    'books/A Short History of The World/page (23).png',
    'books/A Short History of The World/page (24).png',
    'books/A Short History of The World/page (25).png',
    'books/A Short History of The World/page (26).png',
    'books/A Short History of The World/page (27).png',
    'books/A Short History of The World/page (28).png',
    'books/A Short History of The World/page (29).png',
    'books/A Short History of The World/page (30).png',
    'books/A Short History of The World/page (31).png',
    'books/A Short History of The World/page (32).png',
    'books/A Short History of The World/page (33).png',
    'books/A Short History of The World/page (34).png',
    'books/A Short History of The World/page (35).png',
    'books/A Short History of The World/page (36).png',
    'books/A Short History of The World/page (37).png',
    'books/A Short History of The World/page (38).png',
    'books/A Short History of The World/page (39).png',
    'books/A Short History of The World/page (40).png',
    'books/A Short History of The World/page (41).png',
    'books/A Short History of The World/page (42).png',
    'books/A Short History of The World/page (43).png',
    'books/A Short History of The World/page (44).png',
    'books/A Short History of The World/page (45).png',
    'books/A Short History of The World/page (46).png',
    'books/A Short History of The World/page (47).png',
    'books/A Short History of The World/page (48).png',
    'books/A Short History of The World/page (49).png',
    'books/A Short History of The World/page (50).png',
    'books/A Short History of The World/page (51).png',
    'books/A Short History of The World/page (52).png',
    'books/A Short History of The World/page (53).png',
    'books/A Short History of The World/page (54).png',
    'books/A Short History of The World/page (55).png',
    'books/A Short History of The World/page (56).png',
    'books/A Short History of The World/page (57).png',
    'books/A Short History of The World/page (58).png',
    'books/A Short History of The World/page (59).png',
    'books/A Short History of The World/page (60).png',
    'books/A Short History of The World/page (61).png',
    'books/A Short History of The World/page (62).png',
    'books/A Short History of The World/page (63).png',
    'books/A Short History of The World/page (64).png',
    'books/A Short History of The World/page (65).png',
    'books/A Short History of The World/page (66).png',
    'books/A Short History of The World/page (67).png',
    'books/A Short History of The World/page (68).png',
    'books/A Short History of The World/page (69).png',
    'books/A Short History of The World/page (70).png',
    'books/A Short History of The World/page (71).png',
    'books/A Short History of The World/page (72).png',
    'books/A Short History of The World/page (73).png',
    'books/A Short History of The World/page (74).png',
    'books/A Short History of The World/page (75).png',
    'books/A Short History of The World/page (76).png',
    'books/A Short History of The World/page (77).png',
    'books/A Short History of The World/page (78).png',
    'books/A Short History of The World/page (79).png',
    'books/A Short History of The World/page (80).png',
    'books/A Short History of The World/page (81).png',
    'books/A Short History of The World/page (82).png',
    'books/A Short History of The World/page (83).png',
    'books/A Short History of The World/page (84).png',
    'books/A Short History of The World/page (85).png',
    'books/A Short History of The World/page (86).png',
    'books/A Short History of The World/page (87).png',
    'books/A Short History of The World/page (88).png',
    'books/A Short History of The World/page (89).png',
    'books/A Short History of The World/page (90).png',
    'books/A Short History of The World/page (91).png',
    'books/A Short History of The World/page (92).png',
    'books/A Short History of The World/page (93).png',
    'books/A Short History of The World/page (94).png',
    'books/A Short History of The World/page (95).png',
    'books/A Short History of The World/page (96).png',
    'books/A Short History of The World/page (97).png',
    'books/A Short History of The World/page (98).png',
    'books/A Short History of The World/page (99).png',
    'books/A Short History of The World/page (100).png',
    'books/A Short History of The World/page (101).png',
    'books/A Short History of The World/page (102).png',
    'books/A Short History of The World/page (103).png',
    'books/A Short History of The World/page (104).png',
    'books/A Short History of The World/page (105).png',
    'books/A Short History of The World/page (106).png',
    'books/A Short History of The World/page (107).png',
    'books/A Short History of The World/page (108).png',
    'books/A Short History of The World/page (109).png',
    'books/A Short History of The World/page (110).png',
    'books/A Short History of The World/page (111).png',
    'books/A Short History of The World/page (112).png',
    'books/A Short History of The World/page (113).png',
    'books/A Short History of The World/page (114).png',
    'books/A Short History of The World/page (115).png',
    'books/A Short History of The World/page (116).png',
    'books/A Short History of The World/page (117).png',
    'books/A Short History of The World/page (118).png',
    'books/A Short History of The World/page (119).png',
    'books/A Short History of The World/page (120).png',
    'books/A Short History of The World/page (121).png',
    'books/A Short History of The World/page (122).png',
    'books/A Short History of The World/page (123).png',
    'books/A Short History of The World/page (124).png',
    'books/A Short History of The World/page (125).png',
    'books/A Short History of The World/page (126).png',
    'books/A Short History of The World/page (127).png',
    'books/A Short History of The World/page (128).png',
    'books/A Short History of The World/page (129).png',
    'books/A Short History of The World/page (130).png',
    'books/A Short History of The World/page (131).png',
    'books/A Short History of The World/page (132).png',
    'books/A Short History of The World/page (133).png',
    'books/A Short History of The World/page (134).png',
    'books/A Short History of The World/page (135).png',
    'books/A Short History of The World/page (136).png',
    'books/A Short History of The World/page (137).png',
    'books/A Short History of The World/page (138).png',
    'books/A Short History of The World/page (139).png',
    'books/A Short History of The World/page (140).png',
    'books/A Short History of The World/page (141).png',
    'books/A Short History of The World/page (142).png',
    'books/A Short History of The World/page (143).png',
    'books/A Short History of The World/page (144).png',
    'books/A Short History of The World/page (145).png',
    'books/A Short History of The World/page (146).png',
    'books/A Short History of The World/page (147).png',
    'books/A Short History of The World/page (148).png',
    'books/A Short History of The World/page (149).png',
    'books/A Short History of The World/page (150).png',
    'books/A Short History of The World/page (151).png',
    'books/A Short History of The World/page (152).png',
    'books/A Short History of The World/page (153).png',
    'books/A Short History of The World/page (154).png',
    'books/A Short History of The World/page (155).png',
    'books/A Short History of The World/page (156).png',
    'books/A Short History of The World/page (157).png',
    'books/A Short History of The World/page (158).png',
    'books/A Short History of The World/page (159).png',
    'books/A Short History of The World/page (160).png',
    'books/A Short History of The World/page (161).png',
    'books/A Short History of The World/page (162).png',
    'books/A Short History of The World/page (163).png',
    'books/A Short History of The World/page (164).png',
    'books/A Short History of The World/page (165).png',
    'books/A Short History of The World/page (166).png',
    'books/A Short History of The World/page (167).png',
    'books/A Short History of The World/page (168).png',
    'books/A Short History of The World/page (169).png',
    'books/A Short History of The World/page (170).png',
    'books/A Short History of The World/page (171).png',
    'books/A Short History of The World/page (172).png',
    'books/A Short History of The World/page (173).png',
    'books/A Short History of The World/page (174).png',
    'books/A Short History of The World/page (175).png',
    'books/A Short History of The World/page (176).png',
    'books/A Short History of The World/page (177).png',
    'books/A Short History of The World/page (178).png',
    'books/A Short History of The World/page (179).png',
    'books/A Short History of The World/page (180).png',
    'books/A Short History of The World/page (181).png',
    'books/A Short History of The World/page (182).png',
    'books/A Short History of The World/page (183).png',
    'books/A Short History of The World/page (184).png',
    'books/A Short History of The World/page (185).png',
    'books/A Short History of The World/page (186).png',
    'books/A Short History of The World/page (187).png',
    'books/A Short History of The World/page (188).png',
    'books/A Short History of The World/page (189).png',
    'books/A Short History of The World/page (190).png',
    'books/A Short History of The World/page (191).png',
    'books/A Short History of The World/page (192).png',
    'books/A Short History of The World/page (193).png',
    'books/A Short History of The World/page (194).png',
    'books/A Short History of The World/page (195).png',
    'books/A Short History of The World/page (196).png',
    'books/A Short History of The World/page (197).png',
    'books/A Short History of The World/page (198).png',
    'books/A Short History of The World/page (199).png',
    'books/A Short History of The World/page (200).png',
    'books/A Short History of The World/page (201).png',
    'books/A Short History of The World/page (202).png',
    'books/A Short History of The World/page (203).png',
    'books/A Short History of The World/page (204).png',
    'books/A Short History of The World/page (205).png',
    'books/A Short History of The World/page (206).png',
    'books/A Short History of The World/page (207).png',
    'books/A Short History of The World/page (208).png',
    'books/A Short History of The World/page (209).png',
    'books/A Short History of The World/page (210).png',
    'books/A Short History of The World/page (211).png',
    'books/A Short History of The World/page (212).png',
    'books/A Short History of The World/page (213).png',
    'books/A Short History of The World/page (214).png',
    'books/A Short History of The World/page (215).png',
    'books/A Short History of The World/page (216).png',
    'books/A Short History of The World/page (217).png',
    'books/A Short History of The World/page (218).png',
    'books/A Short History of The World/page (219).png',
    'books/A Short History of The World/page (220).png',
    'books/A Short History of The World/page (221).png',
    'books/A Short History of The World/page (222).png',
    'books/A Short History of The World/page (223).png',
    'books/A Short History of The World/page (224).png',
    'books/A Short History of The World/page (225).png',
    'books/A Short History of The World/page (226).png',
    'books/A Short History of The World/page (227).png',
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
