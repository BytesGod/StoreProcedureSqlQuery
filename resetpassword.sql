Create proc spResetPassword
@Username nvarchar(100)
as
Begin
 Declare @StudId int
 Declare @Email nvarchar(100)
 
 Select @StudId = StudId, @Email = Email 
 from tblStudent
 where Username = @Username
 
 if(@StudId IS NOT NULL)
 Begin
  --If username exists
  Declare @ID UniqueIdentifier
  Set @ID = NEWID()
  
  Insert into tblResetPasswordRequests
  (Id, StudId, ResetRequestDateTime)
  Values(@ID, @StudId, GETDATE())
  
  Select 1 as ReturnCode, @ID as UniqueId, @Email as Email
 End
 Else
 Begin
  --If username does not exist
  SELECT 0 as ReturnCode, NULL as UniqueId, NULL as Email
 End
End