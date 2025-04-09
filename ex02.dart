void main() {
  double v1 = 10;
  double v2 = 2;
  double resultado = divDois(v1, v2);

  if (resultado != -1) {
    print('A Divisão de ${v1} / ${v2} é ${resultado}');
  }
}
double divDois(double a, double b) {
  if (b == 0) {
    print('Proibido dividir por 0');
    return -1;
  }
  return a / b;
}