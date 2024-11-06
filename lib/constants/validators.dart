class Validators {
  // Validate First Name
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }
    if (value.length > 30) {
      return 'First name must not exceed 30 characters';
    }
    return null;
  }

  // Validate Last Name
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    if (value.length < 2) {
      return 'Last name must be at least 2 characters long';
    }
    if (value.length > 30) {
      return 'Last name must not exceed 30 characters';
    }
    return null;
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    String pattern = r'^\d{10}$'; // Ensures exactly 10 digits
    RegExp regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+$'; // Basic email format
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Nickname
  static String? validateNickname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a nickname';
    }
    if (value.length < 2) {
      return 'Nickname must be at least 2 characters long';
    }
    if (value.length > 20) {
      return 'Nickname must not exceed 20 characters';
    }
    return null;
  }
}
