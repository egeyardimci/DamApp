import 'package:agaol/quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Quotes extends StatefulWidget {
  Quotes({super.key});
  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  bool load = false;
  List myQuotes = [new quote("Loading...","Loading..."),new quote("Loading...","Loading..."),
    new quote("Loading...","Loading...")];

  @override
  void initState(){
    getQuotesFromServer();
  }

  void getQuotesFromServer() async{

    var url =
    Uri.https('api.quotable.io','/quotes/random', {'limit': '3'});

    Response response = await get(url);
    List data = jsonDecode(response.body);

    myQuotes.clear();

    for(var i in data){
      myQuotes.add(new quote(i["author"], i["content"]));
    }
    setState(() {
      load = true;
    });
  }

  void deleteQuote(q){
    setState(() {
      myQuotes.remove(q);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: myQuotes.map((q){
        return QuoteBox(q,deleteQuote);
      }).toList(),
    );
  }
}

class QuoteBox extends StatelessWidget {
  final quote q;
  Function deleteQuote;

  QuoteBox(this.q,this.deleteQuote);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            Text("Author: ${q.author}"),
            Text("Content: ${q.content}"),
            ElevatedButton(onPressed: (){
              deleteQuote(q);
            }, child: Text("Delete"))
          ],
        ),
      ),
    );
  }
}