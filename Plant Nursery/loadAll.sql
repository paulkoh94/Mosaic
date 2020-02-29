use plant_nursery;

delete from measurement;
delete from logs;
delete from potted;
delete from pots;
delete from requirements;
delete from tray;
delete from weather_station;
delete from plants;
delete from weather_station;
insert into weather_station values('0,0');
insert into weather_station values('3,0');
insert into weather_station values('0,3');
insert into weather_station values('3,3');
insert into tray values('t-1433b89', '0,0', '2019-05-13 12:32:02');
insert into tray values('t-8572k92', '0,0', '2019-03-04 12:11:25');
insert into tray values('t-2512i22', '3,0', '2019-04-11 14:20:15');
insert into tray values('t-9928i12', '0,3', '2019-05-02 13:45:50');
insert into tray values('t-1154e28', '0,3', '2019-04-29 10:31:12');
insert into tray values('t-0903l11', '3,3', '2019-05-01 09:51:31');

-- veggies
insert into plants values('Solanum Lycopersicum', 'Tomato', 'Plum Tomato', 'vegetable', 
	'Oval shape, red in color, low number of seed compartments, high solid content',
    '5-6 days');
insert into plants values('Solanum Lycopersicum', 'Tomato', 'Cherry Tomato', 'vegetable', 
    'Small, round, sweet, red color, 1-2cm large', '5-6 days');
insert into plants values('Solanum Melongena', 'Eggplant', 'Purple Eggplant','vegetable',
	'Elongated oval shape, thicker at bottom, Dark purple color', '7-14 days');
insert into plants values('Solanum Melongena', 'Eggplant', 'Casper Eggplant','vegetable',
	'Shorter length, thick, white in color','7-14 days');
insert into plants values('Allium Cepa L', 'Onion', 'Red Onion', 'vegetable',
	'Bulb shaped, oval, Deep red colour, strong smell and taste','7-10 days');
insert into plants values('Allium Cepa L', 'Onion', 'Sweet Onion', 'vegetable',
	'Bulb shaped, oval, white color, mild smell and taste', '7-10 days');
insert into plants values('Daucus Carota','Carrot','Danvers Carrot', 'vegetable',
	'Medium size, longer root, dark orange color, "half size"', '14-21 days');
insert into plants values('Daucus Carota','Carrot','Chantenay Carrot', 'vegetable',
	'Short, thick, orange color, sweet and crisp', '14-21 days');
insert into plants values('Brassica Oleracea', 'Wild Cabbage', 'Cabbage','vegetable',
	'Light green, dense leaves, spherical','3-4 days');
insert into plants values('Brassica Oleracea', 'Wild Cabbage', 'Broccoli','vegetable',
	'Dark green, tree-like structure coming out of a thick stalk','10-14 days');
insert into plants values('Cucurbita Pepo', 'Squash', 'Pumpkin', 'vegetable',
	'Round, spherical, deep orange color, thick shell, rich full taste', '5-10 days');
insert into plants values('Cucurbita Pepo', 'Squash', 'Acorn Squash', 'vegetable',
	'Dark green, round with longitudinal ridges, with yellow-orange inside', '7-12 days');
    
-- fruits
insert into plants values('Capsicum Annuum', 'Chile Pepper', 'Jalapeno', 'fruit',
	'Medium sized pepper, dark green, firm smooth flesh, spicy taste', '10-14 days');
insert into plants values('Capsicum Annuum', 'Chile Pepper', 'Bell Pepper', 'fruit',
	'Variety of colors, oval shape with longitudinal ridges, mild taste', '7-8 days');
insert into plants values('Cucumis Melo', 'Muskmelon', 'Honeydew', 'fruit',
	'Slightly oval, light green/brown husk, pale green flesh, sweet taste', '8-10 days');
insert into plants values('Cucumis Melo', 'Muskmelon', 'Cantaloupe', 'fruit',
	'Slightly oval, light brown husk, pale orange flesh, sweet taste', '7-14 days');
insert into plants values('Rubus Ursinus', 'Blackberry', 'California Blackberry', 'fruit',
	'Shrub with dark black/purple berries, slightly sour tasting berries', '15-20 days');
