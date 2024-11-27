import 'package:flutter/material.dart';
import '../widgets/inputwidget.dart';
import '../mixins/teacherlistmixin.dart';
import '../back_end/auth_service.dart';

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

    /*as variaveis email e password vem da pasta mixin/teacherlistmixin, 
    basicamente eles servem para pegar os valores da lista e passarem para o input do email e senha no código abaixo.*/
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
              //App Bar que contém o botão de retornar a Home
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
            //Título da página
            const Text(
              "Mauá Trekking",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontVariations: [FontVariation('wght', 600.0)]),
            ),
            //sub título para indicar a troca de tela do login agora tendo o "Acesso aos Professores"
            const Text(
              "Acesso dos Professores",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontVariations: [FontVariation('wght', 500.0)]),
            ),
            //Caixa que contém os textfields de email e senha
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
                            icon: email.icon, //icone do email
                            title: email.title,//título do email
                            controller: email.controller,//valor colocado no field do email (U:Vezzu essa várivel que precisa passsar na validação com o .text)
                            labeltext: email.label,//Valor da label do email
                            hinttext: email.hint,//dica do valor a ser colocado no email
                            obscuretext: email.obscuretext,//se o campo deve ser obscurecido ou não(U:remove as bolinhas)
                            ),
                        const SizedBox(height: 20),
                        InputWidget(
                            icon: password.icon,//Icone da senha
                            title: password.title,//Título da Senha
                            controller: password.controller,//Valor colocado no field da senha (U:Vezzu essa várivel que precisa passsar na validação com o .text)
                            labeltext: password.label,//Valor da label da senha
                            hinttext: password.hint,//dica do valor a ser colocado na senha
                            obscuretext: password.obscuretext,//se o campo deve ser obscurecido ou não(U:Coloca as bolinhas)
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Botão de Login
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: 500,
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              final authService = AuthService();
                              await authService.login(
                                email: email.controller.text.trim(),
                                password: password.controller.text.trim(),
                                context: context,
                              );
                            },
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
