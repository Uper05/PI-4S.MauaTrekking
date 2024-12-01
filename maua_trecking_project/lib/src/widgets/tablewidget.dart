import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../back_end/firestoreEquipe.dart';

class Tablewidget extends StatefulWidget {
  const Tablewidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return TablewidgetState();
  }
}

class TablewidgetState extends State<Tablewidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 223, 223, 223),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/telaProfessor');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 37, 69),
                  )),
            ),
        ),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 223, 223, 223), //change your color here
        ),
        centerTitle: true,
        title: const Text(
          'Tabela de Equipes',
          style: TextStyle(
              color: Color.fromARGB(255, 223, 223, 223),
              fontVariations: [FontVariation('wght', 600.0)]),
        ),
        
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: obterEquipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Erro ao carregar os dados!'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('Nenhuma equipe encontrada!'));
            }

            var equipes = snapshot.data!.docs;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: DataTable(
                  dataTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 223, 223, 223),
                      fontSize: 16.0,
                      fontVariations: [FontVariation('wght', 300.0)]),
                  headingTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 223, 223, 223),
                      fontSize: 18.0,
                      fontVariations: [FontVariation('wght', 600.0)]),
                  columns: const [
                    DataColumn(label: Text('RA Líder')),
                    DataColumn(label: Text('RA Comp 1')),
                    DataColumn(label: Text('RA Comp 2')),
                    DataColumn(label: Text('RA Comp 3')),
                    DataColumn(label: Text('RA Comp 4')),
                    DataColumn(label: Text('1.')),
                    DataColumn(label: Text('2.')),
                    DataColumn(label: Text('3.')),
                    DataColumn(label: Text('4.')),
                    DataColumn(label: Text('5.')),
                    DataColumn(label: Text('6.')),
                    DataColumn(label: Text('7.')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: equipes.map<DataRow>((equipe) {
                    // Fazendo o cast do dado para Map<String, dynamic>
                    var data = equipe.data() as Map<String, dynamic>;

                    // Extraindo os campos como listas
                    var raEquipeList =
                        List<String>.from(data['RAEquipe'] ?? []);

                    // Extraindo e convertendo pontuações
                    var pontuacoesList =
                        (data['pontuacoes'] as List<dynamic>? ?? [])
                            .map<int>((e) => e as int)
                            .toList();

                    // Calculando a pontuação total
                    var pontuacaoTotal =
                        pontuacoesList.fold<int>(0, (sum, item) => sum + item);

                    return DataRow(cells: [
                      DataCell(MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _editarRA(context, equipe.id, 0,
                              raEquipeList.isNotEmpty ? raEquipeList[0] : ''),
                          child: Text(
                              raEquipeList.isNotEmpty ? raEquipeList[0] : ''),
                        ),
                      )),
                      DataCell(MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _editarRA(context, equipe.id, 1,
                              raEquipeList.length > 1 ? raEquipeList[1] : ''),
                          child: Text(
                              raEquipeList.length > 1 ? raEquipeList[1] : ''),
                        ),
                      )),
                      DataCell(MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _editarRA(context, equipe.id, 2,
                              raEquipeList.length > 2 ? raEquipeList[2] : ''),
                          child: Text(
                              raEquipeList.length > 2 ? raEquipeList[2] : ''),
                        ),
                      )),
                      DataCell(MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _editarRA(context, equipe.id, 3,
                              raEquipeList.length > 3 ? raEquipeList[3] : ''),
                          child: Text(
                              raEquipeList.length > 3 ? raEquipeList[3] : ''),
                        ),
                      )),
                      DataCell(MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _editarRA(context, equipe.id, 4,
                              raEquipeList.length > 4 ? raEquipeList[4] : ''),
                          child: Text(
                              raEquipeList.length > 4 ? raEquipeList[4] : ''),
                        ),
                      )),
                      DataCell(Text(pontuacoesList.isNotEmpty
                          ? pontuacoesList[0].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 1
                          ? pontuacoesList[1].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 2
                          ? pontuacoesList[2].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 3
                          ? pontuacoesList[3].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 4
                          ? pontuacoesList[4].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 5
                          ? pontuacoesList[5].toString()
                          : '')),
                      DataCell(Text(pontuacoesList.length > 6
                          ? pontuacoesList[6].toString()
                          : '')),
                      DataCell(Text(pontuacaoTotal.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> _editarRA(
    BuildContext context, String equipeId, int index, String raAtual) async {
  TextEditingController raController = TextEditingController(text: raAtual);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        title: const Text(
          'Editar RA',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontVariations: [FontVariation('wght', 400.0)],
              color: Color.fromARGB(255, 0, 37, 69)),
        ),
        content: TextField(
          style: const TextStyle(
              fontSize: 24.0, fontVariations: [FontVariation('wght', 200.0)]),
          controller: raController,
          decoration: const InputDecoration(
              labelText: 'Novo RA',
              labelStyle: TextStyle(
                  fontSize: 24.0,
                  fontVariations: [FontVariation('wght', 200.0)])),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.0,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 0, 37, 69))),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Fechar o diálogo sem fazer nada
                  },
                  child: const Text('Cancelar',
                      style: TextStyle(
                          color: Color.fromARGB(255, 223, 223, 223),
                          fontSize: 20.0,
                          fontVariations: [FontVariation('wght', 400.0)])),
                ),
              ),
              Container(
                width: 100.0,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 0, 37, 69))),
                  onPressed: () async {
                    // Atualizar usando a função do arquivo firestoreEquipe.dart
                    String novoRA = raController.text.trim();
                    if (novoRA.isNotEmpty) {
                      await atualizarRA(
                          equipeId, index, novoRA); // Chamada da função
                    }
                    Navigator.of(context).pop(); // Fechar o diálogo
                  },
                  child: const Text('Salvar',
                      style: TextStyle(
                          color: Color.fromARGB(255, 223, 223, 223),
                          fontSize: 20.0,
                          fontVariations: [FontVariation('wght', 400.0)])),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
