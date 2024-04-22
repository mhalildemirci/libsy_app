import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class anenquiryprinciples extends StatefulWidget {
  const anenquiryprinciples({Key? key}) : super(key: key);

  @override
  State<anenquiryprinciples> createState() => _anenquiryprinciplesState();
}

class _anenquiryprinciplesState extends State<anenquiryprinciples> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/an enquiry principles/page (1).png',
    'books/an enquiry principles/page (2).png',
    'books/an enquiry principles/page (3).png',
    'books/an enquiry principles/page (4).png',
    'books/an enquiry principles/page (5).png',
    'books/an enquiry principles/page (6).png',
    'books/an enquiry principles/page (7).png',
    'books/an enquiry principles/page (8).png',
    'books/an enquiry principles/page (9).png',
    'books/an enquiry principles/page (10).png',
    'books/an enquiry principles/page (11).png',
    'books/an enquiry principles/page (12).png',
    'books/an enquiry principles/page (13).png',
    'books/an enquiry principles/page (14).png',
    'books/an enquiry principles/page (15).png',
    'books/an enquiry principles/page (16).png',
    'books/an enquiry principles/page (17).png',
    'books/an enquiry principles/page (18).png',
    'books/an enquiry principles/page (19).png',
    'books/an enquiry principles/page (20).png',
    'books/an enquiry principles/page (21).png',
    'books/an enquiry principles/page (22).png',
    'books/an enquiry principles/page (23).png',
    'books/an enquiry principles/page (24).png',
    'books/an enquiry principles/page (25).png',
    'books/an enquiry principles/page (26).png',
    'books/an enquiry principles/page (27).png',
    'books/an enquiry principles/page (28).png',
    'books/an enquiry principles/page (29).png',
    'books/an enquiry principles/page (30).png',
    'books/an enquiry principles/page (31).png',
    'books/an enquiry principles/page (32).png',
    'books/an enquiry principles/page (33).png',
    'books/an enquiry principles/page (34).png',
    'books/an enquiry principles/page (35).png',
    'books/an enquiry principles/page (36).png',
    'books/an enquiry principles/page (37).png',
    'books/an enquiry principles/page (38).png',
    'books/an enquiry principles/page (39).png',
    'books/an enquiry principles/page (40).png',
    'books/an enquiry principles/page (41).png',
    'books/an enquiry principles/page (42).png',
    'books/an enquiry principles/page (43).png',
    'books/an enquiry principles/page (44).png',
    'books/an enquiry principles/page (45).png',
    'books/an enquiry principles/page (46).png',
    'books/an enquiry principles/page (47).png',
    'books/an enquiry principles/page (48).png',
    'books/an enquiry principles/page (49).png',
    'books/an enquiry principles/page (50).png',
    'books/an enquiry principles/page (51).png',
    'books/an enquiry principles/page (52).png',
    'books/an enquiry principles/page (53).png',
    'books/an enquiry principles/page (54).png',
    'books/an enquiry principles/page (55).png',
    'books/an enquiry principles/page (56).png',
    'books/an enquiry principles/page (57).png',
    'books/an enquiry principles/page (58).png',
    'books/an enquiry principles/page (59).png',
    'books/an enquiry principles/page (60).png',
    'books/an enquiry principles/page (61).png',
    'books/an enquiry principles/page (62).png',
    'books/an enquiry principles/page (63).png',
    'books/an enquiry principles/page (64).png',
    'books/an enquiry principles/page (65).png',
    'books/an enquiry principles/page (66).png',
    'books/an enquiry principles/page (67).png',
    'books/an enquiry principles/page (68).png',
    'books/an enquiry principles/page (69).png',
    'books/an enquiry principles/page (70).png',
    'books/an enquiry principles/page (71).png',
    'books/an enquiry principles/page (72).png',
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
