import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() =>_HomeState();
}



class _HomeState extends State<Home> {

  String _userToDo='';
  List todoList = [];

  @override
  void initState() {
    super.initState();

      todoList.addAll(['Дописать приложение','попробовать вставить чвои функции','сгореть так как не получилось)','лечь спат']);
  }

  void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text('Меню '),
            backgroundColor: Colors.deepOrange,),
          body: Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
                  child: Text('На главную')),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text('Мое приложение')
            ],
          ),

        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _menuOpen,
            icon: Icon(Icons.menu_open_outlined),)
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext contex, int index){
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(
                        Icons.delete
                    ),
                    color: Colors.deepOrange,
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),),
                ),
              onDismissed: (direction){
                  //if(direction == DismissDirection.endToStart)
                  setState(() {
                    todoList.removeAt(index);
                  });
              },

            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                },
                    child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,

        )

      ),
    );
  }
}
