import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class istanbulicyuzu extends StatefulWidget {
  const istanbulicyuzu({Key? key}) : super(key: key);

  @override
  State<istanbulicyuzu> createState() => _istanbulicyuzuState();
}

class _istanbulicyuzuState extends State<istanbulicyuzu> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/istanbulun icyuzu/page (1).png',
    'books/istanbulun icyuzu/page (2).png',
    'books/istanbulun icyuzu/page (3).png',
    'books/istanbulun icyuzu/page (4).png',
    'books/istanbulun icyuzu/page (5).png',
    'books/istanbulun icyuzu/page (6).png',
    'books/istanbulun icyuzu/page (7).png',
    'books/istanbulun icyuzu/page (8).png',
    'books/istanbulun icyuzu/page (9).png',
    'books/istanbulun icyuzu/page (10).png',
    'books/istanbulun icyuzu/page (11).png',
    'books/istanbulun icyuzu/page (12).png',
    'books/istanbulun icyuzu/page (13).png',
    'books/istanbulun icyuzu/page (14).png',
    'books/istanbulun icyuzu/page (15).png',
    'books/istanbulun icyuzu/page (16).png',
    'books/istanbulun icyuzu/page (17).png',
    'books/istanbulun icyuzu/page (18).png',
    'books/istanbulun icyuzu/page (19).png',
    'books/istanbulun icyuzu/page (20).png',
    'books/istanbulun icyuzu/page (21).png',
    'books/istanbulun icyuzu/page (22).png',
    'books/istanbulun icyuzu/page (23).png',
    'books/istanbulun icyuzu/page (24).png',
    'books/istanbulun icyuzu/page (25).png',
    'books/istanbulun icyuzu/page (26).png',
    'books/istanbulun icyuzu/page (27).png',
    'books/istanbulun icyuzu/page (28).png',
    'books/istanbulun icyuzu/page (29).png',
    'books/istanbulun icyuzu/page (30).png',
    'books/istanbulun icyuzu/page (31).png',
    'books/istanbulun icyuzu/page (32).png',
    'books/istanbulun icyuzu/page (33).png',
    'books/istanbulun icyuzu/page (34).png',
    'books/istanbulun icyuzu/page (35).png',
    'books/istanbulun icyuzu/page (36).png',
    'books/istanbulun icyuzu/page (37).png',
    'books/istanbulun icyuzu/page (38).png',
    'books/istanbulun icyuzu/page (39).png',
    'books/istanbulun icyuzu/page (40).png',
    'books/istanbulun icyuzu/page (41).png',
    'books/istanbulun icyuzu/page (42).png',
    'books/istanbulun icyuzu/page (43).png',
    'books/istanbulun icyuzu/page (44).png',
    'books/istanbulun icyuzu/page (45).png',
    'books/istanbulun icyuzu/page (46).png',
    'books/istanbulun icyuzu/page (47).png',
    'books/istanbulun icyuzu/page (48).png',
    'books/istanbulun icyuzu/page (49).png',
    'books/istanbulun icyuzu/page (50).png',
    'books/istanbulun icyuzu/page (51).png',
    'books/istanbulun icyuzu/page (52).png',
    'books/istanbulun icyuzu/page (53).png',
    'books/istanbulun icyuzu/page (54).png',
    'books/istanbulun icyuzu/page (55).png',
    'books/istanbulun icyuzu/page (56).png',
    'books/istanbulun icyuzu/page (57).png',
    'books/istanbulun icyuzu/page (58).png',
    'books/istanbulun icyuzu/page (59).png',
    'books/istanbulun icyuzu/page (60).png',
    'books/istanbulun icyuzu/page (61).png',
    'books/istanbulun icyuzu/page (62).png',
    'books/istanbulun icyuzu/page (63).png',
    'books/istanbulun icyuzu/page (64).png',
    'books/istanbulun icyuzu/page (65).png',
    'books/istanbulun icyuzu/page (66).png',
    'books/istanbulun icyuzu/page (67).png',
    'books/istanbulun icyuzu/page (68).png',
    'books/istanbulun icyuzu/page (69).png',
    'books/istanbulun icyuzu/page (70).png',
    'books/istanbulun icyuzu/page (71).png',
    'books/istanbulun icyuzu/page (72).png',
    'books/istanbulun icyuzu/page (73).png',
    'books/istanbulun icyuzu/page (74).png',
    'books/istanbulun icyuzu/page (75).png',
    'books/istanbulun icyuzu/page (76).png',
    'books/istanbulun icyuzu/page (77).png',
    'books/istanbulun icyuzu/page (78).png',
    'books/istanbulun icyuzu/page (79).png',
    'books/istanbulun icyuzu/page (80).png',
    'books/istanbulun icyuzu/page (81).png',
    'books/istanbulun icyuzu/page (82).png',
    'books/istanbulun icyuzu/page (83).png',
    'books/istanbulun icyuzu/page (84).png',
    'books/istanbulun icyuzu/page (85).png',
    'books/istanbulun icyuzu/page (86).png',
    'books/istanbulun icyuzu/page (87).png',
    'books/istanbulun icyuzu/page (88).png',
    'books/istanbulun icyuzu/page (89).png',
    'books/istanbulun icyuzu/page (90).png',
    'books/istanbulun icyuzu/page (91).png',
    'books/istanbulun icyuzu/page (92).png',
    'books/istanbulun icyuzu/page (93).png',
    'books/istanbulun icyuzu/page (94).png',
    'books/istanbulun icyuzu/page (95).png',
    'books/istanbulun icyuzu/page (96).png',
    'books/istanbulun icyuzu/page (97).png',
    'books/istanbulun icyuzu/page (98).png',
    'books/istanbulun icyuzu/page (99).png',
    'books/istanbulun icyuzu/page (100).png',
    'books/istanbulun icyuzu/page (101).png',
    'books/istanbulun icyuzu/page (102).png',
    'books/istanbulun icyuzu/page (103).png',
    'books/istanbulun icyuzu/page (104).png',
    'books/istanbulun icyuzu/page (105).png',
    'books/istanbulun icyuzu/page (106).png',
    'books/istanbulun icyuzu/page (107).png',
    'books/istanbulun icyuzu/page (108).png',
    'books/istanbulun icyuzu/page (109).png',
    'books/istanbulun icyuzu/page (110).png',
    'books/istanbulun icyuzu/page (111).png',
    'books/istanbulun icyuzu/page (112).png',
    'books/istanbulun icyuzu/page (113).png',
    'books/istanbulun icyuzu/page (114).png',
    'books/istanbulun icyuzu/page (115).png',
    'books/istanbulun icyuzu/page (116).png',
    'books/istanbulun icyuzu/page (117).png',
    'books/istanbulun icyuzu/page (118).png',
    'books/istanbulun icyuzu/page (119).png',
    'books/istanbulun icyuzu/page (120).png',
    'books/istanbulun icyuzu/page (121).png',
    'books/istanbulun icyuzu/page (122).png',
    'books/istanbulun icyuzu/page (123).png',
    'books/istanbulun icyuzu/page (124).png',
    'books/istanbulun icyuzu/page (125).png',
    'books/istanbulun icyuzu/page (126).png',
    'books/istanbulun icyuzu/page (127).png',
    'books/istanbulun icyuzu/page (128).png',
    'books/istanbulun icyuzu/page (129).png',
    'books/istanbulun icyuzu/page (130).png',
    'books/istanbulun icyuzu/page (131).png',
    'books/istanbulun icyuzu/page (132).png',
    'books/istanbulun icyuzu/page (133).png',
    'books/istanbulun icyuzu/page (134).png',
    'books/istanbulun icyuzu/page (135).png',
    'books/istanbulun icyuzu/page (136).png',
    'books/istanbulun icyuzu/page (137).png',
    'books/istanbulun icyuzu/page (138).png',
    'books/istanbulun icyuzu/page (139).png',
    'books/istanbulun icyuzu/page (140).png',
    'books/istanbulun icyuzu/page (141).png',
    'books/istanbulun icyuzu/page (142).png',
    'books/istanbulun icyuzu/page (143).png',
    'books/istanbulun icyuzu/page (144).png',
    'books/istanbulun icyuzu/page (145).png',
    'books/istanbulun icyuzu/page (146).png',
    'books/istanbulun icyuzu/page (147).png',
    'books/istanbulun icyuzu/page (148).png',
    'books/istanbulun icyuzu/page (149).png',
    'books/istanbulun icyuzu/page (150).png',
    'books/istanbulun icyuzu/page (151).png',
    'books/istanbulun icyuzu/page (152).png',
    'books/istanbulun icyuzu/page (153).png',
    'books/istanbulun icyuzu/page (154).png',
    'books/istanbulun icyuzu/page (155).png',
    'books/istanbulun icyuzu/page (156).png',
    'books/istanbulun icyuzu/page (157).png',
    'books/istanbulun icyuzu/page (158).png',
    'books/istanbulun icyuzu/page (159).png',
    'books/istanbulun icyuzu/page (160).png',
    'books/istanbulun icyuzu/page (161).png',
    'books/istanbulun icyuzu/page (162).png',
    'books/istanbulun icyuzu/page (163).png',
    'books/istanbulun icyuzu/page (164).png',
    'books/istanbulun icyuzu/page (165).png',
    'books/istanbulun icyuzu/page (166).png',
    'books/istanbulun icyuzu/page (167).png',
    'books/istanbulun icyuzu/page (168).png',
    'books/istanbulun icyuzu/page (169).png',
    'books/istanbulun icyuzu/page (170).png',
    'books/istanbulun icyuzu/page (171).png',
    'books/istanbulun icyuzu/page (172).png',
    'books/istanbulun icyuzu/page (173).png',
    'books/istanbulun icyuzu/page (174).png',
    'books/istanbulun icyuzu/page (175).png',
    'books/istanbulun icyuzu/page (176).png',
    'books/istanbulun icyuzu/page (177).png',
    'books/istanbulun icyuzu/page (178).png',
    'books/istanbulun icyuzu/page (179).png',
    'books/istanbulun icyuzu/page (180).png',
    'books/istanbulun icyuzu/page (181).png',
    'books/istanbulun icyuzu/page (182).png',
    'books/istanbulun icyuzu/page (183).png',
    'books/istanbulun icyuzu/page (184).png',
    'books/istanbulun icyuzu/page (185).png',
    'books/istanbulun icyuzu/page (186).png',
    'books/istanbulun icyuzu/page (187).png',
    'books/istanbulun icyuzu/page (188).png',
    'books/istanbulun icyuzu/page (189).png',
    'books/istanbulun icyuzu/page (190).png',
    'books/istanbulun icyuzu/page (191).png',
    'books/istanbulun icyuzu/page (192).png',
    'books/istanbulun icyuzu/page (193).png',
    'books/istanbulun icyuzu/page (194).png',
    'books/istanbulun icyuzu/page (195).png',
    'books/istanbulun icyuzu/page (196).png',
    'books/istanbulun icyuzu/page (197).png',
    'books/istanbulun icyuzu/page (198).png',
    'books/istanbulun icyuzu/page (199).png',
    'books/istanbulun icyuzu/page (200).png',
    'books/istanbulun icyuzu/page (201).png',
    'books/istanbulun icyuzu/page (202).png',
    'books/istanbulun icyuzu/page (203).png',
    'books/istanbulun icyuzu/page (204).png',
    'books/istanbulun icyuzu/page (205).png',
    'books/istanbulun icyuzu/page (206).png',
    'books/istanbulun icyuzu/page (207).png',
    'books/istanbulun icyuzu/page (208).png',
    'books/istanbulun icyuzu/page (209).png',
    'books/istanbulun icyuzu/page (210).png',
    'books/istanbulun icyuzu/page (211).png',
    'books/istanbulun icyuzu/page (212).png',
    'books/istanbulun icyuzu/page (213).png',
    'books/istanbulun icyuzu/page (214).png',
    'books/istanbulun icyuzu/page (215).png',
    'books/istanbulun icyuzu/page (216).png',
    'books/istanbulun icyuzu/page (217).png',
    'books/istanbulun icyuzu/page (218).png',
    'books/istanbulun icyuzu/page (219).png',
    'books/istanbulun icyuzu/page (220).png',
    'books/istanbulun icyuzu/page (221).png',
    'books/istanbulun icyuzu/page (222).png',
    'books/istanbulun icyuzu/page (223).png',
    'books/istanbulun icyuzu/page (224).png',
    'books/istanbulun icyuzu/page (225).png',
    'books/istanbulun icyuzu/page (226).png',
    'books/istanbulun icyuzu/page (227).png',

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
