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

public partial class EmployeeMaster : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cmn.fillddl(ddlDepartment, "Select * from DepartmentMaster", "name", "id");
            FillGrid();

            if (Request.QueryString["id"] != null)
            {
                string i = Request.QueryString["id"].ToString();
                filltxt(i);
            }

        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string sql;
            if (btnsave.Text.ToString() == "Save")
            {
                sql = "insert into EmployeeMaster(Name,FatherName,MotherName,Dob,Gender,Phone,EmailId,DateOfJoin,PAddress,CAddress,Qualification,Department,Designation) " +
                    " values('" + txtName.Text.ToString() + "'," +
                    "'" + txtFName.Text.ToString() + "'," +
                    "'" + txtMName.Text.ToString() + "'," +
                    "'" + txtDOB.Text.ToString() + "'," +
                    "'" + ddlGender.SelectedValue.ToString() + "'," +
                    "'" + txtPhone.Text.ToString() + "'," +
                    "'" + txtEmail.Text.ToString() + "'," +
                    "'" + txtDoj.Text.ToString() + "'," +
                    "'" + txtPAddress.Text.ToString() + "'," +
                    "'" + txtCAddress.Text.ToString() + "'," +
                    "'" + txtQualification.Text.ToString() + "'," +
                    "" + ddlDepartment.SelectedValue.ToString() + "," +
                    "'" + txtDesignation.Text.ToString() + "')";
            }
            else
            {
                sql = "update EmployeeMaster set  Name='" + txtName.Text.ToString() + "', " +
                      " FatherName='" + txtFName.Text.ToString() + "', " +
                      " MotherName='" + txtMName.Text.ToString() + "', " +
                      " Dob='" + txtDOB.Text.ToString() + "', " +
                      " Gender='" + ddlGender.SelectedValue.ToString() + "', " +
                      " Phone='" + txtPhone.Text.ToString() + "', " +
                      " EmailId='" + txtEmail.Text.ToString() + "', " +
                      " DateOfJoin='" + txtDoj.Text.ToString() + "', " +
                      " PAddress='" + txtPAddress.Text.ToString() + "', " +
                      " CAddress='" + txtCAddress.Text.ToString() + "', " +
                      " Qualification='" + txtQualification.Text.ToString() + "', " +
                      " Department=" + ddlDepartment.SelectedValue.ToString() + ", " +
                      " Designation='" + txtDesignation.Text.ToString() + "' " +
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
    lblEmpId.Text = "";
    txtName.Text="";
    txtFName.Text="";
    txtMName.Text = "";
    txtDOB.Text = "";
    ddlGender.SelectedIndex = 0;
    txtPhone.Text = "";
    txtEmail.Text = "";
    txtDoj.Text = "";
    txtPAddress.Text = "";
    txtCAddress.Text = "";
    txtQualification.Text = "";
    ddlDepartment.SelectedIndex = 0;
    txtDesignation.Text = "";
   
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
        string sql = "Select id, Name,FatherName,EmailId,Designation  " +
                   " from EmployeeMaster";
        
        cmn.fillgrid(gv1, sql);
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        filltxt(hdid.Value);

    }

    protected void filltxt(string id)
    {
        DataTable dt = cmn.mydatatable("Select * from EmployeeMaster where id=" + id + "");
        if (dt.Rows.Count>0)
        {
            hdid.Value = dt.Rows[0]["id"].ToString();
            lblEmpId.Text = dt.Rows[0]["id"].ToString();

            txtName.Text = dt.Rows[0]["Name"].ToString();
            txtFName.Text = dt.Rows[0]["FatherName"].ToString();
            txtMName.Text = dt.Rows[0]["MotherName"].ToString();
            txtDOB.Text = dt.Rows[0]["Dob"].ToString();
            ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
            txtPhone.Text = dt.Rows[0]["Phone"].ToString();
            txtEmail.Text = dt.Rows[0]["EmailId"].ToString();
            txtDoj.Text = dt.Rows[0]["DateOfJoin"].ToString();
            txtPAddress.Text = dt.Rows[0]["PAddress"].ToString();
            txtCAddress.Text = dt.Rows[0]["CAddress"].ToString();
            txtQualification.Text = dt.Rows[0]["Qualification"].ToString();
            ddlDepartment.SelectedValue = dt.Rows[0]["Department"].ToString();
            txtDesignation.Text = dt.Rows[0]["Designation"].ToString();

            btnsave.Text="Update";
        }

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("Delete from EmployeeMaster where id=" + hdid.Value + "");
        FillGrid();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "delete from EmployeeMaster  where id=" + hdid.Value + "";
        cmn.dmloperation(sql);
        FillGrid();
        reset();

    }

    protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
