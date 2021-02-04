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

public partial class EmailSetup : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                filltxt();
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
                cmn.dmloperation("Delete from EmailSetup");
                string sql;
                if (btnsave.Text.ToString() != "")
                {
                    sql = "insert into EmailSetup(Name,EmailId,Password,Subject) " +
                        " values('" + txtname.Text.ToString() + "', " +
                        " '" + txtemail.Text.ToString() + "', " +
                        " '" + txtpass.Text.ToString() + "', " +
                        " '" + txtsubject.Text.ToString() + "')";
                }
                else
                {
                    sql = "update EmailSetup set Name='" + txtname.Text.ToString() + "', " +
                          " EmailId='" + txtemail.Text.ToString() + "', " +
                          " Password='" + txtpass.Text.ToString() + "', " +
                          " Subject='" + txtsubject.Text.ToString() + "' " +
                          " where id=" + hdid.Value + "";
                }
                cmn.dmloperation(sql);
            
          
            filltxt();
            lblmsg.Text = "Record saved successfully !";
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void filltxt()
    {
        try
        {
            DataTable dt = cmn.mydatatable("Select * from EmailSetup ");
            if (dt.Rows.Count > 0)
            {
                hdid.Value = dt.Rows[0]["id"].ToString();

                txtname.Text = dt.Rows[0]["NAme"].ToString();
                txtemail.Text = dt.Rows[0]["EmailId"].ToString();
                txtpass.Text = dt.Rows[0]["Password"].ToString();
                txtconfirmpass.Text = dt.Rows[0]["Password"].ToString();
                txtsubject.Text = dt.Rows[0]["Subject"].ToString();
                btnsave.Text = "Update";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }


    protected void btntestemail_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtEmail = cmn.mydatatable("Select * from EmailSetup");
            if (dtEmail.Rows.Count > 0)
            {
                string name = dtEmail.Rows[0]["Name"].ToString();
                string FrmEmail = dtEmail.Rows[0]["EmailId"].ToString();
                string Pass = dtEmail.Rows[0]["Password"].ToString();
                string Subject = dtEmail.Rows[0]["Subject"].ToString();
                string Msg = "Test Email from Nikhil Kumar Singh(IMED)";
                string ToEmail = dtEmail.Rows[0]["EmailId"].ToString();
                cmn.SendMail(name.ToString(), FrmEmail.ToString(), Pass.ToString(), ToEmail.ToString(), Subject.ToString(), Msg.ToString());
                lblmsg.Text = "Check your inbox to see test message.";
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message.ToString() + " Be sure you are connected with Internet !";
        }
    }
}
