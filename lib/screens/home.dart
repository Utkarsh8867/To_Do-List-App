
import 'package:flutter/material.dart';
import 'package:to_do_list/tododetailpage.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../databasehelper.dart';

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
  
// }

// class _HomeState extends State<Home> {
//   List<Map<String, dynamic>> todosList = [];
//   List<Map<String, dynamic>> _foundToDo = [];
//   final _todoController = TextEditingController();
//   final dbHelper = DatabaseHelper();
  
//   get todo => todo;
  

//   @override
//   void initState() {
//     _loadTodos();
//     super.initState();
//   }

//   void _loadTodos() async {
//     List<Map<String, dynamic>> todos = await dbHelper.getTodos();
//     setState(() {
//       todosList = todos;
//       _foundToDo = todos;
//     });
//   }

//   void _handleToDoChange(ToDo todo) async {
//     todo.isDone = !todo.isDone;
//     await dbHelper.insertOrUpdate(todo.toMap());
//     _loadTodos();
//   }

//   void _deleteToDoItem(String id) async {
//     await dbHelper.delete(id);
//     _loadTodos();
//   }

//   void _addToDoItem(String toDo) async {
//     Map<String, dynamic> newToDo = {
//       'id': DateTime.now().millisecondsSinceEpoch.toString(),
//       'todoText': toDo,
//       'isDone': 0,
//     };
//     await dbHelper.insertOrUpdate(newToDo);
//     _loadTodos();
//     _todoController.clear();
//   }

//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = todosList;
//     } else {
//       results = todosList
//           .where((item) => item['todoText']
//               .toLowerCase()
//               .contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }

//     setState(() {
//       _foundToDo = results;
//     });
//   }

//   Widget searchBox() {
//     return Container(
      
//       padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
//       decoration: BoxDecoration(
//         color: Colors.amberAccent,
//         //  color: Color.fromARGB(255, 9, 198, 198),

//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextField(
//         onChanged: (value) => _runFilter(value),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           prefixIcon: Icon(
//             Icons.search,
//             size: 20,
//           ),
//           prefixIconConstraints: BoxConstraints(
//             maxHeight: 20,
//             minWidth: 25,
//           ),
//           border: InputBorder.none,
//           hintText: 'Search',
//           // hintTextDirection:Text( style: TextStyle()  Colors.black,) Colors.black,
//         ),
//       ),
//     );
//   }

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: tdBGColor,
//     appBar: _buildAppBar(),
//     body: Stack(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 15,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 30), // Add SizedBox to create space
//               searchBox(),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                         top: 20, // Adjust top margin to create space
//                         bottom: 20,
//                       ),
//                       child: GestureDetector(
//                        onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AllTodosPage()),
//     );
//   },
//                         // child: Center(
//                           child: Text(
//                             'View ToDos',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 118, 20, 13),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         // ),
//                       ),
//                     ),
//                     for (Map<String, dynamic> todo in _foundToDo.reversed)
//                       GestureDetector(
//                         onTap: () {
//                           // Add your onTap logic here
//                           print('Todo tapped: ${todo['todoText']}');
//                         },
//                         child: ToDoItem(
//                           todo: ToDo.fromMap(todo),
//                           onToDoChanged: _handleToDoChange,
//                           onDeleteItem: _deleteToDoItem,
//                         ),
//                       ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(children: [
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     bottom: 20,
//                     right: 20,
//                     left: 20,
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 9, 198, 198),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromARGB(255, 255, 5, 5),
//                         offset: Offset(0.0, 0.0),
//                         blurRadius: 10.0,
//                         spreadRadius: 0.0,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     controller: _todoController,
//                     decoration: InputDecoration(
//                       hintText: 'Add a new todo item',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                   bottom: 20,
//                   right: 20,
//                 ),
//                 child: ElevatedButton(
//                   child: Text(
//                     '+',
//                     style: TextStyle(
//                       fontSize: 40,
//                     ),
//                   ),
//                   onPressed: () {
//                     _addToDoItem(_todoController.text);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(60, 60),
//                     elevation: 10,
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       // backgroundColor: Color.fromARGB(255, 255, 139, 6),
//       backgroundColor: Color.fromARGB(255, 9, 198, 198),
//       toolbarHeight: 90,
//       elevation: 0,
//       title: Center(
//         child: Text(
//           'T O D O  L I S T',
//           style: TextStyle(
//             fontSize: 40,
//             color: Color.fromARGB(255, 18, 19, 18),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {
//             // Add your action here
//           },
//           icon: Icon(Icons.menu),
//         ),
//       ],
//     );
//   }
// }