insert into plants values('Rubus Ursinus', 'Blackberry', 'Pacific Dewberry', 'fruit',
	'Shrub with dark purple berries, sweet/sour tasting berries', '15-20 days');
insert into plants values('Fragaria Ananassa', 'Strawberry', 'Allstar', 'fruit',
	'Bright orange/red berries, sweet flavor', '7-14 days');
insert into plants values('Fragaria Ananassa', 'Strawberry', 'Honeoye', 'fruit',
	'Glossy red appearance, firm, mild/sweet flavor', '7-14 days');
insert into plants values('Vitis Labrusca', 'Fox Grape', 'Concord Grape', 'fruit',
	'Light brown leaves, dark blue/purple grapes, sweet flavor', '14-56 days');
insert into plants values('Vitis Labrusca', 'Fox Grape', 'Delaware Grape', 'fruit',
	'Light greenleaves, light purple grapes, sweet flavor', '21-46 days');
insert into plants values('Ananas Comosus', 'Pineapple', 'Hilo', 'fruit',
	'Compact, cylindrical, sweet/sour flavor', '100-180 days');
insert into plants values('Ananas Comosus', 'Pineapple', 'Kona Sugarloaf', 'fruit',
	'Cylindrical, white flesh, sweet flavor', '100-180 days');

-- herbs
insert into plants values('Ocimum Basilicum', 'Basil', 'Lettuce Leaf Basil', 'herb',
	'Large crinkled leaves, short plant, sweet flavor', '5-10 days');
insert into plants values('Ocimum Basilicum', 'Basil', 'Cinnamon Basil', 'herb',
	'Dark green, shiny leaves, short plant, spicy flavor', '5-10 days');
insert into plants values('Laurus Nobilis', 'Bayleaf', 'Mediterranean Bay Leaf', 'herb',
	'Dull green, clean leaves', '14-180 days');
insert into plants values('Laurus Nobilis', 'Bayleaf', 'California Bay Leaf', 'herb',
	'Green ,crinkly leaves', '14-180 days');
insert into plants values('Coriandrum Sativum', 'Coriander', 'European Coriander', 'herb',
	'Tart taste, light grean leaves', '7-9 days');
insert into plants values('Coriandrum Sativum', 'Coriander', 'Indian Coriander', 'herb',
	'Tart taste, light grean leaves, skinny stalk', '7-9 days');
insert into plants values('Cuminum Cyminum', 'Cumin', 'Indian Cumin', 'herb',
	'Slender stem, small pink flowers', '7-14 days');
insert into plants values('Cuminum Cyminum', 'Cumin', 'Morrocon Cumin', 'herb',
	'Slender stem, small white flowers', '7-14 days');
insert into plants values('Petroselinum Crispum', 'Parsley', 'Leaf Parsley', 'herb',
	'Deep light green, leafy, strong flavor', '10-25 days');
insert into plants values('Petroselinum Crispum', 'Parsley', 'Root Parsley', 'herb',
	'Green, deep roots', '10-25 days');
insert into plants values('Origanum Vulgare', 'Oregano', 'Aureum', 'herb',
	'Mild taste,', '7-14 days');
insert into plants values('Origanum Vulgare', 'Oregano', 'Greek Kaliter', 'herb',
	'Mild taste, small, hardy, dark, compact, thick, silvery-haired leaves, strong taste',
    '7-14 days');
    
-- Vegetables
insert into requirements values('Solanum Lycopersicum',
	'Fertilize right after planting. Fertilize once every one to two weeks after fruit.',
	'Water once every morning until flowered, then twice a day once flowered.',
    'Daytime: 65-85 degrees Fahrenheit | Nighttime: below 85 degrees farenheight.',
    'Daytime: 80%-90% | Nighttime: 65%-75%',
    'Normal light hours | Shorten daytime to ripen faster');
