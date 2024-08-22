import 'package:ch3_lec8/global/globalclass.dart';
import 'package:flutter/material.dart';

class ThirdTask extends StatefulWidget {
  const ThirdTask({super.key});

  @override
  State<ThirdTask> createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {

  List<TextFieldGroup> _groups = [];

  void _addGroup() {
    setState(() {
      _groups.add(TextFieldGroup(
        header: 'Group ${_groups.length + 1}',
        controllers: [TextEditingController()],
      ));
    });
  }

  void _removeGroup(int index) {
    setState(() {
      _groups.removeAt(index);
    });
  }

  void _addTextField(int groupIndex) {
    setState(() {
      _groups[groupIndex].controllers.add(TextEditingController());
    });
  }

  void _removeTextField(int groupIndex, int textFieldIndex) {
    setState(() {
      _groups[groupIndex].controllers.removeAt(textFieldIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grouped Text Fields')),
      body: SingleChildScrollView(
        child: Column(
          children: _groups.asMap().entries.map((entry) {
            final groupIndex = entry.key;
            final group = entry.value;
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.header,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...group.controllers.asMap().entries.map((entry) {
                      final textFieldIndex = entry.key;
                      final controller = entry.value;
                      return Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: 'Field ${textFieldIndex + 1}',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _removeTextField(groupIndex, textFieldIndex),
                          ),
                        ],
                      );
                    }).toList(),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _addTextField(groupIndex),
                      child: Text('Add TextField'),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _removeGroup(groupIndex),
                      child: Text('Remove Group'),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGroup,
        child: Icon(Icons.add),
      ),
    );
  }
}
