import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class notessonbrother extends StatefulWidget {
  const notessonbrother({Key? key}) : super(key: key);

  @override
  State<notessonbrother> createState() => _notessonbrotherState();
}

class _notessonbrotherState extends State<notessonbrother> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/notes son and brother/page (1).png',
    'books/notes son and brother/page (2).png',
    'books/notes son and brother/page (3).png',
    'books/notes son and brother/page (4).png',
    'books/notes son and brother/page (5).png',
    'books/notes son and brother/page (6).png',
    'books/notes son and brother/page (7).png',
    'books/notes son and brother/page (8).png',
    'books/notes son and brother/page (9).png',
    'books/notes son and brother/page (10).png',
    'books/notes son and brother/page (11).png',
    'books/notes son and brother/page (12).png',
    'books/notes son and brother/page (13).png',
    'books/notes son and brother/page (14).png',
    'books/notes son and brother/page (15).png',
    'books/notes son and brother/page (16).png',
    'books/notes son and brother/page (17).png',
    'books/notes son and brother/page (18).png',
    'books/notes son and brother/page (19).png',
    'books/notes son and brother/page (20).png',
    'books/notes son and brother/page (21).png',
    'books/notes son and brother/page (22).png',
    'books/notes son and brother/page (23).png',
    'books/notes son and brother/page (24).png',
    'books/notes son and brother/page (25).png',
    'books/notes son and brother/page (26).png',
    'books/notes son and brother/page (27).png',
    'books/notes son and brother/page (28).png',
    'books/notes son and brother/page (29).png',
    'books/notes son and brother/page (30).png',
    'books/notes son and brother/page (31).png',
    'books/notes son and brother/page (32).png',
    'books/notes son and brother/page (33).png',
    'books/notes son and brother/page (34).png',
    'books/notes son and brother/page (35).png',
    'books/notes son and brother/page (36).png',
    'books/notes son and brother/page (37).png',
    'books/notes son and brother/page (38).png',
    'books/notes son and brother/page (39).png',
    'books/notes son and brother/page (40).png',
    'books/notes son and brother/page (41).png',
    'books/notes son and brother/page (42).png',
    'books/notes son and brother/page (43).png',
    'books/notes son and brother/page (44).png',
    'books/notes son and brother/page (45).png',
    'books/notes son and brother/page (46).png',
    'books/notes son and brother/page (47).png',
    'books/notes son and brother/page (48).png',
    'books/notes son and brother/page (49).png',
    'books/notes son and brother/page (50).png',
    'books/notes son and brother/page (51).png',
    'books/notes son and brother/page (52).png',
    'books/notes son and brother/page (53).png',
    'books/notes son and brother/page (54).png',
    'books/notes son and brother/page (55).png',
    'books/notes son and brother/page (56).png',
    'books/notes son and brother/page (57).png',
    'books/notes son and brother/page (58).png',
    'books/notes son and brother/page (59).png',
    'books/notes son and brother/page (60).png',
    'books/notes son and brother/page (61).png',
    'books/notes son and brother/page (62).png',
    'books/notes son and brother/page (63).png',
    'books/notes son and brother/page (64).png',
    'books/notes son and brother/page (65).png',
    'books/notes son and brother/page (66).png',
    'books/notes son and brother/page (67).png',
    'books/notes son and brother/page (68).png',
    'books/notes son and brother/page (69).png',
    'books/notes son and brother/page (70).png',
    'books/notes son and brother/page (71).png',
    'books/notes son and brother/page (72).png',
    'books/notes son and brother/page (73).png',
    'books/notes son and brother/page (74).png',
    'books/notes son and brother/page (75).png',
    'books/notes son and brother/page (76).png',
    'books/notes son and brother/page (77).png',
    'books/notes son and brother/page (78).png',
    'books/notes son and brother/page (79).png',
    'books/notes son and brother/page (80).png',
    'books/notes son and brother/page (81).png',
    'books/notes son and brother/page (82).png',
    'books/notes son and brother/page (83).png',
    'books/notes son and brother/page (84).png',
    'books/notes son and brother/page (85).png',
    'books/notes son and brother/page (86).png',
    'books/notes son and brother/page (87).png',
    'books/notes son and brother/page (88).png',
    'books/notes son and brother/page (89).png',
    'books/notes son and brother/page (90).png',
    'books/notes son and brother/page (91).png',
    'books/notes son and brother/page (92).png',
    'books/notes son and brother/page (93).png',
    'books/notes son and brother/page (94).png',
    'books/notes son and brother/page (95).png',
    'books/notes son and brother/page (96).png',
    'books/notes son and brother/page (97).png',
    'books/notes son and brother/page (98).png',
    'books/notes son and brother/page (99).png',
    'books/notes son and brother/page (100).png',
    'books/notes son and brother/page (101).png',
    'books/notes son and brother/page (102).png',
    'books/notes son and brother/page (103).png',
    'books/notes son and brother/page (104).png',
    'books/notes son and brother/page (105).png',
    'books/notes son and brother/page (106).png',
    'books/notes son and brother/page (107).png',
    'books/notes son and brother/page (108).png',
    'books/notes son and brother/page (109).png',
    'books/notes son and brother/page (110).png',
    'books/notes son and brother/page (111).png',
    'books/notes son and brother/page (112).png',
    'books/notes son and brother/page (113).png',
    'books/notes son and brother/page (114).png',
    'books/notes son and brother/page (115).png',
    'books/notes son and brother/page (116).png',
    'books/notes son and brother/page (117).png',
    'books/notes son and brother/page (118).png',
    'books/notes son and brother/page (119).png',
    'books/notes son and brother/page (120).png',
    'books/notes son and brother/page (121).png',
    'books/notes son and brother/page (122).png',
    'books/notes son and brother/page (123).png',
    'books/notes son and brother/page (124).png',
    'books/notes son and brother/page (125).png',
    'books/notes son and brother/page (126).png',
    'books/notes son and brother/page (127).png',
    'books/notes son and brother/page (128).png',
    'books/notes son and brother/page (129).png',
    'books/notes son and brother/page (130).png',
    'books/notes son and brother/page (131).png',
    'books/notes son and brother/page (132).png',
    'books/notes son and brother/page (133).png',
    'books/notes son and brother/page (134).png',
    'books/notes son and brother/page (135).png',
    'books/notes son and brother/page (136).png',
    'books/notes son and brother/page (137).png',
    'books/notes son and brother/page (138).png',
    'books/notes son and brother/page (139).png',
    'books/notes son and brother/page (140).png',
    'books/notes son and brother/page (141).png',
    'books/notes son and brother/page (142).png',
    'books/notes son and brother/page (143).png',
    'books/notes son and brother/page (144).png',
    'books/notes son and brother/page (145).png',
    'books/notes son and brother/page (146).png',
    'books/notes son and brother/page (147).png',
    'books/notes son and brother/page (148).png',
    'books/notes son and brother/page (149).png',
    'books/notes son and brother/page (150).png',
    'books/notes son and brother/page (151).png',
    'books/notes son and brother/page (152).png',
    'books/notes son and brother/page (153).png',
    'books/notes son and brother/page (154).png',
    'books/notes son and brother/page (155).png',
    'books/notes son and brother/page (156).png',
    'books/notes son and brother/page (157).png',
    'books/notes son and brother/page (158).png',
    'books/notes son and brother/page (159).png',
    'books/notes son and brother/page (160).png',
    'books/notes son and brother/page (161).png',
    'books/notes son and brother/page (162).png',
    'books/notes son and brother/page (163).png',
    'books/notes son and brother/page (164).png',
    'books/notes son and brother/page (165).png',
    'books/notes son and brother/page (166).png',
    'books/notes son and brother/page (167).png',
    'books/notes son and brother/page (168).png',
    'books/notes son and brother/page (169).png',
    'books/notes son and brother/page (170).png',
    'books/notes son and brother/page (171).png',
    'books/notes son and brother/page (172).png',
    'books/notes son and brother/page (173).png',
    'books/notes son and brother/page (174).png',
    'books/notes son and brother/page (175).png',
    'books/notes son and brother/page (176).png',
    'books/notes son and brother/page (177).png',
    'books/notes son and brother/page (178).png',
    'books/notes son and brother/page (179).png',
    'books/notes son and brother/page (180).png',
    'books/notes son and brother/page (181).png',
    'books/notes son and brother/page (182).png',
    'books/notes son and brother/page (183).png',
    'books/notes son and brother/page (184).png',
    'books/notes son and brother/page (185).png',
    'books/notes son and brother/page (186).png',
    'books/notes son and brother/page (187).png',
    'books/notes son and brother/page (188).png',
    'books/notes son and brother/page (189).png',
    'books/notes son and brother/page (190).png',
    'books/notes son and brother/page (191).png',
    'books/notes son and brother/page (192).png',
    'books/notes son and brother/page (193).png',
    'books/notes son and brother/page (194).png',
    'books/notes son and brother/page (195).png',
    'books/notes son and brother/page (196).png',
    'books/notes son and brother/page (197).png',
    'books/notes son and brother/page (198).png',
    'books/notes son and brother/page (199).png',
    'books/notes son and brother/page (200).png',
    'books/notes son and brother/page (201).png',
    'books/notes son and brother/page (202).png',
    'books/notes son and brother/page (203).png',
    'books/notes son and brother/page (204).png',
    'books/notes son and brother/page (205).png',
    'books/notes son and brother/page (206).png',
    'books/notes son and brother/page (207).png',
    'books/notes son and brother/page (208).png',
    'books/notes son and brother/page (209).png',
    'books/notes son and brother/page (210).png',
    'books/notes son and brother/page (211).png',
    'books/notes son and brother/page (212).png',
    'books/notes son and brother/page (213).png',
    'books/notes son and brother/page (214).png',
    'books/notes son and brother/page (215).png',
    'books/notes son and brother/page (216).png',
    'books/notes son and brother/page (217).png',
    'books/notes son and brother/page (218).png',
    'books/notes son and brother/page (219).png',
    'books/notes son and brother/page (220).png',
    'books/notes son and brother/page (221).png',
    'books/notes son and brother/page (222).png',
    'books/notes son and brother/page (223).png',
    'books/notes son and brother/page (224).png',
    'books/notes son and brother/page (225).png',
    'books/notes son and brother/page (226).png',
    'books/notes son and brother/page (227).png',
    'books/notes son and brother/page (228).png',
    'books/notes son and brother/page (229).png',
    'books/notes son and brother/page (230).png',
    'books/notes son and brother/page (231).png',
    'books/notes son and brother/page (232).png',
    'books/notes son and brother/page (233).png',
    'books/notes son and brother/page (234).png',
    'books/notes son and brother/page (235).png',

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
