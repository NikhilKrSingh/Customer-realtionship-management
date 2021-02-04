<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ServiceMaster.aspx.cs" Inherits="ServiceMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Service Master</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
    Short Name</TD><TD>
        <asp:TextBox ID="txtShortCode" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="txtShortCode" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
    </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
    Service Name</TD><TD>
        <asp:TextBox ID="txtname" runat="server" MaxLength="45" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txtname" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
    </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%">&nbsp;</TD><TD>Service 
    Charges</TD><TD>
        <asp:TextBox ID="txtCharges" runat="server" MaxLength="9" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
            ControlToValidate="txtCharges" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtCharges" ErrorMessage="Only numbers in charges!" 
            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
    </TD>
    <td style="WIDTH: 5%">
        &nbsp;</td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD colSpan=2>
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
        </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="id" 
            OnPageIndexChanging="gv1_PageIndexChanging" OnRowDeleting="gv1_RowDeleting" 
            OnSelectedIndexChanged="gv1_SelectedIndexChanged" Width="99%">
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ShortCode" HeaderText="Short Code" />
                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                <asp:BoundField DataField="Charges" HeaderText="Charges"></asp:BoundField>
                <asp:CommandField SelectText="Edit" ShowSelectButton="True"></asp:CommandField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
    </TD><TD style="WIDTH: 5%">
    </TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
        <asp:HiddenField ID="hdid" runat="server" />
        </TD><TD>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                Font-Size="XX-Small" Height="15px" ShowSummary="False" ValidationGroup="a" 
                Width="251px" />
        </TD><TD style="WIDTH: 5%"></TD></TR>
    <tr>
        <td style="WIDTH: 5%">
        </td>
        <td>
        </td>
        <td>
            &nbsp;</td>
        <td style="WIDTH: 5%">
        </td>
    </tr>
    </TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

