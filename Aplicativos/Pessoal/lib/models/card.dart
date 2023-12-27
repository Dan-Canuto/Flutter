class Card {
  final String name;
  final String icon;
  final String showCard;
  final String link;
  
  Card(this.name, this.icon, this.showCard, this.link,);

  Card.fromJson(Map<String, dynamic>json):
    name = json['name'],
    icon = json['icon'],
    showCard = json['showCard'],
    link = json['link'];

  Map<String, dynamic> toJson(){
    return{
      'name' : name,
      'icon' : icon,
      'showCard' : showCard,
      'link' : link,
    };
  }

}
