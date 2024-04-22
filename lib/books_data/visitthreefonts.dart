import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class visitthreefonts extends StatefulWidget {
  const visitthreefonts({Key? key}) : super(key: key);

  @override
  State<visitthreefonts> createState() => _visitthreefontsState();
}

class _visitthreefontsState extends State<visitthreefonts> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/A Visit to Three Fonts/page (1).png',
    'books/A Visit to Three Fonts/page (2).png',
    'books/A Visit to Three Fonts/page (3).png',
    'books/A Visit to Three Fonts/page (4).png',
    'books/A Visit to Three Fonts/page (5).png',
    'books/A Visit to Three Fonts/page (6).png',
    'books/A Visit to Three Fonts/page (7).png',
    'books/A Visit to Three Fonts/page (8).png',
    'books/A Visit to Three Fonts/page (9).png',
    'books/A Visit to Three Fonts/page (10).png',
    'books/A Visit to Three Fonts/page (11).png',
    'books/A Visit to Three Fonts/page (12).png',
    'books/A Visit to Three Fonts/page (13).png',
    'books/A Visit to Three Fonts/page (14).png',
    'books/A Visit to Three Fonts/page (15).png',
    'books/A Visit to Three Fonts/page (16).png',
    'books/A Visit to Three Fonts/page (17).png',
    'books/A Visit to Three Fonts/page (18).png',
    'books/A Visit to Three Fonts/page (19).png',
    'books/A Visit to Three Fonts/page (20).png',
    'books/A Visit to Three Fonts/page (21).png',
    'books/A Visit to Three Fonts/page (22).png',
    'books/A Visit to Three Fonts/page (23).png',
    'books/A Visit to Three Fonts/page (24).png',
    'books/A Visit to Three Fonts/page (25).png',
    'books/A Visit to Three Fonts/page (26).png',
    'books/A Visit to Three Fonts/page (27).png',
    'books/A Visit to Three Fonts/page (28).png',
    'books/A Visit to Three Fonts/page (29).png',
    'books/A Visit to Three Fonts/page (30).png',
    'books/A Visit to Three Fonts/page (31).png',
    'books/A Visit to Three Fonts/page (32).png',
    'books/A Visit to Three Fonts/page (33).png',
    'books/A Visit to Three Fonts/page (34).png',
    'books/A Visit to Three Fonts/page (35).png',
    'books/A Visit to Three Fonts/page (36).png',
    'books/A Visit to Three Fonts/page (37).png',
    'books/A Visit to Three Fonts/page (38).png',
    'books/A Visit to Three Fonts/page (39).png',
    'books/A Visit to Three Fonts/page (40).png',
    'books/A Visit to Three Fonts/page (41).png',
    'books/A Visit to Three Fonts/page (42).png',
    'books/A Visit to Three Fonts/page (43).png',
    'books/A Visit to Three Fonts/page (44).png',
    'books/A Visit to Three Fonts/page (45).png',
    'books/A Visit to Three Fonts/page (46).png',
    'books/A Visit to Three Fonts/page (47).png',
    'books/A Visit to Three Fonts/page (48).png',
    'books/A Visit to Three Fonts/page (49).png',
    'books/A Visit to Three Fonts/page (50).png',
    'books/A Visit to Three Fonts/page (51).png',
    'books/A Visit to Three Fonts/page (52).png',
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
