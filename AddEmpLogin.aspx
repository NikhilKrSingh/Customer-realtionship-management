<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="AddEmpLogin.aspx.cs" Inherits="AddEmpLogin" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Add Employee Login</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            
            </asp:ScriptManager>
           
            <table>
                <tr>
                    <td style="width: 341px;">
                        &nbsp;</td>
                    <td style="width: 197px;">
                        &nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Employee ID</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:DropDownList ID="ddlEmployee" runat="server" Width="120px" 
                            AutoPostBack="True" 
                            onselectedindexchanged="ddlEmployee_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="ddlEmployee" ErrorMessage="*" InitialValue="-Plz select-" 
                            ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                    <td colspan="2" style="height: 32px;">
                        <asp:Label ID="Label11" runat="server" BackColor="#003399" Font-Bold="True" 
                            Font-Italic="False" Font-Names="Arial Narrow" Font-Size="Large" 
                            ForeColor="White" Text="Employee Login Detail" Width="268px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Employee Name</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        User Name</td>
                    <td style="width: 289px; height: 32px;">
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtUsername" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Department</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        Password</td>
                    <td style="width: 289px; height: 32px;">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtPassword" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 31px;">
                        Contact No</td>
                    <td style="width: 197px; height: 31px;">
                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 31px;">
                        </td>
                    <td style="width: 289px; height: 31px;">
                        </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Email ID</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        &nbsp;</td>
                    <td style="width: 289px; height: 32px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        &nbsp;</td>
                    <td style="width: 197px">
                        &nbsp;</td>
                    <td style="width: 220px">
                        &nbsp;</td>
                    <td style="width: 289px">
                        &nbsp;</td>
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
                        &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            Font-Size="XX-Small" Height="15px" ShowSummary="False" ValidationGroup="a" 
                            Width="251px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px">
                    </td>
                    <td style="width: 197px">
                    </td>
                    <td style="width: 220px">
                    </td>
                    <td style="width: 289px">
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:GridView ID="gv1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="pagehead" 
                            DataKeyNames="mid" Font-Size="Smaller" 
                            OnPageIndexChanging="gv1_PageIndexChanging" 
                            OnRowDeleting="gv1_RowDeleting" PageSize="4" Width="90%" 
                            onselectedindexchanged="gv1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="SN">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="fullname" HeaderText="Student Name" />
                                <asp:BoundField DataField="lname" HeaderText="User Name" />
                                <asp:BoundField DataField="pwd" HeaderText="Password" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="role" HeaderText="Role" />
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
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

