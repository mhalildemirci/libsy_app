import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class inferno extends StatefulWidget {
  const inferno({Key? key}) : super(key: key);

  @override
  State<inferno> createState() => _infernoState();
}

class _infernoState extends State<inferno> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/the inferno/page (1).png',
    'books/the inferno/page (2).png',
    'books/the inferno/page (3).png',
    'books/the inferno/page (4).png',
    'books/the inferno/page (5).png',
    'books/the inferno/page (6).png',
    'books/the inferno/page (7).png',
    'books/the inferno/page (8).png',
    'books/the inferno/page (9).png',
    'books/the inferno/page (10).png',
    'books/the inferno/page (11).png',
    'books/the inferno/page (12).png',
    'books/the inferno/page (13).png',
    'books/the inferno/page (14).png',
    'books/the inferno/page (15).png',
    'books/the inferno/page (16).png',
    'books/the inferno/page (17).png',
    'books/the inferno/page (18).png',
    'books/the inferno/page (19).png',
    'books/the inferno/page (20).png',
    'books/the inferno/page (21).png',
    'books/the inferno/page (22).png',
    'books/the inferno/page (23).png',
    'books/the inferno/page (24).png',
    'books/the inferno/page (25).png',
    'books/the inferno/page (26).png',
    'books/the inferno/page (27).png',
    'books/the inferno/page (28).png',
    'books/the inferno/page (29).png',
    'books/the inferno/page (30).png',
    'books/the inferno/page (31).png',
    'books/the inferno/page (32).png',
    'books/the inferno/page (33).png',
    'books/the inferno/page (34).png',
    'books/the inferno/page (35).png',
    'books/the inferno/page (36).png',
    'books/the inferno/page (37).png',
    'books/the inferno/page (38).png',
    'books/the inferno/page (39).png',
    'books/the inferno/page (40).png',
    'books/the inferno/page (41).png',
    'books/the inferno/page (42).png',
    'books/the inferno/page (43).png',
    'books/the inferno/page (44).png',
    'books/the inferno/page (45).png',
    'books/the inferno/page (46).png',
    'books/the inferno/page (47).png',
    'books/the inferno/page (48).png',
    'books/the inferno/page (49).png',
    'books/the inferno/page (50).png',
    'books/the inferno/page (51).png',
    'books/the inferno/page (52).png',
    'books/the inferno/page (53).png',
    'books/the inferno/page (54).png',
    'books/the inferno/page (55).png',
    'books/the inferno/page (56).png',
    'books/the inferno/page (57).png',
    'books/the inferno/page (58).png',
    'books/the inferno/page (59).png',
    'books/the inferno/page (60).png',
    'books/the inferno/page (61).png',
    'books/the inferno/page (62).png',
    'books/the inferno/page (63).png',
    'books/the inferno/page (64).png',
    'books/the inferno/page (65).png',
    'books/the inferno/page (66).png',
    'books/the inferno/page (67).png',
    'books/the inferno/page (68).png',
    'books/the inferno/page (69).png',
    'books/the inferno/page (70).png',
    'books/the inferno/page (71).png',
    'books/the inferno/page (72).png',
    'books/the inferno/page (73).png',
    'books/the inferno/page (74).png',
    'books/the inferno/page (75).png',
    'books/the inferno/page (76).png',
    'books/the inferno/page (77).png',
    'books/the inferno/page (78).png',
    'books/the inferno/page (79).png',
    'books/the inferno/page (80).png',
    'books/the inferno/page (81).png',
    'books/the inferno/page (82).png',
    'books/the inferno/page (83).png',
    'books/the inferno/page (84).png',
    'books/the inferno/page (85).png',
    'books/the inferno/page (86).png',
    'books/the inferno/page (87).png',
    'books/the inferno/page (88).png',
    'books/the inferno/page (89).png',
    'books/the inferno/page (90).png',
    'books/the inferno/page (91).png',
    'books/the inferno/page (92).png',
    'books/the inferno/page (93).png',
    'books/the inferno/page (94).png',
    'books/the inferno/page (95).png',
    'books/the inferno/page (96).png',
    'books/the inferno/page (97).png',
    'books/the inferno/page (98).png',
    'books/the inferno/page (99).png',
    'books/the inferno/page (100).png',
    'books/the inferno/page (101).png',
    'books/the inferno/page (102).png',
    'books/the inferno/page (103).png',
    'books/the inferno/page (104).png',
    'books/the inferno/page (105).png',
    'books/the inferno/page (106).png',
    'books/the inferno/page (107).png',
    'books/the inferno/page (108).png',
    'books/the inferno/page (109).png',
    'books/the inferno/page (110).png',
    'books/the inferno/page (111).png',
    'books/the inferno/page (112).png',
    'books/the inferno/page (113).png',
    'books/the inferno/page (114).png',
    'books/the inferno/page (115).png',
    'books/the inferno/page (116).png',
    'books/the inferno/page (117).png',
    'books/the inferno/page (118).png',
    'books/the inferno/page (119).png',
    'books/the inferno/page (120).png',
    'books/the inferno/page (121).png',
    'books/the inferno/page (122).png',
    'books/the inferno/page (123).png',
    'books/the inferno/page (124).png',
    'books/the inferno/page (125).png',
    'books/the inferno/page (126).png',
    'books/the inferno/page (127).png',
    'books/the inferno/page (128).png',
    'books/the inferno/page (129).png',
    'books/the inferno/page (130).png',
    'books/the inferno/page (131).png',
    'books/the inferno/page (132).png',
    'books/the inferno/page (133).png',
    'books/the inferno/page (134).png',
    'books/the inferno/page (135).png',
    'books/the inferno/page (136).png',
    'books/the inferno/page (137).png',
    'books/the inferno/page (138).png',
    'books/the inferno/page (139).png',
    'books/the inferno/page (140).png',
    'books/the inferno/page (141).png',
    'books/the inferno/page (142).png',
    'books/the inferno/page (143).png',
    'books/the inferno/page (144).png',
    'books/the inferno/page (145).png',
    'books/the inferno/page (146).png',
    'books/the inferno/page (147).png',
    'books/the inferno/page (148).png',
    'books/the inferno/page (149).png',
    'books/the inferno/page (150).png',
    'books/the inferno/page (151).png',
    'books/the inferno/page (152).png',
    'books/the inferno/page (153).png',
    'books/the inferno/page (154).png',
    'books/the inferno/page (155).png',
    'books/the inferno/page (156).png',
    'books/the inferno/page (157).png',
    'books/the inferno/page (158).png',
    'books/the inferno/page (159).png',
    'books/the inferno/page (160).png',
    'books/the inferno/page (161).png',
    'books/the inferno/page (162).png',

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
