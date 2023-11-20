--1. Вывести имена всех игроков, которые не имеют достижений

select player.nickname from player 
left join achievement 
on player.id = achievement.player_id
where player_id is null

--2. Вывести имена всех игроков, у которых сумма очков больше 800 и их очки. В запросе желательно использовать 
--having

select player.nickname, sum(score.amount) from player 
join achievement 
on player.id = achievement.player_id
join score 
on achievement.id = score.achievement_id
group by nickname
having sum(amount) > 800

--3. Получить информацию об игроке, набравшем самое большое количество очков

select player.nickname, sum(score.amount) from player 
join achievement 
on player.id = achievement.player_id
join score 
on achievement.id = score.achievement_id
group by nickname 
order by sum(amount) desc
limit 1

--4. Подсчитать для каждой гильдии сумму всех очков всех ее игроков. Вывести название гильдии и кол-во очков по 
--убыванию, начиная  от самого наибольшего к наименьшему

select guild.name, sum(score.amount) from guild 
join player 
on guild.id = player.guild_id 
join achievement 
on achievement.player_id = player.id 
join score 
on achievement.id = score.achievement_id
group by guild.name
order by sum(score.amount) desc

--5. Вывести имя игрока и его гильдию, фамилия которого начинается с “B” и больше одной буквы

select player.nickname, guild.name from player 
join guild  
on guild.id = player.guild_id
where player.nickname like '% B_%'

--6. Создать в таблице гильдия новую команду

insert into guild (id, name) values 
(9, 'Heroes');

select * from guild 

--7. Создать в таблице player не менее 2-х игроков, которые должны входить в созданную вами гильдию

insert into player (id, nickname, date_of_start_game, guild_id) values 
(1, 'Nick C', '2021-05-11', 9),
(2, 'Anna Prit', '2022-10-03', 9);

select * from player

--8. Вывести всех игроков, кто вступил в гильдию, вместе с именем этой гильдии используя оператор join

select player.nickname, guild.name from player 
join guild 
on guild.id = player.guild_id


--9. Добавить к имени каждого игрока название гильдии одним запросом. 

select concat (player.nickname, ' ', guild.name) as NG from player 
join guild 
on guild.id = player.guild_id

--10. Вывести в алфавитном порядке названия всех уникальных достижений, которые были у игроков

select distinct name from achievement 
order by name


