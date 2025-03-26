import 'dart:convert';

class AppSettingsModel {
  final bool isOperationSavingEnabled;
  final bool isDarkMode;
  AppSettingsModel({
    this.isOperationSavingEnabled = true,
    this.isDarkMode = false,
  });

  AppSettingsModel copyWith({
    bool? isOperationSavingEnabled,
    bool? isDarkMode,
  }) {
    return AppSettingsModel(
      isOperationSavingEnabled:
          isOperationSavingEnabled ?? this.isOperationSavingEnabled,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isOperationSavingEnabled': isOperationSavingEnabled,
      'isDarkMode': isDarkMode,
    };
  }

  factory AppSettingsModel.fromMap(Map<String, dynamic> map) {
    return AppSettingsModel(
      isOperationSavingEnabled: map['isOperationSavingEnabled'] ?? false,
      isDarkMode: map['isDarkMode'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSettingsModel.fromJson(String source) =>
      AppSettingsModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppSettingsModel &&
        other.isOperationSavingEnabled == isOperationSavingEnabled &&
        other.isDarkMode == isDarkMode;
  }

  @override
  int get hashCode => isOperationSavingEnabled.hashCode ^ isDarkMode.hashCode;

  @override
  String toString() =>
      'AppSettingsModel(isOperationSavingEnabled: $isOperationSavingEnabled, isDarkMode: $isDarkMode)';
}
