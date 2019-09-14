Create Proc spIsPasswordResetLinkValid 
@GUID uniqueidentifier
as
Begin
 Declare @StudId int
 
 If(Exists(Select StudId from tblResetPasswordRequests where Id = @GUID))
 Begin
  Select 1 as IsValidPasswordResetLink
 End
 Else
 Begin
  Select 0 as IsValidPasswordResetLink
 End
End