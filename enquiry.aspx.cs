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

public partial class enquiry : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //FillGrid();

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
                    "'" + txtmobile.Text.ToString() + "'," +
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
    txtmobile.Text = "";
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
