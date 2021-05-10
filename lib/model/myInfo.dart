class MyInfo {
  dynamic first,
      last,
      phone,
      email,
  gender,
  password,
      educationValue,
      yearOfPassing,
      grade,
      experience,
      designation,
      domain,
      address,
      landmark,
      city,
      pinCode;

  MyInfo(
      {this.first,
      this.last,
      this.phone,
      this.email,
        this.gender,
        this.password,
      this.educationValue,
      this.yearOfPassing,
      this.grade,
      this.experience,
      this.designation,
      this.domain,
      this.address,
      this.landmark,
      this.city,
      this.pinCode});

  factory MyInfo.fromMap(Map<String, dynamic> json) => MyInfo(
        first: json["firstName"] == null ? null : json["firstName"],
        last: json["lastName"] == null ? null : json["lastName"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
    gender: json["gender"] == null ? null : json["gender"],
    password: json["password"] == null ? null : json["password"],
        educationValue:
            json["educationValue"] == null ? null : json["educationValue"],
        yearOfPassing:
            json["yearOfPassinge"] == null ? null : json["yearOfPassing"],
        grade: json["grade"] == null ? null : json["grade"],
        experience: json["experience"] == null ? null : json["experience"],
        designation: json["designation"] == null ? null : json["designation"],
        domain: json["domain"] == null ? null : json["domain"],
        address: json["address"] == null ? null : json["address"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        city: json["city"] == null ? null : json["city"],
        pinCode: json["pinCode"] == null ? null : json["pinCode"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": first == null ? null : first,
        "lastName": last == null ? null : last,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
    "gender":gender == null? null : gender,
  "password":password == null?null:password,
        "educationValue": educationValue == null ? null : educationValue,
        "yearOfPassinge": yearOfPassing == null ? null : yearOfPassing,
        "grade": grade == null ? null : grade,
        "experience": experience == null ? null : experience,
        "designation": designation == null ? null : designation,
        "domain": domain == null ? null : domain,
        "address": address == null ? null : address,
        "landmark": landmark == null ? null : landmark,
        "city": city == null ? null : city,
        "pinCode": pinCode == null ? null : pinCode,
      };
}