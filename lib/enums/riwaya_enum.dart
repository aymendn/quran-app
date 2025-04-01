enum RiwayaEnum {
  warsh,
  hafs;

  String get quranTextDBName {
    return switch (this) {
      warsh => 'warsh',
      hafs => 'hafs',
    };
  }

  String get quranImagesFolder {
    return switch (this) {
      warsh => 'warsh-tajweed',
      hafs => 'hafs',
    };
  }
}
