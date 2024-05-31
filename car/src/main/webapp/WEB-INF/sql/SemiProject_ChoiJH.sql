
select *
from tbl_car

select pk_carname, carpoint, cartype
from tbl_car
where cartype='SEDAN';

select *
from tbl_car

select pk_carname, carpoint, cartype
from tbl_car
where cartype='SEDAN';

select *
from tbl_User

select Pk_UserId
from tbl_User
where UserStatus = 1 and Pk_UserId = 'chojh' and UserMobile = '01093061612'


update tbl_User set userpwd = 9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382, userlastchangepwd = sysdate
					   where pk_userid = chojh


select Pk_UserId
from tbl_User
where UserStatus = 1 and UserName = 'test11' and UserEmail = 'ip8Ffrzzoxpl5QU6R42IJP+Q6znsEDJK2vNNLn30VKU='