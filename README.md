# 📱 Expense Tracker Lite

Lightweight expense tracking mobile application with offline-first storage, API integration for currency conversion, pagination, date filtering, and export functionality (CSV & PDF).

---

## 📌 Overview of the Architecture and Structure

The project follows **Onion Clean Architecture** with clear separation of concerns:

- **Presentation Layer**
    - Flutter UI (Widgets).
    - State handled by **Cubit (flutter_bloc)**.
- **Application Layer**
    - Business logic (use cases).
- **Domain Layer**
    - Entities, repositories (abstract contracts).
- **Infrastructure (Data) Layer**
    - Hive for offline persistence.
    - REST API for currency conversion.
    - Local services for Export (CSV & PDF).

**Folder Structure**:  

lib/
├── core/ # Shared utilities, constants, extensions
├── features/
│ ├── dashboard/ # Dashboard Cubit, filters, pagination
│ ├── add_expense/ # Add new expense
│ ├── currency/ # Currency conversion via API
│ ├── export/ # CSV/PDF export implementation
│ └── common/ # Shared widgets (buttons, text fields, etc.)
└── main.dart


---

## 🌀 State Management Approach

- State management is handled with **Cubit** (a simplified BLoC).
- No logic inside UI widgets → all handled in Cubit.
- Examples:
  - `DashboardExpenseCubit` → fetch, paginate, and filter expenses.
  - `AddExpenseCubit` → handle form input, save to Hive.
  - `ExportCubit` → handle export to CSV/PDF.

---

## 🌐 API Integration

- Currency conversion uses:  
  https://open.er-api.com/v6/latest/USD
- Flow:
1. User adds an expense with an amount.
2. API called to fetch exchange rate.
3. Converted USD value stored along with original amount in Hive.

---

## 📖 Pagination & Filtering

- **Pagination**:
- Implemented locally via Hive.
- Uses a `ScrollController` inside Cubit to load more data when reaching the end.

- **Filters**:
- Supported filters:
  - `Today`
  - `This Week`
  - `This Month`
  - `All`
- Applied before pagination.

---

🎨 UI Features

Dashboard:

Shows total balance, income, expenses.

Transactions list with infinite scroll.

Date filters (today, week, month, all).

Add Expense:

Form with category, amount, date, and currency.

Calls API to convert to USD.

Export Buttons:

Export transactions to CSV or PDF with one tap.

🚀 How to Run the Project

Clone the repo:

git clone https://github.com/username/expense_tracker_lite.git
cd expense_tracker_lite


Install dependencies:

flutter pub get


Generate Hive adapters:

flutter pub run build_runner build


Run the app:

flutter run

🐞 Known Bugs / Unimplemented Features

API error handling is minimal.

No cloud sync for receipts/images.

No dark mode yet.

Limited test coverage.

## 📤 Export (CSV & PDF)

### Clean Architecture Flow

- **Domain**:
```dart
abstract class ExpenseExportRepository {
  Future<String> exportToCsv(List<ExpenseModel> expenses);
  Future<String> exportToPdf(List<ExpenseModel> expenses);
}

