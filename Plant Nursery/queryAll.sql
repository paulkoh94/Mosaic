use plant_nursery

-- query 1
drop procedure if exists listCommonNames$$
delimiter??
create procedure listCommonNames()
begin
	select distinct common_name
    from plants A, potted B
    where A.species_name = B.species_name
end??
delimiter ;

-- query 2
drop procedure if exists varietyCount$$
delimiter??
create procedure varietyCount()
begin
	select distinct species_name, count(variety)
    from plants
    group by species_name
end??
delimiter ;

-- query 3
drop procedure if exists commonNameCount$$
delimiter??
create procedure commonNameCount(in input varchar(25))
begin
	select common_name, count(common_name)
    from potted natural inner join plants
    where common_name = 'Tomato'
    group by common_name
end??
delimiter ;

-- query 4
drop procedure if exists volumeCount$$
delimiter??
create procedure volumeCount(in input varchar(25))
begin
	select volume, count(volume)
    from (potted natural inner join plants) natural inner join pots
    where germ_date is not null and common_name = 'Tomato'
    group by volume
end??
delimiter ;

-- query 5
drop procedure if exists populousSpecies$$
delimiter??
create procedure populousSpecies()
begin
	select species_name, count(species_name) as populous
    from potted natural inner join pots
    where germ_date is not null
	group by species_name
    having count(species_name) = (select count(species_name) as p
			from potted natural inner join pots
			where germ_date is not null
			group by species_name
			order by p desc
			limit 1)
end??
delimiter ;

-- query 6
drop procedure if exists oldestVeg$$
delimiter??
create procedure oldestVeg()
begin
	select variety
    from potted natural inner join pots natural join plants
    where type = 'vegetable' and germ_date is not null
		and germ_date <= now() - interval 1 month 
		and now() - germ_date = (select now() - germ_date
								from potted natural inner join pots natural join plants
								where germ_date is not null
                                order by now() - germ_date desc
                                limit 1)
end??
delimiter ;

-- query 7
drop procedure if exists mostWater$$
delimiter??
create procedure mostWater()
begin
	select variety, avg(watering) as water
    from (potted natural inner join pots) natural inner join logs
    where germ_date is not null 
    group by variety
	having avg(watering) = (select avg(watering) as w
			from (potted natural inner join pots) natural inner join logs
			where germ_date is not null 
			group by variety
            order by w desc
            limit 1)
end??
delimiter ;

-- query 8
drop procedure if exists averageFood$$
delimiter??
create procedure averageFood()
begin
	select count(*)
    from (plants natural inner join (potted natural inner join pots)) natural inner join logs
    where type = 'herb' 
		and feeding > (select avg(feeding)
						from (plants natural inner join (potted natural inner join pots)) natural inner join logs
                        where type = 'vegetable')
end??
delimiter ;

-- query 9
drop procedure fruitLight$$
delimiter??
create procedure fruitLight(in given )
begin
	select common_name
    from plants natural join potted natural join logs natural join measurement natural join pots
    where type = 'fruit' and month(measure_time) = 05 and germ_date is not null
		and sum(light) > (select sum(light)
				from plants natural join potted natural join logs natural join measurement 
                natural join pots
                where type = 'fruit' and germ_date is not null
                and month(measure_time) = 04)

end??
delimiter ;