// class ToDoItem extends StatelessWidget {
//   final ToDo todo;
//   final Function(ToDo) onToDoChanged;
//   final Function(String) onDeleteItem;

//   const ToDoItem({
//     required this.todo,
//     required this.onToDoChanged,
//     required this.onDeleteItem,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         // color: Colors.brown,
//         color: Colors.amber[200],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: EdgeInsets.symmetric(vertical: 5),
//       padding: EdgeInsets.all(10),
//       child: ListTile(
//         leading: Checkbox(
//           value: todo.isDone,
//           onChanged: (value) {
//             onToDoChanged(todo);
//           },
//         ),
//         title: Text(
//           todo.todoText,
//           style: TextStyle(
//             decoration: todo.isDone ? TextDecoration.lineThrough : null,
//             color: const Color.fromARGB(255, 12, 12, 12),
//           ),
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {
//             onDeleteItem(todo.id);
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:to_do_list/tododetailpage.dart';
// import '../model/todo.dart';
// import '../constants/colors.dart';
// import '../databasehelper.dart';

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Map<String, dynamic>> todosList = [];
//   List<Map<String, dynamic>> _foundToDo = [];
//   final _todoController = TextEditingController();
//   final dbHelper = DatabaseHelper();

//   @override
//   void initState() {
//     _loadTodos();
//     super.initState();
//   }

//   void _loadTodos() async {
//     List<Map<String, dynamic>> todos = await dbHelper.getTodos();
//     setState(() {
//       todosList = todos;
//       _foundToDo = todos;
//     });
//   }

//   void _handleToDoChange(Map<String, dynamic> todo) async {
//     todo['isDone'] = !(todo['isDone'] ?? false);
//     await dbHelper.insertOrUpdate(todo);
//     _loadTodos();
//   }

//   void _deleteToDoItem(String id) async {
//     await dbHelper.delete(id);
//     _loadTodos();
//   }

//   void _addToDoItem(String toDo) async {
//     Map<String, dynamic> newToDo = {
//       'id': DateTime.now().millisecondsSinceEpoch.toString(),
//       'todoText': toDo,
//       'isDone': false,
//     };
//     await dbHelper.insertOrUpdate(newToDo);
//     _loadTodos();
//     _todoController.clear();
//   }

//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = todosList;
//     } else {
//       results = todosList
//           .where((item) =>
//               item['todoText'].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }

//     setState(() {
//       _foundToDo = results;
//     });
//   }

//   Widget searchBox() {
//     return Container(
//       padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
//       decoration: BoxDecoration(
//         color: Colors.amberAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextField(
//         onChanged: (value) => _runFilter(value),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           prefixIcon: Icon(
//             Icons.search,
//             size: 20,
//           ),
//           prefixIconConstraints: BoxConstraints(
//             maxHeight: 20,
//             minWidth: 25,
//           ),
//           border: InputBorder.none,
//           hintText: 'Search',
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: tdBGColor,
//       appBar: _buildAppBar(),
//       body: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 15,
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: 30), // Add SizedBox to create space
//                 searchBox(),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: 20, // Adjust top margin to create space
//                           bottom: 20,
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => AllTodosPage()),
//                             );
//                           },
//                           child: Text(
//                             'View ToDos',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 118, 20, 13),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                       for (Map<String, dynamic> todo in _foundToDo.reversed)
//                         GestureDetector(
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text(todo['todoText']),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       onPressed: () {
//                                         _handleToDoChange(todo);
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('Task Completed'),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         _deleteToDoItem(todo['id']);
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('Delete'),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.amber[200],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             margin: EdgeInsets.symmetric(vertical: 5),
//                             padding: EdgeInsets.all(10),
//                             child: ListTile(
//                               leading: Checkbox(
//                                 value: todo['isDone'] == true,
//                                 onChanged: (value) {
//                                   _handleToDoChange(todo);
//                                 },
//                               ),
//                               title: Text(
//                                 todo['todoText'],
//                                 style: TextStyle(
//                                   decoration: todo['isDone'] == true ? TextDecoration.lineThrough : null,
//                                   color: const Color.fromARGB(255, 12, 12, 12),
//                                 ),
//                               ),
//                               trailing: IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () {
//                                   _deleteToDoItem(todo['id']);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       bottom: 20,
//                       right: 20,
//                       left: 20,
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 9, 198, 198),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 255, 5, 5),
//                           offset: Offset(0.0, 0.0),
//                           blurRadius: 10.0,
//                           spreadRadius: 0.0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextField(
//                       controller: _todoController,
//                       decoration: InputDecoration(
//                         hintText: 'Add a new todo item',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     bottom: 20,
//                     right: 20,
//                   ),
//                   child: ElevatedButton(
//                     child: Text(
//                       '+',
//                       style: TextStyle(
//                         fontSize: 40,
//                       ),
//                     ),
//                     onPressed: () {
//                       _addToDoItem(_todoController.text);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(60, 60),
//                       elevation: 10,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Color.fromARGB(255, 9, 198, 198),
//       toolbarHeight: 90,
//       elevation: 0,
//       title: Center(
//         child: Text(
//           'T O D O  L I S T',
//           style: TextStyle(
//             fontSize: 40,
//             color: Color.fromARGB(255, 18, 19, 18),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {
//             // Add your action here
//           },
//           icon: Icon(Icons.menu),
//         ),
//       ],
//     );
//   }
// }


// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Map<String, dynamic>> todosList = [];
//   List<Map<String, dynamic>> _foundToDo = [];
//   final _todoController = TextEditingController();
//   final dbHelper = DatabaseHelper();

//   @override
//   void initState() {
//     _loadTodos();
//     super.initState();
//   }

//   void _loadTodos() async {
//     List<Map<String, dynamic>> todos = await dbHelper.getTodos();
//     setState(() {
//       todosList = todos;
//       _foundToDo = todos;
//     });
//   }

//     void _handleToDoChange(ToDo todo) async {
//     todo.isDone = !todo.isDone;
//     await dbHelper.insertOrUpdate(todo.toMap());
//     _loadTodos();
//   }
  
//   void _deleteToDoItem(String id) async {
//     await dbHelper.delete(id);
//     _loadTodos();
//   }

//   void _addToDoItem(String toDo) async {
//     Map<String, dynamic> newToDo = {
//       'id': DateTime.now().millisecondsSinceEpoch.toString(),
//       'todoText': toDo,
//       'isDone': false,
//     };
//     await dbHelper.insertOrUpdate(newToDo);
//     _loadTodos();
//     _todoController.clear();
//   }

//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = todosList;
//     } else {
//       results = todosList
//           .where((item) =>
//               item['todoText'].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }

//     setState(() {
//       _foundToDo = results;
//     });
//   }

//   Widget searchBox() {
//     return Container(
//       padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
//       decoration: BoxDecoration(
//         color: Colors.amberAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextField(
//         onChanged: (value) => _runFilter(value),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           prefixIcon: Icon(
//             Icons.search,
//             size: 20,
//           ),
//           prefixIconConstraints: BoxConstraints(
//             maxHeight: 20,
//             minWidth: 25,
//           ),
//           border: InputBorder.none,
//           hintText: 'Search',
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: tdBGColor,
//       appBar: _buildAppBar(),
//       body: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 15,
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: 30), // Add SizedBox to create space
//                 searchBox(),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: 20, // Adjust top margin to create space
//                           bottom: 20,
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => AllTodosPage()),
//                             );
//                           },
//                           child: Text(
//                             'View ToDos',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 118, 20, 13),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                       for (Map<String, dynamic> todo in _foundToDo.reversed)
//                         GestureDetector(
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text(todo['todoText']),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       onPressed: () {
//                                         _handleToDoChange(todo as ToDo);
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('Task Completed'),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         _deleteToDoItem(todo['id']);
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('Delete'),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.amber[200],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             margin: EdgeInsets.symmetric(vertical: 5),
//                             padding: EdgeInsets.all(10),
//                             child: ListTile(
//                               title: Text(
//                                 todo['todoText'],
//                                 style: TextStyle(
//                                   decoration: todo['isDone'] == true ? TextDecoration.lineThrough : null,
//                                   color: const Color.fromARGB(255, 12, 12, 12),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       bottom: 20,
//                       right: 20,
//                       left: 20,
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 9, 198, 198),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 255, 5, 5),
//                           offset: Offset(0.0, 0.0),
//                           blurRadius: 10.0,
//                           spreadRadius: 0.0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextField(
//                       controller: _todoController,
//                       decoration: InputDecoration(
//                         hintText: 'Add a new todo item',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     bottom: 20,
//                     right: 20,
//                   ),
//                   child: ElevatedButton(
//                     child: Text(
//                       '+',
//                       style: TextStyle(
//                         fontSize: 40,
//                       ),
//                     ),
//                     onPressed: () {
//                       _addToDoItem(_todoController.text);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(60, 60),
//                       elevation: 10,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Color.fromARGB(255, 9, 198, 198),
//       toolbarHeight: 90,
//       elevation: 0,
//       title: Center(
//         child: Text(
//           'T O D O  L I S T',
//           style: TextStyle(
//             fontSize: 40,
//             color: Color.fromARGB(255, 18, 19, 18),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {
//             // Add your action here
//           },
//           icon: Icon(Icons.menu),
//         ),
//       ],
//     );
//   }
// }

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
    //  theme: ThemeData(fontFamily: "Tilt Neon"),
}

