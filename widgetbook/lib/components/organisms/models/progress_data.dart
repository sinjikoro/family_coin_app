import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/models/progress_data.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Progress Data', type: ProgressData)
Widget progressDataBasicUseCase(BuildContext context) {
  const progressData = ProgressData(
    icon: AppIcon.calendar(size: 24),
    title: '今日のタスク',
    valueText: '3/5 完了',
  );
  
  return Card(
    child: ListTile(
      leading: progressData.icon,
      title: Text(progressData.title),
      subtitle: Text(progressData.valueText),
      trailing: progressData.progress != null
          ? CircularProgressIndicator(
              value: progressData.progress,
              strokeWidth: 2,
            )
          : null,
    ),
  );
}

@widgetbook.UseCase(name: 'With Progress Bar', type: ProgressData)
Widget progressDataWithProgressUseCase(BuildContext context) {
  const progressData = ProgressData(
    icon: AppIcon.trophy(size: 24),
    title: '今週の進捗',
    valueText: '85%',
    progress: 0.85,
  );
  
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              progressData.icon,
              const SizedBox(width: 8),
              Text(
                progressData.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            progressData.valueText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progressData.progress,
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    ),
  );
}