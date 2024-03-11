class Contact {
  final int id;
  final String name,number, imgUrl;

  Contact(this.id,{
    required this.name,required this.number,
    required this.imgUrl,
  });
}

List<Contact> contactData = [
  new Contact(00,
    name: "Elon Musk",number: '9000000001',
    imgUrl:
    "https://www.investopedia.com/thmb/XJDLdvCuNbcWk_EVZzXx84ae82c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1258889149-1f50bb87f9d54dca87813923f12ac94b.jpg",
  ),
  new Contact(01,
    name: "Bill Gates",number: '9005400001',
    imgUrl: "https://people.com/thmb/J1rjybBvnhWJQFmU3JJjrB0rG-M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(584x489:586x491)/bill-gates-01-122122-3dca1a10ca5b4473af97402696129443.jpg",
  ),
  new Contact(02,
    name: "Ratan Tata",number: '940580016',
    imgUrl: "https://c.ndtvimg.com/2023-12/k7v5t9vs_ratan-tata_625x300_28_December_23.jpeg",
  ),
  new Contact(03,
    name: "Sujith Narayanan,",number: '90054890001',
    imgUrl: "https://images.livemint.com/img/2021/03/28/1600x900/Sujith_Narayanan_1616924204918_1616924242153.jpg",
  ),
  new Contact(04,
    name: "Sundar Pichai",number: '8097000212',
    imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Sundar_Pichai_%282023%29_cropped.jpg/1200px-Sundar_Pichai_%282023%29_cropped.jpg",
  ),
  new Contact(05,
    name: "Sam Altman",number: '8097080212',
    imgUrl: "https://media.cnn.com/api/v1/images/stellar/prod/230516104426-01-openai-ceo-samuel-altman-ai-oversight-senate-hearing-0516.jpg",
  ),
  new Contact(06,
    name: "Satya Nadela",number: '8098000212',
    imgUrl: "https://pbs.twimg.com/profile_images/1221837516816306177/_Ld4un5A_400x400.jpg",
  ),
  new Contact(07,
    name: "Anand mahindra",number: '8097000282',
    imgUrl: "https://www.mahindra.com/sites/default/files/2022-10/AM_0.jpg",
  ),
  new Contact(08,
    name: "Hitesh Chaudhari",number: '7097000212',
    imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ooNeHd47P2eWXILlp7NC76xM4azFL4pg_A&usqp=CAU",
  ),
  new Contact(09,
    name: "Harry",number: '8797000212',
    imgUrl: "https://yt3.googleusercontent.com/ytc/AIdro_krnyU9zev1u94JYs4opG8p1sYE3HQ9oButitIb7A=s900-c-k-c0x00ffffff-no-rj",
  ),
];

