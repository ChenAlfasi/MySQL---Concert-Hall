create schema konzert1;
use konzert1;

create table employee
(
id int not null,
fisrt_name char(25),
last_name char(25),
phone int,
email char(25),
DOB date,
adress char(25),
account_bank_number int,
primary key(id))
ENGINE = InnoDB;

create table usher
(
id int not null,
uniform_size char(25),
walkie_talkie int,
primary key (id),
CONSTRAINT fk_idu FOREIGN KEY (id) REFERENCES employee(id))
ENGINE = InnoDB;

create table cashier
(
id int not null,
sales_target int,
primary key (id),
CONSTRAINT fk_idc FOREIGN KEY (id) REFERENCES employee(id))
ENGINE = InnoDB;

create table players
(
player_id int not null,
first_name char(25),
last_name char (25),
phone int ,
email char(25),
dob date,
adress char(25),
primary key (player_id))
ENGINE = InnoDB;

create table konzert
(
konzert_id int not null,
konzert_type char(25),
duration float,
population char(25),
primary key (konzert_id))
ENGINE = InnoDB;

create table usher_in_konzert
(
usher_id int not null,
konzert_id int not null,
date_of_konzert date,
start_time char(25),
end_time char(25),
primary key (usher_id,konzert_id,date_of_konzert,start_time,end_time),
CONSTRAINT fk_ui FOREIGN KEY (usher_id) REFERENCES usher(id),
CONSTRAINT fk_ki FOREIGN KEY (konzert_id) REFERENCES konzert(konzert_id))
ENGINE = InnoDB;

create table players_in_konzert
(
player_id int not null,
konzert_id int not null,
date_of_konzert date not null,
start_time char(25) not null,
end_time char(25) not null,
primary key (player_id,konzert_id,date_of_konzert,start_time,end_time),
CONSTRAINT fk_idpik FOREIGN KEY (player_id) REFERENCES players(player_id),
CONSTRAINT fk_idko FOREIGN KEY (konzert_id) REFERENCES konzert(konzert_id)
on delete cascade)
ENGINE = InnoDB;

create table contact
(
contact_id int not null,
first_name char(25),
last_name char(25),
phone int,
primary key (contact_id))
ENGINE = InnoDB;

create table customers
(
id_customer int not null,
first_name char(25),
last_name char(25),
phone int ,
email char(25),
dob date,
adress char (25),
contact_id int ,
primary key (id_customer),
CONSTRAINT fk_ci FOREIGN KEY (contact_id) REFERENCES contact(contact_id))
ENGINE = InnoDB;

create table cash_desk
(
cash_desk_id int not null,
c_name char(25),
location char(25),
primary key(cash_desk_id))
ENGINE = InnoDB;

create table chasier_in_cashdesk
(
cashier_id int not null,
cash_desk_id int not null,
date_of_chasiershift date,
start_time char(25),
end_time char(25),
primary key(cashier_id,cash_desk_id,date_of_chasiershift,start_time,end_time),
CONSTRAINT fk_cai FOREIGN KEY (cashier_id) REFERENCES cashier(id),
CONSTRAINT fk_cdi FOREIGN KEY (cash_desk_id) REFERENCES cash_desk(cash_desk_id))
ENGINE = InnoDB;

create table tickets
(
ticket_code int not null,
customer_id int not null,
konzert_id int not null,
cashier_id int not null,
primary key(ticket_code),
CONSTRAINT fk_cui FOREIGN KEY (customer_id) REFERENCES customers(id_customer),
CONSTRAINT fk_koi FOREIGN KEY (konzert_id) REFERENCES konzert(konzert_id),
CONSTRAINT fk_casi FOREIGN KEY (cashier_id) REFERENCES cashier(id))
ENGINE = InnoDB;

