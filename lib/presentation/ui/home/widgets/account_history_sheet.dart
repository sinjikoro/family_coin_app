import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アカウント履歴シート
class AccountHistorySheet extends ConsumerWidget {
  /// constructor
  const AccountHistorySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    children: [
      const Text(
        'Account History',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: FutureBuilder(
          future: ref.read(transactionLogListStateProvider.future),
          builder:
              (context, snapshot) => ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder:
                    (context, index) => _AccountHistoryItem(
                      transactionLog: snapshot.data![index],
                    ),
              ),
        ),
      ),
    ],
  );
}

/// アカウント履歴アイテム
class _AccountHistoryItem extends StatelessWidget {
  /// constructor
  const _AccountHistoryItem({required this.transactionLog});

  /// 取引ログ
  final TransactionLog transactionLog;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(transactionLog.createdAt.toLocal().toString()),
    subtitle: Text(transactionLog.description),
    trailing: Text(transactionLog.amount.toString()),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TransactionLog>('transactionLog', transactionLog),
    );
  }
}
