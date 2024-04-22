import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class stives extends StatefulWidget {
  const stives({Key? key}) : super(key: key);

  @override
  State<stives> createState() => _stivesState();
}

class _stivesState extends State<stives> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/st.Ives/page (1).png',
    'books/st.Ives/page (2).png',
    'books/st.Ives/page (3).png',
    'books/st.Ives/page (4).png',
    'books/st.Ives/page (5).png',
    'books/st.Ives/page (6).png',
    'books/st.Ives/page (7).png',
    'books/st.Ives/page (8).png',
    'books/st.Ives/page (9).png',
    'books/st.Ives/page (10).png',
    'books/st.Ives/page (11).png',
    'books/st.Ives/page (12).png',
    'books/st.Ives/page (13).png',
    'books/st.Ives/page (14).png',
    'books/st.Ives/page (15).png',
    'books/st.Ives/page (16).png',
    'books/st.Ives/page (17).png',
    'books/st.Ives/page (18).png',
    'books/st.Ives/page (19).png',
    'books/st.Ives/page (20).png',
    'books/st.Ives/page (21).png',
    'books/st.Ives/page (22).png',
    'books/st.Ives/page (23).png',
    'books/st.Ives/page (24).png',
    'books/st.Ives/page (25).png',
    'books/st.Ives/page (26).png',
    'books/st.Ives/page (27).png',
    'books/st.Ives/page (28).png',
    'books/st.Ives/page (29).png',
    'books/st.Ives/page (30).png',
    'books/st.Ives/page (31).png',
    'books/st.Ives/page (32).png',
    'books/st.Ives/page (33).png',
    'books/st.Ives/page (34).png',
    'books/st.Ives/page (35).png',
    'books/st.Ives/page (36).png',
    'books/st.Ives/page (37).png',
    'books/st.Ives/page (38).png',
    'books/st.Ives/page (39).png',
    'books/st.Ives/page (40).png',
    'books/st.Ives/page (41).png',
    'books/st.Ives/page (42).png',
    'books/st.Ives/page (43).png',
    'books/st.Ives/page (44).png',
    'books/st.Ives/page (45).png',
    'books/st.Ives/page (46).png',
    'books/st.Ives/page (47).png',
    'books/st.Ives/page (48).png',
    'books/st.Ives/page (49).png',
    'books/st.Ives/page (50).png',
    'books/st.Ives/page (51).png',
    'books/st.Ives/page (52).png',
    'books/st.Ives/page (53).png',
    'books/st.Ives/page (54).png',
    'books/st.Ives/page (55).png',
    'books/st.Ives/page (56).png',
    'books/st.Ives/page (57).png',
    'books/st.Ives/page (58).png',
    'books/st.Ives/page (59).png',
    'books/st.Ives/page (60).png',
    'books/st.Ives/page (61).png',
    'books/st.Ives/page (62).png',
    'books/st.Ives/page (63).png',
    'books/st.Ives/page (64).png',
    'books/st.Ives/page (65).png',
    'books/st.Ives/page (66).png',
    'books/st.Ives/page (67).png',
    'books/st.Ives/page (68).png',
    'books/st.Ives/page (69).png',
    'books/st.Ives/page (70).png',
    'books/st.Ives/page (71).png',
    'books/st.Ives/page (72).png',
    'books/st.Ives/page (73).png',
    'books/st.Ives/page (74).png',
    'books/st.Ives/page (75).png',
    'books/st.Ives/page (76).png',
    'books/st.Ives/page (77).png',
    'books/st.Ives/page (78).png',
    'books/st.Ives/page (79).png',
    'books/st.Ives/page (80).png',
    'books/st.Ives/page (81).png',
    'books/st.Ives/page (82).png',
    'books/st.Ives/page (83).png',
    'books/st.Ives/page (84).png',
    'books/st.Ives/page (85).png',
    'books/st.Ives/page (86).png',
    'books/st.Ives/page (87).png',
    'books/st.Ives/page (88).png',
    'books/st.Ives/page (89).png',
    'books/st.Ives/page (90).png',
    'books/st.Ives/page (91).png',
    'books/st.Ives/page (92).png',
    'books/st.Ives/page (93).png',
    'books/st.Ives/page (94).png',
    'books/st.Ives/page (95).png',
    'books/st.Ives/page (96).png',
    'books/st.Ives/page (97).png',
    'books/st.Ives/page (98).png',
    'books/st.Ives/page (99).png',
    'books/st.Ives/page (100).png',
    'books/st.Ives/page (101).png',
    'books/st.Ives/page (102).png',
    'books/st.Ives/page (103).png',
    'books/st.Ives/page (104).png',
    'books/st.Ives/page (105).png',
    'books/st.Ives/page (106).png',
    'books/st.Ives/page (107).png',
    'books/st.Ives/page (108).png',
    'books/st.Ives/page (109).png',
    'books/st.Ives/page (110).png',
    'books/st.Ives/page (111).png',
    'books/st.Ives/page (112).png',
    'books/st.Ives/page (113).png',
    'books/st.Ives/page (114).png',
    'books/st.Ives/page (115).png',
    'books/st.Ives/page (116).png',
    'books/st.Ives/page (117).png',
    'books/st.Ives/page (118).png',
    'books/st.Ives/page (119).png',
    'books/st.Ives/page (120).png',
    'books/st.Ives/page (121).png',
    'books/st.Ives/page (122).png',
    'books/st.Ives/page (123).png',
    'books/st.Ives/page (124).png',
    'books/st.Ives/page (125).png',
    'books/st.Ives/page (126).png',
    'books/st.Ives/page (127).png',
    'books/st.Ives/page (128).png',
    'books/st.Ives/page (129).png',
    'books/st.Ives/page (130).png',
    'books/st.Ives/page (131).png',
    'books/st.Ives/page (132).png',
    'books/st.Ives/page (133).png',
    'books/st.Ives/page (134).png',
    'books/st.Ives/page (135).png',
    'books/st.Ives/page (136).png',
    'books/st.Ives/page (137).png',
    'books/st.Ives/page (138).png',
    'books/st.Ives/page (139).png',
    'books/st.Ives/page (140).png',
    'books/st.Ives/page (141).png',
    'books/st.Ives/page (142).png',
    'books/st.Ives/page (143).png',
    'books/st.Ives/page (144).png',
    'books/st.Ives/page (145).png',
    'books/st.Ives/page (146).png',
    'books/st.Ives/page (147).png',
    'books/st.Ives/page (148).png',
    'books/st.Ives/page (149).png',
    'books/st.Ives/page (150).png',
    'books/st.Ives/page (151).png',
    'books/st.Ives/page (152).png',
    'books/st.Ives/page (153).png',
    'books/st.Ives/page (154).png',
    'books/st.Ives/page (155).png',
    'books/st.Ives/page (156).png',
    'books/st.Ives/page (157).png',
    'books/st.Ives/page (158).png',
    'books/st.Ives/page (159).png',
    'books/st.Ives/page (160).png',
    'books/st.Ives/page (161).png',
    'books/st.Ives/page (162).png',
    'books/st.Ives/page (163).png',
    'books/st.Ives/page (164).png',
    'books/st.Ives/page (165).png',
    'books/st.Ives/page (166).png',
    'books/st.Ives/page (167).png',
    'books/st.Ives/page (168).png',
    'books/st.Ives/page (169).png',
    'books/st.Ives/page (170).png',
    'books/st.Ives/page (171).png',
    'books/st.Ives/page (172).png',
    'books/st.Ives/page (173).png',
    'books/st.Ives/page (174).png',
    'books/st.Ives/page (175).png',
    'books/st.Ives/page (176).png',
    'books/st.Ives/page (177).png',
    'books/st.Ives/page (178).png',
    'books/st.Ives/page (179).png',
    'books/st.Ives/page (180).png',
    'books/st.Ives/page (181).png',
    'books/st.Ives/page (182).png',
    'books/st.Ives/page (183).png',
    'books/st.Ives/page (184).png',
    'books/st.Ives/page (185).png',
    'books/st.Ives/page (186).png',
    'books/st.Ives/page (187).png',
    'books/st.Ives/page (188).png',
    'books/st.Ives/page (189).png',
    'books/st.Ives/page (190).png',
    'books/st.Ives/page (191).png',
    'books/st.Ives/page (192).png',
    'books/st.Ives/page (193).png',
    'books/st.Ives/page (194).png',
    'books/st.Ives/page (195).png',
    'books/st.Ives/page (196).png',
    'books/st.Ives/page (197).png',
    'books/st.Ives/page (198).png',
    'books/st.Ives/page (199).png',
    'books/st.Ives/page (200).png',
    'books/st.Ives/page (201).png',
    'books/st.Ives/page (202).png',
    'books/st.Ives/page (203).png',
    'books/st.Ives/page (204).png',
    'books/st.Ives/page (205).png',
    'books/st.Ives/page (206).png',
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
