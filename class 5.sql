-- Length function gives us size of the the word or letter where char_lenght gives the value of how much letter given in the word
-- Length(storage) of the english letter is 1 , so we take a example of chines letter
select length('诶');
select char_length("诶");

-- concat function join the given letter and word
select concat('H','sd','y') from dual;
select concat('H','sd','y') ;
select concat('H','-','y') from dual;

-- concat_was add first given letter/word to adjoing the rest of the word
select concat_ws("$" , "hey", 'hell', 'hii' ) ;
select upper('hi');                          -- makes capital letter word
select lower('HIE');                           -- makes small letter word

-- substr do scliecing in the givn word
select substr('hello_world', 4);
select substr('anshuman',3,4);            -- second number parameter gives us the range
select substr('anshuman',1,5);
select substr(substr('anshuman',1,5),3);          

-- instr gives us the index of the perticular letter
select INSTR('hello','e'); 
select instr('hello','el');         -- perfernce to first letter
-- select instr('hello' , 'l',2); in orecal

--  locate the index of letter 
select locate('a','rajasthan');
select locate('a', 'rajasthan',3);                     -- start finding after 3rd letter


--    ltrim remove the left sapce
select ('    ---xyz');
select ltrim('     ---xyz');
-- rtrim works on right triming

select trim(leading ' ' from '     zyx        ');        -- starting
select trim(trailing ' ' from '     zyx        ');        -- ending
select trim(both " " from '      zyx      ') ;             -- both start and ending
-- works of very first or on last letter of the word
select trim(both'z' from 'zzzz     yz');
select trim(both'z' from '   zzzz     yz');
select trim(both'z' from 'zzzz     yz   ');
select trim(both'z' from 'zzzz zz lzrt    yz');

-- lpad ristict the word range or add the other letter/charector in third range
-- lpad == left , rpad == right
select lpad('hello',6,'$');
select lpad('helloo',6,'$');
select lpad('hellohello',6,'$');
select rpad('hello',6,'#');
select rpad('hello',8 ,'#');

-- It replace letter to other letter which is given
select replace('tusharss','s','#');

use sakila;
select * from  language;
desc language;
-- dml
-- insert satement insert into table values (val1,val2,val3)
INSERT  INTO LANGUAGE VALUES(NULL , 'PROTUGUES',NOW());        
SELECT * FROM LANGUAGE;
DESC LANGUAGE;                                    -- PRIMARY KEY AND AUTO INCREMENT

INSERT  INTO LANGUAGE VALUES(15 , 'PROTUGUES',NOW());        -- will added on 15 no 
SELECT * FROM LANGUAGE;
INSERT  INTO LANGUAGE VALUES(NULL , 'PROTUGUES',NOW());         -- thus it will not add on 8 place it will place on 16 place..
SELECT * FROM LANGUAGE;
-- auto increment just flow the last number of the indexing 





