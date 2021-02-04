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
public partial class EnterServiceDetailEmp : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                cmn.fillddl(ddlJobNo, "Select id, id as name from JobCardMaster where AssignTo is not null and status='Open'", "name", "id");
                cmn.fillddl(ddlService, "Select id, name from ServiceMaster ", "name", "id");
                reset();
                
                hdJobNo.Value = Request.QueryString["JobNo"].ToString();
                DataTable dt = cmn.mydatatable("Select JobDate,CustomerMaster.name as customer, employeemaster.name as employee,JobCardMaster.ProblemDesc  from JobCardMaster " +
                        " left join customermaster on JobCardMaster.customerid =customermaster.id " +
                        " left join Employeemaster on JobCardMaster.AssignTo =Employeemaster.id " +
                        " where JobCardMaster.id=" + hdJobNo.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
            lblCustomer.Text = dt.Rows[0]["customer"].ToString();
            lblEmployee.Text = dt.Rows[0]["employee"].ToString();
            txtProblem.Text = dt.Rows[0]["ProblemDesc"].ToString();
        }

        ddlJobNo.SelectedValue = hdJobNo.Value.ToString();
            }
            fillgrid();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql;
            if (btnsave.Text == "Save")
            {
                sql = "Insert into ServiceDetail (JobNo,ServiceDate,ServiceId,ActionTaken,Remark,Status) values ( " +
                        " " + ddlJobNo.SelectedValue.ToString() + ", " +
                        " '" + Convert.ToDateTime(txtDate.Text.ToString()).ToString("yyyy-MM-dd") + "', " +
                        " " + ddlService.SelectedValue.ToString() + ", " +
                        " '" + ddlService.SelectedItem.ToString() + "', " +
                        " '" + txtRemark.Text + "', " +
                        " '" + ddlStatus.SelectedValue.ToString() + "')";
                cmn.dmloperation("Update JobCardMaster set Status='" + ddlStatus.SelectedValue.ToString() + "' where id=" + ddlJobNo.SelectedValue.ToString() + "");
            }
            else
            {
                sql = "Update ServiceDetail set ServiceId=" + ddlService.SelectedValue.ToString() + ",ActionTaken='" + ddlService.SelectedItem.ToString() + "',Remark='" + txtRemark.Text + "',Status='" + ddlStatus.SelectedValue.ToString() + "' where Id=" + hdid.Value + "";
                cmn.dmloperation("Update JobCardMaster set Status='" + ddlStatus.SelectedValue.ToString() + "' where id=" + ddlJobNo.SelectedValue.ToString() + "");
            }
            cmn.dmloperation(sql);
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void reset()
    {
        lblServiceId.Text = "";
        //cmn.fillddl(ddlJobNo, "Select id, id as name from JobCardMaster where AssignTo is not null and status='Open'", "name", "id");
        //ddlJobNo.SelectedIndex = 0;
        //lblCustomer.Text = "";
        //lblEmployee.Text = "";
        txtRemark.Text = "";
      //  txtAction.Text = "";
        ddlStatus.SelectedIndex = 0;
        ddlService.SelectedIndex = 0;
        btnsave.Text = "Save";
        txtDate.Text = DateTime.Today.ToShortDateString();
       // txtProblem.Text = "";
        fillgrid();
       // ddlJobNo.Enabled =true;
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        reset();
    }
    protected void fillgrid()
    {
        try
        {
            SqlConnection cn = new SqlConnection(DBUtil.ConnectionString);
            cn.Open();
            string sql;
            sql = "select ServiceDetail.id,JobCardMaster.id as JobNo, convert(varchar,serviceDate,105) as ServiceDate,customerMaster.Name as Customer,EmployeeMaster.Name as Employee,JobCardMaster.Status " +
                   " from ServiceDetail left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id " +
                   " left join CustomerMaster on  JobCardMaster.customerID=CustomerMaster.id " +
                   " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id where ServiceDetail.JobNo=" + hdJobNo.Value.ToString() +  "";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            gv1.DataSource = dt;
            gv1.DataBind();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex ;
        fillgrid();
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            cmn.fillddl(ddlJobNo, "Select id, id as name from JobCardMaster where AssignTo is not null ", "name", "id");
            hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
            string sql;
            sql = "select ServiceDetail.id,JobCardMaster.id as JobNo,ServiceDetail.ServiceId,ServiceMaster.name as ActionTaken,ServiceDetail.Remark,ServiceDetail.Status, convert(varchar,serviceDate,105) as ServiceDate,customerMaster.Name as Customer, " +
                   " EmployeeMaster.Name as Employee,JobCardMaster.ProblemDesc    " +
                   " from ServiceDetail " +
                   " left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id  " +
                   " left join ServiceMaster on ServiceDetail.ServiceId=ServiceMaster.Id " + 
                   " left join CustomerMaster on  JobCardMaster.customerID=CustomerMaster.id  " +
                   " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id  where ServiceDetail.id=" + hdid.Value + "";
           
            SqlConnection cn = new SqlConnection(DBUtil.ConnectionString);
            cn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblServiceId.Text = dt.Rows[0]["id"].ToString();
                txtDate.Text = Convert.ToDateTime(dt.Rows[0]["ServiceDate"].ToString()).ToString("dd-MM-yyyy");
                ddlJobNo.SelectedValue = dt.Rows[0]["JobNo"].ToString();
                lblCustomer.Text = dt.Rows[0]["Customer"].ToString();
                lblEmployee.Text = dt.Rows[0]["Employee"].ToString();
                ddlService.SelectedValue = dt.Rows[0]["ServiceId"].ToString();
                //txtAction.Text = dt.Rows[0]["ActionTaken"].ToString();
                txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                txtProblem.Text = dt.Rows[0]["ProblemDesc"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();

                btnsave.Text = "Update";
                ddlJobNo.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            cmn.dmloperation("Delete from ServiceDetail where id=" + hdid.Value + "");
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
            cmn.dmloperation("Delete from ServiceDetail where Id=" + hdid.Value + "");
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void ddlJobNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = ddlJobNo.SelectedValue.ToString();
        DataTable dt = cmn.mydatatable("Select JobDate,CustomerMaster.name as customer, employeemaster.name as employee,ProblemDesc from JobCardMaster " +
            " left join customermaster on JobCardMaster.customerid =customermaster.id " +
            " left join Employeemaster on JobCardMaster.AssignTo =Employeemaster.id " +
            " where JobCardMaster.id=" + hdid.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
           // txtDate.Text = Convert.ToDateTime(dt.Rows[0]["JobDate"].ToString()).ToString("dd-MM-yyyy");
            lblCustomer.Text = dt.Rows[0]["customer"].ToString();
            lblEmployee.Text = dt.Rows[0]["employee"].ToString();
            txtProblem.Text = dt.Rows[0]["ProblemDesc"].ToString();
        }
    }
}
