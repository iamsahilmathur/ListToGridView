import 'package:demo/src/models/catalog_model.dart';
import 'package:demo/src/notifiers/notify.dart';
import 'package:demo/src/res/constaints.dart';
import 'package:demo/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  BuildContext context;

  HomePage({this.context});

  Notify notifyState;

  @override
  Widget build(BuildContext context) {
    notifyState = Provider.of<Notify>(context,listen: false);
    return Scaffold(
       appBar:  AppBar(
         centerTitle: true,
         title: Text(AppConstants.homeAppBarTitle,style: TextStyle(color: Colors.black),),
         actions: [
           PopupMenuButton(
                 itemBuilder: (_) => <PopupMenuItem<String>>[
                   new PopupMenuItem<String>(
                       child: const Text("GridView"), value: 'GridView'),
                   new PopupMenuItem<String>(
                       child: const Text('ListView'), value: 'ListView'),
                 ],
                 onSelected: (value) {
                   switch(value){
                     case "GridView":
                       notifyState.switchToGrid();
                       break;
                     case "ListView":
                       notifyState.switchToList();
                       break;
                   }
                 }
             ),

         ],
       ),
       drawer: MyDrawer.mDrawer(context),
       body: MyListView(),
    );
  }


}

class MyListView extends StatefulWidget {

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {

  List<Catalog> itemList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList= listItems();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Notify>(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: model.flag ? ListView.builder(
              itemCount: itemList != null ? itemList.length : 0,
              itemBuilder: (context, index){
                return Card(elevation: 0,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                  child: ListTile(
                    trailing: Icon(Icons.star,color: Colors.amber,),
                    title: Text('${itemList[index].name}'),
                    subtitle: Text('${itemList[index].desc}'),
                    leading: CircleAvatar(child: FlutterLogo()),
                  ),
                );
              }
          ) : GridView.count(crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            shrinkWrap: true,
            children: List.generate(itemList.length, (index) => Padding(
              padding: EdgeInsets.all(12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
                child: GridTile(
                  header: Text(itemList[index].name),
                  child: Padding(padding: EdgeInsets.all(12),child: FlutterLogo()),
                  footer: Text(itemList[index].desc),
                ),
              ),
            )),
          ),
        );
      },
    );
  }

  List<Catalog> listItems(){
      final List<Catalog> itemList= List.generate(16, (index) => Catalog.name(index, "Item= $index", "My Item Description $index"));
      return itemList;
    }
}




