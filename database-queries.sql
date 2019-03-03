create table Users(
[user_id] int IDENTITY(1,1) primary key,
username varchar(100) not null,
fullname varchar(200),
email varchar(200),
dob date,
password varchar(255)
);
create table Items(
item_id int IDENTITY(1,1) primary key,
title varchar(200) not null,
category varchar(200),
descr varchar(MAX),
pictures varchar(400)
);
create table ItemRating(
item_id int foreign key references Items(item_id) on delete cascade,
[user_id] int foreign key references Users([user_id]) on delete cascade,
rating int
);

insert into ItemRating (item_id, [user_id], rating) values (15, 1, 3);
SELECT AVG(rating) AS rating FROM ItemRating WHERE item_id =15;
SELECT review, username FROM [ItemReviews], [Users] WHERE ([item_id] =21) AND [Users].[user_id] = [ItemReviews].[user_id];

create table ItemReviews(
item_id int foreign key references Items(item_id) on delete cascade,
[user_id] int foreign key references Users([user_id]) on delete cascade,
review varchar(2000)
)
Delete top(1) from ItemRating where item_id=15;

SELECT review, username, fullname, rating 
FROM [ItemReviews], [Users], [ItemRating] 
WHERE ( [ItemReviews].[item_id] = @item_id
AND [Users].[user_id] = [ItemReviews].[user_id])
OR ( [ItemRating].[item_id] = @item_id
AND [Users].[user_id] = [ItemRating].[user_id] );

SELECT ItemReviews.item_id, review, rating
FROM ItemReviews
LEFT JOIN ItemRating ON ItemReviews.item_id = ItemRating.item_id AND (ItemReviews.user_id = ItemRating.user_id);

SELECT ISNULL(ItemReviews.item_id, ItemRating.item_id) AS item_id, review, rating, username, fullname
FROM ItemReviews
FULL OUTER JOIN ItemRating ON ItemReviews.item_id = ItemRating.item_id AND ItemReviews.user_id = ItemRating.user_id
LEFT JOIN Users ON (ItemReviews.user_id = Users.user_id OR ItemRating.user_id = Users.user_id);

SELECT * FROM 
(SELECT ISNULL(ItemReviews.item_id, ItemRating.item_id) AS item_id, ISNULL(review, 'No review by user.') AS review, ISNULL(rating, 0) AS rating, username, fullname
FROM ItemReviews
FULL OUTER JOIN ItemRating ON ItemReviews.item_id = ItemRating.item_id AND ItemReviews.user_id = ItemRating.user_id
LEFT JOIN Users ON (ItemReviews.user_id = Users.user_id OR ItemRating.user_id = Users.user_id)) AS t
WHERE item_id = 24;

SELECT * FROM (SELECT ISNULL(ItemReviews.item_id, ItemRating.item_id) AS item_id, ISNULL(review, 'No review by user.') AS review, ISNULL(rating, 0) AS rating, username, fullname FROM ItemReviews FULL OUTER JOIN ItemRating ON ItemReviews.item_id = ItemRating.item_id AND ItemReviews.user_id = ItemRating.user_id LEFT JOIN Users ON (ItemReviews.user_id = Users.user_id OR ItemRating.user_id = Users.user_id)) AS t WHERE item_id = 24;

SELECT * FROM Items;

--Working
SELECT review, username FROM [ItemReviews], [Users] WHERE ([item_id] = @item_id) AND [Users].[user_id] = [ItemReviews].[user_id];
SELECT * FROM Users WHERE username='fawad1';