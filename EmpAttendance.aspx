<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EmpAttendance.aspx.cs" Inherits="EmpAttendance" Title="Untitled Page" %>
   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <h2>
           Employee
        Attendance
    </h2>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Attendance Header" Width="100%"> 
        Today :
        <asp:Label ID="lblToday" runat="server" CssClass="borderlabel"></asp:Label>
        &nbsp; &nbsp;<asp:Label ID="lblWeekno" runat="server" CssClass="borderlabel" 
            Visible="False"></asp:Label>
        &nbsp; &nbsp;
        <br />
        Department :
        <asp:Label ID="lblPeriod" runat="server" CssClass="borderlabel"></asp:Label>
        &nbsp; &nbsp; <asp:Label ID="lblSemister" runat="server" CssClass="borderlabel" 
            Visible="False"></asp:Label>
 

        </asp:Panel>
       <br />
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="admno"
           DataSourceID="SqlDataSource1" Width="100%">
           <Columns>
               <asp:BoundField DataField="admno" HeaderText="admno" ReadOnly="True" SortExpression="admno" >
                   <ItemStyle HorizontalAlign="Center" />
               </asp:BoundField>
               <asp:BoundField DataField="sname" HeaderText="sname" SortExpression="sname" >
                   <ItemStyle HorizontalAlign="Center" />
               </asp:BoundField>
               <asp:TemplateField HeaderText="Attendance">
                   <ItemTemplate>
                       <asp:RadioButton ID="rbPresent" runat="server" Checked="True" GroupName="g1" Text="Present" />
                       <asp:RadioButton ID="rbAbsent" runat="server" GroupName="g1" Text="Absent" />
                       <asp:RadioButton ID="rbLeave" runat="server" GroupName="g1" Text="Leave" />
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" />
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Remarks">
                   <ItemTemplate>
                       <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" />
               </asp:TemplateField>
           </Columns>
          
       </asp:GridView>
       <br />
       <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="131px" OnClick="btnSubmit_Click" />
       <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Back" 
           Width="81px" />
       <br />
       <asp:HiddenField ID="hdid" runat="server" />
       <br />
       <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
       <br />
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamConnectionString1 %>"
           
    
           
           SelectCommand="select  id as admno,Name as sname from EmployeeMaster where Department=@Department">
           <SelectParameters>
               <asp:QueryStringParameter Name="Department" QueryStringField="id" />
           </SelectParameters>
       </asp:SqlDataSource>
</asp:Content>

