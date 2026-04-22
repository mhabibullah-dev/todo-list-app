import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskSheet extends StatefulWidget {
  final void Function(String title) onAdd;

  const AddTaskSheet({super.key, required this.onAdd});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _hasText = _controller.text.trim().isNotEmpty);
    });
    // Auto-focus the field when the sheet opens
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _controller.text.trim();
    if (title.isEmpty) return;
    widget.onAdd(title);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    // Shift up with keyboard
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Drag handle ─────────────────────────────────────────────
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFC5C5D4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // ── Sheet title ─────────────────────────────────────────────
          Text(
            'New Task',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1B22),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'What do you need to get done?',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFF454652),
            ),
          ),
          const SizedBox(height: 20),

          // ── Task title input ─────────────────────────────────────────
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            maxLines: 1,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF1A1B22),
            ),
            decoration: InputDecoration(
              hintText: 'e.g. Buy groceries, Call dentist…',
              prefixIcon: Icon(
                Icons.task_alt_rounded,
                color: colors.primary.withValues(alpha: 0.6),
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Add Task button ──────────────────────────────────────────
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _hasText ? 1.0 : 0.5,
            child: ElevatedButton.icon(
              onPressed: _hasText ? _submit : null,
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text('Add Task'),
            ),
          ),
          const SizedBox(height: 8),

          // ── Cancel button ────────────────────────────────────────────
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
