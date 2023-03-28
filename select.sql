SELECT * FROM "Adventureworks".person.person;

select pp.firstname, pp.lastname, pe.emailaddress, pa.city, sc.customerid
from person.person pp, person.emailaddress pe, person.businessentityaddress pba, person.address pa,
     person.businessentitycontact pbc, sales.customer sc
where pp.businessentityid = pe.businessentityid and pba.businessentityid = pp.businessentityid
and pba.addressid = pa.addressid and pbc.businessentityid = pp.businessentityid
and pbc.personid = sc.personid;


select pbc.businessentityid, ppp.phonenumber, e.emailaddress, sc.customerid
from person.businessentitycontact pbc
LEFT JOIN person.emailaddress e on pbc.businessentityid = e.businessentityid
LEFT JOIN person.personphone ppp on ppp.businessentityid = pbc.businessentityid
--INNER JOIN person.businessentityaddress pba on e.businessentityid = pba.businessentityid
--INNER JOIN person.address pa on pa.addressid = pba.addressid
INNER JOIN sales.customer sc on sc.personid = pbc.personid;