import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sawyerdetecetive extends StatefulWidget {
  const sawyerdetecetive({Key? key}) : super(key: key);

  @override
  State<sawyerdetecetive> createState() => _sawyerdetecetiveState();
}

class _sawyerdetecetiveState extends State<sawyerdetecetive> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sawyer detective/page (1).png',
    'books/sawyer detective/page (2).png',
    'books/sawyer detective/page (3).png',
    'books/sawyer detective/page (4).png',
    'books/sawyer detective/page (5).png',
    'books/sawyer detective/page (6).png',
    'books/sawyer detective/page (7).png',
    'books/sawyer detective/page (8).png',
    'books/sawyer detective/page (9).png',
    'books/sawyer detective/page (10).png',
    'books/sawyer detective/page (11).png',
    'books/sawyer detective/page (12).png',
    'books/sawyer detective/page (13).png',
    'books/sawyer detective/page (14).png',
    'books/sawyer detective/page (15).png',
    'books/sawyer detective/page (16).png',
    'books/sawyer detective/page (17).png',
    'books/sawyer detective/page (18).png',
    'books/sawyer detective/page (19).png',
    'books/sawyer detective/page (20).png',
    'books/sawyer detective/page (21).png',
    'books/sawyer detective/page (22).png',
    'books/sawyer detective/page (23).png',
    'books/sawyer detective/page (24).png',
    'books/sawyer detective/page (25).png',
    'books/sawyer detective/page (26).png',
    'books/sawyer detective/page (27).png',
    'books/sawyer detective/page (28).png',
    'books/sawyer detective/page (29).png',
    'books/sawyer detective/page (30).png',
    'books/sawyer detective/page (31).png',
    'books/sawyer detective/page (32).png',
    'books/sawyer detective/page (33).png',
    'books/sawyer detective/page (34).png',
    'books/sawyer detective/page (35).png',
    'books/sawyer detective/page (36).png',
    'books/sawyer detective/page (37).png',
    'books/sawyer detective/page (38).png',
    'books/sawyer detective/page (39).png',
    'books/sawyer detective/page (40).png',
    'books/sawyer detective/page (41).png',
    'books/sawyer detective/page (42).png',
    'books/sawyer detective/page (43).png',
    'books/sawyer detective/page (44).png',
    'books/sawyer detective/page (45).png',
    'books/sawyer detective/page (46).png',
    'books/sawyer detective/page (47).png',
    'books/sawyer detective/page (48).png',
    'books/sawyer detective/page (49).png',
    'books/sawyer detective/page (50).png',
    'books/sawyer detective/page (51).png',
    'books/sawyer detective/page (52).png',
    'books/sawyer detective/page (53).png',
    'books/sawyer detective/page (54).png',
    'books/sawyer detective/page (55).png',
    'books/sawyer detective/page (56).png',
    'books/sawyer detective/page (57).png',
    'books/sawyer detective/page (58).png',
    'books/sawyer detective/page (59).png',
    'books/sawyer detective/page (60).png',
    'books/sawyer detective/page (61).png',
    'books/sawyer detective/page (62).png',
    'books/sawyer detective/page (63).png',
    'books/sawyer detective/page (64).png',
    'books/sawyer detective/page (65).png',
    'books/sawyer detective/page (66).png',
    'books/sawyer detective/page (67).png',
    'books/sawyer detective/page (68).png',
    'books/sawyer detective/page (69).png',
    'books/sawyer detective/page (70).png',
    'books/sawyer detective/page (71).png',
    'books/sawyer detective/page (72).png',
    'books/sawyer detective/page (73).png',
    'books/sawyer detective/page (74).png',
    'books/sawyer detective/page (75).png',
    'books/sawyer detective/page (76).png',
    'books/sawyer detective/page (77).png',

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
