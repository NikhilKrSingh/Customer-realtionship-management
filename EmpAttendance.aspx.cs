using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;



public partial class EmpAttendance : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    DBUtil db = new DBUtil();

    
    protected void Page_Load(object sender, EventArgs e)
    {

        lblToday.Text = DateTime.Now.ToShortDateString();
        hdid.Value = Request.QueryString["id"];
        lblWeekno.Text = hdid.Value.ToString();

        //lblWeekno.Text = Request.QueryString["weekno"];
        lblPeriod.Text = cmn.dmlscaler("Select name from DepartmentMaster where id=" + hdid.Value.ToString() + "").ToString();
        //lblSemister.Text = Request.QueryString["semister"];
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // get details from Gridview
        string status,remarks;
        //SqlConnection con = new SqlConnection;
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        //SqlTransaction trans=null; 



        try
        {
            //con.Open();
            //trans = con.BeginTransaction();
            SqlCommand cmd = new SqlCommand("insert into EmpAttendance values(@adate,@weekno,@period,@fcode,@admno,@status,@remarks)", con);
           // cmd.Transaction = trans;

            //cmd.Parameters.Add("@adate", SqlDbType.DateTime).Value = lblToday.Text;
            //cmd.Parameters.Add("@weekno", SqlDbType.Int).Value = Int32.Parse(lblWeekno.Text);
            //cmd.Parameters.Add("@period", SqlDbType.Int).Value = Int32.Parse(lblPeriod.Text);
            //cmd.Parameters.Add("@fcode", SqlDbType.VarChar, 10).Value = Session["fcode"].ToString();


            cmd.Parameters.Add("@adate", SqlDbType.DateTime).Value = DateTime.Now.ToShortDateString();
            cmd.Parameters.Add("@weekno", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@period", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@fcode", SqlDbType.VarChar, 10).Value = "l";

            cmd.Parameters.Add("@admno", SqlDbType.Int);
            cmd.Parameters.Add("@status", SqlDbType.Char, 1);
            cmd.Parameters.Add("@remarks", SqlDbType.VarChar, 50);

            RadioButton rb;
            foreach (GridViewRow r in GridView1.Rows)
            {
                remarks = "";
                status = "l";
                rb = (RadioButton)r.FindControl("rbPresent");
                if (rb.Checked)
                    status = "p";
                else
                {
                    rb = (RadioButton)r.FindControl("rbAbsent");
                    if (rb.Checked)
                        status = "a";
                    else
                    {
                        TextBox t = (TextBox)r.FindControl("txtRemarks");
                        remarks = t.Text;
                    }
                }
                cmd.Parameters["@admno"].Value = r.Cells[0].Text;
                cmd.Parameters["@status"].Value = status;
                cmd.Parameters["@remarks"].Value = remarks;
                cmd.ExecuteNonQuery();
            }
            //trans.Commit();
            lblMsg.Text = "Attendance stored successfully!";
        }
        catch (Exception ex)
        {
            //trans.Rollback();
            lblMsg.Text = "Error ->" + ex.Message;
        }
        finally
        {
            con.Close();
        }


    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpAttendancefor.aspx");
    }
}
