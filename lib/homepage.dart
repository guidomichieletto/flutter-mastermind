import 'package:flutter/material.dart';
import 'package:mastermind/components/attempt_row.dart';
import 'package:mastermind/components/user_input.dart';
import 'package:mastermind/game.dart';
import 'package:confetti/confetti.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game game = Game();

  void _resetGame() {
    setState(() {
      game = Game();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Mastermind!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            UserInput(game: game),
            const SizedBox(height: 40),

            const Text('Secret - Debug', style: TextStyle(fontSize: 20)),
            AttemptRow(colors: game.secret, feedback: [0,0]),
            const SizedBox(height: 50,),

            // Rebuild this part automatically when `game` notifies listeners
            AnimatedBuilder(
              animation: game,
              builder: (context, _) {
                return Column(
                  children: [
                    if(game.gameStatus() == 1) Center(
                      child: ConfettiWidget(
                        numberOfParticles: 100,
                        confettiController: ConfettiController(duration: const Duration(seconds: 4))..play(),
                        blastDirectionality: BlastDirectionality.explosive,
                        shouldLoop: false,
                        colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
                      ),
                    ),
                    for (int i = 0; i < game.attempts.length; i++)
                      AttemptRow(
                        colors: game.attempts[i],
                        feedback: game.getFeedback(i),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetGame,
        tooltip: 'New Game',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}