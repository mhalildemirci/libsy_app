import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

// ignore: camel_case_types
class aconnecticut extends StatefulWidget {
  const aconnecticut({Key? key}) : super(key: key);

  @override
  State<aconnecticut> createState() => _aconnecticutState();
}

class _aconnecticutState extends State<aconnecticut> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Connecticut/page (1).png',
    'books/A Connecticut/page (2).png',
    'books/A Connecticut/page (3).png',
    'books/A Connecticut/page (4).png',
    'books/A Connecticut/page (5).png',
    'books/A Connecticut/page (6).png',
    'books/A Connecticut/page (7).png',
    'books/A Connecticut/page (8).png',
    'books/A Connecticut/page (9).png',
    'books/A Connecticut/page (10).png',
    'books/A Connecticut/page (11).png',
    'books/A Connecticut/page (12).png',
    'books/A Connecticut/page (13).png',
    'books/A Connecticut/page (14).png',
    'books/A Connecticut/page (15).png',
    'books/A Connecticut/page (16).png',
    'books/A Connecticut/page (17).png',
    'books/A Connecticut/page (18).png',
    'books/A Connecticut/page (19).png',
    'books/A Connecticut/page (20).png',
    'books/A Connecticut/page (21).png',
    'books/A Connecticut/page (22).png',
    'books/A Connecticut/page (23).png',
    'books/A Connecticut/page (24).png',
    'books/A Connecticut/page (25).png',
    'books/A Connecticut/page (26).png',
    'books/A Connecticut/page (27).png',
    'books/A Connecticut/page (28).png',
    'books/A Connecticut/page (29).png',
    'books/A Connecticut/page (30).png',
    'books/A Connecticut/page (31).png',
    'books/A Connecticut/page (32).png',
    'books/A Connecticut/page (33).png',
    'books/A Connecticut/page (34).png',
    'books/A Connecticut/page (35).png',
    'books/A Connecticut/page (36).png',
    'books/A Connecticut/page (37).png',
    'books/A Connecticut/page (38).png',
    'books/A Connecticut/page (39).png',
    'books/A Connecticut/page (40).png',
    'books/A Connecticut/page (41).png',
    'books/A Connecticut/page (42).png',
    'books/A Connecticut/page (43).png',
    'books/A Connecticut/page (44).png',
    'books/A Connecticut/page (45).png',
    'books/A Connecticut/page (46).png',
    'books/A Connecticut/page (47).png',
    'books/A Connecticut/page (48).png',
    'books/A Connecticut/page (49).png',
    'books/A Connecticut/page (50).png',
    'books/A Connecticut/page (51).png',
    'books/A Connecticut/page (52).png',
    'books/A Connecticut/page (53).png',
    'books/A Connecticut/page (54).png',
    'books/A Connecticut/page (55).png',
    'books/A Connecticut/page (56).png',
    'books/A Connecticut/page (57).png',
    'books/A Connecticut/page (58).png',
    'books/A Connecticut/page (59).png',
    'books/A Connecticut/page (60).png',
    'books/A Connecticut/page (61).png',
    'books/A Connecticut/page (62).png',
    'books/A Connecticut/page (63).png',
    'books/A Connecticut/page (64).png',
    'books/A Connecticut/page (65).png',
    'books/A Connecticut/page (66).png',
    'books/A Connecticut/page (67).png',
    'books/A Connecticut/page (68).png',
    'books/A Connecticut/page (69).png',
    'books/A Connecticut/page (70).png',
    'books/A Connecticut/page (71).png',
    'books/A Connecticut/page (72).png',
    'books/A Connecticut/page (73).png',
    'books/A Connecticut/page (74).png',
    'books/A Connecticut/page (75).png',
    'books/A Connecticut/page (76).png',
    'books/A Connecticut/page (77).png',
    'books/A Connecticut/page (78).png',
    'books/A Connecticut/page (79).png',
    'books/A Connecticut/page (80).png',
    'books/A Connecticut/page (81).png',
    'books/A Connecticut/page (82).png',
    'books/A Connecticut/page (83).png',
    'books/A Connecticut/page (84).png',
    'books/A Connecticut/page (85).png',
    'books/A Connecticut/page (86).png',
    'books/A Connecticut/page (87).png',
    'books/A Connecticut/page (88).png',
    'books/A Connecticut/page (89).png',
    'books/A Connecticut/page (90).png',
    'books/A Connecticut/page (91).png',
    'books/A Connecticut/page (92).png',
    'books/A Connecticut/page (93).png',
    'books/A Connecticut/page (94).png',
    'books/A Connecticut/page (95).png',
    'books/A Connecticut/page (96).png',
    'books/A Connecticut/page (97).png',
    'books/A Connecticut/page (98).png',
    'books/A Connecticut/page (99).png',
    'books/A Connecticut/page (100).png',
    'books/A Connecticut/page (101).png',
    'books/A Connecticut/page (102).png',
    'books/A Connecticut/page (103).png',
    'books/A Connecticut/page (104).png',
    'books/A Connecticut/page (105).png',
    'books/A Connecticut/page (106).png',
    'books/A Connecticut/page (107).png',
    'books/A Connecticut/page (108).png',
    'books/A Connecticut/page (109).png',
    'books/A Connecticut/page (110).png',
    'books/A Connecticut/page (111).png',
    'books/A Connecticut/page (112).png',
    'books/A Connecticut/page (113).png',
    'books/A Connecticut/page (114).png',
    'books/A Connecticut/page (115).png',
    'books/A Connecticut/page (116).png',
    'books/A Connecticut/page (117).png',
    'books/A Connecticut/page (118).png',
    'books/A Connecticut/page (119).png',
    'books/A Connecticut/page (120).png',
    'books/A Connecticut/page (121).png',
    'books/A Connecticut/page (122).png',
    'books/A Connecticut/page (123).png',
    'books/A Connecticut/page (124).png',
    'books/A Connecticut/page (125).png',
    'books/A Connecticut/page (126).png',
    'books/A Connecticut/page (127).png',
    'books/A Connecticut/page (128).png',
    'books/A Connecticut/page (129).png',
    'books/A Connecticut/page (130).png',
    'books/A Connecticut/page (131).png',
    'books/A Connecticut/page (132).png',
    'books/A Connecticut/page (133).png',
    'books/A Connecticut/page (134).png',
    'books/A Connecticut/page (135).png',
    'books/A Connecticut/page (136).png',
    'books/A Connecticut/page (137).png',
    'books/A Connecticut/page (138).png',
    'books/A Connecticut/page (139).png',
    'books/A Connecticut/page (140).png',
    'books/A Connecticut/page (141).png',
    'books/A Connecticut/page (142).png',
    'books/A Connecticut/page (143).png',
    'books/A Connecticut/page (144).png',
    'books/A Connecticut/page (145).png',
    'books/A Connecticut/page (146).png',
    'books/A Connecticut/page (147).png',
    'books/A Connecticut/page (148).png',
    'books/A Connecticut/page (149).png',
    'books/A Connecticut/page (150).png',
    'books/A Connecticut/page (151).png',
    'books/A Connecticut/page (152).png',
    'books/A Connecticut/page (153).png',
    'books/A Connecticut/page (154).png',
    'books/A Connecticut/page (155).png',
    'books/A Connecticut/page (156).png',
    'books/A Connecticut/page (157).png',
    'books/A Connecticut/page (158).png',
    'books/A Connecticut/page (159).png',
    'books/A Connecticut/page (160).png',
    'books/A Connecticut/page (161).png',
    'books/A Connecticut/page (162).png',
    'books/A Connecticut/page (163).png',
    'books/A Connecticut/page (164).png',
    'books/A Connecticut/page (165).png',
    'books/A Connecticut/page (166).png',
    'books/A Connecticut/page (167).png',
    'books/A Connecticut/page (168).png',
    'books/A Connecticut/page (169).png',
    'books/A Connecticut/page (170).png',
    'books/A Connecticut/page (171).png',
    'books/A Connecticut/page (172).png',
    'books/A Connecticut/page (173).png',
    'books/A Connecticut/page (174).png',
    'books/A Connecticut/page (175).png',
    'books/A Connecticut/page (176).png',
    'books/A Connecticut/page (177).png',
    'books/A Connecticut/page (178).png',
    'books/A Connecticut/page (179).png',
    'books/A Connecticut/page (180).png',
    'books/A Connecticut/page (181).png',
    'books/A Connecticut/page (182).png',
    'books/A Connecticut/page (183).png',
    'books/A Connecticut/page (184).png',
    'books/A Connecticut/page (185).png',
    'books/A Connecticut/page (186).png',
    'books/A Connecticut/page (187).png',
    'books/A Connecticut/page (188).png',
    'books/A Connecticut/page (189).png',
    'books/A Connecticut/page (190).png',
    'books/A Connecticut/page (191).png',
    'books/A Connecticut/page (192).png',
    'books/A Connecticut/page (193).png',
    'books/A Connecticut/page (194).png',
    'books/A Connecticut/page (195).png',
    'books/A Connecticut/page (196).png',
    'books/A Connecticut/page (197).png',
    'books/A Connecticut/page (198).png',
    'books/A Connecticut/page (199).png',
    'books/A Connecticut/page (200).png',
    'books/A Connecticut/page (201).png',
    'books/A Connecticut/page (202).png',
    'books/A Connecticut/page (203).png',
    'books/A Connecticut/page (204).png',
    'books/A Connecticut/page (205).png',
    'books/A Connecticut/page (206).png',
    'books/A Connecticut/page (207).png',
    'books/A Connecticut/page (208).png',
    'books/A Connecticut/page (209).png',
    'books/A Connecticut/page (210).png',
    'books/A Connecticut/page (211).png',
    'books/A Connecticut/page (212).png',
    'books/A Connecticut/page (213).png',
    'books/A Connecticut/page (214).png',
    'books/A Connecticut/page (215).png',
    'books/A Connecticut/page (216).png',
    'books/A Connecticut/page (217).png',
    'books/A Connecticut/page (218).png',
    'books/A Connecticut/page (219).png',
    'books/A Connecticut/page (220).png',
    'books/A Connecticut/page (221).png',
    'books/A Connecticut/page (222).png',
    'books/A Connecticut/page (223).png',
    'books/A Connecticut/page (224).png',
    'books/A Connecticut/page (225).png',
    'books/A Connecticut/page (226).png',
    'books/A Connecticut/page (227).png',
    'books/A Connecticut/page (228).png',
    'books/A Connecticut/page (229).png',
    'books/A Connecticut/page (230).png',
    'books/A Connecticut/page (231).png',
    'books/A Connecticut/page (232).png',
    'books/A Connecticut/page (233).png',
    'books/A Connecticut/page (234).png',
    'books/A Connecticut/page (235).png',
    'books/A Connecticut/page (236).png',
    'books/A Connecticut/page (237).png',
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
