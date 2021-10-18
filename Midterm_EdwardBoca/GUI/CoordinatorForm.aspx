<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoordinatorForm.aspx.cs" Inherits="Midterm_EdwardBoca.GUI.CoordinatorForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 857px;
            height: 553px;
        }
        .auto-style3 {
            text-align: left;
            width: 427px;
        }
        .auto-style14 {
            text-align: center;
            width: 372px;
        }
        .auto-style9 {
            width: 428px;
        }
        .auto-style10 {
            width: 427px;
        }
        .auto-style15 {
            width: 372px;
        }
        .auto-style19 {
            width: 427px;
            height: 23px;
        }
        .auto-style20 {
            width: 372px;
            height: 23px;
        }
        .auto-style21 {
            width: 428px;
            height: 23px;
        }
        .auto-style6 {
            width: 427px;
            height: 25px;
        }
        .auto-style16 {
            height: 25px;
            width: 372px;
        }
        .auto-style7 {
            height: 25px;
            width: 428px;
        }
        .auto-style11 {
            height: 25px;
        }
        .auto-style12 {
            height: 188px;
        }
        .auto-style17 {
            width: 100%;
            height: 102px;
        }
        .auto-style18 {
            width: 435px;
        }
        .auto-style5 {
            height: 264px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblSelectTeacher" runat="server" Font-Bold="True" Text="Select Teacher"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:Label ID="lblSelectCourse" runat="server" Font-Bold="True" Text="Select  Course"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="lblSelectGroup" runat="server" Font-Bold="True" Text="Select  Group"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:DropDownList ID="dpdSelectTeacher" runat="server" Height="26px" Width="256px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="dpdSelectCourse" runat="server" Height="26px" Width="256px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="dpdSelectGroup" runat="server" Height="26px" Width="256px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style19"></td>
                <td class="auto-style20"></td>
                <td class="auto-style21">
                    <asp:Button ID="btnAssignCourse" runat="server" OnClick="btnAssignCourse_Click" Text="Assign Course" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Select the Assigned Date</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="btnListCourses" runat="server" OnClick="btnListCourses_Click" Text="List Courses" Width="130px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Calendar ID="CalendarAssignedDate" runat="server"></asp:Calendar>
                </td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style11" colspan="3">
                    <asp:GridView ID="GridViewListInfo" runat="server" Width="669px">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style12" colspan="3">
                    <table class="auto-style17">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="3">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
