String? validateFullName(String? value) {
  return value == null || value.trim().isEmpty ? 'Enter your full name' : null;
}

String? validatePhone(String? value) {
  return RegExp(r'^[0-9]{10}$').hasMatch(value?.trim() ?? '')
      ? null
      : 'Enter exactly 10 digits';
}

String? validateReason(String? value) {
  return (value?.trim().length ?? 0) >= 30
      ? null
      : 'Enter at least 30 characters';
}

String? validateFosterAge(String? value) {
  final age = int.tryParse(value?.trim() ?? '');
  if (age == null) return 'Enter your age as a whole number';
  return age < 18 ? 'You must be 18 or older to foster' : null;
}
