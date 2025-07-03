import 'package:flutter/material.dart';

class CustomScheduleBottomSheet extends StatefulWidget {
  const CustomScheduleBottomSheet({super.key});

  @override
  State<CustomScheduleBottomSheet> createState() =>
      _CustomScheduleBottomSheetState();
}

class _CustomScheduleBottomSheetState extends State<CustomScheduleBottomSheet> {
  int selectedTab = 0; // 0:日ごと, 1:週ごと, 2:月ごと, 3:年ごと

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color(0xFFF8FAFC),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'タスク設定',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // タブ
              Row(
                children: [
                  _ScheduleTab(
                    label: '日ごと',
                    selected: selectedTab == 0,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                  _ScheduleTab(
                    label: '週ごと',
                    selected: selectedTab == 1,
                    onTap: () => setState(() => selectedTab = 1),
                  ),
                  _ScheduleTab(
                    label: '月ごと',
                    selected: selectedTab == 2,
                    onTap: () => setState(() => selectedTab = 2),
                  ),
                  _ScheduleTab(
                    label: '年ごと',
                    selected: selectedTab == 3,
                    onTap: () => setState(() => selectedTab = 3),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (selectedTab == 0) ..._buildDayTab(),
              if (selectedTab == 1) ..._buildWeekTab(),
              if (selectedTab == 2) ..._buildMonthTab(),
              if (selectedTab == 3) ..._buildYearTab(),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildDayTab() => [
    _RepeatSettingRow(label: '日ごとの設定', unit: '日ごと'),
    const SizedBox(height: 16),
    _StartDateRow(),
    const SizedBox(height: 24),
    _CalendarSection(execDays: const [15, 17, 19, 21, 23, 25, 27, 29, 31]),
    const SizedBox(height: 16),
    _LegendRow(),
    const SizedBox(height: 16),
    _ScheduleSummaryBox(
      text: '毎日実行\n開始日: 2024年1月15日\n次回実行: 1月15日, 16日, 17日...',
    ),
  ];

  List<Widget> _buildWeekTab() => [
    _RepeatSettingRow(label: '週ごとの設定', unit: '週ごと'),
    const SizedBox(height: 16),
    _StartDateRow(),
    const SizedBox(height: 16),
    _WeekdaySelector(),
    const SizedBox(height: 24),
    _CalendarSection(execDays: const [15, 17, 19, 21, 29]),
    const SizedBox(height: 16),
    _LegendRow(),
    const SizedBox(height: 16),
    _ScheduleSummaryBox(
      text: '毎日実行\n開始日: 2024年1月15日\n次回実行: 1月15日, 16日, 17日...',
    ),
  ];

  List<Widget> _buildMonthTab() => [
    _RepeatSettingRow(label: '月ごとの設定', unit: '月ごと'),
    const SizedBox(height: 16),
    _StartDateRow(),
    const SizedBox(height: 16),
    _MonthDateSelector(),
    const SizedBox(height: 24),
    _CalendarSection(execDays: const [15]),
    const SizedBox(height: 16),
    _LegendRow(),
    const SizedBox(height: 16),
    _ScheduleSummaryBox(text: '毎日実行\n開始日: 2024年1月15日\n次回実行: 3月15日, 5月15日...'),
  ];

  List<Widget> _buildYearTab() => [
    _RepeatSettingRow(label: '年ごとの設定', unit: '年ごと'),
    const SizedBox(height: 16),
    _StartDateRow(),
    const SizedBox(height: 16),
    _YearDateSelector(),
    const SizedBox(height: 24),
    _CalendarSection(execDays: const [15]),
    const SizedBox(height: 16),
    _LegendRow(),
    const SizedBox(height: 16),
    _ScheduleSummaryBox(text: '毎日実行\n開始日: 2024年1月15日\n次回実行: 2026年1月15日...'),
  ];
}

class _ScheduleTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ScheduleTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1A1D29) : Colors.transparent,
          border: Border.all(color: const Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _RepeatSettingRow extends StatelessWidget {
  final String label;
  final String unit;
  const _RepeatSettingRow({required this.label, required this.unit});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('毎'),
              Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(unit),
            ],
          ),
        ],
      ),
    );
  }
}

class _StartDateRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('開始日'),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF8FAFC),
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('2024年1月15日', style: TextStyle(fontSize: 16)),
              Icon(Icons.calendar_today, color: Colors.grey[400]),
            ],
          ),
        ),
      ],
    );
  }
}

class _WeekdaySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(7, (i) {
        final isSelected = [1, 3, 5].contains(i); // 仮: 月水金
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1A1D29) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.black12,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              ['月', '火', '水', '木', '金', '土', '日'][i],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _MonthDateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MonthDateChip(label: '15日', selected: true),
        _MonthDateChip(label: '第3月曜日'),
      ],
    );
  }
}

class _YearDateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MonthDateChip(label: '1月15日', selected: true),
        _MonthDateChip(label: '1月の第3月曜日'),
      ],
    );
  }
}

class _MonthDateChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _MonthDateChip({required this.label, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1A1D29) : Colors.transparent,
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CalendarSection extends StatelessWidget {
  final List<int> execDays;
  const _CalendarSection({required this.execDays});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(icon: const Icon(Icons.chevron_left), onPressed: null),
            const Text(
              '2024年1月',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            IconButton(icon: const Icon(Icons.chevron_right), onPressed: null),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('日', style: TextStyle(color: Colors.red)),
                  Text('月'),
                  Text('火'),
                  Text('水'),
                  Text('木'),
                  Text('金'),
                  Text('土', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 1; i <= 31; i++)
                    _CustomCalendarDay(
                      day: i,
                      isStart: i == 15,
                      isExec: execDays.contains(i),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomCalendarDay extends StatelessWidget {
  final int day;
  final bool isStart;
  final bool isExec;
  const _CustomCalendarDay({
    required this.day,
    required this.isStart,
    required this.isExec,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            isStart
                ? Colors.black
                : isExec
                ? Colors.blue[100]
                : Colors.transparent,
        border: Border.all(
          color: isExec ? Colors.blue : Colors.transparent,
          width: isExec ? 2 : 0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$day',
        style: TextStyle(
          color:
              isStart
                  ? Colors.white
                  : isExec
                  ? Colors.blue[900]
                  : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        const Text('開始日'),
        const SizedBox(width: 16),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        const Text('実行日'),
      ],
    );
  }
}

class _ScheduleSummaryBox extends StatelessWidget {
  final String text;
  const _ScheduleSummaryBox({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.calendar_today, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
