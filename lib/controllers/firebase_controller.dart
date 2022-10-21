import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:proyecto_ui/models/blog_item.dart';
import 'package:proyecto_ui/models/curso.dart';
import 'package:proyecto_ui/models/curso_item.dart';
import '../util/localizer.dart';
import 'package:geolocator/geolocator.dart';

class FirebaseController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref();
  RxList<CursoItem> cursosList = <CursoItem>[].obs;
  RxList<BlogItem> blogsList = <BlogItem>[].obs;
  RxList<CursoItem> cursosListByRoom = <CursoItem>[].obs;


  Future<void> getCoursesListByRoom(String room) async {
    try {
      cursosListByRoom.clear();
      final snapshot = await databaseRef
          .child('cursos')
          .orderByChild('room')
          .equalTo(room)
          .get();
      //final snapshot = await databaseRef.child('cursos').get();
      List<CursoItem> cursos = [];

      for (var element in snapshot.children) {
        CursoItem curso = CursoItem(
            0,
            element.child('desc').value as String,
            element.child('name').value as String,
            element.child('room').value as String,
            element.child('teacher_id').value as String,
            element.child('time').value != null
              ? element.child('time').value as String
              : "",
            element.child('video_url').value as String);

        cursos.add(curso);
      }

      cursosListByRoom.addAll(cursos);
      print(cursosListByRoom);
      return Future.value();

      cursosList.clear();
      cursosList.addAll(cursos);
      print(cursosList);
      return Future.value();
    } catch (error) {
      //print("LLega aca error: "+ error.toString());
      return Future.error(error);
    }
  }

  Future<void> getCoursesListByTeacherId(String id) async {
    try {
      //final snapshot = await databaseRef.child('cursos').orderByChild("teacher_id").equalTo(id).get();
      final snapshot = await databaseRef.child('cursos').get();
      List<CursoItem> cursos = [];

      for (var element in snapshot.children) {
        CursoItem curso = CursoItem(
            0,
            element.child('desc').value as String,
            element.child('name').value as String,
            element.child('room').value as String,
            element.child('teacher_id').value as String,
            element.child('time').value != null
              ? element.child('time').value as String
              : "",
            element.child('video_url').value as String);

        cursos.add(curso);
      }

      cursosList.clear();
      cursosList.addAll(cursos);
      print(cursosList);
      return Future.value();
    } catch (error) {
      //print("LLega aca error: "+ error.toString());
      return Future.error(error);
    }
  }

  Future<void> getblogsListByTeacherId(String id) async {
    try {
      //final snapshot = await databaseRef.child('cursos').orderByChild("teacher_id").equalTo(id).get();
      final snapshot = await databaseRef.child('blogs').get();
      List<BlogItem> blogs = [];

      for (var element in snapshot.children) {
        print(element.value);
        BlogItem blog = BlogItem(
            null,
            element.child('titulo').value as String,
            element.child('auth').value as String,
            element.child('date').value as String,
            element.child('desc').value as String,
            element.child('userId').value as String);

        blogs.add(blog);
      }

      blogsList.clear();
      blogsList.addAll(blogs);
      print(blogsList);
      return Future.value();
    } catch (error) {
      print("LLega aca error: " + error.toString());
      return Future.error(error);
    }
  }

  Future<void> addCourse(Map<String, dynamic> curso) async {
    try {
      await databaseRef.child('cursos').push().set(curso);
      print('Publicar curso: Exitoso');
      return Future.value();
    } catch (error) {
      print("LLega aca error: " + error.toString());
      return Future.error(error);
    }
  }

  Future<void> addBlog(Map<String, dynamic> blog) async {
    print("LLega 1");
    try {
      //final snapshot = await databaseRef.child('cursos').orderByChild("teacher_id").equalTo(id).get();

      //Map<String, String> curso = {'titulo': titulo, 'desc': desc, 'room': room};

      await databaseRef.child('blogs').push().set(blog);
      print('Publicar blog: Exitoso');
      return Future.value();
    } catch (error) {
      print("LLega aca error: " + error.toString());
      return Future.error(error);
    }
  }

  Future<void> updatePosition(Map<String, dynamic> position) async {
    try {
      await databaseRef.child('posiciones').child(position["uid"]).set(position);
      print("publicar posicion exitoso");
    } catch (error) {
      print("Posicion no publicada: " + error.toString());
      return Future.error(error);
    }
  }

  Future<List<Map<String, dynamic>>> getAllPositions() async {
    try {
      //List<Map<String, dynamic>> posiciones = List.empty(growable: true);
      List<Map<String, dynamic>> posiciones = [];
      print("acaca1");
      var snapshot = await databaseRef.child('posiciones').get();
      print("Snapshot");
      print(snapshot.value);
      for (var element in snapshot.children) {
        posiciones.add({
          "longitude": element.child("longitude").value,// as double,
          "latitude": element.child("latitude").value,// as double,
          "uid": element.child("uid").value, // as String
          "userName": element.child("userName").value,
        });
      }

      return Future.value(posiciones);
    } catch (error) {
      print("Imposible recuperar posiciones de la base de datos: " +
          error.toString());
      return Future.error(new Map());
    }
  }

  Future<List<Map<String, dynamic>>> getAllPositionsWithinDistance(
      int meters) async {
    Position currentPosition = await determinePosition();
    Map<String, dynamic> currentPositionMap = {
      "longitude": currentPosition.longitude,
      "latitude": currentPosition.latitude
    };
    List<Map<String, dynamic>> posiciones = await getAllPositions();
    List<Map<String, dynamic>> posicionesOk = List.empty(growable: true);

    for (Map<String, dynamic> item in posiciones) {
      if (calculateDistance(currentPositionMap, item) < meters) {
        posicionesOk.add(item);
      }
    }
    return posicionesOk;
  }
}
