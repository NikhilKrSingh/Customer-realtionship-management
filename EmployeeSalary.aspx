<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EmployeeSalary.aspx.cs" Inherits="EmployeeSalary" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript"  language="javascript">

     function sum() {
         var txtFirstNumberValue = document.getElementById('<%=txtBasic.ClientID%>');
         var txtSecondNumberValue = document.getElementById('<%=txtDA.ClientID%>');
         if (txtFirstNumberValue == "")
             txtFirstNumberValue = 0;
         if (txtSecondNumberValue == "")
             txtSecondNumberValue = 0;

         var result = parseInt(txtFirstNumberValue) + parseInt(txtSecondNumberValue);
         if (!isNaN(result)) {
             document.getElementById('<%=txtBasic.ClientID%>') = result;
         }
     }
        </script>
    <h2>
        Employee Salary&nbsp;</h2>
        
    <p>
        &nbsp;</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            
            </asp:ScriptManager>
           
            <table>
                <tr>
                    <td style="width: 341px;">
                        Salary Date</td>
                    <td style="width: 197px;">
                        <asp:TextBox ID="txtDate" runat="server" MaxLength="50" Width="120px"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Employee ID</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:DropDownList ID="ddlEmployee" runat="server" Width="120px" 
                            AutoPostBack="True" onselectedindexchanged="ddlEmployee_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td colspan="2" style="height: 32px;">
                        <asp:Label ID="Label11" runat="server" BackColor="Purple" Font-Bold="True" 
                            Font-Italic="True" Font-Names="Monotype Corsiva" Font-Size="Large" 
                            ForeColor="White" Text="Deduction Details" Width="268px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Employee Name</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        PF</td>
                    <td style="width: 289px; height: 32px;">
                        <asp:TextBox ID="txtPF" runat="server" Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="txtPF" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                            runat="server" ControlToValidate="txtPF" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 32px;">
                        Designation</td>
                    <td style="width: 197px; height: 32px;">
                        <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 32px;">
                        LIC</td>
                    <td style="width: 289px; height: 32px;">
                        <asp:TextBox ID="txtLIC" runat="server" Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="txtLIC" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                            runat="server" ControlToValidate="txtLIC" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 35px;">
                        <asp:Label ID="Label6" runat="server" BackColor="Purple" Font-Bold="True" 
                            Font-Italic="True" Font-Names="Monotype Corsiva" Font-Size="Large" 
                            ForeColor="White" Text="Earning Details" Width="277px"></asp:Label>
                    </td>
                    <td style="width: 220px; height: 35px;">
                        Transport</td>
                    <td style="width: 289px; height: 35px;">
                        <asp:TextBox ID="txtTransport" runat="server" Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ControlToValidate="txtTransport" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                            runat="server" ControlToValidate="txtTransport" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 341px; height: 35px;">
                        Basic Pay</td>
                    <td style="width: 197px; height: 35px;">
                        <asp:TextBox ID="txtBasic" onkeydown="sum();"  runat="server" MaxLength="15" 
                            Width="120px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtBasic" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                            ControlToValidate="txtBasic" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 220px; height: 35px;">
                        &nbsp;</td>
                    <td style="width: 289px; height: 35px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        DA</td>
                    <td style="width: 197px">
                        <asp:TextBox ID="txtDA" runat="server" MaxLength="50" 
                            onkeypress="integer(this);" Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtDA" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                            ControlToValidate="txtDA" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 220px">
                        <asp:Button ID="btnCalculate" runat="server" onclick="btnCalculate_Click" 
                            Text="Calculate Salary" ValidationGroup="a" />
                    </td>
                    <td style="width: 289px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 341px">
                        HRA</td>
                    <td style="width: 197px">
                        <asp:TextBox ID="txtHRA" runat="server" MaxLength="15" Width="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="txtHRA" ErrorMessage="Answer 1 is required!" 
                            ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                            ControlToValidate="txtHRA" Display="Dynamic" 
                            ErrorMessage="Enter only numeric value" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 220px">
                        Net Salary</td>
                    <td style="width: 289px">
                        <asp:TextBox ID="txtNetSalary" runat="server" Width="120px"></asp:TextBox>
                    </td>
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
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="mGrid" 
                            DataKeyNames="id" Font-Size="Smaller" 
                            OnPageIndexChanging="gv1_PageIndexChanging" OnRowDeleting="gv1_RowDeleting" 
                            OnSelectedIndexChanged="gv1_SelectedIndexChanged" PageSize="4" Width="90%">
                            <Columns>
                                <asp:TemplateField HeaderText="SN">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SalaryDate" HeaderText="Salary Date" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" />
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtBasic" ErrorMessage="Enter number only in Basic Pay" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a" 
                            Display="Dynamic"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtDA" ErrorMessage="Enter number only in DA" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtHRA" ErrorMessage="Enter number only in HRA" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="txtPF" ErrorMessage="Enter number only in PF" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                            ControlToValidate="txtLIC" Display="Dynamic" 
                            ErrorMessage="Enter number only in LIC" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ControlToValidate="txtTransport" Display="Dynamic" 
                            ErrorMessage="Enter number only in Transport" 
                            ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="a"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

