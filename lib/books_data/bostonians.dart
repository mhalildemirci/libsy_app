import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bostonians extends StatefulWidget {
  const bostonians({Key? key}) : super(key: key);

  @override
  State<bostonians> createState() => _bostoniansState();
}

class _bostoniansState extends State<bostonians> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bostoninans/page (1).png',
    'books/bostoninans/page (2).png',
    'books/bostoninans/page (3).png',
    'books/bostoninans/page (4).png',
    'books/bostoninans/page (5).png',
    'books/bostoninans/page (6).png',
    'books/bostoninans/page (7).png',
    'books/bostoninans/page (8).png',
    'books/bostoninans/page (9).png',
    'books/bostoninans/page (10).png',
    'books/bostoninans/page (11).png',
    'books/bostoninans/page (12).png',
    'books/bostoninans/page (13).png',
    'books/bostoninans/page (14).png',
    'books/bostoninans/page (15).png',
    'books/bostoninans/page (16).png',
    'books/bostoninans/page (17).png',
    'books/bostoninans/page (18).png',
    'books/bostoninans/page (19).png',
    'books/bostoninans/page (20).png',
    'books/bostoninans/page (21).png',
    'books/bostoninans/page (22).png',
    'books/bostoninans/page (23).png',
    'books/bostoninans/page (24).png',
    'books/bostoninans/page (25).png',
    'books/bostoninans/page (26).png',
    'books/bostoninans/page (27).png',
    'books/bostoninans/page (28).png',
    'books/bostoninans/page (29).png',
    'books/bostoninans/page (30).png',
    'books/bostoninans/page (31).png',
    'books/bostoninans/page (32).png',
    'books/bostoninans/page (33).png',
    'books/bostoninans/page (34).png',
    'books/bostoninans/page (35).png',
    'books/bostoninans/page (36).png',
    'books/bostoninans/page (37).png',
    'books/bostoninans/page (38).png',
    'books/bostoninans/page (39).png',
    'books/bostoninans/page (40).png',
    'books/bostoninans/page (41).png',
    'books/bostoninans/page (42).png',
    'books/bostoninans/page (43).png',
    'books/bostoninans/page (44).png',
    'books/bostoninans/page (45).png',
    'books/bostoninans/page (46).png',
    'books/bostoninans/page (47).png',
    'books/bostoninans/page (48).png',
    'books/bostoninans/page (49).png',
    'books/bostoninans/page (50).png',
    'books/bostoninans/page (51).png',
    'books/bostoninans/page (52).png',
    'books/bostoninans/page (53).png',
    'books/bostoninans/page (54).png',
    'books/bostoninans/page (55).png',
    'books/bostoninans/page (56).png',
    'books/bostoninans/page (57).png',
    'books/bostoninans/page (58).png',
    'books/bostoninans/page (59).png',
    'books/bostoninans/page (60).png',
    'books/bostoninans/page (61).png',
    'books/bostoninans/page (62).png',
    'books/bostoninans/page (63).png',
    'books/bostoninans/page (64).png',
    'books/bostoninans/page (65).png',
    'books/bostoninans/page (66).png',
    'books/bostoninans/page (67).png',
    'books/bostoninans/page (68).png',
    'books/bostoninans/page (69).png',
    'books/bostoninans/page (70).png',
    'books/bostoninans/page (71).png',
    'books/bostoninans/page (72).png',
    'books/bostoninans/page (73).png',
    'books/bostoninans/page (74).png',
    'books/bostoninans/page (75).png',
    'books/bostoninans/page (76).png',
    'books/bostoninans/page (77).png',
    'books/bostoninans/page (78).png',
    'books/bostoninans/page (79).png',
    'books/bostoninans/page (80).png',
    'books/bostoninans/page (81).png',
    'books/bostoninans/page (82).png',
    'books/bostoninans/page (83).png',
    'books/bostoninans/page (84).png',
    'books/bostoninans/page (85).png',
    'books/bostoninans/page (86).png',
    'books/bostoninans/page (87).png',
    'books/bostoninans/page (88).png',
    'books/bostoninans/page (89).png',
    'books/bostoninans/page (90).png',
    'books/bostoninans/page (91).png',
    'books/bostoninans/page (92).png',
    'books/bostoninans/page (93).png',
    'books/bostoninans/page (94).png',
    'books/bostoninans/page (95).png',
    'books/bostoninans/page (96).png',
    'books/bostoninans/page (97).png',
    'books/bostoninans/page (98).png',
    'books/bostoninans/page (99).png',
    'books/bostoninans/page (100).png',
    'books/bostoninans/page (101).png',
    'books/bostoninans/page (102).png',
    'books/bostoninans/page (103).png',
    'books/bostoninans/page (104).png',
    'books/bostoninans/page (105).png',
    'books/bostoninans/page (106).png',
    'books/bostoninans/page (107).png',
    'books/bostoninans/page (108).png',
    'books/bostoninans/page (109).png',
    'books/bostoninans/page (110).png',
    'books/bostoninans/page (111).png',
    'books/bostoninans/page (112).png',
    'books/bostoninans/page (113).png',
    'books/bostoninans/page (114).png',
    'books/bostoninans/page (115).png',
    'books/bostoninans/page (116).png',
    'books/bostoninans/page (117).png',
    'books/bostoninans/page (118).png',
    'books/bostoninans/page (119).png',
    'books/bostoninans/page (120).png',
    'books/bostoninans/page (121).png',
    'books/bostoninans/page (122).png',
    'books/bostoninans/page (123).png',
    'books/bostoninans/page (124).png',
    'books/bostoninans/page (125).png',
    'books/bostoninans/page (126).png',
    'books/bostoninans/page (127).png',
    'books/bostoninans/page (128).png',
    'books/bostoninans/page (129).png',
    'books/bostoninans/page (130).png',
    'books/bostoninans/page (131).png',
    'books/bostoninans/page (132).png',
    'books/bostoninans/page (133).png',
    'books/bostoninans/page (134).png',
    'books/bostoninans/page (135).png',
    'books/bostoninans/page (136).png',
    'books/bostoninans/page (137).png',
    'books/bostoninans/page (138).png',
    'books/bostoninans/page (139).png',
    'books/bostoninans/page (140).png',
    'books/bostoninans/page (141).png',
    'books/bostoninans/page (142).png',
    'books/bostoninans/page (143).png',
    'books/bostoninans/page (144).png',
    'books/bostoninans/page (145).png',
    'books/bostoninans/page (146).png',
    'books/bostoninans/page (147).png',
    'books/bostoninans/page (148).png',
    'books/bostoninans/page (149).png',
    'books/bostoninans/page (150).png',
    'books/bostoninans/page (151).png',
    'books/bostoninans/page (152).png',
    'books/bostoninans/page (153).png',
    'books/bostoninans/page (154).png',

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
