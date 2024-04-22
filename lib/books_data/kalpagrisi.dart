import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kalpagrisi extends StatefulWidget {
  const kalpagrisi({Key? key}) : super(key: key);

  @override
  State<kalpagrisi> createState() => _kalpagrisiState();
}

class _kalpagrisiState extends State<kalpagrisi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kalp agrisi/page (1).png',
    'books/kalp agrisi/page (2).png',
    'books/kalp agrisi/page (3).png',
    'books/kalp agrisi/page (4).png',
    'books/kalp agrisi/page (5).png',
    'books/kalp agrisi/page (6).png',
    'books/kalp agrisi/page (7).png',
    'books/kalp agrisi/page (8).png',
    'books/kalp agrisi/page (9).png',
    'books/kalp agrisi/page (10).png',
    'books/kalp agrisi/page (11).png',
    'books/kalp agrisi/page (12).png',
    'books/kalp agrisi/page (13).png',
    'books/kalp agrisi/page (14).png',
    'books/kalp agrisi/page (15).png',
    'books/kalp agrisi/page (16).png',
    'books/kalp agrisi/page (17).png',
    'books/kalp agrisi/page (18).png',
    'books/kalp agrisi/page (19).png',
    'books/kalp agrisi/page (20).png',
    'books/kalp agrisi/page (21).png',
    'books/kalp agrisi/page (22).png',
    'books/kalp agrisi/page (23).png',
    'books/kalp agrisi/page (24).png',
    'books/kalp agrisi/page (25).png',
    'books/kalp agrisi/page (26).png',
    'books/kalp agrisi/page (27).png',
    'books/kalp agrisi/page (28).png',
    'books/kalp agrisi/page (29).png',
    'books/kalp agrisi/page (30).png',
    'books/kalp agrisi/page (31).png',
    'books/kalp agrisi/page (32).png',
    'books/kalp agrisi/page (33).png',
    'books/kalp agrisi/page (34).png',
    'books/kalp agrisi/page (35).png',
    'books/kalp agrisi/page (36).png',
    'books/kalp agrisi/page (37).png',
    'books/kalp agrisi/page (38).png',
    'books/kalp agrisi/page (39).png',
    'books/kalp agrisi/page (40).png',
    'books/kalp agrisi/page (41).png',
    'books/kalp agrisi/page (42).png',
    'books/kalp agrisi/page (43).png',
    'books/kalp agrisi/page (44).png',
    'books/kalp agrisi/page (45).png',
    'books/kalp agrisi/page (46).png',
    'books/kalp agrisi/page (47).png',
    'books/kalp agrisi/page (48).png',
    'books/kalp agrisi/page (49).png',
    'books/kalp agrisi/page (50).png',
    'books/kalp agrisi/page (51).png',
    'books/kalp agrisi/page (52).png',
    'books/kalp agrisi/page (53).png',
    'books/kalp agrisi/page (54).png',
    'books/kalp agrisi/page (55).png',
    'books/kalp agrisi/page (56).png',
    'books/kalp agrisi/page (57).png',
    'books/kalp agrisi/page (58).png',
    'books/kalp agrisi/page (59).png',
    'books/kalp agrisi/page (60).png',
    'books/kalp agrisi/page (61).png',
    'books/kalp agrisi/page (62).png',
    'books/kalp agrisi/page (63).png',
    'books/kalp agrisi/page (64).png',
    'books/kalp agrisi/page (65).png',
    'books/kalp agrisi/page (66).png',
    'books/kalp agrisi/page (67).png',
    'books/kalp agrisi/page (68).png',
    'books/kalp agrisi/page (69).png',
    'books/kalp agrisi/page (70).png',
    'books/kalp agrisi/page (71).png',
    'books/kalp agrisi/page (72).png',
    'books/kalp agrisi/page (73).png',
    'books/kalp agrisi/page (74).png',
    'books/kalp agrisi/page (75).png',
    'books/kalp agrisi/page (76).png',
    'books/kalp agrisi/page (77).png',
    'books/kalp agrisi/page (78).png',
    'books/kalp agrisi/page (79).png',
    'books/kalp agrisi/page (80).png',
    'books/kalp agrisi/page (81).png',
    'books/kalp agrisi/page (82).png',
    'books/kalp agrisi/page (83).png',
    'books/kalp agrisi/page (84).png',
    'books/kalp agrisi/page (85).png',
    'books/kalp agrisi/page (86).png',
    'books/kalp agrisi/page (87).png',
    'books/kalp agrisi/page (88).png',
    'books/kalp agrisi/page (89).png',
    'books/kalp agrisi/page (90).png',
    'books/kalp agrisi/page (91).png',
    'books/kalp agrisi/page (92).png',
    'books/kalp agrisi/page (93).png',
    'books/kalp agrisi/page (94).png',
    'books/kalp agrisi/page (95).png',
    'books/kalp agrisi/page (96).png',
    'books/kalp agrisi/page (97).png',
    'books/kalp agrisi/page (98).png',
    'books/kalp agrisi/page (99).png',
    'books/kalp agrisi/page (100).png',
    'books/kalp agrisi/page (101).png',
    'books/kalp agrisi/page (102).png',
    'books/kalp agrisi/page (103).png',
    'books/kalp agrisi/page (104).png',
    'books/kalp agrisi/page (105).png',
    'books/kalp agrisi/page (106).png',
    'books/kalp agrisi/page (107).png',
    'books/kalp agrisi/page (108).png',
    'books/kalp agrisi/page (109).png',
    'books/kalp agrisi/page (110).png',
    'books/kalp agrisi/page (111).png',
    'books/kalp agrisi/page (112).png',
    'books/kalp agrisi/page (113).png',
    'books/kalp agrisi/page (114).png',
    'books/kalp agrisi/page (115).png',
    'books/kalp agrisi/page (116).png',
    'books/kalp agrisi/page (117).png',
    'books/kalp agrisi/page (118).png',
    'books/kalp agrisi/page (119).png',
    'books/kalp agrisi/page (120).png',
    'books/kalp agrisi/page (121).png',
    'books/kalp agrisi/page (122).png',
    'books/kalp agrisi/page (123).png',
    'books/kalp agrisi/page (124).png',
    'books/kalp agrisi/page (125).png',
    'books/kalp agrisi/page (126).png',
    'books/kalp agrisi/page (127).png',
    'books/kalp agrisi/page (128).png',
    'books/kalp agrisi/page (129).png',
    'books/kalp agrisi/page (130).png',
    'books/kalp agrisi/page (131).png',
    'books/kalp agrisi/page (132).png',
    'books/kalp agrisi/page (133).png',
    'books/kalp agrisi/page (134).png',
    'books/kalp agrisi/page (135).png',
    'books/kalp agrisi/page (136).png',
    'books/kalp agrisi/page (137).png',
    'books/kalp agrisi/page (138).png',
    'books/kalp agrisi/page (139).png',
    'books/kalp agrisi/page (140).png',
    'books/kalp agrisi/page (141).png',
    'books/kalp agrisi/page (142).png',
    'books/kalp agrisi/page (143).png',
    'books/kalp agrisi/page (144).png',
    'books/kalp agrisi/page (145).png',
    'books/kalp agrisi/page (146).png',
    'books/kalp agrisi/page (147).png',
    'books/kalp agrisi/page (148).png',
    'books/kalp agrisi/page (149).png',
    'books/kalp agrisi/page (150).png',
    'books/kalp agrisi/page (151).png',
    'books/kalp agrisi/page (152).png',
    'books/kalp agrisi/page (153).png',
    'books/kalp agrisi/page (154).png',
    'books/kalp agrisi/page (155).png',
    'books/kalp agrisi/page (156).png',

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
