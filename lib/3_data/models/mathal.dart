// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Mathal {
  String content;
  String explanation;
  Mathal({
    required this.content,
    required this.explanation,
  });

  Mathal copyWith({
    String? content,
    String? explanation,
  }) {
    return Mathal(
      content: content ?? this.content,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'explanation': explanation,
    };
  }

  factory Mathal.fromMap(Map<String, dynamic> map) {
    return Mathal(
      content: map['content'] as String,
      explanation: map['explanation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mathal.fromJson(String source) => Mathal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Mathal(content: $content, explanation: $explanation)';

  @override
  bool operator ==(covariant Mathal other) {
    if (identical(this, other)) return true;
  
    return 
      other.content == content &&
      other.explanation == explanation;
  }

  @override
  int get hashCode => content.hashCode ^ explanation.hashCode;
}
