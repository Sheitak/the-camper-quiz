import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_camper_quiz/models/question.dart';
import 'package:the_camper_quiz/widgets/custom_text.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => new _QuizState();
}

class _QuizState extends State<Quiz>{

  late Question actualQuestion;
  int index = 0;
  int score = 0;

  List<Question> questionsList = [
    new Question('La devise de la Belgique est l\'union fait la force', true, 'Eh oui, elle a été choisie après la révolution de 1830 et l\'indépendance du pays', 'belgique.jpg'),
    new Question('La lune va finir par tomber sur terre à cause de la gravité', false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    new Question('La Russie est plus grande en superficie que Pluton', true, 'Plus de 6 600 kilomètres ! Pour une superficie de 17 125 191 km2', 'russie.jpg'),
    new Question('Nyctalope est une race naine d\'antilope', false, 'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    new Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, 'Il se vendra à près de 20 millions d\'exemplaires, un score inégalé !', 'commodore.jpg'),
    new Question('Le nom du drapeau des pirates es black skull', false, 'Il est appelé Jolly Roger', 'pirate.png'),
    new Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou', 'tintin.jpg'),
    new Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    new Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir', true, 'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    new Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    actualQuestion = questionsList[index];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Quiz'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new CustomText(
                    'Question numéro ${index + 1}',
                    color: Colors.grey[900]
                ),
                Padding(padding: EdgeInsets.all(15.0)),
                new CustomText(
                  'Score : $score / $index',
                  color: Colors.grey[900]
                ),
                Padding(padding: EdgeInsets.all(15.0)),
                new Card(
                  elevation: 10.0,
                  child: new Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.width / 1.2,
                      child: new Image.asset(
                        'assets/images/' + actualQuestion.imagePath,
                        fit: BoxFit.cover,
                      )
                  )
                ),
                Padding(padding: EdgeInsets.all(15.0)),
                new CustomText(
                  actualQuestion.question,
                  color: Colors.grey[900],
                  factor: 0.9
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elevatedButtonBoolean(true),
                elevatedButtonBoolean(false)
              ],
            )
          ],
        )
      )
    );
  }

  ElevatedButton elevatedButtonBoolean(bool judge) {
    return new ElevatedButton(
        onPressed: (
            () => dialog(judge)
        ),
        style: ButtonStyle(
            backgroundColor: (judge) ? MaterialStateProperty.all<Color>(Colors.green) : MaterialStateProperty.all<Color>(Colors.red),
        ),
        child: new CustomText(
          (judge) ? "Vrai" : "Faux",
        )
    );
  }

  Future<Null> dialog(bool judge) async {
    bool goodAnswer = (judge == actualQuestion.response);
    String valid = 'assets/images/vrai.jpg';
    String wrong = 'assets/images/faux.jpg';
    if (goodAnswer) {
      score++;
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: new CustomText(
              (goodAnswer) ? 'Bravo !' : 'Oups... Perdu !',
              factor: 1.2,
              color: (goodAnswer) ? Colors.green : Colors.red,
            ),
            contentPadding: EdgeInsets.all(20.0),
            children: [
              new Image.asset(
                  (goodAnswer) ? valid : wrong,
                  fit: BoxFit.cover,
              ),
              new Container(
                padding: EdgeInsets.all(10.0),
              ),
              new CustomText(
                actualQuestion.explication,
                color: Colors.grey[900],
              ),
              new Container(
                padding: EdgeInsets.all(10.0),
              ),
              new ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    nextQuestion()
                  },
                  child: new CustomText(
                    'Question suivante',
                    factor: 0.9,
                  )
              )
            ],
          );
        }
    );
  }

  Future<Null> alert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return new AlertDialog(
            title: new CustomText(
              'Le Quiz est terminé ! Merci davoir joué',
              color: Colors.blue,
              factor: 0.9,
            ),
            contentPadding: EdgeInsets.all(10.0),
            content: new CustomText(
                'Voici votre score : $score / ${questionsList.length}',
                color: Colors.grey[900]
            ),
            actions: [
              new TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.center
                  ),
                  onPressed: () => {
                    Navigator.pop(buildContext),
                    Navigator.pop(context)
                  },
                  child: new CustomText(
                    'Recommencer',
                    color: Colors.blue,
                  )
              ),
            ],
          );
        }
    );
  }

  void nextQuestion() {
    if (index < questionsList.length - 1) {
      index++;
      setState(() {
        actualQuestion = questionsList[index];
      });
    } else {
      alert();
    }
  }
}