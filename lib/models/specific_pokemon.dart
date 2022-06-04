class SpecificPokemon {
  SpecificPokemon({
    this.sprites,
  });

  SpecificPokemon.fromJson(dynamic json) {
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
  }

  Sprites? sprites;

  SpecificPokemon copyWith({
    Sprites? sprites,
  }) =>
      SpecificPokemon(
        sprites: sprites ?? this.sprites,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sprites != null) {
      map['sprites'] = sprites?.toJson();
    }
    return map;
  }
}

class Sprites {
  Sprites({
    this.other,
  });

  Sprites.fromJson(dynamic json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Other? other;

  Sprites copyWith({
    Other? other,
  }) =>
      Sprites(
        other: other ?? this.other,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (other != null) {
      map['other'] = other?.toJson();
    }
    return map;
  }
}

class Other {
  Other({
    this.officialartwork,
  });

  Other.fromJson(dynamic json) {
    officialartwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  OfficialArtwork? officialartwork;

  Other copyWith({
    OfficialArtwork? officialartwork,
  }) =>
      Other(
        officialartwork: officialartwork ?? this.officialartwork,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (officialartwork != null) {
      map['official-artwork'] = officialartwork?.toJson();
    }
    return map;
  }
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  OfficialArtwork.fromJson(dynamic json) {
    frontDefault = json['front_default'];
  }

  String? frontDefault;

  OfficialArtwork copyWith({
    String? frontDefault,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['front_default'] = frontDefault;
    return map;
  }
}
