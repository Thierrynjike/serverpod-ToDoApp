import 'package:flutter/material.dart';
import 'package:talkpod_client/talkpod_client.dart';

var client = Client('http://localhost:8080/');
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'RobotoMono',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
        title: 'ToDo App',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String description = "This is a generic description for all tasks";
  var myTask = Task(name: '', description: '', assignedTo: '');
  List<dynamic> _tasks = [];
  String? _ltd = "";
  Color color = Colors.amber;
  int _action = 0;
  int _taskInd = -1;
  final _formkey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    getTasks();
  }

  Widget texWithStyle(String texte,
      {fontstyle = FontStyle.normal,
      fontweight = FontWeight.normal,
      fontsize = 15.0,
      color = Colors.black}) {
    return Text(
      texte,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
        fontStyle: fontstyle,
      ),
    );
  }

  String _taskdisp(Task task) {
    String out = "Informations de la tâche \n";
    out += "---------------------------------------\n";

    out +=
        "Nom: ${task.name}\ndescription: ${task.description}\ncreation date: ${task.creationDate}\nResponsable: ${task.assignedTo}\n";

    return out;
  }

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.amber;
      }
      return Colors.amberAccent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
/*         leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/images.jpeg"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55.0),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
        ), */
      ),
      drawer: Drawer(
        backgroundColor: color,
        elevation: 10.0,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/images.jpeg"),
              Container(
                width: 10.0,
              ),
              texWithStyle('Welcome to your TODO App',
                  fontsize: 50.0, color: color, fontweight: FontWeight.bold),
            ],
          ),
          Container(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _action = 1;
                  });
                },
                child: texWithStyle("New task"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor),
                  elevation: MaterialStateProperty.all(15.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _action = 2;
                  });
                },
                child: texWithStyle("Delete"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor),
                  elevation: MaterialStateProperty.all(15.0),
                ),
              ),
            ],
          ),
          Container(
            height: 20.0,
          ),
          actiondb(_action),
          _action == 0
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: _taskdb,
                    child: const Text('Submit'),
                  ),
                ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: color),
                  ),
                  child: _taskInd == -1
                      ? texWithStyle(
                          "So Empty! create new tasks to see them here!")
                      : ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: _tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: Container(
                                height: 50,
                                color: Colors.amber[100],
                                child: texWithStyle('${_tasks[index].name}'),
                              ),
                              onTap: () {
                                setState(() {
                                  _taskInd = index;
                                });
                              },
                            );
                          }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: _taskInd == -1
                      ? texWithStyle("Tap on a task to see more here!")
                      : texWithStyle(_taskdisp(_tasks[_taskInd])),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget actiondb(int cas) {
    //String name, assignto;
    Widget w2 = Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(color: color),
            ),
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Whose task should be deleted ?'),
                validator: (value) {
                  validation(value);
                  setState(() {
                    _ltd = value;
                  });
                }),
          ),
        ],
      ),
    );

    Widget w1 = Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(color: color),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the task name',
              ),
              validator: (value) => validation(value),
              onChanged: (s) {
                setState(() {
                  myTask.name = s;
                });
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(color: color),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Whose task is it?',
              ),
              validator: (value) => validation(value),
              onChanged: (s) {
                setState(() {
                  myTask.assignedTo = s;
                });
              },
            ),
          ),
        ],
      ),
    );
    return cas == 0 ? const SizedBox() : (cas == 1 ? w1 : w2);
  }

  String? validation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    //print(value);
    return null;
  }

  Future<void> getTasks() async {
    Tasks result = await client.task.findall();
    setState(() {
      _tasks = result.list;
    });
  }

  void _taskdb() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formkey.currentState!.validate()) {
      setState(() {
        myTask.description = description;
      });

      try {
        if (_action == 1) {
          print(myTask);
          final res = await client.task.add(myTask);
          print(res);
        }
        if (_action == 2) {
          final res = await client.task.deletelike('$_ltd');
          print(res);
        }

        await this.getTasks();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Database action Done!')),
        );

      } catch (e) {
        print('$e');
      }
    } else {
      print("There is an error in the form");
    }
  }
}