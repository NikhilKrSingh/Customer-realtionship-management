<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EmpAttendanceReport.aspx.cs" Inherits="EmpAttendanceReport" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <h2>
        Employee
        Monthly Attendance Report</h2>
     

    <p>
        <table>
            <tr>
                <td style="width: 341px">
                    &nbsp;</td>
                <td colspan="2">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                From_Date<br />
                                                </td>
                            <td>
                                <asp:TextBox ID="txtFdate" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td style="width: 6px">
                                To_Date<br />
                                                </td>
                            <td>
                                <asp:TextBox ID="txtToDate" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnViewReport" runat="server" onclick="btnViewReport_Click" 
                                    Text="View Report" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                (yyyy/mm/dd)</td>
                            <td style="width: 6px">
                                &nbsp;</td>
                            <td>
                                (yyyy/mm/dd)</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td style="width: 289px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="100%" 
                        AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="4" OnPageIndexChanging="gv1_PageIndexChanging" 
                        PageSize="6" DataKeyNames="no" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="stName" HeaderText="Employee Name" />
                            <asp:BoundField DataField="TT" HeaderText="Total Classes" />
                            <asp:BoundField DataField="PP" HeaderText="Present" />
                            <asp:BoundField DataField="LL" HeaderText="Leave" />
                            <asp:BoundField DataField="AA" HeaderText="Absent" />
                            <asp:BoundField DataField="Per" HeaderText="Attendance %" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
                <td style="width: 289px">
                    <asp:DropDownList ID="ddlbatch" runat="server" AutoPostBack="True" Height="16px" 
                        Width="125px" Visible="False">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlbatch"
                        ErrorMessage="Required field !" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 341px" colspan="2">
                    <asp:HiddenField ID="hdid" runat="server" />
                </td>
                <td style="width: 220px">
                    <table>
                        <tr>
                            <td align="center" style="width: 100px">
                                <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" 
                                    ValidationGroup="a" Visible="False" /></td>
                            <td align="center" style="width: 100px">
                                <asp:Button ID="btndel" runat="server" Text="Delete" OnClick="btndel_Click" 
                                    Visible="False" /></td>
                            <td align="center" style="width: 100px">
                                <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                                    OnClick="btncancel_Click" Visible="False" /></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 289px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        ShowSummary="False" ValidationGroup="a" />
                </td>
            </tr>
            <tr>
                <td style="width: 341px" colspan="2">
                    &nbsp;</td>
                <td style="width: 220px">
                </td>
                <td style="width: 289px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
                <td style="width: 289px">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

