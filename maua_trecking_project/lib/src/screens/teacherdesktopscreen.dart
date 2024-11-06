import 'package:flutter/material.dart';
import '../widgets/inputwidget.dart';
import '../mixins/teacherlistmixin.dart';

class DesktopLayoutProfessor extends StatefulWidget {
  const DesktopLayoutProfessor({super.key});

  @override
  State<StatefulWidget> createState() {
    return DesktopLayoutProfessorState();
  }
}

class DesktopLayoutProfessorState extends State<DesktopLayoutProfessor> {
  @override
  Widget build(BuildContext context) {
    final email = EmailInput();
    final password = PasswordInput();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 37, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 223, 223, 223),
                        shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 0, 37, 69),
                        )),
                  )
                ],
              ),
            ),
            const Text(
              "Mauá Trekking",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontVariations: [FontVariation('wght', 600.0)]),
            ),
            const Text(
              "Acesso dos Professores",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontVariations: [FontVariation('wght', 500.0)]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 500,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputWidget(
                            icon: email.icon,
                            title: email.title,
                            controller: email.controller,
                            labeltext: email.label,
                            hinttext: email.hint,
                            obscuretext: email.obscuretext,
                            ),
                        const SizedBox(height: 20),
                        InputWidget(
                            icon: password.icon,
                            title: password.title,
                            controller: password.controller,
                            labeltext: password.label,
                            hinttext: password.hint,
                            obscuretext: password.obscuretext,
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: 500,
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Fazer Login",
                              style: TextStyle(fontVariations: [
                                FontVariation('wght', 500.0)
                              ], color: Color.fromARGB(255, 0, 37, 69),fontSize: 20.0),
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
