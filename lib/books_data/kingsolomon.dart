import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kingsolomon extends StatefulWidget {
  const kingsolomon({Key? key}) : super(key: key);

  @override
  State<kingsolomon> createState() => _kingsolomonState();
}

class _kingsolomonState extends State<kingsolomon> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/king solomon/page (1).png',
    'books/king solomon/page (2).png',
    'books/king solomon/page (3).png',
    'books/king solomon/page (4).png',
    'books/king solomon/page (5).png',
    'books/king solomon/page (6).png',
    'books/king solomon/page (7).png',
    'books/king solomon/page (8).png',
    'books/king solomon/page (9).png',
    'books/king solomon/page (10).png',
    'books/king solomon/page (11).png',
    'books/king solomon/page (12).png',
    'books/king solomon/page (13).png',
    'books/king solomon/page (14).png',
    'books/king solomon/page (15).png',
    'books/king solomon/page (16).png',
    'books/king solomon/page (17).png',
    'books/king solomon/page (18).png',
    'books/king solomon/page (19).png',
    'books/king solomon/page (20).png',
    'books/king solomon/page (21).png',
    'books/king solomon/page (22).png',
    'books/king solomon/page (23).png',
    'books/king solomon/page (24).png',
    'books/king solomon/page (25).png',
    'books/king solomon/page (26).png',
    'books/king solomon/page (27).png',
    'books/king solomon/page (28).png',
    'books/king solomon/page (29).png',
    'books/king solomon/page (30).png',
    'books/king solomon/page (31).png',
    'books/king solomon/page (32).png',
    'books/king solomon/page (33).png',
    'books/king solomon/page (34).png',
    'books/king solomon/page (35).png',
    'books/king solomon/page (36).png',
    'books/king solomon/page (37).png',
    'books/king solomon/page (38).png',
    'books/king solomon/page (39).png',
    'books/king solomon/page (40).png',
    'books/king solomon/page (41).png',
    'books/king solomon/page (42).png',
    'books/king solomon/page (43).png',
    'books/king solomon/page (44).png',
    'books/king solomon/page (45).png',
    'books/king solomon/page (46).png',
    'books/king solomon/page (47).png',
    'books/king solomon/page (48).png',
    'books/king solomon/page (49).png',
    'books/king solomon/page (50).png',
    'books/king solomon/page (51).png',
    'books/king solomon/page (52).png',
    'books/king solomon/page (53).png',
    'books/king solomon/page (54).png',
    'books/king solomon/page (55).png',
    'books/king solomon/page (56).png',
    'books/king solomon/page (57).png',
    'books/king solomon/page (58).png',
    'books/king solomon/page (59).png',
    'books/king solomon/page (60).png',
    'books/king solomon/page (61).png',
    'books/king solomon/page (62).png',
    'books/king solomon/page (63).png',
    'books/king solomon/page (64).png',
    'books/king solomon/page (65).png',
    'books/king solomon/page (66).png',
    'books/king solomon/page (67).png',
    'books/king solomon/page (68).png',
    'books/king solomon/page (69).png',
    'books/king solomon/page (70).png',
    'books/king solomon/page (71).png',
    'books/king solomon/page (72).png',
    'books/king solomon/page (73).png',
    'books/king solomon/page (74).png',
    'books/king solomon/page (75).png',
    'books/king solomon/page (76).png',
    'books/king solomon/page (77).png',
    'books/king solomon/page (78).png',
    'books/king solomon/page (79).png',
    'books/king solomon/page (80).png',
    'books/king solomon/page (81).png',
    'books/king solomon/page (82).png',
    'books/king solomon/page (83).png',
    'books/king solomon/page (84).png',
    'books/king solomon/page (85).png',
    'books/king solomon/page (86).png',
    'books/king solomon/page (87).png',
    'books/king solomon/page (88).png',
    'books/king solomon/page (89).png',
    'books/king solomon/page (90).png',
    'books/king solomon/page (91).png',
    'books/king solomon/page (92).png',
    'books/king solomon/page (93).png',
    'books/king solomon/page (94).png',
    'books/king solomon/page (95).png',
    'books/king solomon/page (96).png',
    'books/king solomon/page (97).png',
    'books/king solomon/page (98).png',
    'books/king solomon/page (99).png',
    'books/king solomon/page (100).png',
    'books/king solomon/page (101).png',
    'books/king solomon/page (102).png',
    'books/king solomon/page (103).png',
    'books/king solomon/page (104).png',
    'books/king solomon/page (105).png',
    'books/king solomon/page (106).png',
    'books/king solomon/page (107).png',
    'books/king solomon/page (108).png',
    'books/king solomon/page (109).png',
    'books/king solomon/page (110).png',
    'books/king solomon/page (111).png',
    'books/king solomon/page (112).png',
    'books/king solomon/page (113).png',
    'books/king solomon/page (114).png',
    'books/king solomon/page (115).png',
    'books/king solomon/page (116).png',
    'books/king solomon/page (117).png',
    'books/king solomon/page (118).png',
    'books/king solomon/page (119).png',
    'books/king solomon/page (120).png',
    'books/king solomon/page (121).png',
    'books/king solomon/page (122).png',
    'books/king solomon/page (123).png',
    'books/king solomon/page (124).png',
    'books/king solomon/page (125).png',
    'books/king solomon/page (126).png',
    'books/king solomon/page (127).png',
    'books/king solomon/page (128).png',
    'books/king solomon/page (129).png',
    'books/king solomon/page (130).png',
    'books/king solomon/page (131).png',
    'books/king solomon/page (132).png',
    'books/king solomon/page (133).png',
    'books/king solomon/page (134).png',
    'books/king solomon/page (135).png',
    'books/king solomon/page (136).png',
    'books/king solomon/page (137).png',
    'books/king solomon/page (138).png',
    'books/king solomon/page (139).png',
    'books/king solomon/page (140).png',
    'books/king solomon/page (141).png',
    'books/king solomon/page (142).png',
    'books/king solomon/page (143).png',
    'books/king solomon/page (144).png',
    'books/king solomon/page (145).png',
    'books/king solomon/page (146).png',
    'books/king solomon/page (147).png',
    'books/king solomon/page (148).png',
    'books/king solomon/page (149).png',
    'books/king solomon/page (150).png',
    'books/king solomon/page (151).png',
    'books/king solomon/page (152).png',
    'books/king solomon/page (153).png',
    'books/king solomon/page (154).png',
    'books/king solomon/page (155).png',
    'books/king solomon/page (156).png',
    'books/king solomon/page (157).png',
    'books/king solomon/page (158).png',
    'books/king solomon/page (159).png',
    'books/king solomon/page (160).png',
    'books/king solomon/page (161).png',
    'books/king solomon/page (162).png',
    'books/king solomon/page (163).png',
    'books/king solomon/page (164).png',
    'books/king solomon/page (165).png',
    'books/king solomon/page (166).png',
    'books/king solomon/page (167).png',
    'books/king solomon/page (168).png',
    'books/king solomon/page (169).png',
    'books/king solomon/page (170).png',
    'books/king solomon/page (171).png',
    'books/king solomon/page (172).png',
    'books/king solomon/page (173).png',
    'books/king solomon/page (174).png',
    'books/king solomon/page (175).png',
    'books/king solomon/page (176).png',
    'books/king solomon/page (177).png',
    'books/king solomon/page (178).png',
    'books/king solomon/page (179).png',
    'books/king solomon/page (180).png',
    'books/king solomon/page (181).png',
    'books/king solomon/page (182).png',
    'books/king solomon/page (183).png',
    'books/king solomon/page (184).png',
    'books/king solomon/page (185).png',
    'books/king solomon/page (186).png',
    'books/king solomon/page (187).png',
    'books/king solomon/page (188).png',
    'books/king solomon/page (189).png',
    'books/king solomon/page (190).png',
    'books/king solomon/page (191).png',
    'books/king solomon/page (192).png',
    'books/king solomon/page (193).png',
    'books/king solomon/page (194).png',
    'books/king solomon/page (195).png',
    'books/king solomon/page (196).png',
    'books/king solomon/page (197).png',
    'books/king solomon/page (198).png',
    'books/king solomon/page (199).png',
    'books/king solomon/page (200).png',
    'books/king solomon/page (201).png',
    'books/king solomon/page (202).png',
    'books/king solomon/page (203).png',
    'books/king solomon/page (204).png',
    'books/king solomon/page (205).png',
    'books/king solomon/page (206).png',
    'books/king solomon/page (207).png',
    'books/king solomon/page (208).png',
    'books/king solomon/page (209).png',
    'books/king solomon/page (210).png',

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
