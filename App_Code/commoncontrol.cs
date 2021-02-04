using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.Mail;


/// <summary>
/// Summary description for commoncontrol
/// </summary>
public class commoncontrol
{
    DBUtil db = new DBUtil();

	public commoncontrol()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void dmloperation(string sql)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
     
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public string dmlscaler(string sql)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand(sql, con);
        string r;
        r = cmd.ExecuteScalar().ToString();
        return r;
        
    }
    public void fillgrid(System.Web.UI.WebControls.GridView gv,string sql)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        da.Fill(dt);
        gv.DataSource = dt;
        gv.DataBind();
    }

    public DataTable mydatatable(string sql)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        da.Fill(dt);
        return dt;
    }

    public void fillddl(System.Web.UI.WebControls.DropDownList ddl, string sql,string DateTextField,string DataValueField)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        da.Fill(dt);
        ddl.DataSource = dt;
        ddl.DataTextField = DateTextField;
        ddl.DataValueField =DataValueField;
        ddl.DataBind();
        ddl.Items.Insert(0, "-Plz select-");
        ddl.SelectedIndex = 0;
    }

    public void MsgBox(string msg, Page refP)
    {
        Label lbl = new Label();
        string lb = "window.alert('" + msg + "')";
        ScriptManager.RegisterClientScriptBlock(refP, this.GetType(), "UniqueKey", lb, true);
        refP.Controls.Add(lbl);
    }

    public void SendMail(String YourName, String FrmGmailEmail, String FrmPass, String ToEmail, String Subject, String YourMsg)
    {
        // Gmail Address from where you send the mail
        var fromAddress = FrmGmailEmail.ToString();
        //Password of your gmail address
        string fromPassword = FrmPass.ToString();
        // any address where the email will be sending
        var toAddress = ToEmail.ToString();
        // Passing the values and make a email formate to display
        string subject = Subject.ToString();
        string body = "From: " + YourName.ToString() + "\n";
        body += "Email: " + FrmGmailEmail.ToString() + "\n";
        body += "Subject: " + subject.ToString() + "\n";
        body += "Message: \n" + YourMsg.ToString() + "\n";

        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;



        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
    }

    public string DDMMYYtoMMDDYY(string DDMMYY)
    {
        string Month, Days, Year, DDMMYY1, MMDDYY1 = null;
        int index1, index2, index3 = 0;
        DDMMYY1 = DDMMYY;
        index1 = DDMMYY1.IndexOf("/");
        index2 = DDMMYY1.IndexOf("/", index1 + 1);
        index3 = index2;
        Days = DDMMYY1.Substring(0, index1);

        if (index1 == 1)
        {
            Days = "0" + Days;//Month = "0" + Month;
            index2 = index2 - 2;
        }
        else
            index2 = index2 - 3;
        Month = DDMMYY1.Substring(index1 + 1, index2);
        if ((index1 == 1 && index3 == 3) || (index1 == 2 && index3 == 4))
            Month = "0" + Month;
        Year = DDMMYY1.Substring(index3 + 1, 4);
        MMDDYY1 = Month + "/" + Days + "/" + Year;
        return MMDDYY1;
    }

    public string MMDDYYtoDDMMYY(string MMDDYY)
    {
        string Month, Days, Year, DDMMYY1, MMDDYY1 = null;
        int index1, index2, index3 = 0;
        MMDDYY1 = MMDDYY;
        index1 = MMDDYY1.IndexOf("/");
        index2 = MMDDYY1.IndexOf("/", index1 + 1);
        index3 = index2;
        Month = MMDDYY1.Substring(0, index1);
        if (index1 == 1)
        {
            Month = "0" + Month;//Days = "0" + Days;
            index2 = index2 - 2;
        }
        else
            index2 = index2 - 3;

        Days = MMDDYY1.Substring(index1 + 1, index2);
        if ((index1 == 1 && index3 == 3) || (index1 == 2 && index3 == 4))
            Days = "0" + Days;
        Year = MMDDYY1.Substring(index3 + 1, 4);
        DDMMYY1 = Days + "/" + Month + "/" + Year;
        //DDMMYY1 = Days + Month + "/" + Year;
        return DDMMYY1;
    }

    public string MMDDYYtoYYMMDD(string DDMMYY)
    {
        string Month, Days, Year, YYMMDD1, DDMMYY1 = null;
        int index1, index2, index3 = 0;
        DDMMYY1 = DDMMYY;
        index1 = DDMMYY1.IndexOf("/");
        index2 = DDMMYY1.IndexOf("/", index1 + 1);
        index3 = index2;
        Days = DDMMYY1.Substring(0, index1);
        if (index1 == 1)
        {
            Days = "0" + Days;//Days = "0" + Days;
            index2 = index2 - 2;
        }
        else
            index2 = index2 - 3;

        Month = DDMMYY1.Substring(index1 + 1, index2);
        if ((index1 == 1 && index3 == 3) || (index1 == 2 && index3 == 4))
            Month = "0" + Month;
        Year = DDMMYY1.Substring(index3 + 1, 4);
        YYMMDD1 = Year + "/" + Month + "/" + Days;
        //DDMMYY1 = Days + Month + "/" + Year;
        return YYMMDD1;
    }


}
