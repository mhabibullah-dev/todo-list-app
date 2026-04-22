import 'package:flutter/material.dart';
import '../models/todo_item.dart';

/// A single task row styled after the Stitch "Minimalist Task Manager" card design.
/// - White card, 8dp radius, ambient Indigo shadow
/// - Round checkbox (Indigo border → solid Indigo fill when checked)
/// - Strikethrough + dimmed text when done
/// - Dismissible with red delete background
class TaskTile extends StatelessWidget {
  final TodoItem task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme texts = Theme.of(context).textTheme;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: _buildDeleteBackground(colors),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // Ambient Indigo-tinted shadow (Stitch design: "soft, low-opacity")
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3F51B5).withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: GestureDetector(
            onTap: onToggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: task.isDone ? colors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: task.isDone
                      ? colors.primary
                      : colors.primary.withValues(alpha: 0.7),
                  width: 2,
                ),
              ),
              child: task.isDone
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          title: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: (texts.bodyLarge ?? const TextStyle()).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: task.isDone
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : const Color(0xFF1A1B22),
              decoration:
                  task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            child: Text(task.title),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.drag_handle_rounded, size: 20),
            color: const Color(0xFF757684),
            onPressed: null, // visual affordance only
            tooltip: 'Swipe left to delete',
          ),
          onTap: onToggle,
        ),
      ),
    );
  }

  Widget _buildDeleteBackground(ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: colors.error,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_outline_rounded, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text(
            'DELETE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
