import 'package:get/get.dart';

import '../../presenter/pages/splash/splash_binding.dart';
import '../../presenter/pages/splash/splash_view.dart';

abstract class Rotas {
  static const initial = '/';
  static const login = '/login';
  static const configuracoes = '/configuracoes';
  static const mainMenu = '/main_menu';
  static const consulta = '/consulta';
  static const selecioneSetor = '/selecione_setor';
  static const setor = '/setor';
  static const detalhesDoVeiculo = '/detalhesDoVeiculo';
  static const vendaDeTicket = '/venda_de_ticket';
  static const toleranciaDeXMinutos = '/toleranciaDeXMinutos';
  static const notificacaoDeIrregularidade = '/lancamento_de_notificacao_de_irregularidade';
  static const baixaDeApontamento = '/baixaDeApontamento';
  static const lancamentoIndicacaoInfracao = '/lancamentoIndicacaoInfracao';
  static const regularizacao = '/regularizacao';
  static const vendaDeCredito = '/vendaDeCredito';
  static const dadosParaAutuacao = '/dadosParaAutuacao';
  static const contagemDeTempo = '/contagemDeTempo';
}

// ignore: avoid_classes_with_only_static_members
abstract class AppRotas {
  static List<GetPage> routes = [
    GetPage(
      name: Rotas.initial,
      page: () => const SplashView(),
      transition: Transition.native,
      bindings: [SplashBinding()],
    ),
  ];
}
