import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tempah_my/ItemDataModel.dart';

class SelectionPage extends StatelessWidget {
  String name, address, phone, email, indate, outdate;

  SelectionPage(
      {required this.name,
      required this.address,
      required this.phone,
      required this.email,
      required this.indate,
      required this.outdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('TEMPAH.MY'),
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              var items = data.data as List<ItemDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Image(
                                image: NetworkImage(
                                    items[index].imageUrl.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child:
                                        Text(items[index].address.toString()),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
        // body: Column(
        //   children: [
        //     Text('name: ${name}'),
        //     Text('name: ${address}'),
        //     Text('name: ${phone}'),
        //     Text('name: ${email}'),
        //     Text('name: ${indate}'),
        //     Text('name: ${outdate}'),
        //   ],
        // ),
        );
  }

  Future<List<ItemDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.LoadString('assets/files/itemList.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ItemDataModel.fromJson(e)).toList();
  }
}
