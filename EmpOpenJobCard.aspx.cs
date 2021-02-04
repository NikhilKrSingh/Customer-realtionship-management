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
public partial class EmpOpenJobCard : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
               // FillGrid();

                DateTime dt = DateTime.Today;
                txtFdate.Text = DateTime.Now.ToString("dd/MM/yyyy").Replace('-', '/');
                txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy").Replace('-', '/');


            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void FillGrid()
    {
        string sql1 = "";
        if (ddlStatus.SelectedValue=="All")
        {
            sql1="";
        }
        else
        {
            sql1 = " and JobCardMaster.Status='"+ ddlStatus.SelectedValue.ToString() + "'";
        }



        sql1 = sql1 + " And JobCardMaster.JobDate >='" + Convert.ToDateTime(txtFdate.Text).ToString("yyyy-MM-dd") + "' and JobDate <='" + Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd") + "'  ";

        string sql = "select JobCardMaster.id, convert(varchar,JobDate,105) as JobDate,customerMaster.Name,Status " +
            " from JobCardMaster left join customerMaster on  JobCardMaster.customerid=customerMaster.id " +
            " where JobCardMaster.AssignTo=" + Session["stid"].ToString() +  sql1.ToString() + "";

        cmn.fillgrid(gv1, sql);
        if (gv1.Rows.Count <= 0)
        {
            lblMsg.Text = "No record found!!";
        }
        else
        {
            lblMsg.Text =gv1.Rows.Count.ToString() + " Records Found!";
        }
    }


    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
            Response.Redirect("EmpJobCardServiceDetail.aspx?id=" + hdid.Value + " ");
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        FillGrid();
    }

    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            FillGrid();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}
