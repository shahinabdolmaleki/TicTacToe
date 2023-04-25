import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> XorOList = ['', '', '', '', '', '', '', '', ''];
  int filledBox = 0;
  bool isTurnO = true;
  bool gameHasaResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          title: Text(
            'TicTacToe',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  gameClear();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            children: [
              getScoreBoard(),
              SizedBox(
                height: 20,
              ),
              getGridView(),
              SizedBox(
                height: 50,
              ),
              getTurn(),
              SizedBox(
                height: 20,
              ),
              getRestart()
            ],
          ),
        ),
      ),
    );
  }

  Widget getRestart() {
    return Visibility(
      visible: gameHasaResult,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.white, width: 1.5)),
          onPressed: () {
            gameHasaResult = false;
            gameClear();
            scoreO = 0;
            scoreX = 0;
            winnerTitle = '';
          },
          child: Text(
            winnerTitle,
            style: TextStyle(
              fontSize: 25,
            ),
          )),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn : O' : 'Turn : X',
      style: TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
    );
  }

  Widget getGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 9,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext, int Index) {
        return GestureDetector(
          onTap: () {
            tapped(Index);
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Center(
              child: Text(
                XorOList[Index],
                style: TextStyle(
                    color: XorOList[Index] == 'X' ? Colors.white : Colors.red,
                    fontSize: 40),
              ),
            ),
          ),
        );
      },
    );
  }

  void tapped(int Index) {
    if (gameHasaResult) {
      return;
    }
    setState(() {
      if (XorOList[Index] != '') {
        return;
      }
      if (isTurnO) {
        XorOList[Index] = 'O';
        filledBox++;
      } else {
        XorOList[Index] = 'X';
        filledBox++;
      }
      isTurnO = !isTurnO;
      checkWinner();
    });
  }

//check who is winner
  void checkWinner() {
    if (XorOList[3] == XorOList[4] &&
        XorOList[4] == XorOList[5] &&
        XorOList[3] != '') {
      setResult(XorOList[3], 'winner is : ' + XorOList[3]);
      return;
    }
    if (XorOList[0] == XorOList[1] &&
        XorOList[1] == XorOList[2] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'winner is : ' + XorOList[0]);
      return;
    }
    if (XorOList[6] == XorOList[7] &&
        XorOList[7] == XorOList[8] &&
        XorOList[6] != '') {
      setResult(XorOList[6], 'winner is : ' + XorOList[6]);
      return;
    }
    if (XorOList[0] == XorOList[3] &&
        XorOList[3] == XorOList[6] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'winner is : ' + XorOList[0]);
      return;
    }
    if (XorOList[1] == XorOList[4] &&
        XorOList[4] == XorOList[7] &&
        XorOList[1] != '') {
      setResult(XorOList[1], 'winner is : ' + XorOList[1]);
      return;
    }
    if (XorOList[2] == XorOList[5] &&
        XorOList[5] == XorOList[8] &&
        XorOList[2] != '') {
      setResult(XorOList[2], 'winner is : ' + XorOList[2]);
      return;
    }
    if (XorOList[0] == XorOList[4] &&
        XorOList[4] == XorOList[8] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'winner is : ' + XorOList[0]);
      return;
    }
    if (XorOList[2] == XorOList[4] &&
        XorOList[4] == XorOList[6] &&
        XorOList[2] != '') {
      setResult(XorOList[2], 'winner is : ' + XorOList[2]);
      return;
    }
    if (filledBox == 9) {
      setResult('', 'draw');
    }
  }

//for show point to user
  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'player O',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$scoreO',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'player X',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$scoreX',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

//for show result in score board
  void setResult(String winner, String title) {
    setState(() {
      gameHasaResult = true;

      winnerTitle = title;
      if (winner == 'X') {
        scoreX++;
      } else if (winner == 'O') {
        scoreO++;
      } else {
        scoreO++;
        scoreX++;
      }
    });
  }

//for clear game like start
  void gameClear() {
    setState(() {
      for (int i = 0; i < XorOList.length; i++) {
        XorOList[i] = '';
      }
    });
    filledBox = 0;
    isTurnO = true;
  }
}
