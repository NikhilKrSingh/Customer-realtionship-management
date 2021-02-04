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

public partial class EmployeeEnquiry : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filltxt();

        }
    }

    protected void filltxt()
    {
        hdid.Value = Session["stid"].ToString();

        string sql;
        sql = "Select * from oe_members where EmployeeId=" + hdid.Value + "";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
           txtname.Text = dt.Rows[0]["lname"].ToString();
            //lblrole.Text = dt.Rows[0]["role"].ToString();
           txtname.Text = dt.Rows[0]["fullname"].ToString();
          //  ddlqualification.SelectedValue = dt.Rows[0]["cid"].ToString();
            txtaddress.Text = dt.Rows[0]["address"].ToString();
            txtpin.Text = dt.Rows[0]["pinno"].ToString();
            txtemail.Text = dt.Rows[0]["email"].ToString();
            //txtCEmail.Text = dt.Rows[0]["email"].ToString();
        }

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql;
                sql = "insert into Enquiry(Name,Address,Pin,Mobile,Email,Remarks) values(" +
                    " '" + txtname.Text.ToString() + "','" + txtaddress.Text + "', " +
                    "'" + txtpin.Text.ToString() + "'," +
                    "' 0 '," +
                    "'" + txtemail.Text.ToString() + "'," +
                    "'" + txtremarks.Text.ToString() + "')";

            cmn.dmloperation(sql);
            //FillGrid();
            reset();
            Label1.Text = "Thanks for your query.We will contact you soon.";
        }
        catch (Exception ex)
        {
        }
    }

protected void reset()
{
    txtname.Text = "";
    txtaddress.Text = "";
    txtpin.Text = "";
    //txtmobile.Text = "";
    txtemail.Text = "";
    txtremarks.Text = "";
    btnsave.Text = "Save";
    hdid.Value = "0";
}
    protected void btncancel_Click(object sender, EventArgs e)
    {
        reset();
    }
    
    
}
