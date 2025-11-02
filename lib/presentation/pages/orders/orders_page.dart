import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/orders/order_cubit.dart';
import '../../cubits/orders/order_state.dart';
import '../../../settings/injection.dart';
import 'widgets/input_section.dart';
import 'widgets/loading_section.dart';
import 'widgets/error_section.dart';
import 'widgets/results_section.dart';
import 'widgets/not_found_section.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<OrderCubit>()..init(), child: const _OrdersView());
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zamówienie',
          style: TextStyle(fontWeight: FontWeight.w700, color: Theme.brightnessOf(context) == Brightness.light ? Colors.black : Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.brightnessOf(context) == Brightness.dark ? Colors.black : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            switch (state.status) {
              case OrderUiStatus.noApiKey:
              case OrderUiStatus.empty:
                return InputSection(showNoKeyBanner: state.status == OrderUiStatus.noApiKey, inputText: state.inputText);
              case OrderUiStatus.loading:
                return const LoadingSection();
              case OrderUiStatus.notFound:
                return const NotFoundSection();
              case OrderUiStatus.error:
                return ErrorSection(message: state.errorMessage ?? 'Wystąpił błąd podczas analizy.');
              case OrderUiStatus.success:
              case OrderUiStatus.partialSuccess:
                return ResultsSection(items: state.items, total: state.total);
            }
          },
        ),
      ),
    );
  }
}
