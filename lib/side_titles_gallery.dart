
import 'package:flutter/material.dart';
import 'book_page.dart';
import 'side_titles.dart';

class SideTitlesGallery extends StatelessWidget {
  const SideTitlesGallery({
    super.key,
    required this.content,
    required this.parentContent,
  });
  final List content;
  final List parentContent;

  @override
  Widget build(BuildContext context) {
    double sproportion = 0.4;
    return Stack(
     
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*sproportion,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top:40, left:9),
                  alignment: Alignment.topCenter,
                  child:Text(content[0]["title"],
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.w600, 
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            fontSize:22, 
                                            height: 1.2,
                                            fontFamily: 'DrukTextHeavy'),),
                                        ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.37,
                  height: MediaQuery.of(context).size.width*0.37*4/3,
                  child: BookPage(content:content),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width*sproportion,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*sproportion,
          child: SideTitles(content:content, parentContent:parentContent)
        ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        //minimumSize:Size(60,60),
                        shape: CircleBorder(),
                        side: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 255, 255, 255)
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: Icon(
                                Icons.home,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 40.0,
                              ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  //minimumSize:Size(60,60),
                                  shape: CircleBorder(),
                                  side: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                          Icons.arrow_back,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          size: 40.0,
                                        ),
                    ),
               
                ],
              ),
        ),
      ],
    );
  }
}