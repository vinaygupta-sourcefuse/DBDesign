use bms;

create table Author(
    author_id int primary key auto_increment,
    author varchar(50) not null
);

create table Category(
    category_id int primary key auto_increment,
    genre varchar(50) not null unique
);

create table Book(
    title varchar(100) not null,
    isbn int primary key,
    price int not null,
    author_id int,
    category_id int,
    pubDate date,
    foreign key (author_id) references  Author(author_id) on delete cascade,
    foreign key (category_id) references Category(category_id) on delete set null
);

insert into Author values (1 , "Vinay"),(2 , "Bilal"),(3 , "Vikas"),(4 , "Vishal");
select * from Author;

insert into Category values (101 , "Non-Fiction"),(102 , "Biography"),(103 , "History"),(104 , "Fiction");
select * from Category;


-- Insert into Book (added pubDate column and fixed ISBN format)
insert into Book (title, isbn, price, author_id, category_id, pubDate) values 
("The Great Gatsby", 10001, 199, 1, 101, '1925-04-10'),
("To Kill a Mockingbird", 10002, 159, 2, 102, '1960-07-11'),
("The Art of War", 10003, 189, 3, 103, '500-01-01'),
("Pride and Prejudice", 10004, 129, 4, 104, '1813-01-28'),
("Moby Dick", 10005, 219, 1, 101, '1851-10-18'),
("The Catcher in the Rye", 10006, 169, 2, 102, '1951-07-16'),
("War and Peace", 10007, 299, 3, 103, '1869-01-01'),
("Crime and Punishment", 10008, 249, 4, 104, '1866-01-01'),
("The Odyssey", 10009, 179, 1, 101, '800-01-01'),
("The Hobbit", 10010, 139, 2, 102, '1937-09-21'),
("The Brothers Karamazov", 10011, 239, 3, 103, '1880-01-01');
select * from Book;



select * from Book as b, Author as a where b.author_id = a.author_id;	
select * from Book as b, Category as c where c.category_id = b.category_id;
select * from Author as a, Category as c, Book as b where  a.author_id = b.author_id and c.category_id = b.category_id;
