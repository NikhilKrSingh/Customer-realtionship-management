<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="DepartmentMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Department Master</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR>
    <TD style="WIDTH: 5%; height: 26px;"></TD><TD style="height: 26px">
    Short Name</TD><TD style="height: 26px">
        <asp:TextBox ID="txtShortCode" runat="server" MaxLength="10"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="txtShortCode" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
    </TD><TD style="WIDTH: 5%; height: 26px;"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
    DepartmentName</TD><TD>
        <asp:TextBox ID="txtname" runat="server" MaxLength="35"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="txtname" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
    </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD colSpan=2><TABLE style="WIDTH: 174px" align=center><TBODY><TR><TD style="WIDTH: 100px">
    <asp:Button id="btnsave" onclick="btnsave_Click" runat="server" Width="47px" 
        Text="Save" ValidationGroup="a"></asp:Button></TD><TD style="WIDTH: 100px"><asp:Button id="btndelete" onclick="btndelete_Click" runat="server" Text="Delete"></asp:Button></TD><TD style="WIDTH: 100px"><asp:Button id="btnreset" onclick="btnreset_Click" runat="server" Text="Reset"></asp:Button></TD></TR></TBODY></TABLE></TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD colSpan=2>
    <asp:GridView id="gv1" runat="server" Width="99%" 
        OnRowDeleting="gv1_RowDeleting" 
        OnSelectedIndexChanged="gv1_SelectedIndexChanged" 
        OnPageIndexChanging="gv1_PageIndexChanging" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="id" CssClass="mGrid"><Columns>
<asp:TemplateField HeaderText="Serial No."><ItemTemplate>
<%# Container.DataItemIndex+1 %>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
<asp:BoundField DataField="ShortCode" HeaderText="Short Code"></asp:BoundField>
<asp:CommandField SelectText="Edit" ShowSelectButton="True"></asp:CommandField>
<asp:CommandField ShowDeleteButton="True"></asp:CommandField>
</Columns>
</asp:GridView></TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD><asp:HiddenField id="hdid" runat="server"></asp:HiddenField> </TD><TD>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        Font-Size="XX-Small" Height="15px" ShowSummary="False" ValidationGroup="a" 
        Width="251px" />
    </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD></TD><TD></TD><TD style="WIDTH: 5%"></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