INSERT INTO employee VALUES
("842892903","Kasper","Reid, Kaseem W.","67900","sagittis@nec.co.uk","1978-12-06","4841 Ut Road","701878126"),
("304786072","Cruz","Beach, Emmanuel D.","13558","ante.iais@velrius.co.uk","1988-03-20","3758 Duis Road","256234949"),
("608075826","Emery","Cleveland, Brady I.","85995","lectus@massa.co.uk","1979-10-14","883-2625 Sed Ave","378920227"),
("117068825","Flynn","Montoya, Dennis S.","12280","tristique@adisse.co.uk","1980-09-08","Box 252,3 Soci St.","285244893"),
("156732471","Eric","Ramos, Medge O.","75396","lectus@Aliquam.net","1976-01-10","688 Tincidunt Av.","126953041"),
("172273286","Noah","Bray, Lesley J.","66531","Morbi@Sedem.com","1973-04-06","77 Morbi St.","662750413"),
("173465386","Harper","Richard, Carissa I.","59890","velit@Etiam.com","1986-11-12","7221 St.","134606276"),
("675726558","Amir","Lang, Silas L.","76359","adipisng@odio.co.uk","2000-05-22","259 At, St.","243586005"),
("060396710","Magee","Branch, Dakota I.","40323","ullamc@mesac.ca","1997-12-05","Box 43, 23 Ar. St.","558048047"),
("041210832","Elliott","Norman, Allegra B.","10083","veslum@egestas.edu","1983-04-06","Box 2,8453 Avenue","80704623"),
("859121048","Ignatius","Poole, Jacob R.","77178","nonummy@faus.co.uk","1989-09-04","7942 Enim Rd.","596901447"),
("228522504","Bradley","Aguilar, Venus D.","67661","amet@rsl.edu","1970-01-03","572 Non Ave","699101978");
 

INSERT INTO usher VALUES
("842892903","L","1357"),
("304786072","S","1246"),
("608075826","XL","1234"),
("117068825","XS","5432"),
("156732471","M","1989"),
("172273286","S","1090");

INSERT INTO cashier VALUES
("173465386","2"),
("675726558","4"),
("060396710","3"),
("041210832","5"),
("859121048","2"),
("228522504","2");

INSERT INTO konzert VALUES
("1111","israeli","67","adult"),
("2222","turkey","77","children"),
("3333","sport","39","sport fans"),
("4444","comedy","82","for all"),
("5555","drama","54","adult"),
("6666","drama","47","for all");

INSERT INTO usher_in_konzert VALUES
("842892903","1111","2021-03-22","16:00","17:07"),
("842892903","2222","2021-03-25","17:00","18:17"),
("304786072","2222","2021-03-25","17:00","18:17"),
("304786072","3333","2021-03-28","14:00","14:39"),
("608075826","3333","2021-03-14","11:00","11:39"),
("117068825","4444","2021-02-12","11:00","12:22"),
("117068825","5555","2021-01-11","20:00","20:54"),
("117068825","6666","2021-06-18","10:00","10:47"),
("172273286","6666","2021-06-18","10:00","10:47"),
("172273286","5555","2021-01-20","12:00","12:54");

INSERT INTO players VALUES
("173242353","avi","cohen","0547634441","avi@gmail.com","1988-04-05","HArotem 9 or-yeuda"),
("473243353","daniel","peretz","052721342","daniel@gmail.com","1982-03-05","livna 8 tel-aviv"),
("973242953","chen","alfasi","0537632349","chen@gmail.com","1998-04-08","hertzel 12 ramat gan"),
("273142353","aviv","aminoff","0514521441","aviv@gmail.com","2000-04-05","dizingof 192 tel-aviv"),
("373166423","eran","zehavi","052521441","eran@gmail.com","1987-04-09","alenbi 201 tel-aviv"),
("976542351","omer","itzhky","0526521411","omer@gmail.com","1998-04-05","HAyarkon 20 rishon"),
("57571422","eli","dasa","0514231441","eli@gmail.com","1992-08-05","hamelech 13 givataiym"),
("87384235","lionel","messi","0514521241","lio@gmail.com","1989-01-09","HArambla 10 barcelona");

