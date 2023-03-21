import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'int_data.dart';
import 'itemlist.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  String item = '';
  //creating initState() for adding listener to controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      item = _textFieldController.text;
    });
  }
  //disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
  void _submit() {

    Provider.of<ItemData>(context, listen:    false).addItem(int.parse(item));

    Navigator.pop(context);
    _textFieldController.clear();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SecondScreen(),
    ));
  }
  void _remove() {

    Provider.of<ItemData>(context, listen:    false).removeItem(int.parse(item));

    Navigator.pop(context);
    _textFieldController.clear();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SecondScreen(),
    ));
  }
  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new int"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New int"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
    Future<void> _showRemoveTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Remove an int"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Enter index to be removed"),
                onSubmitted: (_) => _remove(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _remove,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Int list app"),
      ),
      body:
      Center(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: _showAddTextDialog, child: Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text(
              'Add an Integer',
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
          ),),
          TextButton(onPressed: _showRemoveTextDialog,
          child: Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text(
              'Remove an integer',
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
          ),),
        ],
      )

      )
    );
  }
}

class SecondScreen extends StatelessWidget {


  // receive data from the FirstScreen as a parameter


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display')),
      body: ItemList()
    );
  }
}