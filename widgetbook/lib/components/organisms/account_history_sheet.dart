import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// アカウント履歴シートのモックバージョン（widgetbook用）
class MockAccountHistorySheet extends StatelessWidget {
  const MockAccountHistorySheet({super.key, this.transactions = const []});

  final List<MockTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Account History',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: transactions.isEmpty
                ? const Center(child: Text('No transactions'))
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) => _MockAccountHistoryItem(
                      transaction: transactions[index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// モック取引データ
class MockTransaction {
  const MockTransaction({
    required this.date,
    required this.description,
    required this.amount,
  });

  final String date;
  final String description;
  final int amount;
}

/// モックアカウント履歴アイテム
class _MockAccountHistoryItem extends StatelessWidget {
  const _MockAccountHistoryItem({required this.transaction});

  final MockTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.date),
      subtitle: Text(transaction.description),
      trailing: Text(
        '${transaction.amount > 0 ? '+' : ''}${transaction.amount}',
        style: TextStyle(
          color: transaction.amount > 0 ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Empty', type: MockAccountHistorySheet)
Widget accountHistorySheetEmptyUseCase(BuildContext context) {
  return const MockAccountHistorySheet();
}

@widgetbook.UseCase(name: 'With Transactions', type: MockAccountHistorySheet)
Widget accountHistorySheetWithTransactionsUseCase(BuildContext context) {
  return const MockAccountHistorySheet(
    transactions: [
      MockTransaction(
        date: '2024-01-15 14:30',
        description: 'お手伝いタスク完了',
        amount: 10,
      ),
      MockTransaction(
        date: '2024-01-15 10:15',
        description: '宿題タスク完了',
        amount: 15,
      ),
      MockTransaction(
        date: '2024-01-14 16:45',
        description: 'お菓子購入',
        amount: -5,
      ),
      MockTransaction(
        date: '2024-01-14 09:20',
        description: '運動タスク完了',
        amount: 20,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Many Transactions', type: MockAccountHistorySheet)
Widget accountHistorySheetManyTransactionsUseCase(BuildContext context) {
  return MockAccountHistorySheet(
    transactions: List.generate(
      20,
      (index) => MockTransaction(
        date: '2024-01-${15 - index} ${10 + (index % 8)}:${30 + (index % 30)}',
        description: 'タスク ${index + 1} 完了',
        amount: 10 + (index % 15),
      ),
    ),
  );
}