class _HomeState extends State<Home> {
    //  theme: ThemeData(fontFamily: "Tilt Neon"),
  List<Map<String, dynamic>> todosList = [];
  List<Map<String, dynamic>> _foundToDo = [];
  final _todoController = TextEditingController();
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    _loadTodos();
    super.initState();
  }

  void _loadTodos() async {
    List<Map<String, dynamic>> todos = await dbHelper.getTodos();
    setState(() {
      todosList = todos;
      _foundToDo = todos;
    });
  }

  // void _handleToDoChange(Map<String, dynamic> todo) async {
  //   todo['isDone'] = !(todo['isDone'] ?? false);
  //   await dbHelper.insertOrUpdate(todo);
  //   _loadTodos();
  // 
  // }

  void _handleToDoChange(ToDo todo) async {
  todo.isDone = !todo.isDone;
  await dbHelper.insertOrUpdate(todo.toMap());
  _loadTodos();
}

  
  void _deleteToDoItem(String id) async {
    await dbHelper.delete(id);
    _loadTodos();
  }

  void _addToDoItem(String toDo) async {
    Map<String, dynamic> newToDo = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'todoText': toDo,
      'isDone': false,
    };
    await dbHelper.insertOrUpdate(newToDo);
    _loadTodos();
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
              item['todoText'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.amberAccent,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon: Icon(
          Icons.search,
          size: 15,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 15,
          minWidth: 15,
        ),
        border: InputBorder.none,
        hintText: 'Search',
      ),
    ),
  );
}



    // Container(
    //   // theme: ThemeData(fontFamily: "Tilt Neon"),
    //   padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
    //   decoration: BoxDecoration(
    //     color: Colors.amberAccent,
    //     borderRadius: BorderRadius.circular(30),
    //   ),
    //   child: TextField(
    //     onChanged: (value) => _runFilter(value),
    //     decoration: InputDecoration(
    //       contentPadding: EdgeInsets.all(30),
    //       prefixIcon: Icon(
    //         Icons.search,
    //         size: 15,
    //       ),
    //       prefixIconConstraints: BoxConstraints(
    //         maxHeight: 15,
    //         minWidth: 15,
    //       ),
    //       border: InputBorder.none,
    //       hintText: 'Search',
    //     ),
    //   ),
    // );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                SizedBox(height: 15), // Add SizedBox to create space
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20, // Adjust top margin to create space
                          bottom: 20,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AllTodosPage()),
                            );
                          },
                          child: Text(
                            'View ToDos',
                            style: TextStyle(
                              color: Color.fromARGB(255, 118, 20, 13),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      for (Map<String, dynamic> todo in _foundToDo.reversed)
                        GestureDetector(
                          onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(todo['todoText']),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _handleToDoChange(ToDo.fromMap(todo));
              Navigator.of(context).pop();
            },
            child: Text('Task Completed'),
          ),
          TextButton(
            onPressed: () {
              _deleteToDoItem(todo['id']);
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
},

                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(
                                todo['todoText'],
                                style: TextStyle(
                                  decoration: todo['isDone'] == true ? TextDecoration.lineThrough : null,
                                  color: const Color.fromARGB(255, 12, 12, 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 9, 198, 198),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 5, 5),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),


 

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 9, 198, 198),
      toolbarHeight: 90,
      elevation: 0,
      title: Center(
        child: Text(
          'T O D O  L I S T',
          style: TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 18, 19, 18),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       // Add your action here
      //     },
      //     icon: Icon(Icons.menu),
      //   ),
      // ],
    );
  }
}