insert into requirements values('Solanum Melongena',
	'Fertilize right after planting, Fertilize once a week after fruit.',
    'Water once every morning',
    'Daytime: 70-80 degrees farenheight | Nighttime: below 80 degrees farenheight',
    'Daytime: 70%-90% | Nighttime: 60%-70%',
	'Normal light hours');
insert into requirements values('Allium Cepa L',
	'Fertilize every 2 weeks',
	'Water every morning',
    'Daytime: 70-90 degrees farenheight| Nighttime: below 80 degrees farenheight',
	'Daytime: 80% | Nighttime: 60%',
    '6-8 hours a day');
insert into requirements values('Daucus Carota',
	'Fertilize every 2 weeks',
    'Water twice a day',
    '70-90 degrees farenheight',
    '80%',
    '6-8 hours a day');
insert into requirements values('Brassica Oleracea',
	'Fertilize every week once flowered',
    'Water twice a day',
    '50-70 degrees farenheight',
    '80%-90%',
    '6 hours a day');
insert into requirements values('Cucurbita Pepo',
	'Fertilize once every week once flowered',
    'Water twice a day',
    '65-80 degrees farenheight',
    '80%',
    '6-8 hours a day');

-- Fruit
insert into requirements values('Capsicum Annuum',
	'Fertilize once every two weeks',
    'Water once a day',
    '70-90 degrees farenheight',
    '70%-80%',
    '6-8 hours a day');
insert into requirements values('Cucumis Melo',
	'Fertilize once a week',
    'Water once a day',
    '80-90 degrees farenheight',
    '80%-90%',
    '7-8 hours a day');
insert into requirements values('Rubus Ursinus',
	'Fertilize once every two weeks',
    'Water twice a day',
    '70-80 degrees farenheight',
    '70%-80%',
    '6-8 hours a day');
insert into requirements values('Fragaria Ananassa',
	'Fertilize once every two weeks',
    'Water twice a day',
    '60degrees farenheight',
    '70%-80%',
    '6-8 hours a day');
insert into requirements values('Vitis Labrusca',
	'Fertilize once every two weeks',
    'Water twice a day',
    '50 degrees farenheight',
    '80%-90%',
    '6 hours a day');
    
insert into requirements values('Ananas Comosus',
	'Fertilize every week',
    'Water once a day',
    '70-90 degrees farenheight',
    '80%',
    '6-8 hours a day');
    
-- herbs
insert into requirements values('Ocimum Basilicum',
	'once every 4-6 weeks',
    'once every 3-4 days',
    '70-80 degrees farenheight',
    '60%',
    '6 hours a day');
insert into requirements values('Laurus Nobilis',
	'once every 3-4 weeks',
    'once every 3-4 days',
    'above 50 degrees farenheight',
    '60%',
    '6 hours a day');
insert into requirements values('Coriandrum Sativum',
	'once every 4 weeks',
    'once every 3 days',
    '70 degrees farenheight',
    '70%',
    '6 hours a day');
insert into requirements values('Cuminum Cyminum',
	'once every 3-5 weeks',
    'once every 4-5 days',
    '80 degrees farenheight',
    '50%',
    '6-8 hours a day');
insert into requirements values('Petroselinum Crispum',
	'once every 4 weeks',
    'once every 2 days',
    '80 degrees farenheight',
    '60%',
    '6 hours a day');
insert into requirements values('Origanum Vulgare',
	'once every 4-6 weeks',
    'once every 4 days',
    '70-90 degrees farenheight',
    '50%',
    '6-8 hours a day');

-- pots in 0,0 with lettuce leaf basil
insert into pots values('p-659a24', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-038j65', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-937q03', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-837t82', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-847y39', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-682h28', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-374y38', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-572z43', 't-1433b89', '2019-05-15', NULL, 1, 3);
insert into pots values('p-681n32', 't-1433b89', '2019-05-15', NULL, 1, 3);

insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-659a24');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-038j65');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-937q03');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-837t82');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-847y39');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-682h28');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-374y38');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-572z43');
insert into potted values('Ocimum Basilicum', 'Lettuce Leaf Basil', 'p-681n32');

