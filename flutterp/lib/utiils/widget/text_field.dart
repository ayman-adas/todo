import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/http.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    HttpController https = Provider.of<HttpController>(context, listen: true);
    return Row(children: [
      SizedBox(
        width: 200,
        child: TextFormField(
          controller: controller,
          showCursor: true,
          onSaved: (newValue) async {
            await https.createTodo(newValue ?? '', 'false',DateTime.now().millisecondsSinceEpoch);
          },
          decoration: const InputDecoration(
            hintText: "What would you like to do",
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      InkWell(
        onTap: () async {
          await https.createTodo(controller.value.text, 'false',DateTime.now().microsecondsSinceEpoch);
        },
        child: const Text(
          'Add New Text',
          style:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 230, 255, 4)),
        ),
      )
    ]);
  }
}
