<%@ Page Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="enquiry.aspx.cs" Inherits="enquiry" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Enquiry Form</h2>
    <p>
        <table>
            <tr>
                <td style="width: 167px">
                    Name</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtname" runat="server" Width="289px" MaxLength="50"></asp:TextBox></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                        ErrorMessage="Subject name is required!" ValidationGroup="a" Width="213px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 167px">
                    Address</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtaddress" runat="server" MaxLength="200" Width="289px"></asp:TextBox></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtaddress"
                        ErrorMessage="Address is required!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 167px">
                    Pin</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtpin" runat="server" onkeypress="integer(this);" MaxLength="6" Width="186px"></asp:TextBox></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpin"
                        ErrorMessage="Pin is required!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 167px">
                    Mobile</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtmobile" runat="server" onkeypress="integer(this);" MaxLength="11" Width="289px"></asp:TextBox></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmobile"
                        ErrorMessage="Mobile is required!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 167px">
                    Email</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtemail" runat="server" MaxLength="100" Width="289px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="Enter valid email id." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="a"></asp:RegularExpressionValidator></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="Email is required!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 167px">
                    Remarks</td>
                <td style="width: 308px">
                    <asp:TextBox ID="txtremarks" runat="server" MaxLength="500" TextMode="MultiLine" Width="289px" Height="62px"></asp:TextBox></td>
                <td style="width: 289px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtremarks"
                        ErrorMessage="Remarks is required!" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 24px">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
                <td style="width: 289px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 308px">
                </td>
                <td style="width: 289px">
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                    <asp:HiddenField ID="hdid" runat="server" />
                </td>
                <td style="width: 308px">
                    <table>
                        <tr>
                            <td align="center" style="width: 100px">
                                <asp:Button ID="btnsave" runat="server" Text="Post Enquiry" OnClick="btnsave_Click" ValidationGroup="a" Width="112px" /></td>
                            <td align="center" style="width: 100px">
                                </td>
                            <td align="center" style="width: 100px">
                                </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 289px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        ShowSummary="False" ValidationGroup="a" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
                <td style="width: 289px">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
                <td style="width: 289px">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

