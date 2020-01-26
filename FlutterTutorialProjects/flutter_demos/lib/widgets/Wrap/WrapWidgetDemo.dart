import 'package:flutter/material.dart';

class WrapWidgetDemo extends StatefulWidget {
  //
  final String title = 'Wrap Widget, Chips Demo';

  @override
  State<StatefulWidget> createState() => _WrapWidgetDemoState();
}

class _WrapWidgetDemoState extends State<WrapWidgetDemo> {
  //

  GlobalKey<ScaffoldState> _key;
  List<String> _dynamicChips;
  bool _isSelected;
  List<Company> _companies;
  List<String> _filters;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    _isSelected = false;
    _filters = <String>[];
    _companies = <Company>[
      const Company('Google'),
      const Company('Apple'),
      const Company('Microsoft'),
      const Company('Sony'),
      const Company('Amazon'),
    ];
    _dynamicChips = ['Health', 'Food', 'Nature'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: rowChips(),
          ),
          Divider(),
          wrapWidget(),
          Divider(),
          dynamicChips(),
          Divider(),
          actionChips(),
          Divider(),
          inputChips(),
          Divider(),
          Wrap(
            children: companyWidgets.toList(),
          ),
          Text('Selected: ${_filters.join(', ')}'),
        ],
      ),
    );
  }

  rowChips() {
    return Row(
      children: <Widget>[
        chipForRow('Health', Color(0xFFff8a65)),
        chipForRow('Food', Color(0xFF4fc3f7)),
        chipForRow('Lifestyle', Color(0xFF9575cd)),
        chipForRow('Sports', Color(0xFF4db6ac)),
        chipForRow('Nature', Color(0xFF5cda65)),
      ],
    );
  }

  wrapWidget() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        chip('Health', Color(0xFFff8a65)),
        chip('Food', Color(0xFF4fc3f7)),
        chip('Lifestyle', Color(0xFF9575cd)),
        chip('Sports', Color(0xFF4db6ac)),
        chip('Nature', Color(0xFF5cda65)),
      ],
    );
  }

  dynamicChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(_dynamicChips.length, (int index) {
        return Chip(
          label: Text(_dynamicChips[index]),
          onDeleted: () {
            setState(() {
              _dynamicChips.removeAt(index);
            });
          },
        );
      }),
    );
  }

  Widget inputChips() {
    return InputChip(
      padding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade600,
        child: Text('JW'),
      ),
      label: Text('James Watson'),
      selected: _isSelected,
      selectedColor: Colors.green,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
      // onPressed: () {
      //   //
      // },
      onDeleted: () {
        //
      },
    );
  }

  Widget actionChips() {
    return ActionChip(
      elevation: 6.0,
      padding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.green[60],
        child: Icon(Icons.call),
      ),
      label: Text('Call'),
      onPressed: () {
        _key.currentState.showSnackBar(SnackBar(
          content: Text('Calling...'),
        ));
      },
      backgroundColor: Colors.white,
      shape: StadiumBorder(
          side: BorderSide(
        width: 1,
        color: Colors.blueAccent,
      )),
    );
  }

  Iterable<Widget> get companyWidgets sync* {
    for (Company company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text(company.name[0].toUpperCase()),
          ),
          label: Text(company.name),
          selected: _filters.contains(company.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
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

  Widget chip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade600,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }

  Widget chipForRow(String label, Color color) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Chip(
        labelPadding: EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade600,
          child: Text(label[0].toUpperCase()),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(6.0),
      ),
    );
  }
}

class Company {
  const Company(this.name);
  final String name;
}
