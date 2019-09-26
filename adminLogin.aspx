<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="EMS.Admin.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style5 {
        width: 44%;
    }
    .auto-style10 {
        text-align: center;
        height: 40px;
    }
    .auto-style11 {
        width: 368px;
        height: 42px;
        text-align: right;
    }
    .auto-style12 {
        width: 377px;
        height: 42px;
        text-align: center;
    }
    .auto-style13 {
        width: 357px;
        height: 42px;
    }
    .auto-style14 {
        width: 368px;
        height: 46px;
        text-align: right;
    }
    .auto-style15 {
        width: 377px;
        height: 46px;
        text-align: center;
    }
    .auto-style16 {
        width: 357px;
        height: 46px;
    }
    .auto-style17 {
        width: 368px;
        height: 45px;
        text-align: right;
    }
    .auto-style18 {
        width: 377px;
        height: 45px;
        text-align: center;
    }
    .auto-style19 {
        width: 357px;
        height: 45px;
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <br />
    </p>
    <p>
        <table align="center" class="auto-style5">
        <tr>
            <td class="auto-style10" colspan="3">
                <asp:Label ID="lblLogin" runat="server" Font-Size="Larger" Text="Login"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblLoginError" runat="server" ForeColor="Red" Text="Error"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Email</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtLoginEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style13">
                <asp:RequiredFieldValidator ID="rfvLoginUsername" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Email required." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">Password</td>
            <td class="auto-style15">
                <asp:TextBox ID="txtLoginPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="rfvLoginPass" runat="server" ControlToValidate="txtLoginPass" ErrorMessage="Password required." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style18">
                <asp:Button ID="btnLogin" runat="server" Height="27px" Text="Login" Width="70px" OnClick="btnLogin_Click" />
            </td>
            <td class="auto-style19">
                &nbsp;</td>
        </tr>
    </table></p>
    <p>
    </p>
</asp:Content>
