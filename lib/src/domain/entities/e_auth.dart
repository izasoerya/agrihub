class EntitiesAuth {
  final String uid;
  final String displayName;
  final String email;
  final String password;
  final String? photoURL;

  EntitiesAuth({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.password,
    this.photoURL,
  });

  EntitiesAuth copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? password,
    String? photoURL,
  }) {
    return EntitiesAuth(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      password: password ?? this.password,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  factory EntitiesAuth.fromJson(Map<String, dynamic> json) {
    return EntitiesAuth(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      password: json['password'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'password': password,
      'photoURL': photoURL,
    };
  }
}
