import '../domain/models/animal.dart';

const fakeAnimals = <Animal>[
  Animal(
    id: '1',
    name: 'Juniper',
    species: Species.cat,
    breed: 'Domestic Shorthair',
    sex: 'Female',
    ageMonths: 6,
    need: Need.adoption,
    description: 'A curious kitten who climbs everything, including you.',
  ),
  Animal(
    id: '2',
    name: 'Captain',
    species: Species.cat,
    breed: 'Domestic Longhair',
    sex: 'Male',
    ageMonths: 36,
    need: Need.adoption,
    description: 'Calm and fluffy. Likes a sunny window and a quiet house.',
  ),
  Animal(
    id: '3',
    name: 'Marmalade',
    species: Species.cat,
    breed: 'Orange Tabby',
    sex: 'Male',
    ageMonths: 144,
    need: Need.adoption,
    description: 'A senior gentleman who will purr on your lap all evening.',
  ),
  Animal(
    id: '4',
    name: 'Bannock',
    species: Species.dog,
    breed: 'Labrador Retriever mix',
    sex: 'Male',
    ageMonths: 5,
    need: Need.adoption,
    description:
        'A happy puppy who is learning to sit. Needs a patient family.',
  ),
  Animal(
    id: '5',
    name: 'Kelpie',
    species: Species.dog,
    breed: 'Border Collie mix',
    sex: 'Female',
    ageMonths: 48,
    need: Need.adoption,
    description:
        'Very smart and very busy. Best with an active home and a yard.',
  ),
  Animal(
    id: '6',
    name: 'Duchess',
    species: Species.dog,
    breed: 'Beagle',
    sex: 'Female',
    ageMonths: 108,
    need: Need.adoption,
    description:
        'Gentle and good with older children. Loves short walks and long naps.',
  ),
  Animal(
    id: '7',
    name: 'Pickles',
    species: Species.other,
    breed: 'Holland Lop rabbit',
    sex: 'Male',
    ageMonths: 24,
    need: Need.adoption,
    description:
        'A litter-trained rabbit who likes cilantro and having his ears left alone.',
  ),
  Animal(
    id: '8',
    name: 'Mittens',
    species: Species.cat,
    breed: 'Domestic Shorthair',
    sex: 'Female',
    ageMonths: 2,
    need: Need.foster,
    fosterReason:
        'Too young for adoption. Needs a home until she is old enough.',
    description: 'Tiny, loud and fearless.',
  ),
  Animal(
    id: '9',
    name: 'Rocket',
    species: Species.dog,
    breed: 'Husky mix',
    sex: 'Male',
    ageMonths: 72,
    need: Need.foster,
    fosterReason:
        'Recovering from surgery. Needs a quiet place to rest for a few weeks.',
    description:
        'Friendly and talkative. Will be ready for adoption once he heals.',
  ),
  Animal(
    id: '10',
    name: 'Pepper',
    species: Species.cat,
    breed: 'Tortoiseshell',
    sex: 'Female',
    ageMonths: 84,
    need: Need.foster,
    fosterReason: 'Needs a break from shelter life.',
    description: 'Shy at first, then very affectionate.',
  ),
];

/// The visit times offered in the visit-time picker.
const visitTimes = <String>[
  'Monday 10:00',
  'Monday 14:00',
  'Wednesday 10:00',
  'Wednesday 14:00',
  'Friday 10:00',
  'Saturday 11:00',
];
