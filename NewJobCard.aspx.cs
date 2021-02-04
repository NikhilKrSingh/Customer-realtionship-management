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

public partial class NewJobCard : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cmn.fillddl(ddlCustomer, "Select id, id as name from CustomerMaster", "name", "id");

            txtDate.Text = DateTime.Today.ToShortDateString();
            FillGrid();

            //if (Request.QueryString["id"] != null)
            //{
            //    string i = Request.QueryString["id"].ToString();
            //    filltxt(i);
            //}

        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql;
            if (btnsave.Text.ToString() == "Save")
            {
                sql = "insert into JobCardMaster(JobDate,Priority,Status,ProblemDesc,CustomerID,UserID) " +
                    " values('" + Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd") + "'," +
                    "'" + ddlPriority.SelectedValue.ToString() + "'," +
                    "'" + ddlStatus.SelectedValue.ToString() + "'," +
                    "'" + txtDescription.Text.ToString() + "'," +
                    "" + ddlCustomer.SelectedValue.ToString() + "," + Session["mid"].ToString() + ")";
            }
            else
            {
                sql = "update JobCardMaster set  JobDate='" + Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd") + "', " +
                       " Priority='" + ddlPriority.SelectedValue.ToString() + "'," +
                        " Status= '" + ddlStatus.SelectedValue.ToString() + "'," +
                        " ProblemDesc= '" + txtDescription.Text.ToString() + "'," +
                        " CustomerID= " + ddlCustomer.SelectedValue.ToString() + "," +
                        " UserID= " + Session["mid"].ToString() + "" +
                        " where id=" + hdid.Value + "";
            }

            cmn.dmloperation(sql);
            FillGrid();
            reset();
        }
        catch (Exception ex)
        {
           lblMsg.Text= ex.Message.ToString();
        }
    }

protected void reset()
{
    txtDate.Text = "";
    ddlPriority.SelectedIndex = 0;
    ddlStatus.SelectedIndex = 0;
    txtDescription.Text = "";
    ddlCustomer.SelectedIndex = 0;
    lblName.Text = "";
    lblEmail.Text = "";
    lblMobile.Text = "";
    lblAddress.Text = "";
    txtDate.Text = DateTime.Today.ToShortDateString();
    btnsave.Text = "Save";
    hdid.Value = "0";
    lblMsg.Text = "";
}
    protected void btncancel_Click(object sender, EventArgs e)
    {
        reset();
    }
    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        FillGrid();
    }

    protected void FillGrid()
    {
        string sql = "select JobCardMaster.id, convert(varchar,JobDate,105) as JobDate,customerMaster.Name,Status from JobCardMaster left join customerMaster on  JobCardMaster.customerid=customerMaster.id ";
        cmn.fillgrid(gv1, sql);
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        filltxt(hdid.Value);
    }

    protected void filltxt(string id)
    {
        DataTable dt = cmn.mydatatable("select JobCardMaster.*,CustomerMaster.id as CustID,CustomerMaster.Name,CustomerMaster.EmailID,CustomerMaster.ContactNo,CustomerMaster.CAddress  from JobCardMaster left join CustomerMaster on JobCardMaster.CustomerId=  CustomerMaster.id where JobCardMaster.id=" + id + "");
        if (dt.Rows.Count>0)
        {
            hdid.Value = dt.Rows[0]["id"].ToString();
            lblJobNo.Text = dt.Rows[0]["id"].ToString();
            txtDate.Text = Convert.ToDateTime(dt.Rows[0]["JobDate"].ToString()).ToString("dd-MM-yyyy");
            ddlPriority.SelectedValue = dt.Rows[0]["Priority"].ToString();
            ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
            txtDescription.Text = dt.Rows[0]["ProblemDesc"].ToString();
            ddlCustomer.SelectedValue = dt.Rows[0]["CustomerID"].ToString();
            lblName.Text = dt.Rows[0]["Name"].ToString();
            lblEmail.Text = dt.Rows[0]["EmailID"].ToString();
            lblMobile.Text = dt.Rows[0]["ContactNo"].ToString();
            lblAddress.Text = dt.Rows[0]["CAddress"].ToString();
            btnsave.Text="Update";
        }

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("Delete from JobCardMaster where id=" + hdid.Value + "");
        FillGrid();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "delete from JobCardMaster  where id=" + hdid.Value + "";
        cmn.dmloperation(sql);
        FillGrid();
        reset();

    }

    protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdCid.Value = ddlCustomer.SelectedValue.ToString();
        DataTable dt = cmn.mydatatable("Select * from CustomerMaster where id=" + hdCid.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
            lblName.Text = dt.Rows[0]["Name"].ToString();
            lblEmail.Text = dt.Rows[0]["EmailId"].ToString();
            lblMobile.Text = dt.Rows[0]["ContactNo"].ToString();
            lblAddress.Text = dt.Rows[0]["CAddress"].ToString();

        }
    }
}
