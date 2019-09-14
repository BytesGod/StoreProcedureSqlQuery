Create Proc spChangePassword
@GUID uniqueidentifier,
@Password nvarchar(100)
as
Begin
 Declare @StudId int
 
 Select @StudId = StudId 
 from tblResetPasswordRequests
 where Id= @GUID
 
 if(@StudId is null)
 Begin
  -- If UserId does not exist
  Select 0 as IsPasswordChanged
 End
 Else
 Begin
  -- If UserId exists, Update with new password
  Update tblStudent set
  [Password] = @Password
  where StudId = @StudId
  
  -- Delete the password reset request row 
  Delete from tblResetPasswordRequests
  where Id = @GUID
  
  Select 1 as IsPasswordChanged
 End
End