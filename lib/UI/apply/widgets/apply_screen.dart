import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/animal.dart';
import '../../animal/view_models/animal_view_model.dart';
import '../../animals/view_models/animals_view_model.dart';
import '../view_models/apply_view_model.dart';

class ApplyScreen extends ConsumerStatefulWidget {
  const ApplyScreen({super.key, required this.animalId});

  final String animalId;

  @override
  ConsumerState<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends ConsumerState<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _reasonController = TextEditingController();
  final _ageController = TextEditingController();
  String? _visitTime;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();
    _ageController.dispose();
    _visitTime = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animals = ref.watch(animalsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Apply')),
      body: animals.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (animals) {
          final animal = animals
              .where((animal) => animal.id == widget.animalId)
              .firstOrNull;
          if (animal == null) {
            return const Center(child: Text('Animal not found'));
          }
          final fostering = animal.need == Need.foster;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apply to ${fostering ? 'foster' : 'adopt'} ${animal.name}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (!fostering) Text('Adoption fee: ${feeText(animal)}'),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Full name'),
                    textCapitalization: TextCapitalization.words,
                    validator: validateFullName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                    validator: validatePhone,
                  ),
                  const SizedBox(height: 12),
                  if (fostering)
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(labelText: 'Your age'),
                      keyboardType: TextInputType.number,
                      validator: validateFosterAge,
                    )
                  else
                    TextFormField(
                      controller: _reasonController,
                      decoration: const InputDecoration(
                        labelText: 'Why is this animal a good match for you?',
                        alignLabelWithHint: true,
                      ),
                      minLines: 3,
                      maxLines: 5,
                      validator: validateReason,
                    ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                     onPressed: () async {
                       final time = await context.push<String>('/visit-times');
                       if (!mounted || time == null) return;
                         setState(() { _visitTime = time; }); },
  child: const Text('Choose a visit time'),
),
if (_visitTime != null) Text(_visitTime!),
const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _formKey.currentState!.validate(),
                    child: const Text('Check details'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
