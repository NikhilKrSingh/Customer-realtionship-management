using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class JobCardPayment : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                cmn.fillddl(ddlJobCard, "Select id, id as name from JobCardMaster where Status='Close'  and PaidYN= 'N'  and AssignTo is not null", "name", "id");

                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                lblAmount.Visible = false;
                ddlMode.Visible = false;
                txtRemarks.Visible = false;
                btnSave.Visible = false;
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }


    protected void FillJobCard(string JobCard)
    {
        string sql = "select JobCardMaster.id, convert(varchar,JobDate,105) as JobDate,Status,(case when isnull(EmployeeMaster.Name,'NULL')='NULL' then 'Not Assigned' else EmployeeMaster.Name end) as Name,ProblemDesc  from JobCardMaster left join EmployeeMaster on JobCardMaster.AssignTo=EmployeeMaster.id " +
                       "  where JobCardMaster.ID=" + JobCard.ToString() + " order by JobCardMaster.id desc ";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
            lblJobNo.Text = dt.Rows[0]["id"].ToString();
            lblDate.Text = dt.Rows[0]["JobDate"].ToString();
            lblAttendedBy.Text = dt.Rows[0]["Name"].ToString();
            lblRemark.Text = dt.Rows[0]["ProblemDesc"].ToString();
        }

    }

    protected void FillGridService(string JobNo)
    {
        string sql = "select ServiceDetail.id,JobNo, convert(varchar,serviceDate,105) as ServiceDate,ServiceDetail.ActionTaken,ServiceDetail.Remark,ServiceMaster.Charges , " +
                       " EmployeeMaster.Name as Employee,ServiceDetail.Status from ServiceDetail " +
                       " left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id  " +
                       " left join ServiceMaster on ServiceDetail.ServiceId=ServiceMaster.Id " + 
                       " left join CustomerMaster on  JobCardMaster.customerID=CustomerMaster.id  " +
                       " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id  where JobCardMaster.id=" + JobNo.ToString() + " order by ServiceDetail.id Asc ";
        cmn.fillgrid(gv1, sql);

        if (gv1.Rows.Count <= 0)
        {
            lblMsg.Text = "No Service record found!!";
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            lblAmount.Visible = false;
            ddlMode.Visible = false;
            txtRemarks.Visible = false;
            btnSave.Visible = false;
        }
        else
        {
            lblMsg.Text = "";

            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            lblAmount.Visible = true;
            ddlMode.Visible = true;
            txtRemarks.Visible = true;
            btnSave.Visible = true;
        }
    }

    protected void FillCustomer(string JobNo)
    {
        hdCid.Value = cmn.dmlscaler("Select customerId from JobCardMaster where id=" + JobNo.ToString() + "");
        string sql1;
        sql1 = "Select * from CustomerMaster where id=" + hdCid.Value + "";
        DataTable dt = cmn.mydatatable(sql1);
        if (dt.Rows.Count > 0)
        {
            lblname.Text = dt.Rows[0]["name"].ToString();
            lbladdress.Text = dt.Rows[0]["CAddress"].ToString();
            lblCustomerId.Text = hdCid.Value.ToString();
            lblemail.Text = dt.Rows[0]["EmailId"].ToString();
        }
    }


    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        FillGridService(hdid.Value);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("OpenJobCard.aspx");
    }

    protected void ddlJobCard_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = ddlJobCard.SelectedValue.ToString();
        FillCustomer(hdid.Value);
        FillJobCard(hdid.Value);
        FillGridService(hdid.Value);

        lblAmount.Text=cmn.dmlscaler("select sum(ServiceMaster.Charges)  from ServiceDetail " +
                                    " left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id " +
                                    " left join ServiceMaster on ServiceDetail.ServiceId=ServiceMaster.Id " +
                                    " where JobCardMaster.id=" + hdid.Value.ToString() + "").ToString();
    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        cmn.dmloperation("Update JobCardMaster set PaidYN='Y',ModeOfPay='" + ddlMode.SelectedValue.ToString() +"' where id=" + hdid.Value.ToString()  + "");
        ddlMode.SelectedIndex = 0;
        txtRemarks.Text = "";
    }
}
