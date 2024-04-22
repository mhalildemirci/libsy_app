import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class newmachiavelli extends StatefulWidget {
  const newmachiavelli({Key? key}) : super(key: key);

  @override
  State<newmachiavelli> createState() => _newmachiavelliState();
}

class _newmachiavelliState extends State<newmachiavelli> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/new machiavelli/page (1).png',
    'books/new machiavelli/page (2).png',
    'books/new machiavelli/page (3).png',
    'books/new machiavelli/page (4).png',
    'books/new machiavelli/page (5).png',
    'books/new machiavelli/page (6).png',
    'books/new machiavelli/page (7).png',
    'books/new machiavelli/page (8).png',
    'books/new machiavelli/page (9).png',
    'books/new machiavelli/page (10).png',
    'books/new machiavelli/page (11).png',
    'books/new machiavelli/page (12).png',
    'books/new machiavelli/page (13).png',
    'books/new machiavelli/page (14).png',
    'books/new machiavelli/page (15).png',
    'books/new machiavelli/page (16).png',
    'books/new machiavelli/page (17).png',
    'books/new machiavelli/page (18).png',
    'books/new machiavelli/page (19).png',
    'books/new machiavelli/page (20).png',
    'books/new machiavelli/page (21).png',
    'books/new machiavelli/page (22).png',
    'books/new machiavelli/page (23).png',
    'books/new machiavelli/page (24).png',
    'books/new machiavelli/page (25).png',
    'books/new machiavelli/page (26).png',
    'books/new machiavelli/page (27).png',
    'books/new machiavelli/page (28).png',
    'books/new machiavelli/page (29).png',
    'books/new machiavelli/page (30).png',
    'books/new machiavelli/page (31).png',
    'books/new machiavelli/page (32).png',
    'books/new machiavelli/page (33).png',
    'books/new machiavelli/page (34).png',
    'books/new machiavelli/page (35).png',
    'books/new machiavelli/page (36).png',
    'books/new machiavelli/page (37).png',
    'books/new machiavelli/page (38).png',
    'books/new machiavelli/page (39).png',
    'books/new machiavelli/page (40).png',
    'books/new machiavelli/page (41).png',
    'books/new machiavelli/page (42).png',
    'books/new machiavelli/page (43).png',
    'books/new machiavelli/page (44).png',
    'books/new machiavelli/page (45).png',
    'books/new machiavelli/page (46).png',
    'books/new machiavelli/page (47).png',
    'books/new machiavelli/page (48).png',
    'books/new machiavelli/page (49).png',
    'books/new machiavelli/page (50).png',
    'books/new machiavelli/page (51).png',
    'books/new machiavelli/page (52).png',
    'books/new machiavelli/page (53).png',
    'books/new machiavelli/page (54).png',
    'books/new machiavelli/page (55).png',
    'books/new machiavelli/page (56).png',
    'books/new machiavelli/page (57).png',
    'books/new machiavelli/page (58).png',
    'books/new machiavelli/page (59).png',
    'books/new machiavelli/page (60).png',
    'books/new machiavelli/page (61).png',
    'books/new machiavelli/page (62).png',
    'books/new machiavelli/page (63).png',
    'books/new machiavelli/page (64).png',
    'books/new machiavelli/page (65).png',
    'books/new machiavelli/page (66).png',
    'books/new machiavelli/page (67).png',
    'books/new machiavelli/page (68).png',
    'books/new machiavelli/page (69).png',
    'books/new machiavelli/page (70).png',
    'books/new machiavelli/page (71).png',
    'books/new machiavelli/page (72).png',
    'books/new machiavelli/page (73).png',
    'books/new machiavelli/page (74).png',
    'books/new machiavelli/page (75).png',
    'books/new machiavelli/page (76).png',
    'books/new machiavelli/page (77).png',
    'books/new machiavelli/page (78).png',
    'books/new machiavelli/page (79).png',
    'books/new machiavelli/page (80).png',
    'books/new machiavelli/page (81).png',
    'books/new machiavelli/page (82).png',
    'books/new machiavelli/page (83).png',
    'books/new machiavelli/page (84).png',
    'books/new machiavelli/page (85).png',
    'books/new machiavelli/page (86).png',
    'books/new machiavelli/page (87).png',
    'books/new machiavelli/page (88).png',
    'books/new machiavelli/page (89).png',
    'books/new machiavelli/page (90).png',
    'books/new machiavelli/page (91).png',
    'books/new machiavelli/page (92).png',
    'books/new machiavelli/page (93).png',
    'books/new machiavelli/page (94).png',
    'books/new machiavelli/page (95).png',
    'books/new machiavelli/page (96).png',
    'books/new machiavelli/page (97).png',
    'books/new machiavelli/page (98).png',
    'books/new machiavelli/page (99).png',
    'books/new machiavelli/page (100).png',
    'books/new machiavelli/page (101).png',
    'books/new machiavelli/page (102).png',
    'books/new machiavelli/page (103).png',
    'books/new machiavelli/page (104).png',
    'books/new machiavelli/page (105).png',
    'books/new machiavelli/page (106).png',
    'books/new machiavelli/page (107).png',
    'books/new machiavelli/page (108).png',
    'books/new machiavelli/page (109).png',
    'books/new machiavelli/page (110).png',
    'books/new machiavelli/page (111).png',
    'books/new machiavelli/page (112).png',
    'books/new machiavelli/page (113).png',
    'books/new machiavelli/page (114).png',
    'books/new machiavelli/page (115).png',
    'books/new machiavelli/page (116).png',
    'books/new machiavelli/page (117).png',
    'books/new machiavelli/page (118).png',
    'books/new machiavelli/page (119).png',
    'books/new machiavelli/page (120).png',
    'books/new machiavelli/page (121).png',
    'books/new machiavelli/page (122).png',
    'books/new machiavelli/page (123).png',
    'books/new machiavelli/page (124).png',
    'books/new machiavelli/page (125).png',
    'books/new machiavelli/page (126).png',
    'books/new machiavelli/page (127).png',
    'books/new machiavelli/page (128).png',
    'books/new machiavelli/page (129).png',
    'books/new machiavelli/page (130).png',
    'books/new machiavelli/page (131).png',
    'books/new machiavelli/page (132).png',
    'books/new machiavelli/page (133).png',
    'books/new machiavelli/page (134).png',
    'books/new machiavelli/page (135).png',
    'books/new machiavelli/page (136).png',
    'books/new machiavelli/page (137).png',
    'books/new machiavelli/page (138).png',
    'books/new machiavelli/page (139).png',
    'books/new machiavelli/page (140).png',
    'books/new machiavelli/page (141).png',
    'books/new machiavelli/page (142).png',
    'books/new machiavelli/page (143).png',
    'books/new machiavelli/page (144).png',
    'books/new machiavelli/page (145).png',
    'books/new machiavelli/page (146).png',
    'books/new machiavelli/page (147).png',
    'books/new machiavelli/page (148).png',
    'books/new machiavelli/page (149).png',
    'books/new machiavelli/page (150).png',
    'books/new machiavelli/page (151).png',
    'books/new machiavelli/page (152).png',
    'books/new machiavelli/page (153).png',
    'books/new machiavelli/page (154).png',
    'books/new machiavelli/page (155).png',
    'books/new machiavelli/page (156).png',
    'books/new machiavelli/page (157).png',
    'books/new machiavelli/page (158).png',
    'books/new machiavelli/page (159).png',
    'books/new machiavelli/page (160).png',
    'books/new machiavelli/page (161).png',
    'books/new machiavelli/page (162).png',
    'books/new machiavelli/page (163).png',
    'books/new machiavelli/page (164).png',
    'books/new machiavelli/page (165).png',
    'books/new machiavelli/page (166).png',
    'books/new machiavelli/page (167).png',
    'books/new machiavelli/page (168).png',
    'books/new machiavelli/page (169).png',
    'books/new machiavelli/page (170).png',
    'books/new machiavelli/page (171).png',
    'books/new machiavelli/page (172).png',
    'books/new machiavelli/page (173).png',
    'books/new machiavelli/page (174).png',
    'books/new machiavelli/page (175).png',
    'books/new machiavelli/page (176).png',
    'books/new machiavelli/page (177).png',
    'books/new machiavelli/page (178).png',
    'books/new machiavelli/page (179).png',
    'books/new machiavelli/page (180).png',
    'books/new machiavelli/page (181).png',
    'books/new machiavelli/page (182).png',
    'books/new machiavelli/page (183).png',
    'books/new machiavelli/page (184).png',
    'books/new machiavelli/page (185).png',
    'books/new machiavelli/page (186).png',
    'books/new machiavelli/page (187).png',
    'books/new machiavelli/page (188).png',
    'books/new machiavelli/page (189).png',
    'books/new machiavelli/page (190).png',
    'books/new machiavelli/page (191).png',
    'books/new machiavelli/page (192).png',
    'books/new machiavelli/page (193).png',
    'books/new machiavelli/page (194).png',
    'books/new machiavelli/page (195).png',
    'books/new machiavelli/page (196).png',
    'books/new machiavelli/page (197).png',
    'books/new machiavelli/page (198).png',
    'books/new machiavelli/page (199).png',
    'books/new machiavelli/page (200).png',
    'books/new machiavelli/page (201).png',
    'books/new machiavelli/page (202).png',
    'books/new machiavelli/page (203).png',
    'books/new machiavelli/page (204).png',
    'books/new machiavelli/page (205).png',
    'books/new machiavelli/page (206).png',
    'books/new machiavelli/page (207).png',
    'books/new machiavelli/page (208).png',
    'books/new machiavelli/page (209).png',
    'books/new machiavelli/page (210).png',
    'books/new machiavelli/page (211).png',
    'books/new machiavelli/page (212).png',
    'books/new machiavelli/page (213).png',
    'books/new machiavelli/page (214).png',
    'books/new machiavelli/page (215).png',
    'books/new machiavelli/page (216).png',
    'books/new machiavelli/page (217).png',
    'books/new machiavelli/page (218).png',
    'books/new machiavelli/page (219).png',
    'books/new machiavelli/page (220).png',
    'books/new machiavelli/page (221).png',
    'books/new machiavelli/page (222).png',
    'books/new machiavelli/page (223).png',
    'books/new machiavelli/page (224).png',
    'books/new machiavelli/page (225).png',
    'books/new machiavelli/page (226).png',
    'books/new machiavelli/page (227).png',
    'books/new machiavelli/page (228).png',
    'books/new machiavelli/page (229).png',
    'books/new machiavelli/page (230).png',
    'books/new machiavelli/page (231).png',
    'books/new machiavelli/page (232).png',
    'books/new machiavelli/page (233).png',
    'books/new machiavelli/page (234).png',
    'books/new machiavelli/page (235).png',
    'books/new machiavelli/page (236).png',
    'books/new machiavelli/page (237).png',
    'books/new machiavelli/page (238).png',
    'books/new machiavelli/page (239).png',
    'books/new machiavelli/page (240).png',
    'books/new machiavelli/page (241).png',
    'books/new machiavelli/page (242).png',
    'books/new machiavelli/page (243).png',
    'books/new machiavelli/page (244).png',
    'books/new machiavelli/page (245).png',
    'books/new machiavelli/page (246).png',
    'books/new machiavelli/page (247).png',
    'books/new machiavelli/page (248).png',
    'books/new machiavelli/page (249).png',
    'books/new machiavelli/page (250).png',
    'books/new machiavelli/page (251).png',
    'books/new machiavelli/page (252).png',
    'books/new machiavelli/page (253).png',
    'books/new machiavelli/page (254).png',
    'books/new machiavelli/page (255).png',
    'books/new machiavelli/page (256).png',

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
