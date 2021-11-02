import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  DatePage({Key? key}) : super(key: key);

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
DateTime _selectedDate = DateTime.now();
DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.redAccent,
            ),
              onPressed: (){
                _getDate(context);
              },
              child: Text('Date Picker'),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Date value : '+_dateFormat.format(_selectedDate), 
            style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ),
    );
  }

  _getDate(context) async{
    final _datePick = await showDatePicker(
      context: context, 
      initialDate: _selectedDate, 
      firstDate: _selectedDate.subtract(
        Duration(days: 30),
      ),
      lastDate: DateTime(_selectedDate.year + 1),
      );

      if(_datePick != null){
        setState(() {
          _selectedDate = _datePick;
        });
      }
  }
}