<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ContactCustomer.aspx.cs" Inherits="ContactCustomer" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Contact Customer</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
    &nbsp;</TD><TD>
        &nbsp;</TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD>
    <TD colspan="2">
        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="mGrid" 
            DataKeyNames="id" Font-Size="Smaller" onrowdeleting="gv1_RowDeleting" 
            Width="90%" onpageindexchanging="gv1_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
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
    </TD><TD></TD>
        <td style="WIDTH: 5%">
        </td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD> </TD><TD></TD><TD style="WIDTH: 5%"></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

