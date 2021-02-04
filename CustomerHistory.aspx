<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="CustomerHistory.aspx.cs" Inherits="CustomerHistory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="HEIGHT: 16px" 
        colspan="4">
    <h2>
        &nbsp;Customer History [Job Card Detail]</h2>
    </TD>
    </TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <table style="width: 80%">
                <tr>
                    <td>
                        Customer ID</td>
                    <td>
                        <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlCustomer_SelectedIndexChanged" Width="100px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="ddlCustomer" Display="Dynamic" 
                            ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                    </td>
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
            &nbsp;</td>
        <td colspan="2">
            <table style="width: 75%">
                <tr>
                    <td>
                        Name</td>
                    <td>
                        <asp:Label ID="lblname" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Gender</td>
                    <td>
                        <asp:Label ID="lblgender" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Address</td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Mobile</td>
                    <td>
                        <asp:Label ID="lblmobile" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:GridView ID="gv2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" Caption="Job Card Details" CellPadding="4" 
            CssClass="pagehead" DataKeyNames="id" Font-Size="Smaller" 
            onrowdeleting="gv2_RowDeleting" 
            onselectedindexchanged="gv2_SelectedIndexChanged" PageSize="4" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="Job No" />
                <asp:BoundField DataField="JobDate" HeaderText="Job Date" />
                <asp:BoundField DataField="Name" HeaderText="Attended By" />
                <asp:BoundField DataField="Status" HeaderText="Job Status" />
                <asp:CommandField DeleteText="Details" ShowDeleteButton="True" />
            </Columns>
            <RowStyle BackColor="White" ForeColor="#003399" />
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" Font-Size="Smaller" ForeColor="#003399" 
                HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
    </TD><TD style="WIDTH: 5%">
        </TD></TR>
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
            &nbsp;</td>
        <td colspan="2">
            <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                BorderStyle="None" BorderWidth="1px" Caption="Service Details" CellPadding="4" 
                CssClass="pagehead" DataKeyNames="id" Font-Size="Smaller" PageSize="4" 
                Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SN">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="JobNo" HeaderText="Job No" />
                    <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" />
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
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <TR><TD style="WIDTH: 5%">
    </TD><TD>
        <asp:HiddenField ID="hdid" runat="server" />
            <asp:HiddenField ID="hdCid" runat="server" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
            Width="251px" />
        </TD><TD>&nbsp;</TD>
        <td style="WIDTH: 5%">
        </td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD> </TD><TD></TD><TD style="WIDTH: 5%"></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

