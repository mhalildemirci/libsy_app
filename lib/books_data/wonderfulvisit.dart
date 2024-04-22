import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class wonderfulvisit extends StatefulWidget {
  const wonderfulvisit({Key? key}) : super(key: key);

  @override
  State<wonderfulvisit> createState() => _wonderfulvisitState();
}

class _wonderfulvisitState extends State<wonderfulvisit> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/wonderful visit/page (1).png',
    'books/wonderful visit/page (2).png',
    'books/wonderful visit/page (3).png',
    'books/wonderful visit/page (4).png',
    'books/wonderful visit/page (5).png',
    'books/wonderful visit/page (6).png',
    'books/wonderful visit/page (7).png',
    'books/wonderful visit/page (8).png',
    'books/wonderful visit/page (9).png',
    'books/wonderful visit/page (10).png',
    'books/wonderful visit/page (11).png',
    'books/wonderful visit/page (12).png',
    'books/wonderful visit/page (13).png',
    'books/wonderful visit/page (14).png',
    'books/wonderful visit/page (15).png',
    'books/wonderful visit/page (16).png',
    'books/wonderful visit/page (17).png',
    'books/wonderful visit/page (18).png',
    'books/wonderful visit/page (19).png',
    'books/wonderful visit/page (20).png',
    'books/wonderful visit/page (21).png',
    'books/wonderful visit/page (22).png',
    'books/wonderful visit/page (23).png',
    'books/wonderful visit/page (24).png',
    'books/wonderful visit/page (25).png',
    'books/wonderful visit/page (26).png',
    'books/wonderful visit/page (27).png',
    'books/wonderful visit/page (28).png',
    'books/wonderful visit/page (29).png',
    'books/wonderful visit/page (30).png',
    'books/wonderful visit/page (31).png',
    'books/wonderful visit/page (32).png',
    'books/wonderful visit/page (33).png',
    'books/wonderful visit/page (34).png',
    'books/wonderful visit/page (35).png',
    'books/wonderful visit/page (36).png',
    'books/wonderful visit/page (37).png',
    'books/wonderful visit/page (38).png',
    'books/wonderful visit/page (39).png',
    'books/wonderful visit/page (40).png',
    'books/wonderful visit/page (41).png',
    'books/wonderful visit/page (42).png',
    'books/wonderful visit/page (43).png',
    'books/wonderful visit/page (44).png',
    'books/wonderful visit/page (45).png',
    'books/wonderful visit/page (46).png',
    'books/wonderful visit/page (47).png',
    'books/wonderful visit/page (48).png',
    'books/wonderful visit/page (49).png',
    'books/wonderful visit/page (50).png',
    'books/wonderful visit/page (51).png',
    'books/wonderful visit/page (52).png',
    'books/wonderful visit/page (53).png',
    'books/wonderful visit/page (54).png',
    'books/wonderful visit/page (55).png',
    'books/wonderful visit/page (56).png',
    'books/wonderful visit/page (57).png',
    'books/wonderful visit/page (58).png',
    'books/wonderful visit/page (59).png',
    'books/wonderful visit/page (60).png',
    'books/wonderful visit/page (61).png',
    'books/wonderful visit/page (62).png',
    'books/wonderful visit/page (63).png',
    'books/wonderful visit/page (64).png',
    'books/wonderful visit/page (65).png',
    'books/wonderful visit/page (66).png',
    'books/wonderful visit/page (67).png',
    'books/wonderful visit/page (68).png',
    'books/wonderful visit/page (69).png',
    'books/wonderful visit/page (70).png',
    'books/wonderful visit/page (71).png',
    'books/wonderful visit/page (72).png',
    'books/wonderful visit/page (73).png',
    'books/wonderful visit/page (74).png',
    'books/wonderful visit/page (75).png',
    'books/wonderful visit/page (76).png',
    'books/wonderful visit/page (77).png',
    'books/wonderful visit/page (78).png',
    'books/wonderful visit/page (79).png',
    'books/wonderful visit/page (80).png',
    'books/wonderful visit/page (81).png',
    'books/wonderful visit/page (82).png',
    'books/wonderful visit/page (83).png',
    'books/wonderful visit/page (84).png',
    'books/wonderful visit/page (85).png',
    'books/wonderful visit/page (86).png',
    'books/wonderful visit/page (87).png',
    'books/wonderful visit/page (88).png',
    'books/wonderful visit/page (89).png',
    'books/wonderful visit/page (90).png',
    'books/wonderful visit/page (91).png',
    'books/wonderful visit/page (92).png',
    'books/wonderful visit/page (93).png',
    'books/wonderful visit/page (94).png',
    'books/wonderful visit/page (95).png',
    'books/wonderful visit/page (96).png',
    'books/wonderful visit/page (97).png',
    'books/wonderful visit/page (98).png',
    'books/wonderful visit/page (99).png',
    'books/wonderful visit/page (100).png',
    'books/wonderful visit/page (101).png',
    'books/wonderful visit/page (102).png',
    'books/wonderful visit/page (103).png',
    'books/wonderful visit/page (104).png',
    'books/wonderful visit/page (105).png',
    'books/wonderful visit/page (106).png',
    'books/wonderful visit/page (107).png',
    'books/wonderful visit/page (108).png',
    'books/wonderful visit/page (109).png',
    'books/wonderful visit/page (110).png',
    'books/wonderful visit/page (111).png',
    'books/wonderful visit/page (112).png',
    'books/wonderful visit/page (113).png',
    'books/wonderful visit/page (114).png',
    'books/wonderful visit/page (115).png',
    'books/wonderful visit/page (116).png',
    'books/wonderful visit/page (117).png',
    'books/wonderful visit/page (118).png',
    'books/wonderful visit/page (119).png',
    'books/wonderful visit/page (120).png',
    'books/wonderful visit/page (121).png',
    'books/wonderful visit/page (122).png',
    'books/wonderful visit/page (123).png',
    'books/wonderful visit/page (124).png',
    'books/wonderful visit/page (125).png',
    'books/wonderful visit/page (126).png',
    'books/wonderful visit/page (127).png',
    'books/wonderful visit/page (128).png',
    'books/wonderful visit/page (129).png',
    'books/wonderful visit/page (130).png',
    'books/wonderful visit/page (131).png',
    'books/wonderful visit/page (132).png',
    'books/wonderful visit/page (133).png',
    'books/wonderful visit/page (134).png',
    'books/wonderful visit/page (135).png',
    'books/wonderful visit/page (136).png',
    'books/wonderful visit/page (137).png',
    'books/wonderful visit/page (138).png',
    'books/wonderful visit/page (139).png',
    'books/wonderful visit/page (140).png',
    'books/wonderful visit/page (141).png',
    'books/wonderful visit/page (142).png',
    'books/wonderful visit/page (143).png',
    'books/wonderful visit/page (144).png',
    'books/wonderful visit/page (145).png',
    'books/wonderful visit/page (146).png',

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
