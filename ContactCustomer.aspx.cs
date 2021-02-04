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
public partial class ContactCustomer : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                FillGrid();
                
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void FillGrid()
    {
        string sql = "Select CustomerMaster.id, CustomerMaster.Name,CustomerMaster.FName as FatherName,EmailId  from CustomerMaster order by CustomerMaster.Name   ";


        cmn.fillgrid(gv1, sql);
    }




    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
            Response.Redirect("CustomerEmail.aspx?id=" + hdid.Value + " ");
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
}
