import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class morsalkimli extends StatefulWidget {
  const morsalkimli({Key? key}) : super(key: key);

  @override
  State<morsalkimli> createState() => _morsalkimliState();
}

class _morsalkimliState extends State<morsalkimli> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mor salkimli/page (1).png',
    'books/mor salkimli/page (2).png',
    'books/mor salkimli/page (3).png',
    'books/mor salkimli/page (4).png',
    'books/mor salkimli/page (5).png',
    'books/mor salkimli/page (6).png',
    'books/mor salkimli/page (7).png',
    'books/mor salkimli/page (8).png',
    'books/mor salkimli/page (9).png',
    'books/mor salkimli/page (10).png',
    'books/mor salkimli/page (11).png',
    'books/mor salkimli/page (12).png',
    'books/mor salkimli/page (13).png',
    'books/mor salkimli/page (14).png',
    'books/mor salkimli/page (15).png',
    'books/mor salkimli/page (16).png',
    'books/mor salkimli/page (17).png',
    'books/mor salkimli/page (18).png',
    'books/mor salkimli/page (19).png',
    'books/mor salkimli/page (20).png',
    'books/mor salkimli/page (21).png',
    'books/mor salkimli/page (22).png',
    'books/mor salkimli/page (23).png',
    'books/mor salkimli/page (24).png',
    'books/mor salkimli/page (25).png',
    'books/mor salkimli/page (26).png',
    'books/mor salkimli/page (27).png',
    'books/mor salkimli/page (28).png',
    'books/mor salkimli/page (29).png',
    'books/mor salkimli/page (30).png',
    'books/mor salkimli/page (31).png',
    'books/mor salkimli/page (32).png',
    'books/mor salkimli/page (33).png',
    'books/mor salkimli/page (34).png',
    'books/mor salkimli/page (35).png',
    'books/mor salkimli/page (36).png',
    'books/mor salkimli/page (37).png',
    'books/mor salkimli/page (38).png',
    'books/mor salkimli/page (39).png',
    'books/mor salkimli/page (40).png',
    'books/mor salkimli/page (41).png',
    'books/mor salkimli/page (42).png',
    'books/mor salkimli/page (43).png',
    'books/mor salkimli/page (44).png',
    'books/mor salkimli/page (45).png',
    'books/mor salkimli/page (46).png',
    'books/mor salkimli/page (47).png',
    'books/mor salkimli/page (48).png',
    'books/mor salkimli/page (49).png',
    'books/mor salkimli/page (50).png',
    'books/mor salkimli/page (51).png',
    'books/mor salkimli/page (52).png',
    'books/mor salkimli/page (53).png',
    'books/mor salkimli/page (54).png',
    'books/mor salkimli/page (55).png',
    'books/mor salkimli/page (56).png',
    'books/mor salkimli/page (57).png',
    'books/mor salkimli/page (58).png',
    'books/mor salkimli/page (59).png',
    'books/mor salkimli/page (60).png',
    'books/mor salkimli/page (61).png',
    'books/mor salkimli/page (62).png',
    'books/mor salkimli/page (63).png',
    'books/mor salkimli/page (64).png',
    'books/mor salkimli/page (65).png',
    'books/mor salkimli/page (66).png',
    'books/mor salkimli/page (67).png',
    'books/mor salkimli/page (68).png',
    'books/mor salkimli/page (69).png',
    'books/mor salkimli/page (70).png',
    'books/mor salkimli/page (71).png',
    'books/mor salkimli/page (72).png',
    'books/mor salkimli/page (73).png',
    'books/mor salkimli/page (74).png',
    'books/mor salkimli/page (75).png',
    'books/mor salkimli/page (76).png',
    'books/mor salkimli/page (77).png',
    'books/mor salkimli/page (78).png',
    'books/mor salkimli/page (79).png',
    'books/mor salkimli/page (80).png',
    'books/mor salkimli/page (81).png',
    'books/mor salkimli/page (82).png',
    'books/mor salkimli/page (83).png',
    'books/mor salkimli/page (84).png',
    'books/mor salkimli/page (85).png',
    'books/mor salkimli/page (86).png',
    'books/mor salkimli/page (87).png',
    'books/mor salkimli/page (88).png',
    'books/mor salkimli/page (89).png',
    'books/mor salkimli/page (90).png',
    'books/mor salkimli/page (91).png',
    'books/mor salkimli/page (92).png',
    'books/mor salkimli/page (93).png',
    'books/mor salkimli/page (94).png',
    'books/mor salkimli/page (95).png',
    'books/mor salkimli/page (96).png',
    'books/mor salkimli/page (97).png',
    'books/mor salkimli/page (98).png',
    'books/mor salkimli/page (99).png',
    'books/mor salkimli/page (100).png',
    'books/mor salkimli/page (101).png',
    'books/mor salkimli/page (102).png',
    'books/mor salkimli/page (103).png',
    'books/mor salkimli/page (104).png',
    'books/mor salkimli/page (105).png',
    'books/mor salkimli/page (106).png',
    'books/mor salkimli/page (107).png',
    'books/mor salkimli/page (108).png',
    'books/mor salkimli/page (109).png',
    'books/mor salkimli/page (110).png',
    'books/mor salkimli/page (111).png',
    'books/mor salkimli/page (112).png',
    'books/mor salkimli/page (113).png',
    'books/mor salkimli/page (114).png',
    'books/mor salkimli/page (115).png',
    'books/mor salkimli/page (116).png',
    'books/mor salkimli/page (117).png',
    'books/mor salkimli/page (118).png',
    'books/mor salkimli/page (119).png',
    'books/mor salkimli/page (120).png',
    'books/mor salkimli/page (121).png',
    'books/mor salkimli/page (122).png',
    'books/mor salkimli/page (123).png',
    'books/mor salkimli/page (124).png',
    'books/mor salkimli/page (125).png',
    'books/mor salkimli/page (126).png',
    'books/mor salkimli/page (127).png',
    'books/mor salkimli/page (128).png',
    'books/mor salkimli/page (129).png',
    'books/mor salkimli/page (130).png',
    'books/mor salkimli/page (131).png',
    'books/mor salkimli/page (132).png',
    'books/mor salkimli/page (133).png',
    'books/mor salkimli/page (134).png',
    'books/mor salkimli/page (135).png',
    'books/mor salkimli/page (136).png',
    'books/mor salkimli/page (137).png',
    'books/mor salkimli/page (138).png',
    'books/mor salkimli/page (139).png',
    'books/mor salkimli/page (140).png',
    'books/mor salkimli/page (141).png',
    'books/mor salkimli/page (142).png',
    'books/mor salkimli/page (143).png',
    'books/mor salkimli/page (144).png',
    'books/mor salkimli/page (145).png',
    'books/mor salkimli/page (146).png',
    'books/mor salkimli/page (147).png',
    'books/mor salkimli/page (148).png',
    'books/mor salkimli/page (149).png',
    'books/mor salkimli/page (150).png',
    'books/mor salkimli/page (151).png',
    'books/mor salkimli/page (152).png',
    'books/mor salkimli/page (153).png',
    'books/mor salkimli/page (154).png',
    'books/mor salkimli/page (155).png',
    'books/mor salkimli/page (156).png',
    'books/mor salkimli/page (157).png',
    'books/mor salkimli/page (158).png',
    'books/mor salkimli/page (159).png',
    'books/mor salkimli/page (160).png',
    'books/mor salkimli/page (161).png',
    'books/mor salkimli/page (162).png',
    'books/mor salkimli/page (163).png',
    'books/mor salkimli/page (164).png',
    'books/mor salkimli/page (165).png',
    'books/mor salkimli/page (166).png',

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
