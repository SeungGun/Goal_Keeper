import 'package:flutter/material.dart';
import 'package:goal_keeper/bottom_routes/achieve_page.dart';
import 'package:goal_keeper/bottom_routes/goal_page.dart';
import 'package:goal_keeper/bottom_routes/help_page.dart';
import 'package:goal_keeper/bottom_routes/schedule_page.dart';
import 'package:goal_keeper/bottom_routes/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  double _opacity = 1.0;
  List<Widget> bottomRoutes = [GoalPage(), SchedulePage(), AchievementPage(), SettingsPage(), HelpMePage()];
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(children: bottomRoutes,controller: _pageController,onPageChanged: (index){
        setState(() {
          _currentIndex = index;
        });
      },),
      floatingActionButton: Opacity(
        opacity: _opacity,
        child: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _opacity = (_currentIndex == 0) ? 1.0 : 0.0;
            _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '목표',
            icon: Icon(Icons.assignment_turned_in)
          ),
          BottomNavigationBarItem(
              label: '스케줄',
              icon: Icon(Icons.date_range_outlined)
          ),
          BottomNavigationBarItem(
              label: '성취도',
              icon: Icon(Icons.military_tech_outlined)
          ),
          BottomNavigationBarItem(
              label: '설정',
              icon: Icon(Icons.settings)
          ),
          BottomNavigationBarItem(
              label: '도움말',
              icon: Icon(Icons.assistant_navigation)
          ),
        ],
      ),
    );
  }
}
