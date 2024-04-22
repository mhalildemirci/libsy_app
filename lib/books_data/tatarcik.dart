import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class tatarcik extends StatefulWidget {
  const tatarcik({Key? key}) : super(key: key);

  @override
  State<tatarcik> createState() => _tatarcikState();
}

class _tatarcikState extends State<tatarcik> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/tatarcik/page (1).png',
    'books/tatarcik/page (2).png',
    'books/tatarcik/page (3).png',
    'books/tatarcik/page (4).png',
    'books/tatarcik/page (5).png',
    'books/tatarcik/page (6).png',
    'books/tatarcik/page (7).png',
    'books/tatarcik/page (8).png',
    'books/tatarcik/page (9).png',
    'books/tatarcik/page (10).png',
    'books/tatarcik/page (11).png',
    'books/tatarcik/page (12).png',
    'books/tatarcik/page (13).png',
    'books/tatarcik/page (14).png',
    'books/tatarcik/page (15).png',
    'books/tatarcik/page (16).png',
    'books/tatarcik/page (17).png',
    'books/tatarcik/page (18).png',
    'books/tatarcik/page (19).png',
    'books/tatarcik/page (20).png',
    'books/tatarcik/page (21).png',
    'books/tatarcik/page (22).png',
    'books/tatarcik/page (23).png',
    'books/tatarcik/page (24).png',
    'books/tatarcik/page (25).png',
    'books/tatarcik/page (26).png',
    'books/tatarcik/page (27).png',
    'books/tatarcik/page (28).png',
    'books/tatarcik/page (29).png',
    'books/tatarcik/page (30).png',
    'books/tatarcik/page (31).png',
    'books/tatarcik/page (32).png',
    'books/tatarcik/page (33).png',
    'books/tatarcik/page (34).png',
    'books/tatarcik/page (35).png',
    'books/tatarcik/page (36).png',
    'books/tatarcik/page (37).png',
    'books/tatarcik/page (38).png',
    'books/tatarcik/page (39).png',
    'books/tatarcik/page (40).png',
    'books/tatarcik/page (41).png',
    'books/tatarcik/page (42).png',
    'books/tatarcik/page (43).png',
    'books/tatarcik/page (44).png',
    'books/tatarcik/page (45).png',
    'books/tatarcik/page (46).png',
    'books/tatarcik/page (47).png',
    'books/tatarcik/page (48).png',
    'books/tatarcik/page (49).png',
    'books/tatarcik/page (50).png',
    'books/tatarcik/page (51).png',
    'books/tatarcik/page (52).png',
    'books/tatarcik/page (53).png',
    'books/tatarcik/page (54).png',
    'books/tatarcik/page (55).png',
    'books/tatarcik/page (56).png',
    'books/tatarcik/page (57).png',
    'books/tatarcik/page (58).png',
    'books/tatarcik/page (59).png',
    'books/tatarcik/page (60).png',
    'books/tatarcik/page (61).png',
    'books/tatarcik/page (62).png',
    'books/tatarcik/page (63).png',
    'books/tatarcik/page (64).png',
    'books/tatarcik/page (65).png',
    'books/tatarcik/page (66).png',
    'books/tatarcik/page (67).png',
    'books/tatarcik/page (68).png',
    'books/tatarcik/page (69).png',
    'books/tatarcik/page (70).png',
    'books/tatarcik/page (71).png',
    'books/tatarcik/page (72).png',
    'books/tatarcik/page (73).png',
    'books/tatarcik/page (74).png',
    'books/tatarcik/page (75).png',
    'books/tatarcik/page (76).png',
    'books/tatarcik/page (77).png',
    'books/tatarcik/page (78).png',
    'books/tatarcik/page (79).png',
    'books/tatarcik/page (80).png',
    'books/tatarcik/page (81).png',
    'books/tatarcik/page (82).png',
    'books/tatarcik/page (83).png',
    'books/tatarcik/page (84).png',
    'books/tatarcik/page (85).png',
    'books/tatarcik/page (86).png',
    'books/tatarcik/page (87).png',
    'books/tatarcik/page (88).png',
    'books/tatarcik/page (89).png',
    'books/tatarcik/page (90).png',
    'books/tatarcik/page (91).png',
    'books/tatarcik/page (92).png',
    'books/tatarcik/page (93).png',
    'books/tatarcik/page (94).png',
    'books/tatarcik/page (95).png',
    'books/tatarcik/page (96).png',
    'books/tatarcik/page (97).png',
    'books/tatarcik/page (98).png',
    'books/tatarcik/page (99).png',
    'books/tatarcik/page (100).png',
    'books/tatarcik/page (101).png',
    'books/tatarcik/page (102).png',
    'books/tatarcik/page (103).png',
    'books/tatarcik/page (104).png',
    'books/tatarcik/page (105).png',
    'books/tatarcik/page (106).png',
    'books/tatarcik/page (107).png',
    'books/tatarcik/page (108).png',
    'books/tatarcik/page (109).png',
    'books/tatarcik/page (110).png',
    'books/tatarcik/page (111).png',
    'books/tatarcik/page (112).png',
    'books/tatarcik/page (113).png',
    'books/tatarcik/page (114).png',
    'books/tatarcik/page (115).png',
    'books/tatarcik/page (116).png',
    'books/tatarcik/page (117).png',
    'books/tatarcik/page (118).png',
    'books/tatarcik/page (119).png',
    'books/tatarcik/page (120).png',
    'books/tatarcik/page (121).png',
    'books/tatarcik/page (122).png',
    'books/tatarcik/page (123).png',
    'books/tatarcik/page (124).png',
    'books/tatarcik/page (125).png',
    'books/tatarcik/page (126).png',
    'books/tatarcik/page (127).png',
    'books/tatarcik/page (128).png',
    'books/tatarcik/page (129).png',
    'books/tatarcik/page (130).png',
    'books/tatarcik/page (131).png',
    'books/tatarcik/page (132).png',
    'books/tatarcik/page (133).png',
    'books/tatarcik/page (134).png',
    'books/tatarcik/page (135).png',
    'books/tatarcik/page (136).png',
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
