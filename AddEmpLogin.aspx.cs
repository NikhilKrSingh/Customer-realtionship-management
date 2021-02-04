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

public partial class AddEmpLogin : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           cmn.fillddl(ddlEmployee, "Select * from EmployeeMaster", "id", "id");
           FillGrid();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            Int32 ii;
            ii = Convert.ToInt32(cmn.dmlscaler("Select count(*) from oe_members where EmployeeID=" + ddlEmployee.SelectedValue.ToString() + "").ToString());
            if (ii > 0)
            {
                lblMsg.Text = "This employee's login already exists!";
                return;
            }
            else
            {
                lblMsg.Text = "";
            }


            Int32 jj;
            jj = Convert.ToInt32(cmn.dmlscaler("Select count(*) from oe_members where lname='" + txtUsername.Text.ToString() + "'").ToString());
            if (jj > 0)
            {
                lblMsg.Text = "This User name already exists!";
                return;
            }
            else
            {
                lblMsg.Text = "";
            }



            string sql;
            Int32 mid = Convert.ToInt32(cmn.dmlscaler("select  isnull(max(mid),0) + 1 from oe_members").ToString());
            if (btnsave.Text.ToString() == "Save")
            {
                sql = "Insert into oe_members (mid,lname,pwd,fullname,email,role,EmployeeID) values(" + mid.ToString() + ",'" + txtUsername.Text.ToString() + "','" + txtPassword.Text.ToString() + "','" + lblName.Text.ToString() + "','" + lblEmail.Text.ToString() + "','User'," + ddlEmployee.SelectedValue.ToString() +") ";
                
                
                
                //sql = "insert into StudentFee(TransactionDate,StudentId,ForSemester,FeeAmt,DDNo,Bank) " +
                //    " values('" + txtDate.Text.ToString() + "'," +
                //    "" + ddlStudent.SelectedValue.ToString() + "," + ddlSemester.SelectedValue.ToString() + "," + txtFeeAmt.Text.ToString() + "," + txtDDNo.Text.ToString() + ",'" + txtBank.Text.ToString() + "')";
                //cmn.dmloperation("Update studentMaster set Semester=" + ddlSemester.SelectedValue.ToString() + " where id=" + ddlStudent.SelectedValue.ToString() + "");
            }
            else
            {
                sql = "update StudentFee set  EmployeeID=" + ddlEmployee.SelectedValue.ToString() + "";
                    //" ForSemester=" + ddlSemester.SelectedValue.ToString() + " ," +
                    //" FeeAmt=" + txtFeeAmt.Text.ToString() + ", " +
                    //" DDNo=" + txtDDNo.Text.ToString() + ", " +
                    //" Bank=" + txtBank.Text.ToString() + " " +
                    //" where id=" + hdid.Value + "";
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
   
    lblName.Text = "";
    lblMobile.Text = "";
    ddlEmployee.SelectedIndex = 0;
    lblName.Text = "";
    lblDepartment.Text="";
    lblMobile.Text = "";
    lblEmail.Text = "";
    txtUsername.Text = "";
    txtPassword.Text = "";


   

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
        
        string sql = "select mid,lname,pwd,fullname,email,role from oe_members where role='User'";
        
        cmn.fillgrid(gv1, sql);
    }
   

    protected void filltxt(string id)
    {
        DataTable dt = cmn.mydatatable("select EmployeeMaster.Id,EmployeeMaster.Name,EmployeeMaster.emailID,Phone,DepartmentMaster.name as department " +
                                        " from EmployeeMaster left join Departmentmaster on EmployeeMaster.Department=Departmentmaster.id " +
                                        " where EmployeeMaster.id=" + id + "");
        if (dt.Rows.Count>0)
        {
            hdid.Value = dt.Rows[0]["id"].ToString();
       
            ddlEmployee.SelectedValue = dt.Rows[0]["StudentId"].ToString();

            lblName.Text = dt.Rows[0]["Name"].ToString();
            lblDepartment.Text = dt.Rows[0]["department"].ToString();
            lblMobile.Text = dt.Rows[0]["Phone"].ToString();
            lblEmail.Text = dt.Rows[0]["emailID"].ToString();
            
       

            btnsave.Text="Update";
        }

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("Delete from oe_members where mid=" + hdid.Value + "");
        FillGrid();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "delete from oe_members  where mid=" + hdid.Value + "";
        cmn.dmloperation(sql);
        FillGrid();
        reset();

    }




    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {

            hdid.Value = ddlEmployee.SelectedValue.ToString();
            DataTable dt = cmn.mydatatable("Select EmployeeMaster.Id,EmployeeMaster.Name,EmployeeMaster.emailID,Phone,DepartmentMaster.name as department from EmployeeMaster left join DepartmentMaster on EmployeeMaster.Department=DepartmentMaster.Id  where EmployeeMaster.id=" + hdid.Value.ToString() + "");

            if (dt.Rows.Count > 0)
            {
                lblName.Text = dt.Rows[0]["Name"].ToString();
                lblMobile.Text = dt.Rows[0]["Phone"].ToString();
                lblDepartment.Text = dt.Rows[0]["department"].ToString();
                lblEmail.Text = dt.Rows[0]["emailID"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message.ToString();
        }
    }

    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
