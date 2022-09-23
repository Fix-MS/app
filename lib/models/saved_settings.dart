class SavedSettings {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  SavedSettings({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  SavedSettings copy() {
    return SavedSettings(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}