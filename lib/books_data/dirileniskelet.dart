import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class dirileniskelet extends StatefulWidget {
  const dirileniskelet({Key? key}) : super(key: key);

  @override
  State<dirileniskelet> createState() => _dirileniskeletState();
}

class _dirileniskeletState extends State<dirileniskelet> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/dirilen Iskelet/page (1).png',
    'books/dirilen Iskelet/page (2).png',
    'books/dirilen Iskelet/page (3).png',
    'books/dirilen Iskelet/page (4).png',
    'books/dirilen Iskelet/page (5).png',
    'books/dirilen Iskelet/page (6).png',
    'books/dirilen Iskelet/page (7).png',
    'books/dirilen Iskelet/page (8).png',
    'books/dirilen Iskelet/page (9).png',
    'books/dirilen Iskelet/page (10).png',
    'books/dirilen Iskelet/page (11).png',
    'books/dirilen Iskelet/page (12).png',
    'books/dirilen Iskelet/page (13).png',
    'books/dirilen Iskelet/page (14).png',
    'books/dirilen Iskelet/page (15).png',
    'books/dirilen Iskelet/page (16).png',
    'books/dirilen Iskelet/page (17).png',
    'books/dirilen Iskelet/page (18).png',
    'books/dirilen Iskelet/page (19).png',
    'books/dirilen Iskelet/page (20).png',
    'books/dirilen Iskelet/page (21).png',
    'books/dirilen Iskelet/page (22).png',
    'books/dirilen Iskelet/page (23).png',
    'books/dirilen Iskelet/page (24).png',
    'books/dirilen Iskelet/page (25).png',
    'books/dirilen Iskelet/page (26).png',
    'books/dirilen Iskelet/page (27).png',
    'books/dirilen Iskelet/page (28).png',
    'books/dirilen Iskelet/page (29).png',
    'books/dirilen Iskelet/page (30).png',
    'books/dirilen Iskelet/page (31).png',
    'books/dirilen Iskelet/page (32).png',
    'books/dirilen Iskelet/page (33).png',
    'books/dirilen Iskelet/page (34).png',
    'books/dirilen Iskelet/page (35).png',
    'books/dirilen Iskelet/page (36).png',
    'books/dirilen Iskelet/page (37).png',
    'books/dirilen Iskelet/page (38).png',
    'books/dirilen Iskelet/page (39).png',
    'books/dirilen Iskelet/page (40).png',
    'books/dirilen Iskelet/page (41).png',
    'books/dirilen Iskelet/page (42).png',
    'books/dirilen Iskelet/page (43).png',
    'books/dirilen Iskelet/page (44).png',
    'books/dirilen Iskelet/page (45).png',
    'books/dirilen Iskelet/page (46).png',
    'books/dirilen Iskelet/page (47).png',
    'books/dirilen Iskelet/page (48).png',
    'books/dirilen Iskelet/page (49).png',
    'books/dirilen Iskelet/page (50).png',
    'books/dirilen Iskelet/page (51).png',
    'books/dirilen Iskelet/page (52).png',
    'books/dirilen Iskelet/page (53).png',
    'books/dirilen Iskelet/page (54).png',
    'books/dirilen Iskelet/page (55).png',
    'books/dirilen Iskelet/page (56).png',
    'books/dirilen Iskelet/page (57).png',
    'books/dirilen Iskelet/page (58).png',
    'books/dirilen Iskelet/page (59).png',
    'books/dirilen Iskelet/page (60).png',
    'books/dirilen Iskelet/page (61).png',
    'books/dirilen Iskelet/page (62).png',
    'books/dirilen Iskelet/page (63).png',
    'books/dirilen Iskelet/page (64).png',
    'books/dirilen Iskelet/page (65).png',
    'books/dirilen Iskelet/page (66).png',
    'books/dirilen Iskelet/page (67).png',
    'books/dirilen Iskelet/page (68).png',
    'books/dirilen Iskelet/page (69).png',
    'books/dirilen Iskelet/page (70).png',
    'books/dirilen Iskelet/page (71).png',
    'books/dirilen Iskelet/page (72).png',
    'books/dirilen Iskelet/page (73).png',
    'books/dirilen Iskelet/page (74).png',
    'books/dirilen Iskelet/page (75).png',
    'books/dirilen Iskelet/page (76).png',
    'books/dirilen Iskelet/page (77).png',
    'books/dirilen Iskelet/page (78).png',
    'books/dirilen Iskelet/page (79).png',
    'books/dirilen Iskelet/page (80).png',
    'books/dirilen Iskelet/page (81).png',
    'books/dirilen Iskelet/page (82).png',
    'books/dirilen Iskelet/page (83).png',
    'books/dirilen Iskelet/page (84).png',
    'books/dirilen Iskelet/page (85).png',
    'books/dirilen Iskelet/page (86).png',
    'books/dirilen Iskelet/page (87).png',
    'books/dirilen Iskelet/page (88).png',
    'books/dirilen Iskelet/page (89).png',
    'books/dirilen Iskelet/page (90).png',
    'books/dirilen Iskelet/page (91).png',
    'books/dirilen Iskelet/page (92).png',
    'books/dirilen Iskelet/page (93).png',
    'books/dirilen Iskelet/page (94).png',
    'books/dirilen Iskelet/page (95).png',
    'books/dirilen Iskelet/page (96).png',
    'books/dirilen Iskelet/page (97).png',
    'books/dirilen Iskelet/page (98).png',
    'books/dirilen Iskelet/page (99).png',
    'books/dirilen Iskelet/page (100).png',
    'books/dirilen Iskelet/page (101).png',
    'books/dirilen Iskelet/page (102).png',
    'books/dirilen Iskelet/page (103).png',
    'books/dirilen Iskelet/page (104).png',
    'books/dirilen Iskelet/page (105).png',
    'books/dirilen Iskelet/page (106).png',
    'books/dirilen Iskelet/page (107).png',
    'books/dirilen Iskelet/page (108).png',
    'books/dirilen Iskelet/page (109).png',
    'books/dirilen Iskelet/page (110).png',
    'books/dirilen Iskelet/page (111).png',
    'books/dirilen Iskelet/page (112).png',
    'books/dirilen Iskelet/page (113).png',
    'books/dirilen Iskelet/page (114).png',
    'books/dirilen Iskelet/page (115).png',
    'books/dirilen Iskelet/page (116).png',
    'books/dirilen Iskelet/page (117).png',
    'books/dirilen Iskelet/page (118).png',
    'books/dirilen Iskelet/page (119).png',
    'books/dirilen Iskelet/page (120).png',
    'books/dirilen Iskelet/page (121).png',
    'books/dirilen Iskelet/page (122).png',
    'books/dirilen Iskelet/page (123).png',
    'books/dirilen Iskelet/page (124).png',
    'books/dirilen Iskelet/page (125).png',
    'books/dirilen Iskelet/page (126).png',
    'books/dirilen Iskelet/page (127).png',
    'books/dirilen Iskelet/page (128).png',
    'books/dirilen Iskelet/page (129).png',
    'books/dirilen Iskelet/page (130).png',
    'books/dirilen Iskelet/page (131).png',
    'books/dirilen Iskelet/page (132).png',
    'books/dirilen Iskelet/page (133).png',
    'books/dirilen Iskelet/page (134).png',
    'books/dirilen Iskelet/page (135).png',
    'books/dirilen Iskelet/page (136).png',
    'books/dirilen Iskelet/page (137).png',
    'books/dirilen Iskelet/page (138).png',
    'books/dirilen Iskelet/page (139).png',
    'books/dirilen Iskelet/page (140).png',
    'books/dirilen Iskelet/page (141).png',
    'books/dirilen Iskelet/page (142).png',
    'books/dirilen Iskelet/page (143).png',
    'books/dirilen Iskelet/page (144).png',
    'books/dirilen Iskelet/page (145).png',
    'books/dirilen Iskelet/page (146).png',
    'books/dirilen Iskelet/page (147).png',
    'books/dirilen Iskelet/page (148).png',
    'books/dirilen Iskelet/page (149).png',
    'books/dirilen Iskelet/page (150).png',
    'books/dirilen Iskelet/page (151).png',
    'books/dirilen Iskelet/page (152).png',
    'books/dirilen Iskelet/page (153).png',
    'books/dirilen Iskelet/page (154).png',
    'books/dirilen Iskelet/page (155).png',
    'books/dirilen Iskelet/page (156).png',
    'books/dirilen Iskelet/page (157).png',
    'books/dirilen Iskelet/page (158).png',
    'books/dirilen Iskelet/page (159).png',
    'books/dirilen Iskelet/page (160).png',
    'books/dirilen Iskelet/page (161).png',
    'books/dirilen Iskelet/page (162).png',
    'books/dirilen Iskelet/page (163).png',
    'books/dirilen Iskelet/page (164).png',
    'books/dirilen Iskelet/page (165).png',
    'books/dirilen Iskelet/page (166).png',
    'books/dirilen Iskelet/page (167).png',
    'books/dirilen Iskelet/page (168).png',
    'books/dirilen Iskelet/page (169).png',
    'books/dirilen Iskelet/page (170).png',
    'books/dirilen Iskelet/page (171).png',
    'books/dirilen Iskelet/page (172).png',
    'books/dirilen Iskelet/page (173).png',
    'books/dirilen Iskelet/page (174).png',
    'books/dirilen Iskelet/page (175).png',
    'books/dirilen Iskelet/page (176).png',
    'books/dirilen Iskelet/page (177).png',
    'books/dirilen Iskelet/page (178).png',
    'books/dirilen Iskelet/page (179).png',

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
