import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class sevdasokagi extends StatefulWidget {
  const sevdasokagi({Key? key}) : super(key: key);

  @override
  State<sevdasokagi> createState() => _sevdasokagiState();
}

class _sevdasokagiState extends State<sevdasokagi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/sevda sokagi/page (1).png',
    'books/sevda sokagi/page (2).png',
    'books/sevda sokagi/page (3).png',
    'books/sevda sokagi/page (4).png',
    'books/sevda sokagi/page (5).png',
    'books/sevda sokagi/page (6).png',
    'books/sevda sokagi/page (7).png',
    'books/sevda sokagi/page (8).png',
    'books/sevda sokagi/page (9).png',
    'books/sevda sokagi/page (10).png',
    'books/sevda sokagi/page (11).png',
    'books/sevda sokagi/page (12).png',
    'books/sevda sokagi/page (13).png',
    'books/sevda sokagi/page (14).png',
    'books/sevda sokagi/page (15).png',
    'books/sevda sokagi/page (16).png',
    'books/sevda sokagi/page (17).png',
    'books/sevda sokagi/page (18).png',
    'books/sevda sokagi/page (19).png',
    'books/sevda sokagi/page (20).png',
    'books/sevda sokagi/page (21).png',
    'books/sevda sokagi/page (22).png',
    'books/sevda sokagi/page (23).png',
    'books/sevda sokagi/page (24).png',
    'books/sevda sokagi/page (25).png',
    'books/sevda sokagi/page (26).png',
    'books/sevda sokagi/page (27).png',
    'books/sevda sokagi/page (28).png',
    'books/sevda sokagi/page (29).png',
    'books/sevda sokagi/page (30).png',
    'books/sevda sokagi/page (31).png',
    'books/sevda sokagi/page (32).png',
    'books/sevda sokagi/page (33).png',
    'books/sevda sokagi/page (34).png',
    'books/sevda sokagi/page (35).png',
    'books/sevda sokagi/page (36).png',
    'books/sevda sokagi/page (37).png',
    'books/sevda sokagi/page (38).png',
    'books/sevda sokagi/page (39).png',
    'books/sevda sokagi/page (40).png',
    'books/sevda sokagi/page (41).png',
    'books/sevda sokagi/page (42).png',
    'books/sevda sokagi/page (43).png',
    'books/sevda sokagi/page (44).png',
    'books/sevda sokagi/page (45).png',
    'books/sevda sokagi/page (46).png',
    'books/sevda sokagi/page (47).png',
    'books/sevda sokagi/page (48).png',
    'books/sevda sokagi/page (49).png',
    'books/sevda sokagi/page (50).png',
    'books/sevda sokagi/page (51).png',
    'books/sevda sokagi/page (52).png',
    'books/sevda sokagi/page (53).png',
    'books/sevda sokagi/page (54).png',
    'books/sevda sokagi/page (55).png',
    'books/sevda sokagi/page (56).png',
    'books/sevda sokagi/page (57).png',
    'books/sevda sokagi/page (58).png',
    'books/sevda sokagi/page (59).png',
    'books/sevda sokagi/page (60).png',
    'books/sevda sokagi/page (61).png',
    'books/sevda sokagi/page (62).png',
    'books/sevda sokagi/page (63).png',
    'books/sevda sokagi/page (64).png',
    'books/sevda sokagi/page (65).png',
    'books/sevda sokagi/page (66).png',
    'books/sevda sokagi/page (67).png',
    'books/sevda sokagi/page (68).png',
    'books/sevda sokagi/page (69).png',
    'books/sevda sokagi/page (70).png',
    'books/sevda sokagi/page (71).png',

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
