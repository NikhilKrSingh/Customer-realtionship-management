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

public partial class membermanagement : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //cmn.fillddl(ddlclass, "Select * from classMaster", "name", "cid");
            
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
        string sql = "select oe_members.*,classmaster.name as ClassName from oe_members left join classmaster on oe_members.cid=classmaster.cid";
        if (ddlclass.SelectedIndex != 0)
        {
            sql = sql + "  where oe_members.role='" + ddlclass.SelectedValue + "'";
        }
        cmn.fillgrid(gv1, sql);
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        Response.Redirect("editmember.aspx?id=" + hdid.Value + " ");
        

    }

    protected void btngo_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
