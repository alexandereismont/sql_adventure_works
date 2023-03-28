
select substr(pp.firstname, 1, 1) as first_letter, count(1)
from person.person as pp
group by pp.firstname;