INSERT INTO players_in_konzert VALUES
("173242353","1111","2021-03-22","16:00","17:07"),
("473243353","1111","2021-03-22","16:00","17:07"),
("973242953","1111","2021-03-22","16:00","17:07"),
("273142353","2222","2021-03-25","17:00","18:17"),
("373166423","2222","2021-03-25","17:00","18:17"),
("87384235","5555","2021-01-20","12:00","12:54"),
("976542351","3333","2021-03-14","11:00","11:39"),
("87384235","3333","2021-03-14","11:00","11:39"),
("273142353","3333","2021-03-14","11:00","11:39"),
("973242953","4444","2021-02-12","11:00","12:22"),
("373166423","4444","2021-02-12","11:00","12:22");

INSERT INTO contact VALUES
("29830134","lior","ran","053462549"),
("29820131","tal","cohen","053462219"),
("39830139","omri","arad","05341549"),
("79830344","liron","aviv","057462549"),
("79830133","reut","noam","053462549");


INSERT INTO customers VALUES
("209045637","ron","yaakov","0546528876","ron@gmail.com","1990-10-20","derech hayam 12","29830134"),
("209874629","dan","aviv","0547683516","dan@gmail.com","1992-10-10","egoz 10","79830133"),
("209874628","adar","cohen","0527683519","adar@gmail.com","1991-10-19","harov 10","39830139"),
("309874610","segev","ron","0527123359","segev@gmail.com","1998-10-11","sela 11","29820131"),
("309875555","elad","tal","0537121358","elad@gmail.com","1990-02-12","tavor 10","79830344");
INSERT INTO customers (id_customer,first_name,last_name,phone,email,dob,adress) VALUES 
("309871111","rotem","avinoam","0532191351","rotem@gmail.com","1980-02-01","hagana 110");


INSERT INTO cash_desk VALUES
("1","livna","south"),
("2","vered","north"),
("3","shoshana","west");


INSERT INTO chasier_in_cashdesk VALUES
("173465386","1","2021-02-18","10:00","16:00"),
("675726558","2","2021-02-18","10:00","16:00"),
("173465386","3","2021-02-19","10:00","16:00"),
("228522504","1","2021-02-24","10:00","16:00"),
("041210832","2","2021-02-20","10:00","16:00"),
("228522504","1","2021-02-20","10:00","16:00"),
("060396710","3","2021-02-20","10:00","16:00"),
("060396710","3","2021-02-20","16:00","22:00"),
("859121048","2","2021-02-21","16:00","22:00"),
("859121048","1","2021-02-27","10:00","16:00");


INSERT INTO tickets VALUES
("123","209045637","1111","173465386"),
("124","209045637","2222","173465386"),
("125","209874629","1111","675726558"),
("126","209874628","3333","060396710"),
("127","309875555","3333","060396710"),
("128","309874610","4444","060396710"),
("129","309871111","2222","060396710"),
("130","309871111","3333","859121048"),
("131","309871111","2222","859121048");

/*manager querys:*/

/* בשאילתה זו המנהל יקבל רשימה של תעודות זהות של עובדיו, שמותיהם, יעד המכירות שלהם וכמות המכירות שלהם בפועל */

select tickets.cashier_id,employee.fisrt_name,cashier.sales_target,
count(tickets.cashier_id) as quantity_sold
from tickets, employee, cashier
where employee.id = tickets.cashier_id and employee.id = cashier.id
group by tickets.cashier_id
order by quantity_sold desc;

/* בשאילתה זו המנהל יקבל מידע על כמות מכירות הכרטיסים של כל קונצרט */

select konzert_id, count(konzert_id) as number_of_tickets_per_konzert
from tickets
group by konzert_id;

/*בשאילתה זו המנהל יקבל רשימה של שלושת הקופאים שלו שעשו הכי הרבה משמרות ממויין מזה שעשה הכי הרבה משמרות לזה שעה הכי מעט */

