use seminar_6_DZ;
/**
drop function if exists count_sec;
delimiter $$
create function count_sec
(
seconds int
)
returns varchar(150)
deterministic
begin
	declare days int;
    declare hours int;
    declare minuts int;
    declare final varchar(150);
    
    set days :=  floor(seconds / (24 * 60 * 60));
    set seconds := seconds % (24 * 60 * 60);
    set hours := floor(seconds / (60 * 60));
    set seconds := seconds % (60 * 60);
    set minuts := floor(seconds / (60));
    set seconds := seconds % (60);
    set final := concat(days, ' days ', hours, ' hours ', minuts, ' minuts ', seconds, ' seconds ');
    
    return final;
end; $$

select count_sec(123456);
**/

drop function if exists even_num;
delimiter $$
create function even_num
(
numb int
)
returns varchar(50)
deterministic
begin
	declare final varchar(50) default '';
    declare i int default 1;
    
    while i <= numb do
		if i % 2 = 0 then
			set final = concat(final, ' ', i);
		end if;
        set i = i + 1;
	end while;
    return final;
end $$

select even_num(15);
    


    