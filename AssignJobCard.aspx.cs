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
public partial class AssignJobCard : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                reset();
                hdJobNo.Value = Request.QueryString["JobNo"].ToString();
                if (hdJobNo.Value != null)
                {
                    ddlJobNo.SelectedValue = hdJobNo.Value;
                    hdid.Value = hdJobNo.Value;
                    FillJobDetail(hdJobNo.Value);
                }
            }
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
            //if (btnsave.Text == "Save")
            //{
            //    sql = "Insert into DepartmentMaster (ShortCode,Name) values('" + txtDate.Text + "')";
            //}
            //else
            //{
                sql = "Update JobCardMaster set AssignTo=" + ddlEmployee.SelectedValue.ToString() + " where Id=" + hdid.Value + "";
                lblMsg.Text = "Job card assigned successfully!";
            //}
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

        txtDesc.Text = "";
        lblDate.Text = "";
        lblName.Text = "";
        btnsave.Text = "Save";
        lblMsg.Text = "";
        cmn.fillddl(ddlJobNo, "Select id, id as name from JobCardMaster where AssignTo is null", "name", "id");
        cmn.fillddl(ddlEmployee, "Select id, id as name from EmployeeMaster", "name", "id");

        ddlEmployee.SelectedIndex = 0;
        ddlJobNo.SelectedIndex = 0;
      
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        reset();
    }
  
  
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            //cmn.dmloperation("Delete from DepartmentMaster where id=" + hdid.Value + "");
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
 
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdEid.Value = ddlEmployee.SelectedValue.ToString();
        DataTable dt = cmn.mydatatable("Select * from EmployeeMaster where id=" + hdEid.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
            lblName.Text = dt.Rows[0]["Name"].ToString();
         }
        lblMsg.Text = "Currently " + cmn.dmlscaler("Select Count(*) from JobCardMaster where Status='Open' and AssignTo=" + hdEid.Value + "").ToString() + " Job Assigned !";
    }
    protected void ddlJobNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = ddlJobNo.SelectedValue.ToString();
        FillJobDetail(hdid.Value);
    }
    protected void FillJobDetail(string JobNo)
    {
        DataTable dt = cmn.mydatatable("Select * from JobCardMaster where id=" + JobNo.ToString() + "");
        if (dt.Rows.Count > 0)
        {
            txtDesc.Text = dt.Rows[0]["ProblemDesc"].ToString();
            lblDate.Text = Convert.ToDateTime(dt.Rows[0]["JobDate"].ToString()).ToString("dd-MM-yyyy"); ;
        }
    }
}
