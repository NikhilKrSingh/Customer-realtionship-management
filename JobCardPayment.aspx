<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="JobCardPayment.aspx.cs" Inherits="JobCardPayment" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="HEIGHT: 16px" 
        colspan="4">
    <h2>
        Payment</h2>
    </TD>
    </TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <table style="width: 80%">
                <tr>
                    <td>
                        Select Job Card</td>
                    <td>
                        <asp:DropDownList ID="ddlJobCard" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlJobCard_SelectedIndexChanged">
                        </asp:DropDownList>
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
            <table style="width: 100%">
                <tr>
                    <td>
                        Job Card No</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblJobNo" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;</td>
                    <td>
                        Customer Id</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblCustomerId" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Name</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Attended By</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblAttendedBy" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Address</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Email
                    </td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Problem Detail</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="lblRemark" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
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
    <TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:GridView ID="gv2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" Caption="Job Card Details" CellPadding="4" 
            CssClass="pagehead" DataKeyNames="id" Font-Size="Smaller" PageSize="4" 
            Width="100%">
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
                Width="100%" onpageindexchanging="gv1_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="SN">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ActionTaken" HeaderText="Service" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" />
                    <asp:BoundField DataField="Charges" HeaderText="Charges" />
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
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td colspan="2">
            <table class="style3" style="width: 93%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Total Amount (Rs)"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Payment Mode"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMode" runat="server" Width="150px">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Cheque</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Remarks / Cheque No"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
                    </td>
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
            &nbsp;</td>
        <td colspan="2">
            <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Back" />
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

