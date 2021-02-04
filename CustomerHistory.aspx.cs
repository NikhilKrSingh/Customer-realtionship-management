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
public partial class CustomerHistory : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                cmn.fillddl(ddlCustomer, "Select id, id as name from CustomerMaster", "name", "id");
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }


    protected void FillJobCard()
    {
        string sql = "select JobCardMaster.id, convert(varchar,JobDate,105) as JobDate,Status,(case when isnull(EmployeeMaster.Name,'NULL')='NULL' then 'Not Assigned' else EmployeeMaster.Name end) as Name  from JobCardMaster left join EmployeeMaster on JobCardMaster.AssignTo=EmployeeMaster.id " +
                       "  where CustomerID=" + ddlCustomer.SelectedValue.ToString() + " order by JobCardMaster.id desc ";
        cmn.fillgrid(gv2, sql);

        if (gv2.Rows.Count <= 0)
        {
            lblMsg.Text = "No Job Card record found!!";
        }
        else
        {
            lblMsg.Text = "";
        }

    }
  

    protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            hdCid.Value = ddlCustomer.SelectedValue.ToString();
        string sql;
        sql = "Select * from CustomerMaster where id=" + hdCid.Value + "";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
            
            lblname.Text = dt.Rows[0]["name"].ToString();
            lbladdress.Text = dt.Rows[0]["CAddress"].ToString();
            lblgender.Text = dt.Rows[0]["Gender"].ToString();
            lblmobile.Text = dt.Rows[0]["ContactNo"].ToString();
            lblemail.Text = dt.Rows[0]["EmailId"].ToString();
        }
        FillJobCard();
        string id = "0";
        FillGridService(id.ToString());
        lblMsg.Text = "";
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        hdid.Value = gv2.DataKeys[e.RowIndex].Value.ToString();
        FillGridService(hdid.Value);
        
    }
   

    protected void FillGridService(string JobNo)
    {
        string sql = "select ServiceDetail.id,JobNo, convert(varchar,serviceDate,105) as ServiceDate,ServiceDetail.ActionTaken,ServiceDetail.Remark,customerMaster.Name as Customer, " +
                       " EmployeeMaster.Name as Employee,ServiceDetail.Status from ServiceDetail " +
                       " left join JobCardMaster on  ServiceDetail.JobNo=JobCardMaster.id  " +
                       " left join CustomerMaster on  JobCardMaster.customerID=CustomerMaster.id  " +
                       " left join EmployeeMaster on  JobCardMaster.AssignTO=EmployeeMaster.id  where JobCardMaster.id=" + JobNo.ToString() + " order by ServiceDetail.id Asc ";
        cmn.fillgrid(gv1, sql);

        if (gv1.Rows.Count <= 0)
        {
            lblMsg.Text = "No Service record found!!";
        }
        else
        {
            lblMsg.Text = "";
        }

    }
    protected void gv2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
