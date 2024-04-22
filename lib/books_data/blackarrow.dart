import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class blackarrow extends StatefulWidget {
  const blackarrow({Key? key}) : super(key: key);

  @override
  State<blackarrow> createState() => _blackarrowState();
}

class _blackarrowState extends State<blackarrow> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/black arrow/page (1).png',
    'books/black arrow/page (2).png',
    'books/black arrow/page (3).png',
    'books/black arrow/page (4).png',
    'books/black arrow/page (5).png',
    'books/black arrow/page (6).png',
    'books/black arrow/page (7).png',
    'books/black arrow/page (8).png',
    'books/black arrow/page (9).png',
    'books/black arrow/page (10).png',
    'books/black arrow/page (11).png',
    'books/black arrow/page (12).png',
    'books/black arrow/page (13).png',
    'books/black arrow/page (14).png',
    'books/black arrow/page (15).png',
    'books/black arrow/page (16).png',
    'books/black arrow/page (17).png',
    'books/black arrow/page (18).png',
    'books/black arrow/page (19).png',
    'books/black arrow/page (20).png',
    'books/black arrow/page (21).png',
    'books/black arrow/page (22).png',
    'books/black arrow/page (23).png',
    'books/black arrow/page (24).png',
    'books/black arrow/page (25).png',
    'books/black arrow/page (26).png',
    'books/black arrow/page (27).png',
    'books/black arrow/page (28).png',
    'books/black arrow/page (29).png',
    'books/black arrow/page (30).png',
    'books/black arrow/page (31).png',
    'books/black arrow/page (32).png',
    'books/black arrow/page (33).png',
    'books/black arrow/page (34).png',
    'books/black arrow/page (35).png',
    'books/black arrow/page (36).png',
    'books/black arrow/page (37).png',
    'books/black arrow/page (38).png',
    'books/black arrow/page (39).png',
    'books/black arrow/page (40).png',
    'books/black arrow/page (41).png',
    'books/black arrow/page (42).png',
    'books/black arrow/page (43).png',
    'books/black arrow/page (44).png',
    'books/black arrow/page (45).png',
    'books/black arrow/page (46).png',
    'books/black arrow/page (47).png',
    'books/black arrow/page (48).png',
    'books/black arrow/page (49).png',
    'books/black arrow/page (50).png',
    'books/black arrow/page (51).png',
    'books/black arrow/page (52).png',
    'books/black arrow/page (53).png',
    'books/black arrow/page (54).png',
    'books/black arrow/page (55).png',
    'books/black arrow/page (56).png',
    'books/black arrow/page (57).png',
    'books/black arrow/page (58).png',
    'books/black arrow/page (59).png',
    'books/black arrow/page (60).png',
    'books/black arrow/page (61).png',
    'books/black arrow/page (62).png',
    'books/black arrow/page (63).png',
    'books/black arrow/page (64).png',
    'books/black arrow/page (65).png',
    'books/black arrow/page (66).png',
    'books/black arrow/page (67).png',
    'books/black arrow/page (68).png',
    'books/black arrow/page (69).png',
    'books/black arrow/page (70).png',
    'books/black arrow/page (71).png',
    'books/black arrow/page (72).png',
    'books/black arrow/page (73).png',
    'books/black arrow/page (74).png',
    'books/black arrow/page (75).png',
    'books/black arrow/page (76).png',
    'books/black arrow/page (77).png',
    'books/black arrow/page (78).png',
    'books/black arrow/page (79).png',
    'books/black arrow/page (80).png',
    'books/black arrow/page (81).png',
    'books/black arrow/page (82).png',
    'books/black arrow/page (83).png',
    'books/black arrow/page (84).png',
    'books/black arrow/page (85).png',
    'books/black arrow/page (86).png',
    'books/black arrow/page (87).png',
    'books/black arrow/page (88).png',
    'books/black arrow/page (89).png',
    'books/black arrow/page (90).png',
    'books/black arrow/page (91).png',
    'books/black arrow/page (92).png',
    'books/black arrow/page (93).png',
    'books/black arrow/page (94).png',
    'books/black arrow/page (95).png',
    'books/black arrow/page (96).png',
    'books/black arrow/page (97).png',
    'books/black arrow/page (98).png',
    'books/black arrow/page (99).png',
    'books/black arrow/page (100).png',
    'books/black arrow/page (101).png',
    'books/black arrow/page (102).png',
    'books/black arrow/page (103).png',
    'books/black arrow/page (104).png',
    'books/black arrow/page (105).png',
    'books/black arrow/page (106).png',
    'books/black arrow/page (107).png',
    'books/black arrow/page (108).png',
    'books/black arrow/page (109).png',
    'books/black arrow/page (110).png',
    'books/black arrow/page (111).png',
    'books/black arrow/page (112).png',
    'books/black arrow/page (113).png',
    'books/black arrow/page (114).png',
    'books/black arrow/page (115).png',
    'books/black arrow/page (116).png',
    'books/black arrow/page (117).png',
    'books/black arrow/page (118).png',
    'books/black arrow/page (119).png',
    'books/black arrow/page (120).png',
    'books/black arrow/page (121).png',
    'books/black arrow/page (122).png',
    'books/black arrow/page (123).png',
    'books/black arrow/page (124).png',
    'books/black arrow/page (125).png',
    'books/black arrow/page (126).png',
    'books/black arrow/page (127).png',
    'books/black arrow/page (128).png',
    'books/black arrow/page (129).png',
    'books/black arrow/page (130).png',
    'books/black arrow/page (131).png',
    'books/black arrow/page (132).png',
    'books/black arrow/page (133).png',
    'books/black arrow/page (134).png',
    'books/black arrow/page (135).png',
    'books/black arrow/page (136).png',
    'books/black arrow/page (137).png',
    'books/black arrow/page (138).png',
    'books/black arrow/page (139).png',
    'books/black arrow/page (140).png',
    'books/black arrow/page (141).png',
    'books/black arrow/page (142).png',
    'books/black arrow/page (143).png',
    'books/black arrow/page (144).png',
    'books/black arrow/page (145).png',
    'books/black arrow/page (146).png',
    'books/black arrow/page (147).png',
    'books/black arrow/page (148).png',
    'books/black arrow/page (149).png',
    'books/black arrow/page (150).png',
    'books/black arrow/page (151).png',
    'books/black arrow/page (152).png',
    'books/black arrow/page (153).png',
    'books/black arrow/page (154).png',
    'books/black arrow/page (155).png',
    'books/black arrow/page (156).png',
    'books/black arrow/page (157).png',
    'books/black arrow/page (158).png',
    'books/black arrow/page (159).png',
    'books/black arrow/page (160).png',
    'books/black arrow/page (161).png',
    'books/black arrow/page (162).png',
    'books/black arrow/page (163).png',
    'books/black arrow/page (164).png',
    'books/black arrow/page (165).png',
    'books/black arrow/page (166).png',
    'books/black arrow/page (167).png',
    'books/black arrow/page (168).png',
    'books/black arrow/page (169).png',
    'books/black arrow/page (170).png',
    'books/black arrow/page (171).png',
    'books/black arrow/page (172).png',

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
