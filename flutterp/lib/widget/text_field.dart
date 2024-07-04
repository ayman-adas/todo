import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/http.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
   HttpController http=Provider.of<HttpController>(context);
    return  Row(
      children: [
      
        TextFormField(
          
          controller: controller,
          showCursor: true,
          onSaved: (newValue) {
            if(newValue=='' ||newValue==null){

            }
            else{
   http.createTodo(newValue, false);
            }
          },
          decoration: const InputDecoration(
            hintText: "What would you like to do",
            hintStyle: TextStyle(fontSize: 12),
 border: OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5))
 ),
 enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5))
),

          ),
        
        ),
        const SizedBox(width: 5,)
        , InkWell(
          onTap: (){
              if(controller.value.text==''){

            }
            else{
   http.createTodo(controller.value.text, false);
            }
          },
          child: const Text('Add New Text',style: TextStyle(fontSize: 16,color: Colors.purple),),
        )
      ],
    );
  }
}