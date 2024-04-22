import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class doriangray extends StatefulWidget {
  const doriangray({Key? key}) : super(key: key);

  @override
  State<doriangray> createState() => _doriangrayState();
}

class _doriangrayState extends State<doriangray> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/potrait dorian gray/page (1).png',
    'books/potrait dorian gray/page (2).png',
    'books/potrait dorian gray/page (3).png',
    'books/potrait dorian gray/page (4).png',
    'books/potrait dorian gray/page (5).png',
    'books/potrait dorian gray/page (6).png',
    'books/potrait dorian gray/page (7).png',
    'books/potrait dorian gray/page (8).png',
    'books/potrait dorian gray/page (9).png',
    'books/potrait dorian gray/page (10).png',
    'books/potrait dorian gray/page (11).png',
    'books/potrait dorian gray/page (12).png',
    'books/potrait dorian gray/page (13).png',
    'books/potrait dorian gray/page (14).png',
    'books/potrait dorian gray/page (15).png',
    'books/potrait dorian gray/page (16).png',
    'books/potrait dorian gray/page (17).png',
    'books/potrait dorian gray/page (18).png',
    'books/potrait dorian gray/page (19).png',
    'books/potrait dorian gray/page (20).png',
    'books/potrait dorian gray/page (21).png',
    'books/potrait dorian gray/page (22).png',
    'books/potrait dorian gray/page (23).png',
    'books/potrait dorian gray/page (24).png',
    'books/potrait dorian gray/page (25).png',
    'books/potrait dorian gray/page (26).png',
    'books/potrait dorian gray/page (27).png',
    'books/potrait dorian gray/page (28).png',
    'books/potrait dorian gray/page (29).png',
    'books/potrait dorian gray/page (30).png',
    'books/potrait dorian gray/page (31).png',
    'books/potrait dorian gray/page (32).png',
    'books/potrait dorian gray/page (33).png',
    'books/potrait dorian gray/page (34).png',
    'books/potrait dorian gray/page (35).png',
    'books/potrait dorian gray/page (36).png',
    'books/potrait dorian gray/page (37).png',
    'books/potrait dorian gray/page (38).png',
    'books/potrait dorian gray/page (39).png',
    'books/potrait dorian gray/page (40).png',
    'books/potrait dorian gray/page (41).png',
    'books/potrait dorian gray/page (42).png',
    'books/potrait dorian gray/page (43).png',
    'books/potrait dorian gray/page (44).png',
    'books/potrait dorian gray/page (45).png',
    'books/potrait dorian gray/page (46).png',
    'books/potrait dorian gray/page (47).png',
    'books/potrait dorian gray/page (48).png',
    'books/potrait dorian gray/page (49).png',
    'books/potrait dorian gray/page (50).png',
    'books/potrait dorian gray/page (51).png',
    'books/potrait dorian gray/page (52).png',
    'books/potrait dorian gray/page (53).png',
    'books/potrait dorian gray/page (54).png',
    'books/potrait dorian gray/page (55).png',
    'books/potrait dorian gray/page (56).png',
    'books/potrait dorian gray/page (57).png',
    'books/potrait dorian gray/page (58).png',
    'books/potrait dorian gray/page (59).png',
    'books/potrait dorian gray/page (60).png',
    'books/potrait dorian gray/page (61).png',
    'books/potrait dorian gray/page (62).png',
    'books/potrait dorian gray/page (63).png',
    'books/potrait dorian gray/page (64).png',
    'books/potrait dorian gray/page (65).png',
    'books/potrait dorian gray/page (66).png',
    'books/potrait dorian gray/page (67).png',
    'books/potrait dorian gray/page (68).png',
    'books/potrait dorian gray/page (69).png',
    'books/potrait dorian gray/page (70).png',
    'books/potrait dorian gray/page (71).png',
    'books/potrait dorian gray/page (72).png',
    'books/potrait dorian gray/page (73).png',
    'books/potrait dorian gray/page (74).png',
    'books/potrait dorian gray/page (75).png',
    'books/potrait dorian gray/page (76).png',
    'books/potrait dorian gray/page (77).png',
    'books/potrait dorian gray/page (78).png',
    'books/potrait dorian gray/page (79).png',
    'books/potrait dorian gray/page (80).png',
    'books/potrait dorian gray/page (81).png',
    'books/potrait dorian gray/page (82).png',
    'books/potrait dorian gray/page (83).png',
    'books/potrait dorian gray/page (84).png',
    'books/potrait dorian gray/page (85).png',
    'books/potrait dorian gray/page (86).png',
    'books/potrait dorian gray/page (87).png',
    'books/potrait dorian gray/page (88).png',
    'books/potrait dorian gray/page (89).png',
    'books/potrait dorian gray/page (90).png',
    'books/potrait dorian gray/page (91).png',
    'books/potrait dorian gray/page (92).png',
    'books/potrait dorian gray/page (93).png',
    'books/potrait dorian gray/page (94).png',
    'books/potrait dorian gray/page (95).png',
    'books/potrait dorian gray/page (96).png',
    'books/potrait dorian gray/page (97).png',
    'books/potrait dorian gray/page (98).png',
    'books/potrait dorian gray/page (99).png',
    'books/potrait dorian gray/page (100).png',
    'books/potrait dorian gray/page (101).png',
    'books/potrait dorian gray/page (102).png',
    'books/potrait dorian gray/page (103).png',
    'books/potrait dorian gray/page (104).png',
    'books/potrait dorian gray/page (105).png',
    'books/potrait dorian gray/page (106).png',
    'books/potrait dorian gray/page (107).png',
    'books/potrait dorian gray/page (108).png',
    'books/potrait dorian gray/page (109).png',
    'books/potrait dorian gray/page (110).png',
    'books/potrait dorian gray/page (111).png',
    'books/potrait dorian gray/page (112).png',
    'books/potrait dorian gray/page (113).png',
    'books/potrait dorian gray/page (114).png',
    'books/potrait dorian gray/page (115).png',
    'books/potrait dorian gray/page (116).png',
    'books/potrait dorian gray/page (117).png',
    'books/potrait dorian gray/page (118).png',
    'books/potrait dorian gray/page (119).png',
    'books/potrait dorian gray/page (120).png',
    'books/potrait dorian gray/page (121).png',
    'books/potrait dorian gray/page (122).png',
    'books/potrait dorian gray/page (123).png',
    'books/potrait dorian gray/page (124).png',
    'books/potrait dorian gray/page (125).png',
    'books/potrait dorian gray/page (126).png',
    'books/potrait dorian gray/page (127).png',
    'books/potrait dorian gray/page (128).png',
    'books/potrait dorian gray/page (129).png',
    'books/potrait dorian gray/page (130).png',
    'books/potrait dorian gray/page (131).png',
    'books/potrait dorian gray/page (132).png',
    'books/potrait dorian gray/page (133).png',
    'books/potrait dorian gray/page (134).png',
    'books/potrait dorian gray/page (135).png',
    'books/potrait dorian gray/page (136).png',
    'books/potrait dorian gray/page (137).png',
    'books/potrait dorian gray/page (138).png',
    'books/potrait dorian gray/page (139).png',
    'books/potrait dorian gray/page (140).png',
    'books/potrait dorian gray/page (141).png',
    'books/potrait dorian gray/page (142).png',
    'books/potrait dorian gray/page (143).png',
    'books/potrait dorian gray/page (144).png',
    'books/potrait dorian gray/page (145).png',
    'books/potrait dorian gray/page (146).png',
    'books/potrait dorian gray/page (147).png',
    'books/potrait dorian gray/page (148).png',
    'books/potrait dorian gray/page (149).png',
    'books/potrait dorian gray/page (150).png',
    'books/potrait dorian gray/page (151).png',
    'books/potrait dorian gray/page (152).png',
    'books/potrait dorian gray/page (153).png',
    'books/potrait dorian gray/page (154).png',
    'books/potrait dorian gray/page (155).png',
    'books/potrait dorian gray/page (156).png',
    'books/potrait dorian gray/page (157).png',
    'books/potrait dorian gray/page (158).png',
    'books/potrait dorian gray/page (159).png',
    'books/potrait dorian gray/page (160).png',
    'books/potrait dorian gray/page (161).png',
    'books/potrait dorian gray/page (162).png',
    'books/potrait dorian gray/page (163).png',
    'books/potrait dorian gray/page (164).png',
    'books/potrait dorian gray/page (165).png',
    'books/potrait dorian gray/page (166).png',
    'books/potrait dorian gray/page (167).png',
    'books/potrait dorian gray/page (168).png',
    'books/potrait dorian gray/page (169).png',
    'books/potrait dorian gray/page (170).png',
    'books/potrait dorian gray/page (171).png',
    'books/potrait dorian gray/page (172).png',
    'books/potrait dorian gray/page (173).png',
    'books/potrait dorian gray/page (174).png',
    'books/potrait dorian gray/page (175).png',
    'books/potrait dorian gray/page (176).png',
    'books/potrait dorian gray/page (177).png',
    'books/potrait dorian gray/page (178).png',
    'books/potrait dorian gray/page (179).png',
    'books/potrait dorian gray/page (180).png',
    'books/potrait dorian gray/page (181).png',
    'books/potrait dorian gray/page (182).png',
    'books/potrait dorian gray/page (183).png',
    'books/potrait dorian gray/page (184).png',
    'books/potrait dorian gray/page (185).png',
    'books/potrait dorian gray/page (186).png',
    'books/potrait dorian gray/page (187).png',
    'books/potrait dorian gray/page (188).png',
    'books/potrait dorian gray/page (189).png',
    'books/potrait dorian gray/page (190).png',
    'books/potrait dorian gray/page (191).png',
    'books/potrait dorian gray/page (192).png',
    'books/potrait dorian gray/page (193).png',
    'books/potrait dorian gray/page (194).png',
    'books/potrait dorian gray/page (195).png',
    'books/potrait dorian gray/page (196).png',
    'books/potrait dorian gray/page (197).png',
    'books/potrait dorian gray/page (198).png',
    'books/potrait dorian gray/page (199).png',
    'books/potrait dorian gray/page (200).png',
    'books/potrait dorian gray/page (201).png',
    'books/potrait dorian gray/page (202).png',
    'books/potrait dorian gray/page (203).png',
    'books/potrait dorian gray/page (204).png',
    'books/potrait dorian gray/page (205).png',
    'books/potrait dorian gray/page (206).png',
    'books/potrait dorian gray/page (207).png',
    'books/potrait dorian gray/page (208).png',
    'books/potrait dorian gray/page (209).png',
    'books/potrait dorian gray/page (210).png',
    'books/potrait dorian gray/page (211).png',
    'books/potrait dorian gray/page (212).png',
    'books/potrait dorian gray/page (213).png',
    'books/potrait dorian gray/page (214).png',
    'books/potrait dorian gray/page (215).png',
    'books/potrait dorian gray/page (216).png',
    'books/potrait dorian gray/page (217).png',
    'books/potrait dorian gray/page (218).png',
    'books/potrait dorian gray/page (219).png',
    'books/potrait dorian gray/page (220).png',
    'books/potrait dorian gray/page (221).png',
    'books/potrait dorian gray/page (222).png',
    'books/potrait dorian gray/page (223).png',

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
