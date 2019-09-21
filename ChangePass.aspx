<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="EMS.ChangePass" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <table align="center" class="auto-style5">
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Label ID="lblLogin" runat="server" Font-Size="Larger" Text="New Password"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr id="trCurrentPassword" runat="server">
                <td class="auto-style11">Current password</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCurrentPass" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    <asp:RequiredFieldValidator ID="rfvCurrentPass" runat="server" ControlToValidate="txtCurrentPass" ErrorMessage="Password required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Password</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    <asp:RequiredFieldValidator ID="rfvLoginUsername" runat="server" ControlToValidate="txtPass" ErrorMessage="Password required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">Confirm Password</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtConPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConPass" ErrorMessage="Password not match." ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Button ID="btnChangePass" runat="server" Text="Change Password" />
                </td>
                <td class="auto-style19">
                    <asp:HyperLink ID="hypGoToLogin" runat="server" NavigateUrl="~/Login.aspx">Go To Login Page.</asp:HyperLink>
                </td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>

