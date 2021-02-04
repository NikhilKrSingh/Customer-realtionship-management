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

public partial class CustomerMaster : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // cmn.fillddl(ddlCourse, "Select * from ClassMaster", "name", "Cid");

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
                sql = "insert into CustomerMaster(Name,Gender,DOB,FName,FOccupation,PAddress,CAddress,ContactNo,EmailId,Qualification,Remark) " +
                    " values('" + txtName.Text.ToString() + "'," +
                    "'" + ddlGender.SelectedValue.ToString() + "'," +
                    "'" + txtDOB.Text.ToString() + "'," +
                    "'" + txtFName.Text.ToString() + "'," +
                    "'" + txtFOccupation.Text.ToString() + "'," +
                    "'" + txtPAddress.Text.ToString() + "'," +
                    "'" + txtCAddress.Text.ToString() + "'," +
                    "'" + txtPhone.Text.ToString() + "'," +
                    "'" + txtEmail.Text.ToString() + "'," +
                    "'" + txtQualification.Text.ToString() + "','" + txtRemarks.Text.ToString() + "')";
        
            }
            else
            {
                sql = "update CustomerMaster set  Name='" + txtName.Text.ToString() + "', " +
                       " Gender='" + ddlGender.SelectedValue.ToString() + "'," +
                        " DOB= '" + txtDOB.Text.ToString() + "'," +
                        " FName= '" + txtFName.Text.ToString() + "'," +
                        " FOccupation= '" + txtFOccupation.Text.ToString() + "'," +
                        " PAddress= '" + txtPAddress.Text.ToString() + "'," +
                        " CAddress= '" + txtCAddress.Text.ToString() + "'," +
                        " ContactNo= '" + txtPhone.Text.ToString() + "'," +
                        " EmailId= '" + txtEmail.Text.ToString() + "'," +
                        " Qualification= '" + txtQualification.Text.ToString() + "', " +
                        " Remark= '" + txtRemarks.Text.ToString() + "' " +
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
    lblStudId.Text = "";
    txtName.Text="";
    txtFOccupation.Text="";
    txtFName.Text = "";
    txtDOB.Text = "";
    ddlGender.SelectedIndex = 0;
    txtPhone.Text = "";
    txtEmail.Text = "";
    txtQualification.Text = "";
    txtPAddress.Text = "";
    txtCAddress.Text = "";
    txtQualification.Text = "";
    txtRemarks.Text = "";
  
   
    btnsave.Text = "Save";
    hdid.Value = "0";
    hdCid.Value = "0";
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
        string sql = "Select CustomerMaster.id, CustomerMaster.Name,CustomerMaster.FName as FatherName,EmailId  from CustomerMaster   ";
                  
        
        cmn.fillgrid(gv1, sql);
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        filltxt(hdid.Value);

    }

    protected void filltxt(string id)
    {
        DataTable dt = cmn.mydatatable("select * " +
                                        " from CustomerMaster  " +
                                        " where id=" + id + "");
        if (dt.Rows.Count>0)
        {
            hdid.Value = dt.Rows[0]["id"].ToString();
            lblStudId.Text = dt.Rows[0]["id"].ToString();

             txtName.Text = dt.Rows[0]["Name"].ToString();
              ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
             txtDOB.Text= dt.Rows[0]["DOB"].ToString();
             txtFName.Text = dt.Rows[0]["FName"].ToString();
             txtFOccupation.Text = dt.Rows[0]["FOccupation"].ToString();
              txtPAddress.Text = dt.Rows[0]["PAddress"].ToString();
              txtCAddress.Text = dt.Rows[0]["CAddress"].ToString();
             txtPhone.Text = dt.Rows[0]["ContactNo"].ToString();
             txtEmail.Text = dt.Rows[0]["EmailId"].ToString();
               txtQualification.Text = dt.Rows[0]["Qualification"].ToString();
               txtRemarks.Text = dt.Rows[0]["Remark"].ToString();
 
         
            btnsave.Text="Update";
        }

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("Delete from CustomerMaster where id=" + hdid.Value + "");
        FillGrid();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "delete from CustomerMaster  where id=" + hdid.Value + "";
        cmn.dmloperation(sql);
        FillGrid();
        reset();

    }

    protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    //protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    hdCid.Value = ddlCourse.SelectedValue.ToString();
    //    DataTable dt = cmn.mydatatable("Select ClassMaster.*,DepartmentMaster.Name as DeptName from ClassMaster left join DepartmentMaster on classMaster.departmentID=DepartmentMaster.id where cid=" + hdCid.Value.ToString() + "");

    //    if (dt.Rows.Count > 0)
    //    {
    //        lblDepartment.Text = dt.Rows[0]["DeptName"].ToString();
    //        lblDuration.Text = dt.Rows[0]["Duration"].ToString();
    //        lblCategory.Text = dt.Rows[0]["Category"].ToString();
    //    }
    //}
}