-- pots in 3,0 with cinnamon basil
insert into pots values('p-281x84', 't-2512i22', '2019-05-12', NULL, 2, 4);
insert into pots values('p-928k17', 't-2512i22', '2019-05-12', NULL, 2, 4);
insert into pots values('p-572e86', 't-2512i22', '2019-05-12', NULL, 2, 4);
insert into pots values('p-682u33', 't-2512i22', '2019-05-01', '2019-05-09' , 5, 6);
insert into pots values('p-772b11', 't-2512i22', '2019-05-01', '2019-05-07' , 5, 6);
insert into pots values('p-883p42', 't-2512i22', '2019-05-01', '2019-05-07' , 5, 6);
insert into pots values('p-132a55', 't-2512i22', '2019-05-01', '2019-05-08' , 5, 6);
insert into pots values('p-029l22', 't-2512i22', '2019-05-01', '2019-05-08' , 5, 6);
insert into pots values('p-202u21', 't-2512i22', '2019-05-01', '2019-05-09' , 5, 6);

insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-281x84');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-928k17');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-572e86');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-682u33');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-772b11');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-883p42');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-132a55');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-029l22');
insert into potted values('Ocimum Basilicum', 'Cinnamon Basil', 'p-202u21');

-- pots in 0,3 with plum tomato
insert into pots values('p-667p12', 't-9928i12', '2019-02-03', '2019-02-09', 15, 12);
insert into pots values('p-909j11', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);
insert into pots values('p-522w75', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);
insert into pots values('p-003d12', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);
insert into pots values('p-638h32', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);
insert into pots values('p-856y21', 't-9928i12', '2019-02-03', '2019-02-09', 15, 12);
insert into pots values('p-673y21', 't-9928i12', '2019-02-03', '2019-02-09', 15, 12);
insert into pots values('p-572b43', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);
insert into pots values('p-682u55', 't-9928i12', '2019-02-03', '2019-02-08', 15, 12);

insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-667p12');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-909j11');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-522w75');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-003d12');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-638h32');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-856y21');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-673y21');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-572b43');
insert into potted values('Solanum Lycopersicum', 'Plum Tomato', 'p-682u55');

-- pots in 3,3 with cherry tomato
insert into pots values('p-662f28', 't-0903l11', '2019-04-03', '2019-04-09', 10, 8);
insert into pots values('p-112b43', 't-0903l11', '2019-04-03', '2019-04-08', 10, 8);
insert into pots values('p-884f21', 't-0903l11', '2019-04-03', '2019-04-08', 10, 8);
insert into pots values('p-466j23', 't-0903l11', '2019-04-03', '2019-04-09', 10, 8);
insert into pots values('p-383z49', 't-0903l11', '2019-04-03', '2019-04-08', 10, 8);
insert into pots values('p-673d56', 't-0903l11', '2019-04-03', '2019-04-08', 10, 8);
insert into pots values('p-883c32', 't-0903l11', '2019-04-03', '2019-04-10', 10, 8);
insert into pots values('p-244h96', 't-0903l11', '2019-04-03', '2019-04-09', 10, 8);
insert into pots values('p-111s53', 't-0903l11', '2019-04-03', '2019-04-08', 10, 8);

insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-662f28');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-112b43');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-884f21');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-466j23');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-383z49');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-673d56');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-883c32');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-244h96');
insert into potted values('Solanum Lycopersicum', 'Cherry Tomato', 'p-111s53');

-- pots in 0,0 with delaware grape
insert into pots values('p-018k32', 't-8572k92', '2019-03-10', '2019-04-22', 7, 12);
insert into pots values('p-764q01', 't-8572k92', '2019-03-10', '2019-04-01', 7, 12);
insert into pots values('p-888w11', 't-8572k92', '2019-03-10', '2019-04-02', 7, 12);
insert into pots values('p-634u19', 't-8572k92', '2019-03-10', '2019-04-08', 7, 12);
insert into pots values('p-062r26', 't-8572k92', '2019-03-10', '2019-04-14', 7, 12);
insert into pots values('p-822v69', 't-8572k92', '2019-03-10', '2019-04-21', 7, 12);

insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-018k32');
insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-764q01');
insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-888w11');
insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-634u19');
insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-062r26');
insert into potted values('Vitis Labrusca', 'Delaware Grape', 'p-822v69');


-- pots in 0,3 with concord grape
insert into pots values('p-917j32', 't-1154e28', '2019-03-01', '2019-03-28', 7, 12);
insert into pots values('p-573d22', 't-1154e28', '2019-03-01', '2019-04-11', 7, 12);
insert into pots values('p-445s98', 't-1154e28', '2019-03-01', '2019-03-30', 7, 12);
insert into pots values('p-582g47', 't-1154e28', '2019-03-01', '2019-04-20', 7, 12);
insert into pots values('p-012n38', 't-1154e28', '2019-03-01', '2019-04-02', 7, 12);
insert into pots values('p-055w99', 't-1154e28', '2019-03-01', '2019-03-26', 7, 12);

insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-917j32');
insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-573d22');
insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-445s98');
insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-582g47');
insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-012n38');
insert into potted values('Vitis Labrusca', 'Concord Grape', 'p-055w99');


-- events for 0,0
insert into logs values('p-659a24', '0,0', 3, 2, NULL, '2019-05-15 09:00:00');
insert into logs values('p-038j65', '0,0', 3, 2, NULL, '2019-05-15 09:01:00');
insert into logs values('p-937q03', '0,0', 3, 2, NULL, '2019-05-15 09:02:00');
insert into logs values('p-837t82', '0,0', 3, 2, NULL, '2019-05-15 09:03:00');
insert into logs values('p-847y39', '0,0', 3, 2, NULL, '2019-05-15 09:04:00');
insert into logs values('p-682h28', '0,0', 3, 2, NULL, '2019-05-15 09:05:00');
insert into logs values('p-374y38', '0,0', 3, 2, NULL, '2019-05-15 09:06:00');
insert into logs values('p-572z43', '0,0', 3, 2, NULL, '2019-05-15 09:07:00');
insert into logs values('p-681n32', '0,0', 3, 2, NULL, '2019-05-15 09:08:00');

insert into logs values('p-018k32', '0,0', 4, 4, NULL, '2019-04-13 10:00:00');
insert into logs values('p-634u19', '0,0', 3, 4, NULL, '2019-04-13 10:03:00');
insert into logs values('p-822v69', '0,0', 3, 3, NULL, '2019-04-20 10:05:00');
insert into logs values('p-062r26', '0,0', 4, 5, NULL, '2019-05-03 10:28:00');
insert into logs values('p-888w11', '0,0', 4, 5, NULL, '2019-05-08 11:00:00');



insert into measurement values('0,0', '75°F', '80%', 2500);
insert into measurement values('0,0', '75°F', '81%', 2400);
insert into measurement values('0,0', '80°F', '80%', 3700);
insert into measurement values('0,0', '80°F', '80%', 4000);
insert into measurement values('0,0', '80°F', '80%', 3950);


-- events for 3,0
insert into logs values('p-281x84', '3,0', 3, 3, NULL, '2019-05-12 09:00:00');
insert into logs values('p-928k17', '3,0', 3, 3, NULL, '2019-05-12 09:01:00');
insert into logs values('p-572e86', '3,0', 3, 3, NULL, '2019-05-12 09:02:00');
insert into logs values('p-682u33', '3,0', 2, 1, NULL, '2019-05-09 10:00:00');
insert into logs values('p-772b11', '3,0', 2, 1, NULL, '2019-05-07 10:05:00');
insert into logs values('p-883p42', '3,0', 2, 1, NULL, '2019-05-07 10:06:00');
insert into logs values('p-132a55', '3,0', 2, 1, NULL, '2019-05-08 10:10:00');
insert into logs values('p-029l22', '3,0', 2, 1, NULL, '2019-05-08 10:11:00');
insert into logs values('p-202u21', '3,0', 2, 1, NULL, '2019-05-09 10:00:00');

