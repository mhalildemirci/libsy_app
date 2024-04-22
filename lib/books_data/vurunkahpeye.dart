import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class vurunkahpeye extends StatefulWidget {
  const vurunkahpeye({Key? key}) : super(key: key);

  @override
  State<vurunkahpeye> createState() => _vurunkahpeyeState();
}

class _vurunkahpeyeState extends State<vurunkahpeye> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/vurun kahpeye/page (1).png',
    'books/vurun kahpeye/page (2).png',
    'books/vurun kahpeye/page (3).png',
    'books/vurun kahpeye/page (4).png',
    'books/vurun kahpeye/page (5).png',
    'books/vurun kahpeye/page (6).png',
    'books/vurun kahpeye/page (7).png',
    'books/vurun kahpeye/page (8).png',
    'books/vurun kahpeye/page (9).png',
    'books/vurun kahpeye/page (10).png',
    'books/vurun kahpeye/page (11).png',
    'books/vurun kahpeye/page (12).png',
    'books/vurun kahpeye/page (13).png',
    'books/vurun kahpeye/page (14).png',
    'books/vurun kahpeye/page (15).png',
    'books/vurun kahpeye/page (16).png',
    'books/vurun kahpeye/page (17).png',
    'books/vurun kahpeye/page (18).png',
    'books/vurun kahpeye/page (19).png',
    'books/vurun kahpeye/page (20).png',
    'books/vurun kahpeye/page (21).png',
    'books/vurun kahpeye/page (22).png',
    'books/vurun kahpeye/page (23).png',
    'books/vurun kahpeye/page (24).png',
    'books/vurun kahpeye/page (25).png',
    'books/vurun kahpeye/page (26).png',
    'books/vurun kahpeye/page (27).png',
    'books/vurun kahpeye/page (28).png',
    'books/vurun kahpeye/page (29).png',
    'books/vurun kahpeye/page (30).png',
    'books/vurun kahpeye/page (31).png',
    'books/vurun kahpeye/page (32).png',
    'books/vurun kahpeye/page (33).png',
    'books/vurun kahpeye/page (34).png',
    'books/vurun kahpeye/page (35).png',
    'books/vurun kahpeye/page (36).png',
    'books/vurun kahpeye/page (37).png',
    'books/vurun kahpeye/page (38).png',
    'books/vurun kahpeye/page (39).png',
    'books/vurun kahpeye/page (40).png',
    'books/vurun kahpeye/page (41).png',
    'books/vurun kahpeye/page (42).png',
    'books/vurun kahpeye/page (43).png',
    'books/vurun kahpeye/page (44).png',
    'books/vurun kahpeye/page (45).png',
    'books/vurun kahpeye/page (46).png',
    'books/vurun kahpeye/page (47).png',
    'books/vurun kahpeye/page (48).png',
    'books/vurun kahpeye/page (49).png',
    'books/vurun kahpeye/page (50).png',
    'books/vurun kahpeye/page (51).png',
    'books/vurun kahpeye/page (52).png',
    'books/vurun kahpeye/page (53).png',
    'books/vurun kahpeye/page (54).png',
    'books/vurun kahpeye/page (55).png',
    'books/vurun kahpeye/page (56).png',
    'books/vurun kahpeye/page (57).png',
    'books/vurun kahpeye/page (58).png',
    'books/vurun kahpeye/page (59).png',
    'books/vurun kahpeye/page (60).png',
    'books/vurun kahpeye/page (61).png',
    'books/vurun kahpeye/page (62).png',
    'books/vurun kahpeye/page (63).png',
    'books/vurun kahpeye/page (64).png',
    'books/vurun kahpeye/page (65).png',
    'books/vurun kahpeye/page (66).png',
    'books/vurun kahpeye/page (67).png',
    'books/vurun kahpeye/page (68).png',
    'books/vurun kahpeye/page (69).png',
    'books/vurun kahpeye/page (70).png',
    'books/vurun kahpeye/page (71).png',
    'books/vurun kahpeye/page (72).png',
    'books/vurun kahpeye/page (73).png',
    'books/vurun kahpeye/page (74).png',
    'books/vurun kahpeye/page (75).png',
    'books/vurun kahpeye/page (76).png',
    'books/vurun kahpeye/page (77).png',
    'books/vurun kahpeye/page (78).png',
    'books/vurun kahpeye/page (79).png',
    'books/vurun kahpeye/page (80).png',
    'books/vurun kahpeye/page (81).png',
    'books/vurun kahpeye/page (82).png',
    'books/vurun kahpeye/page (83).png',
    'books/vurun kahpeye/page (84).png',
    'books/vurun kahpeye/page (85).png',
    'books/vurun kahpeye/page (86).png',
    'books/vurun kahpeye/page (87).png',
    'books/vurun kahpeye/page (88).png',
    'books/vurun kahpeye/page (89).png',
    'books/vurun kahpeye/page (90).png',
    'books/vurun kahpeye/page (91).png',
    'books/vurun kahpeye/page (92).png',
    'books/vurun kahpeye/page (93).png',
    'books/vurun kahpeye/page (94).png',
    'books/vurun kahpeye/page (95).png',
    'books/vurun kahpeye/page (96).png',
    'books/vurun kahpeye/page (97).png',
    'books/vurun kahpeye/page (98).png',
    'books/vurun kahpeye/page (99).png',
    'books/vurun kahpeye/page (100).png',
    'books/vurun kahpeye/page (101).png',
    'books/vurun kahpeye/page (102).png',
    'books/vurun kahpeye/page (103).png',
    'books/vurun kahpeye/page (104).png',
    'books/vurun kahpeye/page (105).png',
    'books/vurun kahpeye/page (106).png',
    'books/vurun kahpeye/page (107).png',
    'books/vurun kahpeye/page (108).png',
    'books/vurun kahpeye/page (109).png',
    'books/vurun kahpeye/page (110).png',
    'books/vurun kahpeye/page (111).png',
    'books/vurun kahpeye/page (112).png',
    'books/vurun kahpeye/page (113).png',
    'books/vurun kahpeye/page (114).png',
    'books/vurun kahpeye/page (115).png',
    'books/vurun kahpeye/page (116).png',
    'books/vurun kahpeye/page (117).png',
    'books/vurun kahpeye/page (118).png',
    'books/vurun kahpeye/page (119).png',
    'books/vurun kahpeye/page (120).png',
    'books/vurun kahpeye/page (121).png',
    'books/vurun kahpeye/page (122).png',
    'books/vurun kahpeye/page (123).png',

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
