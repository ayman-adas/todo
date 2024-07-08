// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../controller/http.dart';

// class ViewTaskList extends StatefulWidget {
//   const ViewTaskList({super.key});

//   @override
//   State<ViewTaskList> createState() => _ViewTaskListState();
// }

// class _ViewTaskListState extends State<ViewTaskList> {
//   @override
//   void initState() {

//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: FutureBuilder<List<dynamic>>(
//         future: http.selectTodo(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child:  CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No data found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(snapshot.data![index].toString()),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }