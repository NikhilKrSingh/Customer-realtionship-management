<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="NewJobCard.aspx.cs" Inherits="NewJobCard" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        New Job Card</h2>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 341px;">
                        Job Card No</td>
                    <td style="width: 197px;">
                        <asp:Label ID="lblJobNo" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtDate" Display="Dynamic" 
                            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Job Card Date</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:TextBox ID="txtDate" runat="server" MaxLength="15" Width="156px"></asp:TextBox>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        Customer Id</td>
                    <td style="width: 289px; height: 32px;">
                        <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlCustomer_SelectedIndexChanged" Width="150px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="ddlCustomer" Display="Dynamic" 
                            ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 35px;">
                        Priority</td>
                    <td style="width: 197px; height: 35px;">
                        <asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" 
                            Width="150px">
                            <asp:ListItem>Normal</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 220px; height: 35px;">
                        Customer Name</td>
                    <td style="width: 289px; height: 35px;">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        Status</td>
                    <td style="width: 197px">
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
                            Width="150px">
                            <asp:ListItem>Open</asp:ListItem>
                            <asp:ListItem>Close</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 220px">
                        Email</td>
                    <td style="width: 289px">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        Problem Description</td>
                    <td rowspan="2" style="width: 197px">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                            Width="150px"></asp:TextBox>
                    </td>
                    <td style="width: 220px">
                        Mobile</td>
                    <td style="width: 289px">
                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        &nbsp;</td>
                    <td style="width: 220px">
                        Address</td>
                    <td style="width: 289px">
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        <asp:HiddenField ID="hdid" runat="server" />
                    </td>
                    <td style="width: 197px">
                        <table>
                            <tr>
                                <td align="center" style="width: 100px; height: 37px;">
                                    <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save" 
                                        ValidationGroup="a" />
                                </td>
                                <td align="center" style="width: 100px; height: 37px;">
                                    <asp:Button ID="btndel" runat="server" OnClick="btndel_Click" Text="Delete" />
                                </td>
                                <td align="center" style="width: 100px; height: 37px;">
                                    <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" 
                                        Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 220px">
                        &nbsp;</td>
                    <td style="width: 289px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 153px">
                        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="pagehead" 
                            DataKeyNames="id" Font-Size="Smaller" 
                            OnPageIndexChanging="gv1_PageIndexChanging" OnRowDeleting="gv1_RowDeleting" 
                            OnSelectedIndexChanged="gv1_SelectedIndexChanged" PageSize="4" Width="90%">
                            <Columns>
                                <asp:TemplateField HeaderText="SN">
                                    <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Job No" />
                                <asp:BoundField DataField="jobdate" HeaderText="Job Date" />
                                <asp:BoundField DataField="Name" HeaderText="Customer" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <PagerStyle BackColor="#99CCCC" Font-Size="Smaller" ForeColor="#003399" 
                                HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        </asp:GridView>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:HiddenField ID="hdCid" runat="server" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
                            Width="251px" />
                    <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

