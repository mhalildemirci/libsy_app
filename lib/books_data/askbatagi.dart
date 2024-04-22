import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class askbatagi extends StatefulWidget {
  const askbatagi({Key? key}) : super(key: key);

  @override
  State<askbatagi> createState() => _askbatagiState();
}

class _askbatagiState extends State<askbatagi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Ask Batagi/page (1).png',
    'books/Ask Batagi/page (2).png',
    'books/Ask Batagi/page (3).png',
    'books/Ask Batagi/page (4).png',
    'books/Ask Batagi/page (5).png',
    'books/Ask Batagi/page (6).png',
    'books/Ask Batagi/page (7).png',
    'books/Ask Batagi/page (8).png',
    'books/Ask Batagi/page (9).png',
    'books/Ask Batagi/page (10).png',
    'books/Ask Batagi/page (11).png',
    'books/Ask Batagi/page (12).png',
    'books/Ask Batagi/page (13).png',
    'books/Ask Batagi/page (14).png',
    'books/Ask Batagi/page (15).png',
    'books/Ask Batagi/page (16).png',
    'books/Ask Batagi/page (17).png',
    'books/Ask Batagi/page (18).png',
    'books/Ask Batagi/page (19).png',
    'books/Ask Batagi/page (20).png',
    'books/Ask Batagi/page (21).png',
    'books/Ask Batagi/page (22).png',
    'books/Ask Batagi/page (23).png',
    'books/Ask Batagi/page (24).png',
    'books/Ask Batagi/page (25).png',
    'books/Ask Batagi/page (26).png',
    'books/Ask Batagi/page (27).png',
    'books/Ask Batagi/page (28).png',
    'books/Ask Batagi/page (29).png',
    'books/Ask Batagi/page (30).png',
    'books/Ask Batagi/page (31).png',
    'books/Ask Batagi/page (32).png',
    'books/Ask Batagi/page (33).png',
    'books/Ask Batagi/page (34).png',
    'books/Ask Batagi/page (35).png',
    'books/Ask Batagi/page (36).png',
    'books/Ask Batagi/page (37).png',
    'books/Ask Batagi/page (38).png',
    'books/Ask Batagi/page (39).png',
    'books/Ask Batagi/page (40).png',
    'books/Ask Batagi/page (41).png',
    'books/Ask Batagi/page (42).png',
    'books/Ask Batagi/page (43).png',
    'books/Ask Batagi/page (44).png',
    'books/Ask Batagi/page (45).png',
    'books/Ask Batagi/page (46).png',
    'books/Ask Batagi/page (47).png',
    'books/Ask Batagi/page (48).png',
    'books/Ask Batagi/page (49).png',
    'books/Ask Batagi/page (50).png',
    'books/Ask Batagi/page (51).png',
    'books/Ask Batagi/page (52).png',
    'books/Ask Batagi/page (53).png',
    'books/Ask Batagi/page (54).png',
    'books/Ask Batagi/page (55).png',
    'books/Ask Batagi/page (56).png',
    'books/Ask Batagi/page (57).png',
    'books/Ask Batagi/page (58).png',
    'books/Ask Batagi/page (59).png',
    'books/Ask Batagi/page (60).png',
    'books/Ask Batagi/page (61).png',
    'books/Ask Batagi/page (62).png',
    'books/Ask Batagi/page (63).png',
    'books/Ask Batagi/page (64).png',
    'books/Ask Batagi/page (65).png',
    'books/Ask Batagi/page (66).png',
    'books/Ask Batagi/page (67).png',
    'books/Ask Batagi/page (68).png',
    'books/Ask Batagi/page (69).png',
    'books/Ask Batagi/page (70).png',
    'books/Ask Batagi/page (71).png',
    'books/Ask Batagi/page (72).png',
    'books/Ask Batagi/page (73).png',
    'books/Ask Batagi/page (74).png',
    'books/Ask Batagi/page (75).png',
    'books/Ask Batagi/page (76).png',
    'books/Ask Batagi/page (77).png',
    'books/Ask Batagi/page (78).png',
    'books/Ask Batagi/page (79).png',
    'books/Ask Batagi/page (80).png',
    'books/Ask Batagi/page (81).png',
    'books/Ask Batagi/page (82).png',
    'books/Ask Batagi/page (83).png',
    'books/Ask Batagi/page (84).png',
    'books/Ask Batagi/page (85).png',
    'books/Ask Batagi/page (86).png',
    'books/Ask Batagi/page (87).png',
    'books/Ask Batagi/page (88).png',
    'books/Ask Batagi/page (89).png',
    'books/Ask Batagi/page (90).png',
    'books/Ask Batagi/page (91).png',
    'books/Ask Batagi/page (92).png',
    'books/Ask Batagi/page (93).png',
    'books/Ask Batagi/page (94).png',
    'books/Ask Batagi/page (95).png',
    'books/Ask Batagi/page (96).png',
    'books/Ask Batagi/page (97).png',
    'books/Ask Batagi/page (98).png',
    'books/Ask Batagi/page (99).png',
    'books/Ask Batagi/page (100).png',
    'books/Ask Batagi/page (101).png',
    'books/Ask Batagi/page (102).png',
    'books/Ask Batagi/page (103).png',
    'books/Ask Batagi/page (104).png',
    'books/Ask Batagi/page (105).png',
    'books/Ask Batagi/page (106).png',
    'books/Ask Batagi/page (107).png',
    'books/Ask Batagi/page (108).png',
    'books/Ask Batagi/page (109).png',
    'books/Ask Batagi/page (110).png',
    'books/Ask Batagi/page (111).png',
    'books/Ask Batagi/page (112).png',

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
