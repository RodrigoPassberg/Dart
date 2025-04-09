import 'dart:io';

class Candidato {
  int id;
  String nome;
  int votos;

  Candidato(this.id, this.nome, this.votos);

  @override
  String toString() {
    return '{id: $id, nome: $nome, votos: $votos}';
  }

  double calcularPorcentagem(int totalVotos) {
    return (votos / totalVotos) * 100;
  }
}

void main() {
  List<Candidato> candidatos = [];
  int idCandidato = 1;
  int totalVotos = 0;
  
  while (true) {
    print('Menu:');
    print('1. Adicionar Candidato');
    print('2. Excluir Candidato');
    print('3. Mostrar Porcentagem de Votos');
    print('4. Sair');
    print('Escolha uma opção: ');

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        String? nome;
        int votos;

        while (nome == null || nome.isEmpty) {
          print('Digite o nome do candidato: ');
          nome = stdin.readLineSync();
        }

        while (true) {
          print('Digite a quantidade de votos: ');
          String? votosEntrada = stdin.readLineSync();
          if (votosEntrada != null && int.tryParse(votosEntrada) != null) {
            votos = int.parse(votosEntrada);
            break;
          } else {
            print('Por favor, insira um número válido de votos.');
          }
        }

        totalVotos += votos;

        candidatos.add(Candidato(idCandidato++, nome, votos));
        break;

      case '2':
        print('Digite o ID do candidato a ser excluído: ');
        String? idEntrada = stdin.readLineSync();

        if (idEntrada != null && int.tryParse(idEntrada) != null) {
          int idExcluir = int.parse(idEntrada);

          Candidato? candidatoExcluir;
          for (var candidato in candidatos) {
            if (candidato.id == idExcluir) {
              candidatoExcluir = candidato;
              break;
            }
          }

          if (candidatoExcluir != null) {
            candidatos.remove(candidatoExcluir);
            totalVotos -= candidatoExcluir.votos;
            print('Candidato ${candidatoExcluir.nome} excluído com sucesso!');
          } else {
            print('Candidato não encontrado!');
          }
        } else {
          print('Por favor, insira um ID válido.');
        }
        break;

      case '3':
        if (candidatos.isEmpty) {
          print('Não há candidatos cadastrados.');
        } else {
          print('Lista de Candidatos:');
          print('Total de Votos: $totalVotos');
          for (var candidato in candidatos) {
            double porcentagem = candidato.calcularPorcentagem(totalVotos);
            print('${candidato.nome}: ${porcentagem.toStringAsFixed(2)}%');
          }
        }
        break;

      case '4':
        print('Saindo...');
        return;

      default:
        print('Opção inválida! Tente novamente.');
    }
  }
}
