<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="JobCardHistory.aspx.cs" Inherits="JobCardHistory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Job Card History</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR><TD style="WIDTH: 5%">&nbsp;</TD><TD>
    &nbsp;</TD><TD>
        &nbsp;</TD><TD style="WIDTH: 5%">&nbsp;</TD></TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <table style="width: 75%">
                <tr>
                    <td>
                        Job Card No</td>
                    <td>
                        <asp:Label ID="lblJobNo" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Customer Name</td>
                    <td>
                        <asp:Label ID="lblCustomer" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Assigned To Employee</td>
                    <td>
                        <asp:Label ID="lblEmployee" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Job Card Status</td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <b>Service Detail :-</b></td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
        </td>
        <td>
            <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
        <td style="WIDTH: 5%">
        </td>
    </tr>
    <TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="pagehead" 
            DataKeyNames="id" Font-Size="Smaller" 
            PageSize="4" Width="90%">
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" />
                <asp:BoundField DataField="JobNo" HeaderText="Job No" />
                <asp:BoundField DataField="ActionTaken" HeaderText="Action Taken" />
                <asp:BoundField DataField="Remark" HeaderText="Remark" />
                <asp:BoundField DataField="Employee" HeaderText="Attented By" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:CommandField DeleteText="Go" ShowDeleteButton="True" />
            </Columns>
            <RowStyle BackColor="White" ForeColor="#003399" />
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" Font-Size="Smaller" ForeColor="#003399" 
                HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
    </TD><TD style="WIDTH: 5%">
        </TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
        <asp:HiddenField ID="hdid" runat="server" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
            Width="251px" />
    </TD><TD></TD>
        <td style="WIDTH: 5%">
        </td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD> </TD><TD></TD><TD style="WIDTH: 5%"></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

