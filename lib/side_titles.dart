import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

int hexToInteger(String hex) => int.parse(hex, radix: 16);

class SideTitles extends StatefulWidget {
  const SideTitles({
    super.key,
    required this.content,
    required this.parentContent,
  });

  
  final List content;
  final List parentContent;

  @override
  State<SideTitles> createState() => _SideTitlesState();

  
}

class _SideTitlesState extends State<SideTitles> {
  final scrollDirection = Axis.vertical;
  late AutoScrollController controller;

 

  @override
  void initState() {
    super.initState();
    
   
    print("initstate");
    
  }

  

  @override
  Widget build(BuildContext context) {

    var subList = widget.parentContent;
    var selectedItemIndex =  widget.parentContent.indexOf(widget.content[0]);
    print(widget.parentContent);
    print("--------------------------------------");
    print(widget.content);

    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection,
        initialScrollOffset: selectedItemIndex>5?700:0);

    return Padding(
                padding: const EdgeInsets.only(left:40.0, right:80.0, top:40, bottom:30),
               
                child: GridView.count(
                        scrollDirection: scrollDirection,
                        controller: controller,
                        primary: false,
                        padding: const EdgeInsets.only(top:5),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 17/20,
                        children: subList.map<Widget>((item) {
                          var itemIndex = subList.indexOf(item);
                          
                          print(item["title"]);
                          print(itemIndex);
                          print(selectedItemIndex);
                          print("--------------------------------------");
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                
                                alignment: AlignmentDirectional.topStart,
                                
                                color:selectedItemIndex==itemIndex?Color(hexToInteger(item["color"])):Color.fromARGB(255, 155, 148, 139),
                                child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                                    splashColor: Color.fromARGB(125, 225, 214, 201),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PageTemplate(content:[item], parentContent:widget.parentContent),
                                                            ),
                                                      );
                                                    },
                                                    child: Ink(
                                                              child:Container(
                                                                //height: 300,
                                                                //width: 280,
                                                                padding: const EdgeInsets.all(10),
                                                                alignment: Alignment.bottomLeft,
                                                                child:Text(item["title"],
                                                                          textAlign: TextAlign.start,
                                                                          maxLines: 3,
                                                                          style: TextStyle(fontWeight: FontWeight.w600, 
                                                                                          color: Color.fromARGB(255, 255, 255, 255),
                                                                                          fontSize:15, 
                                                                                          height: 1.2,
                                                                                          fontFamily: 'DrukTextHeavy'),),
                                                                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                  );
  }
}

