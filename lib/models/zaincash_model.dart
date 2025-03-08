class ZainCash {
  int status;
  String data; // This will store the URL as a string

  ZainCash({
    required this.status,
    required this.data,
  });

  factory ZainCash.fromJson(Map<String, dynamic> json) => ZainCash(
    status: json["status"],
    data: json["data"],  // This is a string (URL)
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,  // The URL as a string
  };
}
