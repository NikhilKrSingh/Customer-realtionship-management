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

public partial class EmpAttendanceFor : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillgrid();

        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

    }

    protected void fillgrid()
    {
        string sql;
        sql = "select id,Name  from DepartmentMaster ";
        
        cmn.fillgrid(gv1, sql);
    }

    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        fillgrid();
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();

        printrpt(hdid.Value);
    }

    protected void printrpt(string id)
    {
        Response.Redirect("EmpAttendance.aspx?id=" + id.ToString() + "");
       
    }
}
