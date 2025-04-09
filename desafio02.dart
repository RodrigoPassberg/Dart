import 'dart:io';

class Paciente {

  String nome = '';
  int idade = 0;
  String sexo = '';

  Paciente(this.nome, this.idade, this.sexo);

  bool estaApto() {
    if (sexo == 'masculino' && idade >= 14 && idade <= 50) {
      return true;
    } else if (sexo == 'feminino' && idade >= 20 && idade <= 40) {
      return true; 
    }
    return false; 
  }

  @override
  String toString() {
    String status = estaApto() ? 'Apto' : 'Não Apto';
    return '{Nome: $nome, Idade: $idade, Sexo: $sexo, Status: $status}';
  }
}

void main() {
  String? entrada;
  String nome = '';
  int idade = 0;
  String sexo = '';

  while (entrada == null || entrada!.isEmpty) {
    print('Digite o nome do paciente: ');
    entrada = stdin.readLineSync();
  }
  nome = entrada!;
  entrada = null;

  while (entrada == null || int.tryParse(entrada!) == null) {
    print('Digite a idade do paciente: ');
    entrada = stdin.readLineSync();
  }
  idade = int.parse(entrada!);
  entrada = null;

  while (entrada == null || (entrada != 'masculino' && entrada != 'feminino')) {
    print('Digite o sexo do paciente (masculino/feminino): ');
    entrada = stdin.readLineSync();
  }
  sexo = entrada!;
  entrada = null;

  Paciente paciente = Paciente(nome, idade, sexo);


  print(paciente);
}
