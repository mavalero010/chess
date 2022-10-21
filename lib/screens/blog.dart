import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/models/blog_item.dart';
import 'package:proyecto_ui/screens/add_blog.dart';
import 'package:proyecto_ui/controllers/firebase_controller.dart';
import 'package:proyecto_ui/screens/blog_post.dart';

class BlogWidget extends StatelessWidget {

  FirebaseController firebaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    firebaseController.getblogsListByTeacherId("0");
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Blog',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            fontFamily: 'Inter',
                            fontSize: 26,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                      ),
                      Text(
                        'Comparte tus conocimientos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            fontFamily: 'Inter',
                            fontSize: 15,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.normal,
                            height: 1.3),
                      ),
                    ],
                  ),
                ),
              ),
    
              InkWell(  
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBlogWidget()),
                    );
                  },
                child: Container(
                width: 48,
                height: 48,
                child: IconButton(
                  icon: const Icon(Icons.post_add),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBlogWidget()),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(73, 69, 79, 1),
                    width: 1,
                  ),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(48, 48)),
                ),
              ),),
    
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Publicaciones',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.bold,
                      height: 1.3),
                ),
              ],
            ),
          ),
       Obx(() =>
         ListView.builder(
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           padding: const EdgeInsets.all(8),             
           itemCount: firebaseController.blogsList.length,
           itemBuilder: (context, index) {
             return _row(firebaseController.blogsList[index], index, context);
           }),
       ),
      ]),
    );
  }

  Widget _row(BlogItem item, int index,  BuildContext context) {
    return _card(item, index, context);
  }

  Widget _card(BlogItem item, int index,  BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => AddBlogPostWidget(item: item)),);
      },
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(73, 69, 79, 1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Stack(fit: StackFit.expand, children: [
                          Image.asset(
                            'assets/images/Ajedrez.png',
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.titulo,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.bold,
                                height: 1.3),
                          ),
                          Text(
                            item.auth,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.normal,
                                height: 1.3),
                          ),
                          Text(
                            item.date,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromRGBO(73, 69, 79, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.normal,
                                height: 1.3),
                          ),
                       
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
