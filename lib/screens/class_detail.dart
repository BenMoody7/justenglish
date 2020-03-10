import 'dart:async';
import 'package:flutter/material.dart';

class ClassDetail extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {

    return ClassDetailState();
  }
}

class ClassDetailState extends State<ClassDetail> {


  DateTime _sDate;
  DateTime _eDate;

  static var _priorities = ['Group', 'Private', 'Circle'];


  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController sDateController = TextEditingController();
  TextEditingController eDateController = TextEditingController();

  ClassDetailState();
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = 'Upper';
    descriptionController.text = 'Weekday morning';
    void moveToLastScreen() {
      Navigator.pop(context, true);
    }
    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text('Add class'),
            leading: IconButton(icon: Icon(
                Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[

                // First element
                ListTile(
                  title: DropdownButton(
                      items: _priorities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String> (
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      style: textStyle,

                      value: 'Group',

                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueSelectedByUser');
                          if (valueSelectedByUser == 'Group'){
                          }
                          else{
                            sDateController.clear();
                            eDateController.clear();
                          }

                        });
                      }
                  ),
                ),

                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    enabled: true,
                    readOnly: true,
                    controller: sDateController,
                    style: textStyle,


                    decoration: InputDecoration(
                        labelText: 'Start Date',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate:  _sDate == null ? DateTime.now():_sDate ,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030)
                      ).then((date){
                        setState(() {
                          if(date!=null){
                            _sDate = date;
                            sDateController.text = (_sDate.day.toString()+'/'+_sDate.month.toString()+'/'+_sDate.year.toString());
                            debugPrint(sDateController.text);
                          }

                        });

                      });


                    },
                  ),
                ),



                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    enabled: true,
                    readOnly: true,
                    controller: eDateController,
                    style: textStyle,


                    decoration: InputDecoration(
                        labelText: 'End Date',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate:  _eDate == null ? DateTime.now():_eDate ,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030)
                      ).then((date){
                        setState(() {
                          if(date!=null){
                            _eDate = date;
                            eDateController.text = (_eDate.day.toString()+'/'+_eDate.month.toString()+'/'+_eDate.year.toString());
                          }
                        });

                      });


                    },
                  ),
                ),






                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                            });
                          },
                        ),
                      ),

                      Container(width: 5.0,),

                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ));



  }

}










