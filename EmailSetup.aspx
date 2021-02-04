<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EmailSetup.aspx.cs" Inherits="EmailSetup" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <h2>
        Email Account Setup</h2>
     

    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 223px">
                        Your Name</td>
                    <td style="width: 81px">
                        <asp:TextBox ID="txtname" runat="server" Width="198px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                        ErrorMessage="Required field !" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 223px">
                        Email Id [Gmail]</td>
                    <td style="width: 81px">
                        <asp:TextBox ID="txtemail"   onkeypress = "integer(this);"  runat="server" 
                        MaxLength="50" Width="198px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="Required field !" ValidationGroup="a"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Enter Valid Email Id !" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 223px">
                        Email Password</td>
                    <td style="width: 81px">
                        <asp:TextBox ID="txtpass" runat="server" MaxLength="15" Width="194px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpass"
                        ErrorMessage="Required field !" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 223px">
                        Confirm Email Password</td>
                    <td style="width: 81px">
                        <asp:TextBox ID="txtconfirmpass" runat="server" Width="192px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtconfirmpass" ControlToValidate="txtpass" 
                        ErrorMessage="Password not Same !" ValidationGroup="a"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 223px">
                        Subject for Confirmation</td>
                    <td style="width: 81px">
                        <asp:TextBox ID="txtsubject" runat="server" MaxLength="50" Width="194px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsubject"
                        ErrorMessage="Required field !" ValidationGroup="a" 
                        InitialValue="-Plz select-"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 223px">
                        <asp:HiddenField ID="hdid" runat="server" />
                    </td>
                    <td style="width: 81px" align="center">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save" 
                                        ValidationGroup="a" Width="71px" />
                                </td>
                                <td>
                                    <asp:Button ID="btntestemail" runat="server" onclick="btntestemail_Click" 
                                        Text="Send Me Test Email" Width="161px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 289px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        ShowSummary="False" ValidationGroup="a" Font-Size="XX-Small" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td style="width: 289px">
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

