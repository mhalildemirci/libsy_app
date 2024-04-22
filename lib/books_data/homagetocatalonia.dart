import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class homagetocatalonia extends StatefulWidget {
  const homagetocatalonia({Key? key}) : super(key: key);

  @override
  State<homagetocatalonia> createState() => _homagetocataloniaState();
}

class _homagetocataloniaState extends State<homagetocatalonia> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/homage to catalonia/page (1).png',
    'books/homage to catalonia/page (2).png',
    'books/homage to catalonia/page (3).png',
    'books/homage to catalonia/page (4).png',
    'books/homage to catalonia/page (5).png',
    'books/homage to catalonia/page (6).png',
    'books/homage to catalonia/page (7).png',
    'books/homage to catalonia/page (8).png',
    'books/homage to catalonia/page (9).png',
    'books/homage to catalonia/page (10).png',
    'books/homage to catalonia/page (11).png',
    'books/homage to catalonia/page (12).png',
    'books/homage to catalonia/page (13).png',
    'books/homage to catalonia/page (14).png',
    'books/homage to catalonia/page (15).png',
    'books/homage to catalonia/page (16).png',
    'books/homage to catalonia/page (17).png',
    'books/homage to catalonia/page (18).png',
    'books/homage to catalonia/page (19).png',
    'books/homage to catalonia/page (20).png',
    'books/homage to catalonia/page (21).png',
    'books/homage to catalonia/page (22).png',
    'books/homage to catalonia/page (23).png',
    'books/homage to catalonia/page (24).png',
    'books/homage to catalonia/page (25).png',
    'books/homage to catalonia/page (26).png',
    'books/homage to catalonia/page (27).png',
    'books/homage to catalonia/page (28).png',
    'books/homage to catalonia/page (29).png',
    'books/homage to catalonia/page (30).png',
    'books/homage to catalonia/page (31).png',
    'books/homage to catalonia/page (32).png',
    'books/homage to catalonia/page (33).png',
    'books/homage to catalonia/page (34).png',
    'books/homage to catalonia/page (35).png',
    'books/homage to catalonia/page (36).png',
    'books/homage to catalonia/page (37).png',
    'books/homage to catalonia/page (38).png',
    'books/homage to catalonia/page (39).png',
    'books/homage to catalonia/page (40).png',
    'books/homage to catalonia/page (41).png',
    'books/homage to catalonia/page (42).png',
    'books/homage to catalonia/page (43).png',
    'books/homage to catalonia/page (44).png',
    'books/homage to catalonia/page (45).png',
    'books/homage to catalonia/page (46).png',
    'books/homage to catalonia/page (47).png',
    'books/homage to catalonia/page (48).png',
    'books/homage to catalonia/page (49).png',
    'books/homage to catalonia/page (50).png',
    'books/homage to catalonia/page (51).png',
    'books/homage to catalonia/page (52).png',
    'books/homage to catalonia/page (53).png',
    'books/homage to catalonia/page (54).png',
    'books/homage to catalonia/page (55).png',
    'books/homage to catalonia/page (56).png',
    'books/homage to catalonia/page (57).png',
    'books/homage to catalonia/page (58).png',
    'books/homage to catalonia/page (59).png',
    'books/homage to catalonia/page (60).png',
    'books/homage to catalonia/page (61).png',
    'books/homage to catalonia/page (62).png',
    'books/homage to catalonia/page (63).png',
    'books/homage to catalonia/page (64).png',
    'books/homage to catalonia/page (65).png',
    'books/homage to catalonia/page (66).png',
    'books/homage to catalonia/page (67).png',
    'books/homage to catalonia/page (68).png',
    'books/homage to catalonia/page (69).png',
    'books/homage to catalonia/page (70).png',
    'books/homage to catalonia/page (71).png',
    'books/homage to catalonia/page (72).png',
    'books/homage to catalonia/page (73).png',
    'books/homage to catalonia/page (74).png',
    'books/homage to catalonia/page (75).png',
    'books/homage to catalonia/page (76).png',
    'books/homage to catalonia/page (77).png',
    'books/homage to catalonia/page (78).png',
    'books/homage to catalonia/page (79).png',
    'books/homage to catalonia/page (80).png',
    'books/homage to catalonia/page (81).png',
    'books/homage to catalonia/page (82).png',
    'books/homage to catalonia/page (83).png',
    'books/homage to catalonia/page (84).png',
    'books/homage to catalonia/page (85).png',
    'books/homage to catalonia/page (86).png',
    'books/homage to catalonia/page (87).png',
    'books/homage to catalonia/page (88).png',
    'books/homage to catalonia/page (89).png',
    'books/homage to catalonia/page (90).png',
    'books/homage to catalonia/page (91).png',
    'books/homage to catalonia/page (92).png',
    'books/homage to catalonia/page (93).png',
    'books/homage to catalonia/page (94).png',
    'books/homage to catalonia/page (95).png',
    'books/homage to catalonia/page (96).png',
    'books/homage to catalonia/page (97).png',
    'books/homage to catalonia/page (98).png',
    'books/homage to catalonia/page (99).png',
    'books/homage to catalonia/page (100).png',
    'books/homage to catalonia/page (101).png',
    'books/homage to catalonia/page (102).png',
    'books/homage to catalonia/page (103).png',
    'books/homage to catalonia/page (104).png',
    'books/homage to catalonia/page (105).png',
    'books/homage to catalonia/page (106).png',
    'books/homage to catalonia/page (107).png',
    'books/homage to catalonia/page (108).png',
    'books/homage to catalonia/page (109).png',
    'books/homage to catalonia/page (110).png',
    'books/homage to catalonia/page (111).png',
    'books/homage to catalonia/page (112).png',
    'books/homage to catalonia/page (113).png',
    'books/homage to catalonia/page (114).png',
    'books/homage to catalonia/page (115).png',
    'books/homage to catalonia/page (116).png',
    'books/homage to catalonia/page (117).png',
    'books/homage to catalonia/page (118).png',
    'books/homage to catalonia/page (119).png',
    'books/homage to catalonia/page (120).png',
    'books/homage to catalonia/page (121).png',
    'books/homage to catalonia/page (122).png',
    'books/homage to catalonia/page (123).png',
    'books/homage to catalonia/page (124).png',
    'books/homage to catalonia/page (125).png',
    'books/homage to catalonia/page (126).png',

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
