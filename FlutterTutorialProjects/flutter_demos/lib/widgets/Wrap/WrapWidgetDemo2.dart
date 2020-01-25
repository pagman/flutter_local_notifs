import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  //
  final String title = "Wrap Widget Demo";

  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  //
  GlobalKey<ScaffoldState> key = GlobalKey();
  int _value = 1;
  bool isSelected = false;
  List<String> _chipsToDelete = ['Health', 'Food', 'Nature'];

  final List<Companies> _companies = <Companies>[
    const Companies('Google'),
    const Companies('Apple'),
    const Companies('Microsoft'),
    const Companies('Sony'),
  ];

  List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            rowChips(),
            Divider(),
            wrapWidget(),
            Divider(),
            chips2(),
            Divider(),
            choiceChip(),
            Divider(),
            actionChips(),
            Divider(),
            inputChip(),
            Divider(),
            Wrap(
              children: actorWidgets.toList(),
            ),
            Text('Selected: ${_filters.join(', ')}'),
          ],
        ),
      ),
    );
  }

  // https://www.youtube.com/watch?v=TF-TBsgIErY
  // Filter chips use tags or descriptive words as a way to filter content.
  Iterable<Widget> get actorWidgets sync* {
    for (Companies company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(child: Text(company.name[0].toUpperCase())),
          label: Text(company.name),
          selected: _filters.contains(company.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(company.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == company.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  rowChips() {
    return Row(
      children: <Widget>[
        chipForRow("Food", Color(0xFF4fc3f7)),
        chipForRow("Lifestyle", Color(0xFFffb74d)),
        chipForRow("Health", Color(0xFFff8a65)),
        chipForRow("Sports", Color(0xFF9575cd)),
        chipForRow("Nature", Color(0xFF4db6ac)),
      ],
    );
  }

  wrapWidget() {
    return Wrap(
      spacing: 10.0, // gap between adjacent chips
      runSpacing: 10.0, // gap between lines
      children: <Widget>[
        chip("Food", Color(0xFF4fc3f7)),
        chip("Lifestyle", Color(0xFFffb74d)),
        chip("Health", Color(0xFFff8a65)),
        chip("Sports", Color(0xFF9575cd)),
        chip("Nature", Color(0xFF4db6ac)),
      ],
    );
  }

  // Action chips are a set of options which trigger an action related to primary content.
  // Action chips should appear dynamically and contextually in a UI.
  Widget actionChips() {
    return ActionChip(
      elevation: 6,
      padding: EdgeInsets.all(10.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.green[50],
        child: Icon(Icons.call),
      ),
      label: Text('Call'),
      onPressed: () {
        key.currentState.showSnackBar(
          SnackBar(
            content: Text('Calling...'),
          ),
        );
      },
      backgroundColor: Colors.white,
      shape: StadiumBorder(
        side: BorderSide(
          width: 1,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  // allows a single selection from a set of options.
  Widget choiceChip() {
    return Wrap(
      spacing: 6.0,
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text('Choice $index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
            selectedColor: Colors.green,
            backgroundColor: Colors.blue,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ).toList(),
    );
  }

  // Chip to represent a person or any other entity
  // gmail
  // has onSelected, onDeleted and onPressed
  Widget inputChip() {
    return InputChip(
      padding: EdgeInsets.all(10.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade500,
        child: Text('JW'),
      ),
      label: Text('John Watson'),
      selected: isSelected,
      selectedColor: Colors.green,
      onSelected: (bool val) {
        print("selected");
        setState(() {
          isSelected = val;
        });
      },
      // can't use onPressed and onSelected simultaneously.
      // onPressed: () {
      //   print('Hello, how are you?');
      // },
      onDeleted: () {
        //
      },
    );
  }

  // Chips are compact elements that represent an attribute,
  // text, entity, or action.
  // this can be deleted.
  Widget chips2() {
    return Wrap(
      spacing: 6.0,
      children: List<Widget>.generate(
        _chipsToDelete.length,
        (int index) {
          return Chip(
            label: Text(_chipsToDelete[index]),
            onDeleted: () {
              setState(() {
                _chipsToDelete.removeAt(index);
              });
            },
          );
        },
      ).toList(),
    );
  }

  // Chips are compact elements that represent an attribute,
  // text, entity, or action.
  // this can be deleted.
  Widget chip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text('AB'),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6,
      shadowColor: Colors.grey[50],
      padding: EdgeInsets.all(4),
    );
  }

  Widget chipForRow(String label, Color color) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Chip(
        labelPadding: EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('AB'),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 6,
        shadowColor: Colors.grey[50],
        padding: EdgeInsets.all(4),
      ),
    );
  }
}

class Companies {
  const Companies(this.name);
  final String name;
}
