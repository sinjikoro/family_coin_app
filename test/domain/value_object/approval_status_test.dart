import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApprovalStatus', () {
    test('未承認状態を生成できる', () {
      final status = ApprovalStatus.unapproved();
      expect(status.value, 'unapproved');
      expect(status.isApproved, false);
    });

    test('承認状態を生成できる', () {
      final status = ApprovalStatus.approved();
      expect(status.value, 'approved');
      expect(status.isApproved, true);
    });

    test('同じ状態のApprovalStatusは等しい', () {
      final status1 = ApprovalStatus.approved();
      final status2 = ApprovalStatus.approved();
      expect(status1, status2);
    });

    test('異なる状態のApprovalStatusは等しくない', () {
      final status1 = ApprovalStatus.approved();
      final status2 = ApprovalStatus.unapproved();
      expect(status1, isNot(status2));
    });

    test('不正な値でApprovalStatusを生成するとエラーになる', () {
      expect(() => ApprovalStatus.byName('invalid'), throwsArgumentError);
    });
  });
}
