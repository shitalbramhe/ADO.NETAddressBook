use AddressBookServiceDB
-------------Add------------
Create procedure AddAddressBook
(
@firstname varchar(150),
@lastname varchar(150),
@address varchar(150),
@city varchar(150),
@state varchar(150),
@zip Bigint,
@phonenumber bigint,
@email varchar(150),
@name varchar(150), 
@type varchar(150)
)
as
begin try
Insert into AddressBookTable values( @firstname,@lastname,@address,@city,@state,@zip,@phonenumber,@email,@name,@type)
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH

---------Delete----------
create procedure DeleteAddressBook
(
@id int
)
as 
begin TRY 
delete from AddressBookTable where id = @id
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH

-----------Update--------
create procedure UpdateAddressBook
(
@id int,
@firstname varchar(150)
)
as 
begin TRY 
Update AddressBookTable set firstname = @firstname where id = @id
 End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH
------------------------------------------
create procedure GetAddressBookTable
(
@id int
)
as 
begin TRY 
select * from AddressBookTable
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ERRORNumber,
ERROR_STATE() AS ERRORState,
ERROR_PROCEDURE() AS ERRORProcedure,
ERROR_LINE() AS ERRORLine,
ERROR_MESSAGE() AS ERRORMessage;
END CATCH

