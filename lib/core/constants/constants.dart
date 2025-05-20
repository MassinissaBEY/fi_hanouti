final List<Map<String, String>> fullStepsList = [
  {
    'title': 'Step 1',
    'description':
        'Explore restaurants, pick delicious meals, and fill your cart.',
    'image': 'assets/images/1.png',
  },
  {
    'title': 'Step 2',
    'description':
        'Tap \'Get Order’ to reveal the code and enjoy meal discounts',
    'image': 'assets/images/2.png',
  },
  {
    'title': 'Step 3',
    'description':
        'If you\'re not at the restaurant, tap \'Save Code\' to store it for later',
    'image': 'assets/images/3.png',
  },
  {
    'title': 'Step 4',
    'description':
        'At the restaurant, show the QR code before paying to get the discount.',
    'image': 'assets/images/4.png',
  },
  {
    'title': 'Step 5',
    'description':
        'You\'ll see the final amount, current discount, and future loyalty savings.',
    'image': 'assets/images/5.png',
  },
];

// const List<Map<String, String>> fullStepsList = [
//   {
//     'title': 'Step 1',
//     'description': 'Explore les restaurants autour et ajoute au panier',
//     'image': 'assets/images/1.png'
//   },
//   {
//     'title': 'Step 2',
//     'description': 'Clique sur “obtenir mon code réduction”',
//     'image': 'assets/images/pic.png'
//   },
//   {
//     'title': 'Step 3',
//     'description': 'Copie ton code promo affiché',
//     'image': 'assets/images/pic.png'
//   },
//   {
//     'title': 'Step 4',
//     'description': 'Commande sur l’application partenaire',
//     'image': 'assets/images/pic.png'
//   },
//   {
//     'title': 'Step 5',
//     'description': 'Colle ton code dans la zone promo !',
//     'image': 'assets/images/pic.png'
//   },
// ];
final List<Map<String, String>> loyaltyStepsList = [
  {
    'image': 'assets/images/6.png',
    'description':
        'When you order 5 times from any restaurant on FelHanout app, you’ll get a discount on the fifth. Track your progress and rewards on the home page.',
  },
];

final List<Map<String, String>> bonusStepsList = [
  {
    'image': 'assets/images/7.png',
    'description':
        'When you order 5 times from any restaurant on FelHanout app, you’ll get a discount on the fifth. Track your progress and rewards on the home page.',
  },
];

final List<Map<String, dynamic>> menuList = [
  {'title': 'How do I get discounts?', 'contect': fullStepsList},
  {'title': 'How do I get loyalty discounts?', 'contect': loyaltyStepsList},
  {'title': 'How do I get a bonus discount?', 'contect': bonusStepsList},
];
