<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Language.Discovery.Admin.Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="css/bootstrapbutton.css" rel="stylesheet" />
    <style>
        .container{
            position:absolute;
         margin:0 auto;
         left:20%;
         top:30%;
    }
    </style>
    <div class="container">
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnCreateStudent" runat="server" Text="Create Student ID"  CssClass="btn btn-primary" Height="100px" width="300px" OnClick="btnCreateStudent_Click" meta:resourcekey="btnCreateStudentResource1" />
                </td>
                <td>
                    <asp:Button ID="btnViewExhchangeMail" runat="server" Text="View Exchange Mail"  CssClass="btn btn-warning" Height="100px" width="300px" OnClick="btnViewExhchangeMail_Click" meta:resourcekey="btnViewExhchangeMailResource1"/>
                </td>
                <td>
                    <asp:Button ID="btnMailMonitoring" runat="server" Text="Preview Email before Sending"  CssClass="btn btn-success" Height="100px" width="300px" OnClick="btnMailMonitoring_Click" meta:resourcekey="btnMailMonitoringResource1"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEditSchool" runat="server" Text="Edit School settings"  CssClass="btn btn-primary" Height="100px" width="300px" OnClick="btnEditSchool_Click" meta:resourcekey="btnEditSchoolResource1"/>
                </td>
                <td>
                    <asp:Button ID="btnViewStudentLogin" runat="server" Text="View Student Logins"  CssClass="btn btn-warning" Height="100px" width="300px" OnClick="btnViewStudentLogin_Click" meta:resourcekey="btnViewStudentLoginResource1"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnViewStudentList" runat="server" Text="View Student List"  CssClass="btn btn-warning" Height="100px" width="300px" OnClick="btnViewStudentList_Click" meta:resourcekey="btnViewStudentListResource1"/>
                </td>
                <td></td>

            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
