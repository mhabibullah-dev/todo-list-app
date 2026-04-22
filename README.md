# 📝 My Tasks — Flutter Todo List App

A clean, minimalist **Flutter todo list app** built with Material Design 3, styled after the **Stitch "Minimalist Task Manager"** design system. Tasks are persisted locally using **SharedPreferences**, so your list survives app restarts.

---

## ✨ Features

- **Add Tasks** — Tap the `+` FAB to open a bottom sheet and type your task
- **Display Tasks** — All tasks shown in a smooth animated `ListView`
- **Complete Tasks** — Tap a task or its checkbox to mark it done (with strikethrough animation)
- **Delete Tasks** — Swipe left on any task to remove it, with an undo snackbar
- **Progress Tracking** — A live progress card shows how many tasks you've completed
- **Persistent Storage** — Tasks are saved via `SharedPreferences` and survive hot restarts
- **Personalized Greeting** — Time-aware greeting (Good morning/afternoon/evening, Habib)
- **Empty State** — A friendly state shown when no tasks are present

---

## 📱 Screenshots

### Home Screen — Empty State
> *No tasks added yet. The empty state with icon and greeting is shown.*

<!-- Add screenshot here -->
<!-- ![Empty State](screenshots/empty_state.png) -->

---

### Home Screen — With Tasks
> *Tasks displayed in a `ListView` with the progress card and percentage indicator.*

<!-- Add screenshot here -->
<!-- ![Home Screen with Tasks](screenshots/home_screen_tasks.png) -->

---

### Home Screen — Tasks In Progress
> *Some tasks checked off. Progress bar and "X of Y done" label update live.*

<!-- Add screenshot here -->
<!-- ![Tasks In Progress](screenshots/tasks_in_progress.png) -->

---

### Add Task — Bottom Sheet
> *The modal bottom sheet with auto-focused text input and "Add Task" button.*

<!-- Add screenshot here -->
<!-- ![Add Task Sheet](screenshots/add_task_sheet.png) -->

---

### Task Completed — Strikethrough Animation
> *A task after being toggled to done: checkbox fills with Indigo, text gets strikethrough.*

<!-- Add screenshot here -->
<!-- ![Task Completed](screenshots/task_completed.png) -->

---

### Delete Task — Swipe Gesture
> *Swiping a task left reveals the red delete background with the "DELETE" label.*

<!-- Add screenshot here -->
<!-- ![Swipe to Delete](screenshots/swipe_to_delete.png) -->

---

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point + ThemeData (Stitch design tokens)
├── models/
│   └── todo_item.dart             # TodoItem model with JSON serialization
├── services/
│   └── storage_service.dart       # SharedPreferences CRUD wrapper
├── screens/
│   └── home_screen.dart           # Main screen (header, progress, task list)
└── widgets/
    ├── task_tile.dart             # Individual task card (checkbox, swipe-to-delete)
    └── add_task_sheet.dart        # Bottom sheet for creating new tasks

.stitch/
└── metadata.json                  # Stitch project & screen reference IDs
```

---

## 🎨 Design System

Styled after the **Stitch "Minimalist Task Manager"**

| Token | Value | Usage |
|---|---|---|
| Primary | `#3F51B5` Deep Indigo | Buttons, checkboxes, header, FAB |
| Background | `#FBF8FF` Off-white | Scaffold background |
| Surface | `#FFFFFF` | Task cards, bottom sheet |
| On-surface | `#1A1B22` | Body text |
| Error | `#BA1A1A` | Swipe-to-delete background |
| Font | **Inter** (Google Fonts) | All text |
| Corner radius | 8 dp | Cards, inputs, buttons |
| Spacing unit | 4 px (8 px grid) | Padding & margins |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.11.0
- A connected device or simulator

### Run the app

```bash
# Install dependencies
flutter pub get

# Launch on connected device
flutter run
```

### Run tests

```bash
flutter test
```

### Analyze code

```bash
flutter analyze
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| [`shared_preferences`](https://pub.dev/packages/shared_preferences) | `^2.3.5` | Local task persistence |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | `^6.2.1` | Inter typeface from Stitch design system |


---

## 🛠️ Built With

- **Flutter** — Cross-platform UI framework
- **Stitch MCP** — UI design generation & design system source
- **SharedPreferences** — Lightweight local key-value storage
- **Google Fonts** — Inter typeface integration
- **Material Design 3** — Component and theming system

---

## 📄 License

This project is for personal/educational use.

---

*Designed using [Stitch by Google](https://stitch.withgoogle.com/) · Built with Flutter*
