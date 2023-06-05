-- 1.
select SUM(amount) 
from hardware
;
-- 2. 
select * 
from hardware
where amount = 0
;
-- 3. 
select AVG(price) 
from hardware
where title like 'Монитор%'
;
-- 4. 
select * 
from hardware
where title like 'Клавиатура%'
order by price ASC
;
-- 5.
select tag, count(title) as amount 
from hardware 
group by tag 
order by amount DESC
;
-- 6. 
select COUNT(title) 
from hardware
where tag = 'discount'
;
-- 7. 
select title, price 
from hardware
where tag = 'new'
order by price DESC
limit 1
;
-- 8. 
INSERT INTO `hardware` (`title`, `price`, `amount`, `tag`) 
VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new')
;
-- 9. 
delete from hardware 
where title = 'Очки PS VR 2' and id > 0
;