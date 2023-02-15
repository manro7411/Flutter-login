import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Login';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(title: const Text(appTitle)),
          body: const MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  var _name;
  final _namefinal = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namefinal.addListener(() {});
  }

  // ignore: unused_element
  void _updatename(val) {
    setState(() {
      _name = _namefinal.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
                controller: _namefinal,
                decoration: const InputDecoration(labelText: 'Enter your Name'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                          .hasMatch(value)) {
                    return "Enter your name";
                  } else {
                    return null;
                  }
                  ;
                }),
          ),
          Text("${_namefinal.text}"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Enter your Student ID'),
                maxLength: 11,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[+*[()]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                          .hasMatch(value)) {
                    return "Enter your Student ID";
                  } else {
                    return null;
                  }
                  ;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Enter your Email'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Enter valid Email";
                  } else {
                    return null;
                  }
                  ;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Process Complete')),
                    );
                  }
                },
                child: const Align(
                    alignment: Alignment.center,
                    // ignore: unnecessary_const
                    child: const Text("Submit"))),
          ),
        ]));
  }
}
