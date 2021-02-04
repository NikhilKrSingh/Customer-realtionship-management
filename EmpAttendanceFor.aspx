<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EmpAttendanceFor.aspx.cs" Inherits="EmpAttendanceFor" Title="Untitled Page" %>

<%--<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Employee Attendance</h2>
    <p>
        <table>
            <tr>
                <td style="width: 341px; height: 24px;">
                    </td>
                <%--<td style="width: 220px; height: 24px;">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                    </td>--%>
                <td style="width: 289px; height: 24px;">
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gv1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4" DataKeyNames="id" 
                        OnPageIndexChanging="gv1_PageIndexChanging" 
                        OnSelectedIndexChanged="gv1_SelectedIndexChanged" CssClass="mGrid">
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <Columns>
                            <asp:TemplateField HeaderText="Serial">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="name" HeaderText="Department Name" />
                            <asp:CommandField SelectText="Take Attendance" ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                </td>
                <td style="width: 289px">
                    </td>
            </tr>
            <tr>
                <td style="width: 341px">
                    </td>
                <td style="width: 220px">
                    </td>
                <td style="width: 289px">
                    </td>
            </tr>
            <tr>
                <td style="width: 341px">
                    <asp:HiddenField ID="hdid" runat="server" />
                </td>
                <td style="width: 220px">
                    <table>
                        </table>
                </td>
                <td style="width: 289px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 341px">
                </td>
                <td style="width: 220px">
                </td>
                <td style="width: 289px">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
                <td style="width: 289px">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

