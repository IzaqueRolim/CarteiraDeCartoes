import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstapp/card.dart';
import 'myapp.dart';
import 'card_component.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {

  var name = "Your Name",number="0000 0000 0000 0000",cvc="000",date="00/00";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crie seu cartao"),centerTitle: true,),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardComponent(name: name,date: date,number: number,altura: 200,largura: 340,),
               SizedBox(
                width: 340,
                height: 60,
                child:
                  TextField(
                    decoration: InputDecoration(
                      hintText: "0000 0000 0000 0000",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      setState(() {
                        number=value;
                      });
                    },
                    )
              ),
              SizedBox(
                width: 340,
                height: 60,
                child:
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Your name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.name,
                    onChanged: (value) => {
                        setState((){
                          name=value;
                        })
                    })
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 170,
                      height: 60,
                      child:
                        TextField(
                          decoration: InputDecoration(
                          hintText: "02/10",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                        keyboardType: TextInputType.datetime,
                        onChanged:(value){
                          setState((){
                            date=value;
                          });
                        })
                  ),
                  SizedBox(
                      width: 170,
                      height: 60,
                      child:
                        TextField(
                          decoration: InputDecoration(
                          hintText: "CVC",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                        keyboardType: TextInputType.number,
                        onChanged:(value){
                          setState(() {
                            cvc=value;
                          });
                        }
                        ),
                  )
                ],
              ),
              GestureDetector(onPanUpdate: (details) {
                
                if (details.delta.dx > 0) {
                  setState((){
                    name = "Raquel";
                  });
                }
                
                if (details.delta.dx < 0) {
                  setState((){
                    name = "Izaque";
                  });
                }
              },
              child:Text(name,style:TextStyle(backgroundColor: Colors.blue))),
             MyButton(card: Cartao(nameUser: name, date: date, numberCard: number, cvc: cvc))    
      ]
      ));
  }
}