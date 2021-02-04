<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="AssignJobCard.aspx.cs" Inherits="AssignJobCard" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 500px" class="TableUI"><TBODY><TR><TD style="WIDTH: 5%; HEIGHT: 16px"></TD>
    <TD style="HEIGHT: 16px" colspan="2">
        <h2>
            Assign Job Card</h2>
    </TD><TD style="WIDTH: 5%; HEIGHT: 16px"></TD></TR><TR><TD style="WIDTH: 5%">&nbsp;</TD><TD>
    &nbsp;</TD><TD>
        &nbsp;</TD><TD style="WIDTH: 5%">&nbsp;</TD></TR>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Job Card No</td>
        <td>
            <asp:DropDownList ID="ddlJobNo" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlJobNo_SelectedIndexChanged" Width="150px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="ddlJobNo" Display="Dynamic" 
                ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Date</td>
        <td>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%">
            &nbsp;</td>
        <td>
            Problem Discussion</td>
        <td>
            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
        </td>
        <td style="WIDTH: 5%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="WIDTH: 5%; height: 15px;">
        </td>
        <td style="height: 15px">
            Employee ID</td>
        <td style="height: 15px">
            <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlEmployee_SelectedIndexChanged" Width="150px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="ddlEmployee" Display="Dynamic" 
                ErrorMessage="Answer 1 is required!" InitialValue="-Plz select-" 
                ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
        </td>
        <td style="WIDTH: 5%; height: 15px;">
        </td>
    </tr>
    <tr>
        <td style="WIDTH: 5%; height: 15px;">
            &nbsp;</td>
        <td style="height: 15px">
            Employee Name</td>
        <td style="height: 15px">
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </td>
        <td style="WIDTH: 5%; height: 15px;">
            &nbsp;</td>
    </tr>
    <TR><TD style="WIDTH: 5%"></TD><TD colspan="2">
        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
        </TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>&nbsp;</TD>
    <TD>&nbsp;</TD>
    <td style="WIDTH: 5%">
    </td>
    </TR><TR><TD style="WIDTH: 5%"></TD><TD colSpan=2>
        <table align="center" style="WIDTH: 174px">
            <tbody>
                <tr>
                    <td style="WIDTH: 100px">
                        <asp:Button ID="btnsave" runat="server" onclick="btnsave_Click" Text="Save" 
                            Width="47px" ValidationGroup="a" />
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
        &nbsp;</TD><TD style="WIDTH: 5%"></TD></TR><TR><TD style="WIDTH: 5%"></TD><TD>
    <asp:HiddenField ID="hdid" runat="server" />
    </TD><TD>
        <asp:HiddenField ID="hdEid" runat="server" />
    </TD><TD style="WIDTH: 5%"></TD></TR>
    <tr>
        <td style="WIDTH: 5%">
        </td>
        <td>
            <asp:HiddenField ID="hdJobNo" runat="server" />
        </td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                Font-Size="XX-Small" Height="16px" ShowSummary="False" ValidationGroup="a" 
                Width="251px" />
        </td>
        <td style="WIDTH: 5%">
        </td>
    </tr>
    </TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