select cashier_id, count(cashier_id)
from chasier_in_cashdesk
group by cashier_id
order by count(cashier_id) desc
limit 3;

/* בשאילתה זו המנהל יקבל את רשימת כל הלקוחות שרכשו 2 כרטיסים ומעלה ממוינים */

select first_name, last_name, count(ticket_code)
from tickets, customers
where tickets.customer_id = customers.id_customer
group by tickets.customer_id
having count(ticket_code)>=2
order by count(ticket_code);

/* בשאילתה זו ניתן לראות את הקונצרט שיש בו הכי הרבה שחקנים וכמות השחקנים בו */

select konzert_id, count(player_id) 
from players_in_konzert
group by konzert_id
order by count(player_id) desc
limit 1;

/*  בשאילתה זו ניתן לראות כמה שחקנים יש בכל קונצרט בהתמיינות מהכמות הנמוכה לכמות הגדולה */

select konzert_id, count(player_id)
from players_in_konzert
group by konzert_id
order by count(player_id) asc;

/* בשאילתה מקוננת זו נקבל את רשימת שמות השחקנים שמשחקים בקונצרטים שאורכם ארוך מהממוצע*/

select distinct players.first_name, players.last_name
from players, players_in_konzert, konzert
where (players_in_konzert.player_id = players.player_id) and 
(konzert.konzert_id = players_in_konzert.konzert_id) 
and duration > ( select avg(duration)
from konzert);


/* בשאילתה זו מעדכנים את מידת המדים של סדרן */

update usher
set uniform_size="L"
where id=304786072;

/* בשאילתה זו מוחקים שחקן(לדוגמה שחקן שפוטר) */

delete from players
where player_id = 57571422;


/* customer queries */

/*בשאילתה זו הלקוח יכול לקבל מידע על כל הקונצרטים ששחקן ספציפי שהוא אוהב משתתף*/

select date_of_konzert, start_time, end_time
from players_in_konzert, players
where players.player_id = players_in_konzert.player_id and
players.last_name = "zehavi";

/* בשאילתה זו הלקוח יקבל את כל הפרטים על הקונצרטים שנמשכים שעה ומעלה */

select *
from konzert
where duration >=60;

/* בשאילתה זו הלקוח יקבל את כל הפרטים על הקונצרטים מסוג קומדיה שמתאימים לכולם */

select *
from konzert
where konzert_type = "comedy" and population = "for all";

/* בשאילתה זו הלקוח יקבל את 2 הקונצרטים המבוקשים ביותר וכמה הם נמכרו */

select konzert_id, count(konzert_id) as number_of_tickets_per_konzert
from tickets
group by konzert_id
order by number_of_tickets_per_konzert desc
limit 2;

/*  בשאילתה זו הלקוח יקבל את התאריכים והשעות שהקופות לרכישת הכרטיסים פתוחות ואת מיקומן */

select cash_desk.cash_desk_id,location, date_of_chasiershift,start_time,end_time
from chasier_in_cashdesk, cash_desk
where cash_desk.cash_desk_id = chasier_in_cashdesk.cash_desk_id;

/* בשאילתה זו הלקוח יקבל מידע על היסטורית הרכישות שלו */

select ticket_code
from tickets
where customer_id = 309871111;

/* בשאילתה זו שינינו איש קשר ללקוח ספציפי */

update customers
set contact_id = 79830344
where id_customer = 309871111;

/* בשאילתה זו התווסף למאגר הלקוחות לקוח חדש*/

INSERT INTO customers (id_customer,first_name,last_name,phone,email,dob,adress) VALUES 
("209045222","roee","levi","0546576476","roee@gmail.com","1994-11-20","herzel 12 tel aviv");

/*בשאילתה מקוננת זו הלקוח יקבל את רשימת השחקנים שמשחקים בקונצטרים עם שחקן ספציפי */

select distinct players.first_name, players.last_name
from players, players_in_konzert
where players.player_id = players_in_konzert.player_id
and konzert_id in (select konzert_id
from players_in_konzert where player_id = "87384235");