insert into measurement values('3,0', '75°F', '59%', 2800);
insert into measurement values('3,0', '76°F', '60%', 2600);
insert into measurement values('3,0', '75°F', '60%', 2300);
insert into measurement values('3,0', '76°F', '60%', 2500);
insert into measurement values('3,0', '76°F', '62%', 2500);
insert into measurement values('3,0', '76°F', '58%', 3000);
insert into measurement values('3,0', '75°F', '60%', 2900);
insert into measurement values('3,0', '75°F', '60%', 2750);

-- events for 0,3
insert into logs values('p-667p12', '0,3', 1, 1, NULL, '2019-02-03 13:00:00');
insert into logs values('p-909j11', '0,3', 2, 2, NULL, '2019-02-10 12:01:00');
insert into logs values('p-522w75', '0,3', 2, 3, NULL, '2019-02-27 11:01:00');
insert into logs values('p-003d12', '0,3', 3, 3, NULL, '2019-03-09 01:09:00');
insert into logs values('p-638h32', '0,3', 3, 4, NULL, '2019-03-30 15:21:00');
insert into logs values('p-856y21', '0,3', 4, 4, NULL, '2019-04-10 12:33:00');
insert into logs values('p-673y21', '0,3', 4, 4, NULL, '2019-04-15 11:54:00');
insert into logs values('p-572b43', '0,3', 4, 4, NULL, '2019-04-28 16:38:00');
insert into logs values('p-682u55', '0,3', 4, 5, NULL, '2019-05-10 13:43:00');

insert into logs values('p-445s98', '0,3', 3, 3, NULL, '2019-04-10 13:43:00');
insert into logs values('p-055w99', '0,3', 1, 2, NULL, '2019-04-21 13:43:00');
insert into logs values('p-582g47', '0,3', 3, 4, NULL, '2019-05-03 13:43:00');
insert into logs values('p-917j32', '0,3', 3, 3, NULL, '2019-04-23 13:43:00');
insert into logs values('p-012n38', '0,3', 3, 3, NULL, '2019-05-10 13:43:00');


insert into measurement values('0,3', '80°F', '80%', 3500);
insert into measurement values('0,3', '80°F', '79%', 3650);
insert into measurement values('0,3', '81°F', '79%', 3600);
insert into measurement values('0,3', '81°F', '79%', 3400);
insert into measurement values('0,3', '80°F', '80%', 3500);
insert into measurement values('0,3', '80°F', '80%', 3500);
insert into measurement values('0,3', '80°F', '80%', 3500);
insert into measurement values('0,3', '80°F', '80%', 3300);
insert into measurement values('0,3', '80°F', '80%', 3550);
insert into measurement values('0,3', '80°F', '80%', 3350);

-- events for 3,3
insert into logs values('p-662f28', '3,3', 1, 1, NULL, '2019-04-03 10:00:00');
insert into logs values('p-112b43', '3,3', 1, 1, NULL, '2019-04-03 10:01:00');
insert into logs values('p-884f21', '3,3', 2, 2, NULL, '2019-04-25 12:43:00');
insert into logs values('p-466j23', '3,3', 2, 2, NULL, '2019-04-25 12:44:00');
insert into logs values('p-383z49', '3,3', 3, 3, NULL, '2019-04-10 13:22:00');
insert into logs values('p-673d56', '3,3', 3, 3, NULL, '2019-04-15 12:33:00');
insert into logs values('p-883c32', '3,3', 3, 4, NULL, '2019-04-23 11:32:00');
insert into logs values('p-244h96', '3,3', 4, 4, NULL, '2019-04-20 15:30:00');

insert into measurement values('3,3', '80°F', '80%', 3800);
insert into measurement values('3,3', '80°F', '80%', 3700);
insert into measurement values('3,3', '80°F', '80%', 3900);
insert into measurement values('3,3', '80°F', '80%', 3600);
insert into measurement values('3,3', '80°F', '80%', 3850);
insert into measurement values('3,3', '80°F', '80%', 3650);
insert into measurement values('3,3', '80°F', '80%', 3550);
insert into measurement values('3,3', '80°F', '80%', 3550);
insert into measurement values('3,3', '80°F', '80%', 3450);