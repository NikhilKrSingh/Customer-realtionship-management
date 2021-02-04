<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="membermanagement.aspx.cs" Inherits="membermanagement" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        View Member &nbsp;</h2>
    <p>
        <table>
            <tr>
                <td style="width: 341px;" align="right">
                    Select&nbsp; Role</td>
                <td colspan="2">
                    <table>
                        <tr>
                            <td style="width: 100px">
                                <asp:DropDownList ID="ddlclass" runat="server" Width="181px" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>User</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 100px">
                                &nbsp;<asp:Button ID="btngo" runat="server" OnClick="btngo_Click" Text="Go" Width="68px" /></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 289px;">
                    <asp:HiddenField ID="hdid" runat="server" />
                    </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="90%" AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnPageIndexChanging="gv1_PageIndexChanging" DataKeyNames="mid" OnSelectedIndexChanged="gv1_SelectedIndexChanged" Font-Size="Smaller" PageSize="8" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Role" HeaderText="Role" />
                            <asp:BoundField DataField="ClassName" HeaderText="Class" />
                            <asp:BoundField DataField="fullname" HeaderText="Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="PinNo" HeaderText="Pin" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="lname" HeaderText="Login Name" />
                            <asp:BoundField DataField="pwd" HeaderText="Password" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                </td>
            </tr>
        </table>
    </p>
</asp:Content>

