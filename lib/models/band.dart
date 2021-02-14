
class Band {

  String id;
  String name;
  int votes;

  Band({
    this.id,
    this.name,
    this.votes
  });

  //Respuesta de BackEnd en Mapas

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
    id:    obj['id'],
    name:  obj['name'],
    votes: obj['votes'],  
  ); 



}