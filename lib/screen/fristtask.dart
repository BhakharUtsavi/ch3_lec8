import 'package:flutter/material.dart';

class FristTask extends StatefulWidget {
  const FristTask({super.key});

  @override
  State<FristTask> createState() => _FristTaskState();
}

class _FristTaskState extends State<FristTask> {

  final List<TextEditingController> _controllers = [];
  final List<GlobalKey<FormState>> _formKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic TextField Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _controllers.map((controller) {
                  int index = _controllers.indexOf(controller);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKeys[index],
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Input ${index + 1}',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _addTextField,
                child: Text('Add TextField'),
              ),
              ElevatedButton(
                onPressed: _removeTextField,
                child: Text('Remove TextField'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
      _formKeys.add(GlobalKey<FormState>());
    });
  }

  void _removeTextField() {
    setState(() {
      if (_controllers.isNotEmpty) {
        _controllers.removeLast();
        _formKeys.removeLast();
      }
    });
  }

  void _submitForm() {
    bool allValid = true;
    for (var key in _formKeys) {
      if (!key.currentState!.validate()) {
        allValid = false;
      }
    }

    if (allValid) {
      List<String> inputData = _controllers.map((controller) => controller.text).toList();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Collected Data: ${inputData.join(', ')}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }
}
