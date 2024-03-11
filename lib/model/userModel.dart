class UserModel {
  final int id;
  final String name, bankName, upiId, joinedOn, imgUrl;

  UserModel(this.id,
      {required this.name,
      required this.imgUrl,
      required this.bankName,
      required this.upiId,
      required this.joinedOn});
}
List<UserModel> dummyData = [
  // Existing entries...
  new UserModel(
    00,
    name: "Elon Musk",
    imgUrl:
    "https://www.investopedia.com/thmb/XJDLdvCuNbcWk_EVZzXx84ae82c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1258889149-1f50bb87f9d54dca87813923f12ac94b.jpg",
    bankName: "SpaceX Bank",
    upiId: "elonmusk@spacex",
    joinedOn: "2022-06-12",
  ),
  new UserModel(
    01,
    name: "Bill Gates",
    imgUrl:
    "https://people.com/thmb/J1rjybBvnhWJQFmU3JJjrB0rG-M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(584x489:586x491)/bill-gates-01-122122-3dca1a10ca5b4473af97402696129443.jpg",
    bankName: "Microsoft Bank",
    upiId: "billgates@microsoft",
    joinedOn: "2022-09-25",
  ),
  new UserModel(
    02,
    name: "Ratan Tata",
    imgUrl:
    "https://c.ndtvimg.com/2023-12/k7v5t9vs_ratan-tata_625x300_28_December_23.jpeg",
    bankName: "Tata Sons Bank",
    upiId: "ratantata@tatasons",
    joinedOn: "2022-12-05",
  ),
  new UserModel(
    03,
    name: "Sujith Narayanan",
    imgUrl:
    "https://images.livemint.com/img/2021/03/28/1600x900/Sujith_Narayanan_1616924204918_1616924242153.jpg",
    bankName: "Axis Bank",
    upiId: "sujithnarayanan@axis",
    joinedOn: "2023-03-20",
  ),
  new UserModel(
    04,
    name: "Sundar Pichai",
    imgUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Sundar_Pichai_%282023%29_cropped.jpg/1200px-Sundar_Pichai_%282023%29_cropped.jpg",
    bankName: "Google Bank",
    upiId: "sundarpichai@google",
    joinedOn: "2023-08-10",
  ),
  new UserModel(
    05,
    name: "Sam Altman",
    imgUrl:
    "https://media.cnn.com/api/v1/images/stellar/prod/230516104426-01-openai-ceo-samuel-altman-ai-oversight-senate-hearing-0516.jpg",
    bankName: "OpenAI Bank",
    upiId: "samaltman@openai",
    joinedOn: "2022-11-15",
  ),
  new UserModel(
    06,
    name: "Satya Nadella",
    imgUrl:
    "https://pbs.twimg.com/profile_images/1221837516816306177/_Ld4un5A_400x400.jpg",
    bankName: "State Bank of India",
    upiId: "satyanadella@sbi",
    joinedOn: "2022-05-10",
  ),
  new UserModel(
    07,
    name: "Anand Mahindra",
    imgUrl: "https://www.mahindra.com/sites/default/files/2022-10/AM_0.jpg",
    bankName: "ICICI Bank",
    upiId: "anandmahindra@icici",
    joinedOn: "2022-08-15",
  ),
  new UserModel(
    08,
    name: "Hitesh Chaudhari",
    imgUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ooNeHd47P2eWXILlp7NC76xM4azFL4pg_A&usqp=CAU",
    bankName: "Axis Bank",
    upiId: "hiteshchaudhari@axis",
    joinedOn: "2023-01-20",
  ),
  new UserModel(
    09,
    name: "Harry",
    imgUrl:
    "https://yt3.googleusercontent.com/ytc/AIdro_krnyU9zev1u94JYs4opG8p1sYE3HQ9oButitIb7A=s900-c-k-c0x00ffffff-no-rj",
    bankName: "HDFC Bank",
    upiId: "harry@hdfc",
    joinedOn: "2023-04-05",
  ),
];

List<UserModel> businessdummyData = [
  new UserModel(
    00,
    name: "Indus",
    imgUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp0XYRsxP7r_VrjHkvi919nDZi-diXOlzgwg&usqp=CAU",
    bankName: "IndusInd Bank",
    upiId: "indus@indusind",
    joinedOn: "2023-02-15",
  ),
  new UserModel(
    01,
    name: "TATA",
    imgUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzNWTqHnz8yw5_aSLvJz8pjFLgZmqP06vN3w&usqp=CAU",
    bankName: "Tata Capital",
    upiId: "tata@tatacapital",
    joinedOn: "2023-05-20",
  ),
  new UserModel(
    02,
    name: "Mahindra",
    imgUrl:
    "https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/Mahindra_new_logo_2021.png/220px-Mahindra_new_logo_2021.png",
    bankName: "Mahindra Finance",
    upiId: "mahindra@mahindrafinance",
    joinedOn: "2023-08-10",
  ),
  new UserModel(
    03,
    name: "Jio",
    imgUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Reliance_Jio_Logo_%28October_2015%29.svg/2048px-Reliance_Jio_Logo_%28October_2015%29.svg.png",
    bankName: "Jio Payments Bank",
    upiId: "jio@jiopayments",
    joinedOn: "2022-11-30",
  ),
  new UserModel(
    04,
    name: "Vodafone",
    imgUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFF8EkLrqeZUoIZ9o7bq_Q9BELVF9TIRrMUg&usqp=CAU",
    bankName: "Vodafone Payments",
    upiId: "vodafone@vodafonepay",
    joinedOn: "2023-03-25",
  ),
  new UserModel(
    05,
    name: "BharatAI",
    imgUrl:
    "https://www.hindustantimes.com/ht-img/img/2023/04/11/1600x900/The-government-also-wants-to-embed-AI-in-different_1681218265620.jpg",
    bankName: "BharatAI Bank",
    upiId: "bharatai@bharataibank",
    joinedOn: "2023-07-15",
  ),
];




