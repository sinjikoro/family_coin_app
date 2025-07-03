import 'package:family_coin/presentation/ui/components/atoms/app_fab.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_tab_bar.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/task_item_data.dart';
import 'package:family_coin/presentation/ui/components/organisms/progress_summary_section.dart';
import 'package:family_coin/presentation/ui/components/organisms/task_list_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスク一覧
class TaskListPage extends StatefulWidget {
  /// constructor
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  /// 選択中のタブ
  int selectedTab = 0;

  /// タブラベルリスト
  final tabs = ['すべて', '今日', '今週', '完了済み'];

  @override
  Widget build(BuildContext context) {
    // ダミーデータ
    final taskItems = [
      const TaskItemData(
        id: '1',
        labelColor: Colors.green,
        title: '宿題をする',
        subTitle: '算数と国語の宿題を完了する',
        coin: 50,
        icon: AppIcon.book(size: 32),
        isDone: true,
      ),
      const TaskItemData(
        id: '2',
        labelColor: Colors.green,
        title: 'お手伝いをする',
        subTitle: '食器洗いのお手伝いをする',
        coin: 30,
        icon: AppIcon.activity(size: 32),
        isDone: true,
      ),
      const TaskItemData(
        id: '3',
        labelColor: Colors.green,
        title: '早寝早起き',
        subTitle: '21時までに就寝する',
        coin: 50,
        icon: AppIcon.heart(size: 32),
        isDone: true,
      ),
      const TaskItemData(
        id: '4',
        labelColor: Colors.grey,
        title: '運動をする',
        subTitle: '30分間の運動やストレッチ',
        coin: 40,
        icon: AppIcon.star(size: 32),
        isDisabled: true,
      ),
      const TaskItemData(
        id: '5',
        labelColor: Colors.grey,
        title: '読書をする',
        subTitle: '好きな本を読む',
        coin: 30,
        icon: AppIcon.bookOpen(size: 32),
        isDisabled: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク一覧'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タブバー
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TaskTabBar(
              selectedIndex: selectedTab,
              tabs: tabs,
              onTabSelected: (i) => setState(() => selectedTab = i),
            ),
          ),
          // 進捗サマリー
          const ProgressSummarySection(
            doneCount: 3,
            remainCount: 2,
            totalCount: 5,
            doneCoin: 130,
            remainCoin: 100,
          ),
          // タスクリスト
          Expanded(child: TaskListSection(tasks: taskItems)),
        ],
      ),
      floatingActionButton: const AppFab(label: '新しいタスクを追加'),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedTab', selectedTab))
      ..add(IterableProperty<String>('tabs', tabs));
  }
}
