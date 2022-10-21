import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;
import 'package:flutter_chess_board/flutter_chess_board.dart';

class AnalysisBoard extends StatefulWidget {
  const AnalysisBoard({Key? key}) : super(key: key);

  @override
  _AnalysisBoardState createState() => _AnalysisBoardState();
}

class _AnalysisBoardState extends State<AnalysisBoard> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ui.Color.fromRGBO(235, 238, 255, 1.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: TopappbarWidget(),
              ),
              Expanded(
                  flex: 8,
                  child: ChessBoard(
                    controller: controller,
                    boardColor: BoardColor.green,
                    boardOrientation: PlayerColor.white,
                  )),
              Expanded(flex: 4, child: AnswersWidget())
            ],
          ),
        ));
  }
}

class TopappbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator TopappbarWidget - FRAME - VERTICAL
    return Container(
      decoration: BoxDecoration(
        color: ui.Color.fromRGBO(235, 238, 255, 1.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: ui.Color.fromRGBO(235, 238, 255, 1.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ui.Color.fromRGBO(73, 69, 79, 1),
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(48, 48)),
                              ))),
                      Center(
                        child: Icon(
                          Icons.clear_all,
                          //color: ui.Color.fromRGBO(80, 87, 254, 1),
                        ),
                      ),
                    ])),
                SizedBox(width: 255),
                Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ui.Color.fromRGBO(73, 69, 79, 1),
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(48, 48)),
                              ))),
                      Center(
                        child: Icon(
                          Icons.history,
                          //color: ui.Color.fromRGBO(80, 87, 254, 1),
                        ),
                      ),
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnswersWidget extends StatefulWidget {
  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AnswersWidget - FRAME - VERTICAL

    return Container(
      decoration: BoxDecoration(
        color: ui.Color.fromRGBO(235, 238, 255, 1.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: 400,
              height: 24,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 20,
                    child: Text(
                      'Movimientos anteriores',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ui.Color.fromRGBO(29, 25, 43, 1),
                          fontFamily: 'Inter',
                          fontSize: 17,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.411764705882353),
                    )),
                Positioned(
                    top: 2,
                    left: 328.45556640625,
                    child: Text(
                      'Ver todo',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: ui.Color.fromRGBO(73, 69, 79, 1),
                          fontFamily: 'Inter',
                          fontSize: 13,
                          letterSpacing: 0.20000000298023224,
                          fontWeight: FontWeight.normal,
                          height: 1.6923076923076923),
                    )),
              ])),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border.all(
                color: ui.Color.fromRGBO(80, 87, 254, 1),
                width: 2,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Caballo',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
                SizedBox(width: 16),
                Text(
                  'Nf3',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
                SizedBox(width: 16),
                Text(
                  '+36',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(29, 25, 43, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border.all(
                color: ui.Color.fromRGBO(73, 69, 79, 1),
                width: 2,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Pieza',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(73, 69, 79, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
                SizedBox(width: 16),
                Text(
                  'Movimiento',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(73, 69, 79, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
                SizedBox(width: 16),
                Text(
                  'Puntos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ui.Color.fromRGBO(73, 69, 79, 1),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1.625),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
