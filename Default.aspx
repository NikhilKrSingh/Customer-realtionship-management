<%@ Page Language="C#" MasterPageFile="~/main.master" Title="Untitled Page" %>

<script runat="server">
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblName.Text = "Welcome To " + Session["fullname"];
        //lblDate.Text = "Lasted Visited At : " + Session["dlv"];
        
        FillGrid();
    }
    protected void FillGrid()
    {
        if (Session["role"] == "Employee")
        {

            Fillgrid5();
        }
        else
        {
            string sql = "Select id, Name,FatherName,EmailId,Department  " +
                          " from EmployeeMaster";
            Fillgrid1();
            Fillgrid2();
            Fillgrid3();
            FillGridEnquiry4();
        }
        
    }


    protected void Fillgrid1()
    {
        try
        {
            
            string sql;
            sql = "select JobCardMaster.id as JobNo, convert(varchar,JobDate,105) as JobDate,JobCardMaster.Status, (case when isnull(EmployeeMaster.Name,'NULL')='NULL' then 'Not Assigned' else EmployeeMaster.Name end) as Name " +
                   " from JobCardMaster " +
                   " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id where status='Open' and isnull(EmployeeMaster.Name,'NULL')='NULL' order by JobCardMaster.id desc";
            cmn.fillgrid(gv1, sql);

            if (gv1.Rows.Count <= 0)
            {
                lblMsg1.Text = "No UnAssigned Job Card to Display!!";
            }
            else
            {
                lblMsg1.Text = "";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void Fillgrid2()
    {
        try
        {
            string sql;
            sql = "select JobCardMaster.id as JobNo, convert(varchar,JobDate,105) as JobDate,EmployeeMaster.Name as Employee,JobCardMaster.Status " +
                   " from JobCardMaster " +
                   " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id where status='Open' and  isnull(EmployeeMaster.Name,'NULL')  not in ('NULL') order by JobCardMaster.id desc";
            cmn.fillgrid(gv2, sql);
            
            if (gv2.Rows.Count <= 0)
            {
                lblMsg2.Text = "No open Job Card to Display!!";
            }
            else
            {
                lblMsg2.Text = "";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void Fillgrid3()
    {
        try
        {
            string sql = "select max(JobCardMaster.id) as Id, max(convert(varchar,JobDate,105)) as JobDate, max(customerMaster.Name) as Name, " +
                       " Sum(serviceMaster.charges) as Amount  " +
                       " from JobCardMaster left join customerMaster on  JobCardMaster.customerid=customerMaster.id  " +
                       " left join ServiceDetail on JobCardMaster.id=ServiceDetail.JobNo " +
                       " left join ServiceMaster on ServiceMaster.id=ServiceDetail.serviceId " +
                       " where JobCardMaster.id> 0 group by JobCardMaster.Id order by jobCardMaster.Id desc";
            cmn.fillgrid(gv3, sql);

            if (gv3.Rows.Count <= 0)
            {
                lblMsg3.Text = "No Payment to Display!!";
            }
            else
            {
                lblMsg3.Text = "";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void Fillgrid5()
    {
        try
        {
            hdMid.Value = cmn.dmlscaler("Select EmployeeId from oe_members where mid=" + Session["mid"].ToString() +"");
            string sql;
            sql = "select JobCardMaster.id as JobNo, convert(varchar,JobDate,105) as JobDate,EmployeeMaster.Name as Employee,JobCardMaster.Status " +
                   " from JobCardMaster " +
                   " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id where status='Open' and assignto=" + hdMid.Value.ToString() + " order by JobCardMaster.id desc";
            cmn.fillgrid(gv5, sql);

            if (gv5.Rows.Count <= 0)
            {
                lblMsg5.Text = "No Job Card to Display!!";
            }
            else
            {
                lblMsg5.Text = "";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void FillGridEnquiry4()
    {
        string sql = "Select  Enquiry.*, convert (Varchar,EnquiryDate,103 ) as EDate from Enquiry order by eid desc  ";
        cmn.fillgrid(gv4, sql);

        if (gv4.Rows.Count <= 0)
        {
            lblMsg4.Text = "No New query to Display!!";
        }
        else
        {
            lblMsg4.Text = "";
        }
    }

    protected void gv4_SelectedIndexChanged(object sender, EventArgs e)
    {
        hd4.Value = gv4.DataKeys[gv4.SelectedIndex].Value.ToString();
        Response.Redirect("viewdetailenquiry.aspx?id=" + hd4.Value + " ");
    }

    protected void gv2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv2.PageIndex = e.NewPageIndex;
        Fillgrid2();
    }

    protected void gv4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv4.PageIndex = e.NewPageIndex;
        FillGridEnquiry4();
    }

    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        Fillgrid1(); 
    }

    protected void gv5_SelectedIndexChanged(object sender, EventArgs e)
    {
        hd5.Value = gv5.DataKeys[gv5.SelectedIndex].Value.ToString();
        Response.Redirect("EnterServiceDetailEmp.aspx?JobNo=" + hd5.Value.ToString() + "");
    }

    protected void gv5_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv5.PageIndex = e.NewPageIndex;
        Fillgrid5();
    }

    protected void gv2_SelectedIndexChanged(object sender, EventArgs e)
    {
        hd2.Value = gv2.DataKeys[gv2.SelectedIndex].Value.ToString();
        Response.Redirect("JobCardServiceDetail.aspx?id=" + hd2.Value.ToString() + "");
    }

    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Response.Redirect("AssignJobCard.aspx?JobNo=" + gv1.DataKeys[gv1.SelectedIndex].Value.ToString() + "");
    }

    protected void gv3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv3.PageIndex = e.NewPageIndex;
        Fillgrid3(); 
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table width="100%">
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Names="Verdana" Width="320px">CRM STATUS REPORT</asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 21px;" colspan="2">
                <table style="width: 100%">
                    <tr>
                        <td colspan="2">
                    <asp:GridView ID="gv5" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" 
                        PageSize="4" DataKeyNames="jobNo" Font-Size="Small" 
                        CssClass="pagehead" Caption="Open Job Card  Details" 
                                onselectedindexchanged="gv5_SelectedIndexChanged" 
                                onpageindexchanging="gv5_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Job No" DataField="JobNo" />
                            <asp:BoundField HeaderText="Assigned To" DataField="Employee" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Add Service" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                            Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                            <br />
                            <asp:Label ID="lblMsg5" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" 
                        PageSize="4" DataKeyNames="JobNo" Font-Size="Small" 
                        CssClass="pagehead" Caption="Unassigned Job Card Details" 
                                onpageindexchanging="gv1_PageIndexChanging" 
                                onselectedindexchanged="gv1_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="JobNo" DataField="JobNo" />
                            <asp:BoundField HeaderText="JobDate" DataField="JobDate" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                            Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                            <br />
                            <asp:Label ID="lblMsg1" runat="server"></asp:Label>
                        </td>
                        <td width="50%">
                    <asp:GridView ID="gv2" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" 
                        PageSize="4" DataKeyNames="jobNo" Font-Size="Small" 
                        CssClass="pagehead" Caption="Open Job Card  Details" 
                                onpageindexchanging="gv2_PageIndexChanging" 
                                onselectedindexchanged="gv2_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Job No" DataField="JobNo" />
                            <asp:BoundField HeaderText="Assigned To" DataField="Employee" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                            Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                            <br />
                            <asp:Label ID="lblMsg2" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                    <asp:GridView ID="gv3" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" 
                        PageSize="4" DataKeyNames="id" Font-Size="Small" 
                        CssClass="pagehead" Caption="Payment Collected Detail" 
                                onpageindexchanging="gv3_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Job No" DataField="Id" />
                            <asp:BoundField DataField="JobDate" HeaderText="JobDate" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                            Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                            <br />
                            <asp:Label ID="lblMsg3" runat="server"></asp:Label>
                        </td>
                        <td>
                    <asp:GridView ID="gv4" runat="server" AutoGenerateColumns="False" Width="90%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" 
                        PageSize="4" DataKeyNames="eid" Font-Size="Small" 
                        CssClass="pagehead" Caption="New Enquiry Detail" 
                                onselectedindexchanged="gv4_SelectedIndexChanged" 
                                onpageindexchanging="gv4_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Date" DataField="EDate" />
                            <asp:BoundField DataField="email" HeaderText="Email Id" />
                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                            Font-Size="Smaller" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                            <br />
                            <asp:Label ID="lblMsg4" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:HiddenField ID="hd1" runat="server" />
                <asp:HiddenField ID="hd2" runat="server" />
                <asp:HiddenField ID="hd3" runat="server" />
                <asp:HiddenField ID="hd4" runat="server" />
                <asp:HiddenField ID="hd5" runat="server" />
                <asp:HiddenField ID="hdMid" runat="server" />
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
</asp:Content>

