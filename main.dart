import 'package:flutter/material.dart';

//ADD SHARED_PREFERENCE IN PUBSPEC.YAML
class MyHomePage extends StatefulWidget{
    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
   var nameController = TextEditingController();
   var nameValue = "NO name is set";

   static const String KEYNAME = "name";
   //final String;//When to use final? When to use const?

   //prefs.setBool(key, value_to_be_stored_int_this_key)

   @override
   void initState(){
    super.initState();
    getValue();
   }

   @override
   Widget build(BuildContext context){
    return Scaffold(
        //appbar:

        body: Container(
            child:Center(
                child: SizedBox(
                    width: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                            TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    label: Text('Name'),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21)
                                    )
                                )
                            ),
                            SizedBox(height: 11),

                            ElevatedButton(
                                onPressed: () async{
                                    var name = nameController.text.toString();
                                    var prefs = await SharedPreferences.getInstance();

                                    prefs.setString(KEYNAME, name);
                                },
                                child: Text('Save')
                            ),
                            Text(nameValue)
                        ]
                    )
                )
            )
        ) 
    );
   }
}

void getValue() async{
    var prefs = await SharedPreferences.getInstance();
    var getNAME = prefs.getString(KEYNAME);

    //nameValue = getNAME != null ? getNAME.toString() : "No value Saved";
    //or
    nameValue = getNAME ?? "No value Saved";

    setState((){});
}