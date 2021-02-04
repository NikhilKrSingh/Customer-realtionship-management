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
public partial class JobCardHistory : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
               // cmn.fillddl(ddlCustomer, "Select id, id as name from CustomerMaster", "name", "id");
                hdid.Value=Request.QueryString["id"].ToString();

                FillGrid(hdid.Value);
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void FillGrid(string id)
    {
        string sql = "select ServiceDetail.id,ServiceDetail.JobNo, convert(varchar,serviceDate,105) as ServiceDate,ServiceDetail.ActionTaken,ServiceDetail.Remark,customerMaster.Name as Customer, " +
                       " EmployeeMaster.Name as Employee,JobCardMaster.Status from ServiceDetail " +
                       " left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id  " +
                       " left join CustomerMaster on  JobCardMaster.customerID=CustomerMaster.id  " +
                       " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id  where ServiceDetail.JobNo=" + id.ToString() + " order by ServiceDetail.id desc ";
        cmn.fillgrid(gv1, sql);

        if (gv1.Rows.Count <= 0)
        {
            lblMsg.Text = "No record found!!";
        }
        else
        {
            lblMsg.Text = "";
        }



        DataTable dt = cmn.mydatatable("Select JobDate,CustomerMaster.name as customer, employeemaster.name as employee,Status from JobCardMaster " +
           " left join customermaster on JobCardMaster.customerid =customermaster.id " +
           " left join Employeemaster on JobCardMaster.AssignTo =Employeemaster.id " +
           " where JobCardMaster.id=" + hdid.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
            // txtDate.Text = Convert.ToDateTime(dt.Rows[0]["JobDate"].ToString()).ToString("dd-MM-yyyy");
            lblJobNo.Text = hdid.Value.ToString();
            lblCustomer.Text = dt.Rows[0]["customer"].ToString();
            lblEmployee.Text = dt.Rows[0]["employee"].ToString();
            lblStatus.Text = dt.Rows[0]["Status"].ToString();
        }

    }

    

   

  
}
