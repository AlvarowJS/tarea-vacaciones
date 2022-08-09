select * from accounts
select * from clients
select * from account_types
select * from transactions
select * from transactions_types
--		Ejercicio 1

select c.id as "id cliente", 
		c.first_name as "nombre",
		c.last_name as "apellido",
		c.email,
		a.account_no as "cuenta",
		a.balance as "saldo"
		from clients as c left join accounts as a on c.id = a.client_id
		
--		Ejercicio 2
		
select a.account_no as "cuenta",
		a.client_id as "id cliente",
		ta."name" as "tipo cuenta"
		from accounts as a join account_types as ta 
		on a."type" = ta.id 

--		Ejercicio 3		
select t.id as "transaccion",
		t.amount as "monto",
		tt."name" as "tipo de transaccion"
		from transactions as t join transactions_types as tt 
		on t.transaction_type = tt.id 
		
-- 		Ejercicio 4
select tt."name" as "tipo de transaccion",
		t.amount 
		from transactions_types as tt left join transactions as t 
		on tt.id = t.transaction_type 
		
--		Ejercicio 5
		
--	Creacion de vista 1
	create view v_clients_accounts as 
		select c.id as "id cliente", 
			c.first_name as "nombre",
			c.last_name as "apellido",
			c.email,
			a.account_no as "cuenta",
			a.balance as "saldo"
			from clients as c left join accounts as a on c.id = a.client_id;
--	Consulta de vista 1
	select * from v_clients_accounts
 
--	Creacion de vista 2	
	create view v_accounts_types as 
		select a.account_no as "cuenta",
			a.client_id as "id cliente",
			ta."name" as "tipo cuenta"
			from accounts as a join account_types as ta 
			on a."type" = ta.id;
--	Consulta de vista 2	
	select * from v_accounts_types	

--	Creacion de vista 3
	create view v_transactions_detail as
		select t.id as "transaccion",
			t.amount as "monto",
			tt."name" as "tipo de transaccion"
			from transactions as t join transactions_types as tt 
			on t.transaction_type = tt.id 
-- Consulta de vista 3			
	select * from v_transactions_detail	

--	Creacion de vista 4	
	create view v_transactions_types_detail as
		select tt."name" as "tipo de transaccion",
			t.amount 
			from transactions_types as tt left join transactions as t 
			on tt.id = t.transaction_type 
--	Consulta de vista	4		
	select * from v_transactions_types_detail