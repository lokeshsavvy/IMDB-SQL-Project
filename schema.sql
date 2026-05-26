Create database IMDB;
use IMDB;
create table Movie(movie_id int primary key,movie_name varchar(50),release_year int);
insert into Movie values(1,'Hanuman',2024),(2,'Good Bad Ugly',2025),(3,'Dragon',2025),(4,'Thandel',2025),(5,'Tourist Family',2025);
create table Genre(genre_id int primary key, genre_name varchar(50));
insert into Genre values(1,'Comedy'),(2,'Action'),(3,'Drama'),(4,'Thriller'),(5,'Romance');
create table Movie_genre(movie_id int,genre_id int, primary key(movie_id,genre_id),
foreign key(movie_id) references Movie(movie_id), 
foreign key(genre_id) references Genre(genre_id));
insert into Movie_genre values(1,2),(2,2),(3,3),(4,5),(5,1);
create table Media(media_id int primary key,movie_id int, media_type varchar(20),URL varchar(100),foreign key(movie_id) references Movie(movie_id));
insert into Media values(101,1,'image','www.imdb.com'),(102,2,'video','www.moviezrulz.com'),(103,3,'image','www.movies.com');
create table Users(user_id int primary key, user_name varchar(20));
insert into Users values(1,'Lokesh'),(2,'Bluesattai'),(3,'Filmy Review');
create table Review(review_id int primary key,movie_id int,user_id int,rating int,comments varchar(100),foreign key(movie_id) references Movie(movie_id), foreign key(user_id) references Users(user_id));
insert into Review values(1,1,1,4,'Good Movie'),(2,2,2,3,'Average'),(3,1,2,3,'Good');
create table Artist(artist_id int primary key,artist_name varchar(50));
create table Skill(skill_id int primary key,skill_name varchar(50));
insert into Skill values(1,'Acting'),(2,'Dancing'),(3,'Singing');
create table Artist_skill(artist_id int,skill_id int, primary key(artist_id,skill_id),foreign key(artist_id) references Artist(artist_id),foreign key(skill_id) references Skill(skill_id));
insert into Artist_skill values(1,1),(1,2),(2,1),(3,3);
insert into Artist values(1, 'Teja Sajja'),(2, 'Ajith Kumar'),(3, 'Prashanth Varma');
create table Movie_artist(movie_id int,artist_id int, roles varchar(50),primary key (movie_id,artist_id,roles),foreign key(movie_id) references Movie(movie_id),foreign key (artist_id) references Artist(artist_id));
insert into Movie_artist values(1,1,'Actor'),(1,1,'Director'),(2,2,'Actor'),(3,3,'Singer');
select m.movie_name,g.genre_name from Movie m join Movie_genre mg on m.movie_id = mg.movie_id join Genre g on mg.genre_id = g.genre_id;
select m.movie_name,us.user_name,r.rating from Movie m join Review r on m.movie_id = r.movie_id join Users us on r.user_id = us.user_id;
select m.movie_name,g.genre_name,u.user_name,r.rating from Movie m join Movie_genre mg on m.movie_id = mg.movie_id join Genre g on mg.genre_id = g.genre_id join Review r on m.movie_id = r.movie_id join Users u on r.user_id = u.user_id;
select a.artist_name, s.skill_name from Artist a join Artist_skill ask on a.artist_id = ask.artist_id join Skill s on ask.skill_id = s.skill_id;
select m.movie_name, a.artist_name, ma.roles from Movie m join Movie_artist ma on m.movie_id = ma.movie_id join Artist a on ma.artist_id = a.artist_id;
select * from Media;
select * from Movie_genre;




