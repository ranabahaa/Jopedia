import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';
class notificationTry extends StatefulWidget {
  const notificationTry({Key? key}) : super(key: key);

  @override
  State<notificationTry> createState() => _notificationTryState();
}

class _notificationTryState extends State<notificationTry> {
  void initState() {
    super.initState();
  }
  int notificationNumber=4;
  var color = Color(0xff50B3CF);
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';
    return Scaffold(
      backgroundColor: Color(0xffF6F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xffF6F9FA),
        elevation: 0.0,
        titleSpacing: 20.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: color,
          ),
        ),

      ),
      body:  ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
