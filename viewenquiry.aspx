<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="viewenquiry.aspx.cs" Inherits="viewenquiry" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        View Enquiry &nbsp;</h2>
    <p>
        <table>
            <tr>
                <td style="width: 341px;" align="left">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></td>
                <td colspan="2">
                </td>
                <td style="width: 289px;">
                    <asp:HiddenField ID="hdid" runat="server" />
                    </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="90%" AllowPaging="True" OnPageIndexChanging="gv1_PageIndexChanging" DataKeyNames="eid" OnSelectedIndexChanged="gv1_SelectedIndexChanged" Font-Size="Smaller" PageSize="8" OnRowDeleting="gv1_RowDeleting" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EDate" HeaderText="Enquiry Date" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="address" HeaderText="Address" />
                            <asp:BoundField DataField="pin" HeaderText="Pin" />
                            <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                            <asp:BoundField DataField="email" HeaderText="EMail" />
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <PagerStyle Font-Size="Smaller" />
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

