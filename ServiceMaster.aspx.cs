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
public partial class ServiceMaster : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {


                reset();
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
            string sql;
            if (btnsave.Text == "Save")
            {
                sql = "Insert into ServiceMaster (ShortCode,Name,Charges) values('" + txtShortCode.Text + "','" + txtname.Text + "'," + txtCharges.Text + ")";
            }
            else
            {
                sql = "Update ServiceMaster set ShortCode='" + txtShortCode.Text + "',Name='" + txtname.Text + "',Charges=" + txtCharges.Text + " where Id=" + hdid.Value + "";
            }
            cmn.dmloperation(sql);
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void reset()
    {
        txtname.Text = "";
        txtShortCode.Text = "";
        txtCharges.Text = "";
        btnsave.Text = "Save";
        fillgrid();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        reset();
    }
    protected void fillgrid()
    {
        try
        {
            SqlConnection cn = new SqlConnection(DBUtil.ConnectionString);
            cn.Open();
            string sql;
            sql = "Select Id,ShortCode,Name,charges from ServiceMaster order by Name";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            gv1.DataSource = dt;
            gv1.DataBind();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex ;
        fillgrid();
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
            string sql;
            sql = "Select * from ServiceMaster where id=" + hdid.Value + "";
           
            SqlConnection cn = new SqlConnection(DBUtil.ConnectionString);
            cn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtShortCode.Text = dt.Rows[0]["ShortCode"].ToString();
                txtname.Text = dt.Rows[0]["Name"].ToString();
                txtCharges.Text = dt.Rows[0]["Charges"].ToString();

             
                btnsave.Text = "Update";
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            cmn.dmloperation("Delete from ServiceMaster where id=" + hdid.Value + "");
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
            cmn.dmloperation("Delete from ServiceMaster where Id=" + hdid.Value + "");
            reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}
