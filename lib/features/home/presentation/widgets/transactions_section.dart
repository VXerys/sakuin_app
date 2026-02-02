import 'package:flutter/material.dart';
import 'package:sakuin_app/core/theme/app_theme.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final transactions = [
      _Transaction(
        name: 'Darrell Steward',
        subtitle: 'Balance Receive',
        amount: r'$120.00',
        date: 'Oct 15, 2021',
        isReceive: true,
      ),
      _Transaction(
        name: 'Kathryn Murphy',
        subtitle: 'Balance Sent',
        amount: r'$120.00',
        date: 'Oct 15, 2021',
        isReceive: false,
      ),
      _Transaction(
        name: 'Ralph Edwards',
        subtitle: 'Balance Receive',
        amount: r'$120.00',
        date: 'Oct 15, 2021',
        isReceive: true,
      ),
    ];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Text(
                'Transactions',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF173A56),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color(0xFF8B93A6)),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Segment control
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F3),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                // Active pill
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.pinkActive,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Nov to Dec',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Month',
                      style: TextStyle(color: const Color(0xFF8B93A6)),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Year',
                      style: TextStyle(color: const Color(0xFF8B93A6)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Transactions list
          Column(
            children: List.generate(transactions.length, (index) {
              final tx = transactions[index];
              return Column(
                children: [
                  _TransactionRow(transaction: tx),
                  if (index != transactions.length - 1)
                    const SizedBox(height: 14),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _Transaction {
  final String name;
  final String subtitle;
  final String amount;
  final String date;
  final bool isReceive;

  _Transaction({
    required this.name,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.isReceive,
  });
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({required this.transaction});

  final _Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bg = transaction.isReceive
        ? const Color(0xFFE8FFF4)
        : const Color(0xFFFCE9EE);
    final iconColor = transaction.isReceive
        ? const Color(0xFF1EA46D)
        : const Color(0xFFF45C87);

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(6),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              transaction.isReceive ? Icons.arrow_downward : Icons.arrow_upward,
              color: iconColor,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF173A56),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction.subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF8B93A6),
                ),
              ),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              transaction.amount,
              style: theme.textTheme.titleMedium?.copyWith(
                color: const Color(0xFFEF4A7D),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              transaction.date,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF8B93A6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
