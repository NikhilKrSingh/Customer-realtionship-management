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

public partial class viewenquiry : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
        }
    }

    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        FillGrid();
    }

    protected void FillGrid()
    {
        string sql = "Select  Enquiry.*, convert (Varchar,EnquiryDate,103 ) as EDate " +
                   " from Enquiry  ";
        cmn.fillgrid(gv1, sql);

        if (gv1.Rows.Count <= 0)
        {
            Label1.Text = "There is no query this time.";
        }
        else
        {
            Label1.Text = "";
        }
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        Response.Redirect("viewdetailenquiry.aspx?id=" + hdid.Value + " ");
    }

    protected void btngo_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("delete from Enquiry where eid=" + hdid.Value +"");
        FillGrid();
    }
}
