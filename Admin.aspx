<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EMS.Admin.Admin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <table class="auto-style5">
            <tr>
                <td>
                    <asp:UpdatePanel ID="ajaxupData" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="StudId" DataSourceID="sddData">
                                <Columns>
                                    <asp:BoundField DataField="StudId" HeaderText="StudId" InsertVisible="False" ReadOnly="True" SortExpression="StudId" />
                                    <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                                    <asp:BoundField DataField="GraduationType" HeaderText="GraduationType" SortExpression="GraduationType" />
                                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                                    <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
                                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                                    <asp:BoundField DataField="RetryAttempt" HeaderText="RetryAttempt" SortExpression="RetryAttempt" />
                                    <asp:CheckBoxField DataField="IsLocked" HeaderText="IsLocked" SortExpression="IsLocked" />
                                    <asp:BoundField DataField="LockedDateTime" HeaderText="LockedDateTime" SortExpression="LockedDateTime" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:SqlDataSource ID="sddData" runat="server" ConnectionString="<%$ ConnectionStrings:EMSConnectionString %>" SelectCommand="SELECT * FROM [tblStudent]"></asp:SqlDataSource>
    </p>
</asp:Content>
