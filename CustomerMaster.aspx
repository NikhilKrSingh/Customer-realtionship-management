<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="CustomerMaster.aspx.cs" Inherits="CustomerMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Customer Master&nbsp;</h2>
    <p>
        <table>
            <tr>
                <td style="width: 341px;">
                    Customer ID</td>
                <td style="width: 197px;">
                    <asp:Label ID="lblStudId" runat="server"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 341px;">
                    Name</td>
                <td style="width: 197px;">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50" Width="156px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" 
                        runat="server" ControlToValidate="txtName"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" 
                        Width="12px" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 220px;">
                    Permanent Address</td>
                <td style="width: 289px;" rowspan="2">
                                <asp:TextBox ID="txtPAddress" runat="server" Width="189px" 
                        MaxLength="500" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPAddress"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 341px;">
                    Gender</td>
                <td style="width: 197px;">
                                <asp:DropDownList ID="ddlGender" runat="server" Width="156px">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                </td>
                <td style="width: 220px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 341px; height: 30px;">
                    DOB</td>
                <td style="width: 197px; height: 30px;">
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" 
                        runat="server" ControlToValidate="txtDOB"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" 
                        Width="12px" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 220px; height: 30px;">
                    Currenet Address</td>
                <td style="width: 289px;" rowspan="2">
                                <asp:TextBox ID="txtCAddress" runat="server" Width="189px" 
                        MaxLength="500" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCAddress"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 341px;">
                    Father Name</td>
                <td style="width: 197px;">
                    <asp:TextBox ID="txtFName" runat="server" MaxLength="50" Width="156px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" 
                        runat="server" ControlToValidate="txtFName"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" 
                        Width="12px" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 220px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 341px; height: 32px;">
                    Occupation</td>
                <td style="width: 197px; height: 32px;">
                    <asp:TextBox ID="txtFOccupation" runat="server" MaxLength="50" Width="156px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" 
                        runat="server" ControlToValidate="txtFName"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" 
                        Width="12px">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 220px; height: 32px;">
                    Qualification</td>
                <td style="width: 289px; height: 32px;">
                    <asp:TextBox ID="txtQualification" runat="server" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" 
                        runat="server" ControlToValidate="txtQualification"
                                    ErrorMessage="Answer 1 is required!" ValidationGroup="a" 
                        Width="12px" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 341px; height: 35px;">
                    Phone No</td>
                <td style="width: 197px; height: 35px;">
                                <asp:TextBox ID="txtPhone" runat="server" Width="156px" 
                        MaxLength="15"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="Number only in Phone no" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a" 
                            Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
                <td style="width: 220px; height: 35px;">
                    Remarks</td>
                <td style="width: 289px; height: 35px;">
                                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 341px">
                    Email ID</td>
                <td style="width: 197px">
                    <asp:TextBox ID="txtEmail" onkeypress="integer(this);" runat="server" 
                        Width="156px" MaxLength="50"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Enter valid email id" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a" 
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Subject name is required!" ValidationGroup="a" 
                        InitialValue="0" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 220px">
                    &nbsp;</td>
                <td style="width: 289px">
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
                                <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" ValidationGroup="a" /></td>
                            <td align="center" style="width: 100px; height: 37px;">
                                <asp:Button ID="btndel" runat="server" Text="Delete" OnClick="btndel_Click" /></td>
                            <td align="center" style="width: 100px; height: 37px;">
                                <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" /></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 220px">
                    &nbsp;</td>
                <td style="width: 289px">
                    &nbsp;</td>
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
                <td colspan="4" style="height: 153px">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="4" OnPageIndexChanging="gv1_PageIndexChanging" 
                        PageSize="4" DataKeyNames="id" OnRowDeleting="gv1_RowDeleting" 
                        OnSelectedIndexChanged="gv1_SelectedIndexChanged" Font-Size="Smaller" 
                        CssClass="pagehead">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" HeaderText="Customer Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                            <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                            <asp:CommandField ShowDeleteButton="True" />
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
                    <asp:HiddenField ID="hdCid" runat="server" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        ShowSummary="False" ValidationGroup="a" Width="251px" Font-Size="XX-Small" 
                        Height="16px" />
                    <br />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>

