

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:to_do_list/databasehelper.dart';

// class AllTodosPage extends StatefulWidget {
//   @override
//   _AllTodosPageState createState() => _AllTodosPageState();
// }

// class _AllTodosPageState extends State<AllTodosPage> {
//   DatabaseHelper dbHelper = DatabaseHelper();
//   late List<Map<String, dynamic>> todosList;

//   @override
//   void initState() {
//     super.initState();
//     _loadTodos();
//   }

//   void _loadTodos() async {
//     List<Map<String, dynamic>> todos = await dbHelper.getTodos();
//     setState(() {
//       todosList = todos;
//     });
//   }

//  @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//        backgroundColor: Color.fromARGB(255, 9, 198, 198),
//       toolbarHeight: 90,
//       elevation: 2,
//       title: Center(
//         child: Text('T O D O s  L I S T',
//          style: TextStyle(
//               fontSize: 40,
//               color: Color.fromARGB(255, 18, 19, 18),
//               fontWeight: FontWeight.bold,)
//             ),
//       ),
//     ),
//     body: SingleChildScrollView(
//       child: Column(
//         children: [
//           for (var todo in todosList)
//             // Center(
//                Card(
//                 margin: EdgeInsets.all(8.0),
//                 child: Center(
//                   child: 
//                       ListTile(
//                         title:
//                             Text(todo['todoText'] ?? '',
//                             style:  TextStyle(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             ),
                          
//                         subtitle: 
//                             Text(todo['isDone'] == 1 ? 'COMPLETED' : 'NOT COMPLETED',
//                             style:  TextStyle(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w200,
//                             ),
                            
//                             ),
                          
//                         // ),
//                       ),
//                     // ],
//                   // ),
//                 // ),
//               ),
//             ),
//         ],
//       ),
//     ),
//   );
// }

// }



import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:to_do_list/databasehelper.dart';

class AllTodosPage extends StatefulWidget {
  @override
  _AllTodosPageState createState() => _AllTodosPageState();
}

class _AllTodosPageState extends State<AllTodosPage> {
  DatabaseHelper dbHelper = DatabaseHelper();
  late List<Map<String, dynamic>> todosList = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    List<Map<String, dynamic>> todos = await dbHelper.getTodos();
    setState(() {
      todosList = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 198, 198),
        toolbarHeight: 90,
        elevation: 2,
        title: Center(
          child: Text(
            'TODO  LIST',
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 18, 19, 18),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var todo in todosList)
              Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    todo['todoText'] ?? '',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    todo['isDone'] == 1 ? 'COMPLETED' : 'NOT COMPLETED',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
