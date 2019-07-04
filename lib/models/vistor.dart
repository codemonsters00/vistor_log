class Visitor {
   String name;
   String phone;
   String email;
   String staffToSee;
   bool seen;

  Visitor({
    this.name,
    this.phone,
    this.email,
    this.staffToSee,
    this.seen,
  });

  factory Visitor.fromJson(Map<String, dynamic> parsedJson) {
    return Visitor(
        name: parsedJson['name'],
        phone: parsedJson['phone'],
        email: parsedJson['email'],
        staffToSee: parsedJson['staffToSee'],
        seen: parsedJson['seen']
        );
        
  }
}