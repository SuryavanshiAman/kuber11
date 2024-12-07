import 'package:flutter/material.dart';

class MySliverAppBarPage extends StatefulWidget {
  const MySliverAppBarPage({Key? key}) : super(key: key);

  @override
  State<MySliverAppBarPage> createState() => _MySliverAppBarPageState();
}

class _MySliverAppBarPageState extends State<MySliverAppBarPage> {
  late ScrollController _scrollController;
  bool _showSearchBar = false;
  int _selectedIndex = 0; // Initialize with 0
  double _previousOffset = 0.0; // To track previous offset for horizontal scrolling

  final List<String> _tabNames = [
    'Home',
    'Search',
    'Notifications',
    'Profile',
  ];

  final List<String> _printedTabNames = []; // List to store printed tab names

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Track horizontal scrolling
    if (_scrollController.offset != _previousOffset) {
      if (_scrollController.offset > _previousOffset) {
        // Scroll right (or downward if vertical)
        if (_selectedIndex < 3) {
          setState(() {
            _selectedIndex++;
          });
        }
      } else {
        // Scroll left (or upward if vertical)
        if (_selectedIndex > 0) {
          setState(() {
            _selectedIndex--;
          });
        }
      }
      _previousOffset = _scrollController.offset;

      // Print the tab name and add it to the list
      setState(() {
        _printedTabNames.add("Tab: ${_tabNames[_selectedIndex]}");
      });
    }

    // Toggle the search bar visibility based on scroll position
    if (_scrollController.offset > 50 && !_showSearchBar) {
      setState(() => _showSearchBar = true);
    } else if (_scrollController.offset <= 50 && _showSearchBar) {
      setState(() => _showSearchBar = false);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Print the tab name when tapping on the bottom navigation bar and add it to the list
    setState(() {
      _printedTabNames.add("Tab: ${_tabNames[_selectedIndex]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Main SliverAppBar with flexible space, only visible when not scrolling
          if (!_showSearchBar)
            SliverAppBar(
              expandedHeight: 155.0,
              floating: false,
              pinned: true,
              title: Text("My Sliver App Bar"),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      height: 80,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (_showSearchBar)
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchBarDelegate(),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text("Item #$index"),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      bottomNavigationBar: !_showSearchBar
          ? BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.amberAccent),
        unselectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.amberAccent,
        items: List.generate(4, (index) {
          Color iconColor =
          _selectedIndex == index ? Colors.green : Colors.red;
          return BottomNavigationBarItem(
            icon: Icon(
              index == 0
                  ? Icons.home
                  : index == 1
                  ? Icons.search
                  : index == 2
                  ? Icons.notifications
                  : Icons.account_circle,
              color: iconColor,
            ),
            label: _tabNames[index],
          );
        }),
      )
          : null,
    );
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
