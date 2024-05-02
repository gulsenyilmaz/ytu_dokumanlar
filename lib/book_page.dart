
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class BookPage extends StatefulWidget {

  const BookPage({
    super.key, 
    required this.content,
  });

  final List content;

  @override
  State<BookPage> createState() => _BookPageState();
}



class _BookPageState extends State<BookPage> {  

  final _controller = GlobalKey<PageFlipWidgetState>();
  int currentPageIndex = 0;



  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var subList = widget.content[0]["sub_list"];
  
    print("BookPage build!");
    return Center(
      
      child: Stack(
       
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top:22.0, left:9, right:40), 
            
            child:PageFlipWidget(
                  key: _controller,
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  
                  lastPage: Container(color: const Color.fromARGB(0, 255, 255, 255), child: const Center(child: Text('Last Page!'))),
                  children: subList.map<Widget>((item) {
                      print(item["title"]);
                      print("--------------------------------------");
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width:200,
                            height:250,
                            //padding: const EdgeInsets.all(50),
                            alignment: AlignmentDirectional.topStart,
                            color: const Color.fromARGB(0, 255, 153, 0),
                            child: Image.asset(item["path"], fit: BoxFit.fitWidth,),
                          );
                        },
                      );
                    }).toList(),
                ),
          ),
          
         
        ]
      ),
    );
  }
}



