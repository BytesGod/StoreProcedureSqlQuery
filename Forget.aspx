<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="EMS.Forget" %>


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <table align="center" class="auto-style5">
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Label ID="lblLogin" runat="server" Font-Size="Larger" Text="Reset Password"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblForgetMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Username</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtForgetEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                </td>
                <td class="auto-style19">
                    <asp:HyperLink ID="hypGoToLogin" runat="server" NavigateUrl="~/Login.aspx">Go to login page.</asp:HyperLink>
                </td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>
