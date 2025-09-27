import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../features/dashboard/data/models/balance_model.dart';
import '../../../features/expense/data/models/category_model.dart';
import '../../constants/local_keys.dart';
import '../service_provider.dart';

class HiveServiceProvider<T> implements ServiceProvider {
  static final HiveServiceProvider _instance = HiveServiceProvider._();

  static HiveServiceProvider get i => _instance;

  HiveServiceProvider._();

  Box<Map> get categoryBox => Hive.box<Map>(LocalKeys.categoryBox);
  Box<Map> get expenseBox => Hive.box<Map>(LocalKeys.expenseBox);
  Box<Map> get balancesBox => Hive.box<Map>(LocalKeys.balancesBox);

  @override
  Future<void> register() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ExpenseModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(BalanceModelAdapter());

    await Future.wait([
      _openBox<Map>(LocalKeys.categoryBox),
      _openBox<Map>(LocalKeys.expenseBox),
      _openBox<Map>(LocalKeys.balancesBox),
    ]);

    initBalanceBox();
  }

  /// Open box (lazy open)
  Future<void> _openBox<T>(boxName) async {
    try {
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox<T>('$boxName');
      }
    } catch (error) {
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.openBox<T>(boxName);
    }
  }

  initBalanceBox() async {
    if (balancesBox.isEmpty) {
      await balancesBox.put('main', {
        "totalBalance": 0,
        "incomeBalance": 0,
        "expenseBalance": 0,
      });
    }
  }

  /// Insert (auto increment key)
  Future<int> insert(Box box, T item) async {
    return await box.add(item);
  }

  /// Insert with custom key
  Future<void> insertWithKey(Box box, dynamic key, T item) async {
    await box.put(key, item);
  }

  /// Get last counted items
  Future<List> getLastCounted<T>(Box box, int take) async {
    final values = box.values.toList();
    if (values.length <= take) return values;
    return values.sublist(values.length - take);
  }

  /// Get all items
  Future<List> getAll<T>(Box box) async {
    return box.values.toList();
  }

  /// Get all paginated items
  Future<List> getAllPagination<T>(
    Box box, {
    int page = 1,
    int limit = 10,
  }) async {
    final all = box.values.toList();
    final startIndex = (page - 1) * limit;
    if (startIndex >= all.length) return [];
    final endIndex = startIndex + limit;
    var list = all.sublist(
      startIndex,
      endIndex > all.length ? all.length : endIndex,
    );

    return list;
  }

  /// Get item by key
  Future<T?> getByKey<T>(Box box, dynamic key) async {
    return box.get(key);
  }

  /// Update item
  Future<void> update(Box box, dynamic key, T item) async {
    await box.put(key, item);
  }

  /// Delete item
  Future<void> delete(Box box, dynamic key) async {
    await box.delete(key);
  }

  /// Clear all items
  Future<void> clear(Box box) async {
    await box.clear();
  }

  /// Count
  Future<int> count(Box box) async {
    return box.length;
  }
}
