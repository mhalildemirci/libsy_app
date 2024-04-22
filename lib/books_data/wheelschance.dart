import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wheelschance extends StatefulWidget {
  const wheelschance({Key? key}) : super(key: key);

  @override
  State<wheelschance> createState() => _wheelschanceState();
}

class _wheelschanceState extends State<wheelschance> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/wheels chance/page (1).png',
    'books/wheels chance/page (2).png',
    'books/wheels chance/page (3).png',
    'books/wheels chance/page (4).png',
    'books/wheels chance/page (5).png',
    'books/wheels chance/page (6).png',
    'books/wheels chance/page (7).png',
    'books/wheels chance/page (8).png',
    'books/wheels chance/page (9).png',
    'books/wheels chance/page (10).png',
    'books/wheels chance/page (11).png',
    'books/wheels chance/page (12).png',
    'books/wheels chance/page (13).png',
    'books/wheels chance/page (14).png',
    'books/wheels chance/page (15).png',
    'books/wheels chance/page (16).png',
    'books/wheels chance/page (17).png',
    'books/wheels chance/page (18).png',
    'books/wheels chance/page (19).png',
    'books/wheels chance/page (20).png',
    'books/wheels chance/page (21).png',
    'books/wheels chance/page (22).png',
    'books/wheels chance/page (23).png',
    'books/wheels chance/page (24).png',
    'books/wheels chance/page (25).png',
    'books/wheels chance/page (26).png',
    'books/wheels chance/page (27).png',
    'books/wheels chance/page (28).png',
    'books/wheels chance/page (29).png',
    'books/wheels chance/page (30).png',
    'books/wheels chance/page (31).png',
    'books/wheels chance/page (32).png',
    'books/wheels chance/page (33).png',
    'books/wheels chance/page (34).png',
    'books/wheels chance/page (35).png',
    'books/wheels chance/page (36).png',
    'books/wheels chance/page (37).png',
    'books/wheels chance/page (38).png',
    'books/wheels chance/page (39).png',
    'books/wheels chance/page (40).png',
    'books/wheels chance/page (41).png',
    'books/wheels chance/page (42).png',
    'books/wheels chance/page (43).png',
    'books/wheels chance/page (44).png',
    'books/wheels chance/page (45).png',
    'books/wheels chance/page (46).png',
    'books/wheels chance/page (47).png',
    'books/wheels chance/page (48).png',
    'books/wheels chance/page (49).png',
    'books/wheels chance/page (50).png',
    'books/wheels chance/page (51).png',
    'books/wheels chance/page (52).png',
    'books/wheels chance/page (53).png',
    'books/wheels chance/page (54).png',
    'books/wheels chance/page (55).png',
    'books/wheels chance/page (56).png',
    'books/wheels chance/page (57).png',
    'books/wheels chance/page (58).png',
    'books/wheels chance/page (59).png',
    'books/wheels chance/page (60).png',
    'books/wheels chance/page (61).png',
    'books/wheels chance/page (62).png',
    'books/wheels chance/page (63).png',
    'books/wheels chance/page (64).png',
    'books/wheels chance/page (65).png',
    'books/wheels chance/page (66).png',
    'books/wheels chance/page (67).png',
    'books/wheels chance/page (68).png',
    'books/wheels chance/page (69).png',
    'books/wheels chance/page (70).png',
    'books/wheels chance/page (71).png',
    'books/wheels chance/page (72).png',
    'books/wheels chance/page (73).png',
    'books/wheels chance/page (74).png',
    'books/wheels chance/page (75).png',
    'books/wheels chance/page (76).png',
    'books/wheels chance/page (77).png',
    'books/wheels chance/page (78).png',
    'books/wheels chance/page (79).png',
    'books/wheels chance/page (80).png',
    'books/wheels chance/page (81).png',
    'books/wheels chance/page (82).png',
    'books/wheels chance/page (83).png',
    'books/wheels chance/page (84).png',
    'books/wheels chance/page (85).png',
    'books/wheels chance/page (86).png',
    'books/wheels chance/page (87).png',
    'books/wheels chance/page (88).png',
    'books/wheels chance/page (89).png',
    'books/wheels chance/page (90).png',
    'books/wheels chance/page (91).png',
    'books/wheels chance/page (92).png',
    'books/wheels chance/page (93).png',
    'books/wheels chance/page (94).png',
    'books/wheels chance/page (95).png',
    'books/wheels chance/page (96).png',
    'books/wheels chance/page (97).png',
    'books/wheels chance/page (98).png',
    'books/wheels chance/page (99).png',
    'books/wheels chance/page (100).png',
    'books/wheels chance/page (101).png',
    'books/wheels chance/page (102).png',
    'books/wheels chance/page (103).png',
    'books/wheels chance/page (104).png',
    'books/wheels chance/page (105).png',
    'books/wheels chance/page (106).png',
    'books/wheels chance/page (107).png',
    'books/wheels chance/page (108).png',
    'books/wheels chance/page (109).png',
    'books/wheels chance/page (110).png',
    'books/wheels chance/page (111).png',
    'books/wheels chance/page (112).png',
    'books/wheels chance/page (113).png',
    'books/wheels chance/page (114).png',
    'books/wheels chance/page (115).png',
    'books/wheels chance/page (116).png',
    'books/wheels chance/page (117).png',
    'books/wheels chance/page (118).png',
    'books/wheels chance/page (119).png',
    'books/wheels chance/page (120).png',
    'books/wheels chance/page (121).png',
    'books/wheels chance/page (122).png',
    'books/wheels chance/page (123).png',
    'books/wheels chance/page (124).png',
    'books/wheels chance/page (125).png',
    'books/wheels chance/page (126).png',
    'books/wheels chance/page (127).png',
    'books/wheels chance/page (128).png',
    'books/wheels chance/page (129).png',
    'books/wheels chance/page (130).png',
    'books/wheels chance/page (131).png',
    'books/wheels chance/page (132).png',
    'books/wheels chance/page (133).png',
    'books/wheels chance/page (134).png',
    'books/wheels chance/page (135).png',
    'books/wheels chance/page (136).png',
    'books/wheels chance/page (137).png',
    'books/wheels chance/page (138).png',
    'books/wheels chance/page (139).png',
    'books/wheels chance/page (140).png',
    'books/wheels chance/page (141).png',
    'books/wheels chance/page (142).png',
    'books/wheels chance/page (143).png',
    'books/wheels chance/page (144).png',
    'books/wheels chance/page (145).png',
    'books/wheels chance/page (146).png',
    'books/wheels chance/page (147).png',
    'books/wheels chance/page (148).png',
    'books/wheels chance/page (149).png',
    'books/wheels chance/page (150).png',
    'books/wheels chance/page (151).png',
    'books/wheels chance/page (152).png',
    'books/wheels chance/page (153).png',
    'books/wheels chance/page (154).png',
    'books/wheels chance/page (155).png',
    'books/wheels chance/page (156).png',
    'books/wheels chance/page (157).png',
    'books/wheels chance/page (158).png',
    'books/wheels chance/page (159).png',
    'books/wheels chance/page (160).png',
    'books/wheels chance/page (161).png',
    'books/wheels chance/page (162).png',
    'books/wheels chance/page (163).png',
    'books/wheels chance/page (164).png',
    'books/wheels chance/page (165).png',
    'books/wheels chance/page (166).png',
    'books/wheels chance/page (167).png',
    'books/wheels chance/page (168).png',
    'books/wheels chance/page (169).png',
    'books/wheels chance/page (170).png',
    'books/wheels chance/page (171).png',
    'books/wheels chance/page (172).png',
    'books/wheels chance/page (173).png',
    'books/wheels chance/page (174).png',
    'books/wheels chance/page (175).png',
    'books/wheels chance/page (176).png',
    'books/wheels chance/page (177).png',
    'books/wheels chance/page (178).png',
    'books/wheels chance/page (179).png',

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
