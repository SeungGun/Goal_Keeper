import 'package:flutter/material.dart';
import 'package:goal_keeper/initialSetting_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  int _goalCount = 0;
  Database database;
  @override
  void initState() {
    super.initState();
    _openDatabaseFromGoalList();
  }
  Future<void> _openDatabaseFromGoalList() async{
    String dbPath = join(await getDatabasesPath(), 'goal.db');
    database = await openDatabase(dbPath, onCreate: (db, version){
      return db.execute('CREATE TABLE IF NOT EXISTS goal_info (title TEXT, period TEXT)');
    },version: 1);
    
    _goalCount = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM goal_info'));

    if(_goalCount == 0){
      Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context)
      => InitialSettingPage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('목표'),);
  }
}
