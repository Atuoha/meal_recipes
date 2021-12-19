enum Complexity{
  Simple,
  Challenging,
  Hard
}

enum Cost{
  Affordable,
  Pricey,
  Luxurious
}
class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Cost cost;
  final int duration;
  final String image;
  final Complexity complexity;
  final List<String> steps;
  final List<String> ingredients;
  final bool isLactose;
  final bool isVegan;
  final bool isVegatarian;
  final bool isGluten;


  String get complexityText{
    if(complexity == Complexity.Simple){
      return "Simple";
    }else if(complexity == Complexity.Hard){
      return "Hard";
    }else{
      return 'Challenging';
    }
  }

    String get costText{
    if(cost == Cost.Affordable){
      return "Affordable";
    }else if(cost == Cost.Pricey){
      return "Pricey";
    }else{
      return 'Luxuriious';
    }
  }


  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.cost,
    required this.complexity,
    required this.image,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isLactose,
    required this.isVegan,
    required this.isVegatarian,
    required this.isGluten,
  });
}
