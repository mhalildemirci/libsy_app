import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class aypesinde extends StatefulWidget {
  const aypesinde({Key? key}) : super(key: key);

  @override
  State<aypesinde> createState() => _aypesindeState();
}

class _aypesindeState extends State<aypesinde> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Ay pesinde/page (1).png',
    'books/Ay pesinde/page (2).png',
    'books/Ay pesinde/page (3).png',
    'books/Ay pesinde/page (4).png',
    'books/Ay pesinde/page (5).png',
    'books/Ay pesinde/page (6).png',
    'books/Ay pesinde/page (7).png',
    'books/Ay pesinde/page (8).png',
    'books/Ay pesinde/page (9).png',
    'books/Ay pesinde/page (10).png',
    'books/Ay pesinde/page (11).png',
    'books/Ay pesinde/page (12).png',
    'books/Ay pesinde/page (13).png',
    'books/Ay pesinde/page (14).png',
    'books/Ay pesinde/page (15).png',
    'books/Ay pesinde/page (16).png',
    'books/Ay pesinde/page (17).png',
    'books/Ay pesinde/page (18).png',
    'books/Ay pesinde/page (19).png',
    'books/Ay pesinde/page (20).png',
    'books/Ay pesinde/page (21).png',
    'books/Ay pesinde/page (22).png',
    'books/Ay pesinde/page (23).png',
    'books/Ay pesinde/page (24).png',
    'books/Ay pesinde/page (25).png',
    'books/Ay pesinde/page (26).png',
    'books/Ay pesinde/page (27).png',
    'books/Ay pesinde/page (28).png',
    'books/Ay pesinde/page (29).png',
    'books/Ay pesinde/page (30).png',
    'books/Ay pesinde/page (31).png',
    'books/Ay pesinde/page (32).png',
    'books/Ay pesinde/page (33).png',
    'books/Ay pesinde/page (34).png',
    'books/Ay pesinde/page (35).png',
    'books/Ay pesinde/page (36).png',
    'books/Ay pesinde/page (37).png',
    'books/Ay pesinde/page (38).png',
    'books/Ay pesinde/page (39).png',
    'books/Ay pesinde/page (40).png',
    'books/Ay pesinde/page (41).png',
    'books/Ay pesinde/page (42).png',
    'books/Ay pesinde/page (43).png',
    'books/Ay pesinde/page (44).png',
    'books/Ay pesinde/page (45).png',
    'books/Ay pesinde/page (46).png',
    'books/Ay pesinde/page (47).png',
    'books/Ay pesinde/page (48).png',
    'books/Ay pesinde/page (49).png',
    'books/Ay pesinde/page (50).png',
    'books/Ay pesinde/page (51).png',
    'books/Ay pesinde/page (52).png',
    'books/Ay pesinde/page (53).png',
    'books/Ay pesinde/page (54).png',
    'books/Ay pesinde/page (55).png',
    'books/Ay pesinde/page (56).png',
    'books/Ay pesinde/page (57).png',
    'books/Ay pesinde/page (58).png',
    'books/Ay pesinde/page (59).png',
    'books/Ay pesinde/page (60).png',
    'books/Ay pesinde/page (61).png',
    'books/Ay pesinde/page (62).png',
    'books/Ay pesinde/page (63).png',
    'books/Ay pesinde/page (64).png',
    'books/Ay pesinde/page (65).png',
    'books/Ay pesinde/page (66).png',
    'books/Ay pesinde/page (67).png',
    'books/Ay pesinde/page (68).png',
    'books/Ay pesinde/page (69).png',
    'books/Ay pesinde/page (70).png',
    'books/Ay pesinde/page (71).png',
    'books/Ay pesinde/page (72).png',
    'books/Ay pesinde/page (73).png',
    'books/Ay pesinde/page (74).png',
    'books/Ay pesinde/page (75).png',
    'books/Ay pesinde/page (76).png',
    'books/Ay pesinde/page (77).png',
    'books/Ay pesinde/page (78).png',
    'books/Ay pesinde/page (79).png',
    'books/Ay pesinde/page (80).png',
    'books/Ay pesinde/page (81).png',
    'books/Ay pesinde/page (82).png',
    'books/Ay pesinde/page (83).png',
    'books/Ay pesinde/page (84).png',
    'books/Ay pesinde/page (85).png',
    'books/Ay pesinde/page (86).png',
    'books/Ay pesinde/page (87).png',
    'books/Ay pesinde/page (88).png',
    'books/Ay pesinde/page (89).png',
    'books/Ay pesinde/page (90).png',
    'books/Ay pesinde/page (91).png',
    'books/Ay pesinde/page (92).png',
    'books/Ay pesinde/page (93).png',
    'books/Ay pesinde/page (94).png',
    'books/Ay pesinde/page (95).png',
    'books/Ay pesinde/page (96).png',
    'books/Ay pesinde/page (97).png',
    'books/Ay pesinde/page (98).png',
    'books/Ay pesinde/page (99).png',
    'books/Ay pesinde/page (100).png',
    'books/Ay pesinde/page (101).png',
    'books/Ay pesinde/page (102).png',
    'books/Ay pesinde/page (103).png',
    'books/Ay pesinde/page (104).png',
    'books/Ay pesinde/page (105).png',
    'books/Ay pesinde/page (106).png',
    'books/Ay pesinde/page (107).png',
    'books/Ay pesinde/page (108).png',
    'books/Ay pesinde/page (109).png',
    'books/Ay pesinde/page (110).png',
    'books/Ay pesinde/page (111).png',
    'books/Ay pesinde/page (112).png',
    'books/Ay pesinde/page (113).png',
    'books/Ay pesinde/page (114).png',
    'books/Ay pesinde/page (115).png',
    'books/Ay pesinde/page (116).png',
    'books/Ay pesinde/page (117).png',
    'books/Ay pesinde/page (118).png',
    'books/Ay pesinde/page (119).png',
    'books/Ay pesinde/page (120).png',
    'books/Ay pesinde/page (121).png',
    'books/Ay pesinde/page (122).png',
    'books/Ay pesinde/page (123).png',
    'books/Ay pesinde/page (124).png',
    'books/Ay pesinde/page (125).png',
    'books/Ay pesinde/page (126).png',
    'books/Ay pesinde/page (127).png',
    'books/Ay pesinde/page (128).png',
    'books/Ay pesinde/page (129).png',
    'books/Ay pesinde/page (130).png',
    'books/Ay pesinde/page (131).png',
    'books/Ay pesinde/page (132).png',
    'books/Ay pesinde/page (133).png',
    'books/Ay pesinde/page (134).png',
    'books/Ay pesinde/page (135).png',
    'books/Ay pesinde/page (136).png',
    'books/Ay pesinde/page (137).png',
    'books/Ay pesinde/page (138).png',
    'books/Ay pesinde/page (139).png',
    'books/Ay pesinde/page (140).png',
    'books/Ay pesinde/page (141).png',
    'books/Ay pesinde/page (142).png',
    'books/Ay pesinde/page (143).png',
    'books/Ay pesinde/page (144).png',
    'books/Ay pesinde/page (145).png',
    'books/Ay pesinde/page (146).png',
    'books/Ay pesinde/page (147).png',
    'books/Ay pesinde/page (148).png',
    'books/Ay pesinde/page (149).png',
    'books/Ay pesinde/page (150).png',
    'books/Ay pesinde/page (151).png',
    'books/Ay pesinde/page (152).png',

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
