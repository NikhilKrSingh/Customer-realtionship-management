<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EnterServiceDetailEmp.aspx.cs" Inherits="EnterServiceDetailEmp" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Enter Service Detail</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR><TD style="WIDTH: 5%">&nbsp;</TD><TD>
    Service ID</TD><TD>
        <asp:Label ID="lblServiceId" runat="server"></asp:Label>
    </TD><TD style="WIDTH: 5%">&nbsp;</TD></TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Service Date</td>
        <td>
            <asp:TextBox ID="txtDate" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Job Card No</td>
        <td>
            <asp:DropDownList ID="ddlJobNo" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlJobNo_SelectedIndexChanged" Width="150px" 
                Enabled="False">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="ddlJobNo" Display="Dynamic" 
                ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Customer</td>
        <td>
            <asp:Label ID="lblCustomer" runat="server"></asp:Label>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Attended By</td>
        <td>
            <asp:Label ID="lblEmployee" runat="server"></asp:Label>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Problem</td>
        <td>
            <asp:TextBox ID="txtProblem" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <TR><TD style="WIDTH: 5%">&nbsp;</TD><TD>
        Action Taken</TD><TD>
            <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="True" 
                Width="250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="ddlService" Display="Dynamic" 
                ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
    </TD><TD style="WIDTH: 5%">&nbsp;</TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>Remark</TD><TD>
        <asp:TextBox ID="txtRemark" runat="server" MaxLength="1000" 
            TextMode="MultiLine" Width="250px"></asp:TextBox>
    </TD>
    <td style="WIDTH: 5%">
    </td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD>
        Job Card Status</TD><TD>
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
                Width="150px">
                <asp:ListItem>Open</asp:ListItem>
                <asp:ListItem>Close</asp:ListItem>
            </asp:DropDownList>
        </TD>
        <td style="WIDTH: 5%">
        </td>
    </TR><TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <table align="center" style="WIDTH: 174px">
            <tbody>
                <tr>
                    <td style="WIDTH: 100px">
                        <asp:Button ID="btnsave" runat="server" onclick="btnsave_Click" Text="Save" 
                            ValidationGroup="a" Width="47px" />
                    </td>
                    <td style="WIDTH: 100px">
                        <asp:Button ID="btndelete" runat="server" onclick="btndelete_Click" 
                            Text="Delete" />
                    </td>
                    <td style="WIDTH: 100px">
                        <asp:Button ID="btnreset" runat="server" onclick="btnreset_Click" 
                            Text="Reset" />
                    </td>
                </tr>
            </tbody>
        </table>
    </TD><TD style="WIDTH: 5%">
    </TD></TR><TR><TD style="WIDTH: 5%"></TD><TD colspan="2">
        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="pagehead" 
            DataKeyNames="id" Font-Size="Smaller" 
            OnPageIndexChanging="gv1_PageIndexChanging" OnRowDeleting="gv1_RowDeleting" 
            OnSelectedIndexChanged="gv1_SelectedIndexChanged" PageSize="5" Width="99%">
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="Service Id" />
                <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" />
                <asp:BoundField DataField="JobNo" HeaderText="Job No"></asp:BoundField>
                <asp:BoundField DataField="Customer" HeaderText="Customer"></asp:BoundField>
                <asp:BoundField DataField="Employee" HeaderText="Employee" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:CommandField SelectText="Edit" ShowSelectButton="True"></asp:CommandField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
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
    </TD><TD style="WIDTH: 5%">
        </TD></TR>
    <tr>
        <td style="WIDTH: 5%">
        </td>
        <td>
            <asp:HiddenField ID="hdid" runat="server" />
        </td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
                Width="251px" />
        </td>
        <td style="WIDTH: 5%">
        </td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
        </td>
        <td>
            <asp:HiddenField ID="hdJobNo" runat="server" />
        </td>
        <td>
        </td>
        <td style="WIDTH: 5%">
        </td>
    </tr>
    </TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

