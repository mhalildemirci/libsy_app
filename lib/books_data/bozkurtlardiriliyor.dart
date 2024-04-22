import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class bozkurtlardiriliyor extends StatefulWidget {
  const bozkurtlardiriliyor({Key? key}) : super(key: key);

  @override
  State<bozkurtlardiriliyor> createState() => _bozkurtlardiriliyorState();
}

class _bozkurtlardiriliyorState extends State<bozkurtlardiriliyor> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/bozkurtlar diriliyor/page (1).png',
    'books/bozkurtlar diriliyor/page (2).png',
    'books/bozkurtlar diriliyor/page (3).png',
    'books/bozkurtlar diriliyor/page (4).png',
    'books/bozkurtlar diriliyor/page (5).png',
    'books/bozkurtlar diriliyor/page (6).png',
    'books/bozkurtlar diriliyor/page (7).png',
    'books/bozkurtlar diriliyor/page (8).png',
    'books/bozkurtlar diriliyor/page (9).png',
    'books/bozkurtlar diriliyor/page (10).png',
    'books/bozkurtlar diriliyor/page (11).png',
    'books/bozkurtlar diriliyor/page (12).png',
    'books/bozkurtlar diriliyor/page (13).png',
    'books/bozkurtlar diriliyor/page (14).png',
    'books/bozkurtlar diriliyor/page (15).png',
    'books/bozkurtlar diriliyor/page (16).png',
    'books/bozkurtlar diriliyor/page (17).png',
    'books/bozkurtlar diriliyor/page (18).png',
    'books/bozkurtlar diriliyor/page (19).png',
    'books/bozkurtlar diriliyor/page (20).png',
    'books/bozkurtlar diriliyor/page (21).png',
    'books/bozkurtlar diriliyor/page (22).png',
    'books/bozkurtlar diriliyor/page (23).png',
    'books/bozkurtlar diriliyor/page (24).png',
    'books/bozkurtlar diriliyor/page (25).png',
    'books/bozkurtlar diriliyor/page (26).png',
    'books/bozkurtlar diriliyor/page (27).png',
    'books/bozkurtlar diriliyor/page (28).png',
    'books/bozkurtlar diriliyor/page (29).png',
    'books/bozkurtlar diriliyor/page (30).png',
    'books/bozkurtlar diriliyor/page (31).png',
    'books/bozkurtlar diriliyor/page (32).png',
    'books/bozkurtlar diriliyor/page (33).png',
    'books/bozkurtlar diriliyor/page (34).png',
    'books/bozkurtlar diriliyor/page (35).png',
    'books/bozkurtlar diriliyor/page (36).png',
    'books/bozkurtlar diriliyor/page (37).png',
    'books/bozkurtlar diriliyor/page (38).png',
    'books/bozkurtlar diriliyor/page (39).png',
    'books/bozkurtlar diriliyor/page (40).png',
    'books/bozkurtlar diriliyor/page (41).png',
    'books/bozkurtlar diriliyor/page (42).png',
    'books/bozkurtlar diriliyor/page (43).png',
    'books/bozkurtlar diriliyor/page (44).png',
    'books/bozkurtlar diriliyor/page (45).png',
    'books/bozkurtlar diriliyor/page (46).png',
    'books/bozkurtlar diriliyor/page (47).png',
    'books/bozkurtlar diriliyor/page (48).png',
    'books/bozkurtlar diriliyor/page (49).png',
    'books/bozkurtlar diriliyor/page (50).png',
    'books/bozkurtlar diriliyor/page (51).png',
    'books/bozkurtlar diriliyor/page (52).png',
    'books/bozkurtlar diriliyor/page (53).png',
    'books/bozkurtlar diriliyor/page (54).png',
    'books/bozkurtlar diriliyor/page (55).png',
    'books/bozkurtlar diriliyor/page (56).png',
    'books/bozkurtlar diriliyor/page (57).png',
    'books/bozkurtlar diriliyor/page (58).png',
    'books/bozkurtlar diriliyor/page (59).png',
    'books/bozkurtlar diriliyor/page (60).png',
    'books/bozkurtlar diriliyor/page (61).png',
    'books/bozkurtlar diriliyor/page (62).png',
    'books/bozkurtlar diriliyor/page (63).png',
    'books/bozkurtlar diriliyor/page (64).png',
    'books/bozkurtlar diriliyor/page (65).png',
    'books/bozkurtlar diriliyor/page (66).png',
    'books/bozkurtlar diriliyor/page (67).png',
    'books/bozkurtlar diriliyor/page (68).png',
    'books/bozkurtlar diriliyor/page (69).png',
    'books/bozkurtlar diriliyor/page (70).png',
    'books/bozkurtlar diriliyor/page (71).png',
    'books/bozkurtlar diriliyor/page (72).png',
    'books/bozkurtlar diriliyor/page (73).png',
    'books/bozkurtlar diriliyor/page (74).png',
    'books/bozkurtlar diriliyor/page (75).png',
    'books/bozkurtlar diriliyor/page (76).png',
    'books/bozkurtlar diriliyor/page (77).png',
    'books/bozkurtlar diriliyor/page (78).png',
    'books/bozkurtlar diriliyor/page (79).png',
    'books/bozkurtlar diriliyor/page (80).png',
    'books/bozkurtlar diriliyor/page (81).png',
    'books/bozkurtlar diriliyor/page (82).png',
    'books/bozkurtlar diriliyor/page (83).png',
    'books/bozkurtlar diriliyor/page (84).png',
    'books/bozkurtlar diriliyor/page (85).png',
    'books/bozkurtlar diriliyor/page (86).png',
    'books/bozkurtlar diriliyor/page (87).png',
    'books/bozkurtlar diriliyor/page (88).png',
    'books/bozkurtlar diriliyor/page (89).png',
    'books/bozkurtlar diriliyor/page (90).png',
    'books/bozkurtlar diriliyor/page (91).png',
    'books/bozkurtlar diriliyor/page (92).png',
    'books/bozkurtlar diriliyor/page (93).png',
    'books/bozkurtlar diriliyor/page (94).png',
    'books/bozkurtlar diriliyor/page (95).png',
    'books/bozkurtlar diriliyor/page (96).png',
    'books/bozkurtlar diriliyor/page (97).png',
    'books/bozkurtlar diriliyor/page (98).png',
    'books/bozkurtlar diriliyor/page (99).png',
    'books/bozkurtlar diriliyor/page (100).png',
    'books/bozkurtlar diriliyor/page (101).png',
    'books/bozkurtlar diriliyor/page (102).png',
    'books/bozkurtlar diriliyor/page (103).png',
    'books/bozkurtlar diriliyor/page (104).png',
    'books/bozkurtlar diriliyor/page (105).png',
    'books/bozkurtlar diriliyor/page (106).png',
    'books/bozkurtlar diriliyor/page (107).png',
    'books/bozkurtlar diriliyor/page (108).png',
    'books/bozkurtlar diriliyor/page (109).png',
    'books/bozkurtlar diriliyor/page (110).png',
    'books/bozkurtlar diriliyor/page (111).png',
    'books/bozkurtlar diriliyor/page (112).png',
    'books/bozkurtlar diriliyor/page (113).png',
    'books/bozkurtlar diriliyor/page (114).png',
    'books/bozkurtlar diriliyor/page (115).png',
    'books/bozkurtlar diriliyor/page (116).png',
    'books/bozkurtlar diriliyor/page (117).png',
    'books/bozkurtlar diriliyor/page (118).png',
    'books/bozkurtlar diriliyor/page (119).png',
    'books/bozkurtlar diriliyor/page (120).png',
    'books/bozkurtlar diriliyor/page (121).png',
    'books/bozkurtlar diriliyor/page (122).png',
    'books/bozkurtlar diriliyor/page (123).png',
    'books/bozkurtlar diriliyor/page (124).png',
    'books/bozkurtlar diriliyor/page (125).png',
    'books/bozkurtlar diriliyor/page (126).png',
    'books/bozkurtlar diriliyor/page (127).png',

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
