import 'dart:async';
import 'package:flutter/material.dart';
import 'package:justenglish/screens/class_detail.dart';


class ClassList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return ClassListState();
  }
}

class ClassListState extends State<ClassList> {











  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Widget> _children = [
    Scaffold(

      appBar: AppBar(
        title: Text('Classes'),
        centerTitle: true,
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail('Add Class');
        },

        tooltip: 'Add Class',

        child: Icon(Icons.add),

      ),

    ),
    Container(),
      Container()
    ];

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Classes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Schedule'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Salary')
          )
        ],
      ),
    );




    /*updateListView();

    return Scaffold(

      appBar: AppBar(
        title: Text('Classes'),
        centerTitle: true,
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail('Add Class');
        },

        tooltip: 'Add Class',

        child: Icon(Icons.add),

      ),

    );*/
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
    Card(
    color: Colors.white,
      elevation: 2.0,
      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: getPriorityColor(1),
          child: getPriorityIcon(1),
        ),

        title: Text('Upper', style: titleStyle,),

        subtitle: Text('Weekday morning'),

        trailing: GestureDetector(
          child: Icon(Icons.delete, color: Colors.grey,),
          onTap: () {
            _delete(this.context);
          },
        ),


        onTap: () {
          debugPrint("ListTile Tapped");
          navigateToDetail('Edit Class');
        },

      ),
    ),
        Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(1),
              child: getPriorityIcon(1),
            ),

            title: Text('Inter', style: titleStyle,),

            subtitle: Text('Weekday evening'),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(this.context);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail('Edit Class');
            },

          ),
        ),
        Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(3),
              child: getPriorityIcon(3),
            ),

            title: Text('IELTS', style: titleStyle,),

            subtitle: Text('Weekend morning'),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(this.context);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail('Edit Class');
            },

          ),
        ),
        Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(2),
              child: getPriorityIcon(2),
            ),

            title: Text('Ahmet', style: titleStyle,),

            subtitle: Text('Private'),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(this.context);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail('Edit Class');
            },

          ),
        ),
      ],
    );

  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.group);
        break;
      case 2:
        return Icon(Icons.person);
        break;
      case 3:
        return Icon(Icons.all_inclusive);
        break;

      default:
        return Icon(Icons.group);
    }
  }

  void _delete(BuildContext context) async {
    _showSnackBar(context, 'Deleted Successfully');
    updateListView();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ClassDetail();
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
  }


}
