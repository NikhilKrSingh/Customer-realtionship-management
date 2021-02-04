<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="JobCardAssignmentStatus.aspx.cs" Inherits="JobCardAssignmentStatus" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            &nbsp;Job Card Assignment Status</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <table style="width: 95%">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtFdate" ErrorMessage="Enter Valid Date (dd-MM-yyyy)" 
                            ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                            ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtToDate" ErrorMessage="Enter Valid Date (dd-MM-yyyy)" 
                            ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                            ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        From</td>
                    <td>
                        <asp:TextBox ID="txtFdate" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtFdate" Display="Dynamic" 
                            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        To</td>
                    <td>
                        <asp:TextBox ID="txtToDate" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="txtToDate" Display="Dynamic" 
                            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        Status</td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" runat="server" Width="100px">
                            <asp:ListItem>Open</asp:ListItem>
                            <asp:ListItem>Close</asp:ListItem>
                            <asp:ListItem>All</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Go" 
                            ValidationGroup="a" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            </td>
        <td colspan="2">
            <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="pagehead" 
                DataKeyNames="id" Font-Size="Smaller" 
                OnPageIndexChanging="gv1_PageIndexChanging" OnRowDeleting="gv1_RowDeleting" 
                onselectedindexchanged="gv1_SelectedIndexChanged" PageSize="8" 
                Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SN">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Job No" />
                    <asp:BoundField DataField="jobdate" HeaderText="Job Date" />
                    <asp:BoundField DataField="Name" HeaderText="Customer" />
                    <asp:BoundField DataField="EmpName" HeaderText="Assigned To" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:CommandField DeleteText="Unassigned" ShowDeleteButton="True" />
                </Columns>
                <RowStyle BackColor="White" ForeColor="#003399" />
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <PagerStyle BackColor="#99CCCC" Font-Size="Smaller" ForeColor="#003399" 
                    HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            </asp:GridView>
        </td>
        <td style="WIDTH: 5%">
            </td>
    </tr>
    <TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:HiddenField ID="hdid" runat="server" />
    </TD><TD style="WIDTH: 5%">
        </TD>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD>
        </TD><TD>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
                Width="251px" />
        </TD>
        <td style="WIDTH: 5%">
        </td>
    </TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

