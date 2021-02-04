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

public partial class EmployeeSalary : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cmn.fillddl(ddlEmployee, "Select * from EmployeeMaster", "id", "id");
            FillGrid();
            txtDate.Text = DateTime.Today.Date.ToShortDateString();
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
                sql = "insert into EmpSalary(SalaryDate,EmpId,BasicPay,DA,HRA,PF,LIC,Transport,NetSalary) " +
                    " values('" + txtDate.Text.ToString() + "'," +
                    "" + ddlEmployee.SelectedValue.ToString() + "," +
                    "" + txtBasic.Text.ToString() + "," +
                    "" + txtDA.Text.ToString() + "," +
                    "" + txtHRA.Text.ToString() + "," +
                    "" + txtPF.Text.ToString() + "," +
                    "" + txtLIC.Text.ToString() + "," +
                    "" + txtTransport.Text.ToString() + "," +
                    "" + txtNetSalary.Text.ToString() + ")";
            }
            else
            {
                sql = "update EmpSalary set  SalaryDate='" + txtDate.Text.ToString() + "', " +
                        "EmpId=" + ddlEmployee.SelectedValue.ToString() + "," +
                        "BasicPay=" + txtBasic.Text.ToString() + "," +
                        "DA=" + txtDA.Text.ToString() + "," +
                        "HRA=" + txtHRA.Text.ToString() + "," +
                        "PF=" + txtPF.Text.ToString() + "," +
                        "LIC=" + txtLIC.Text.ToString() + "," +
                        "Transport=" + txtTransport.Text.ToString() + "," +
                        "NetSalary=" + txtNetSalary.Text.ToString() + " " +
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
    txtDate.Text = DateTime.Today.Date.ToShortDateString();
    lblName.Text = "";
    lblDesignation.Text = "";
    ddlEmployee.SelectedIndex = 0;
    txtBasic.Text = "";
    txtDA.Text = "";
    txtHRA.Text = "";
    txtPF.Text = "";
    txtLIC.Text = "";
    txtTransport.Text = "";
    txtNetSalary.Text = "";

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
        string sql = "Select EmpSalary.id, SalaryDate,EmployeeMaster.Name,EmployeeMaster.Designation  " +
                   " from EmpSalary left join EmployeeMaster on EmpSalary.EmpId=EmployeeMaster.id ";
        
        cmn.fillgrid(gv1, sql);
    }
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
        filltxt(hdid.Value);

    }

    protected void filltxt(string id)
    {
        DataTable dt = cmn.mydatatable("Select EmpSalary.*,EmployeeMaster.Name As EmpName,EmployeeMaster.designation from EmpSalary left join EmployeeMaster on EmpSalary.EmpId=EmployeeMaster.id " +
            " where EmpSalary.id=" + id + "");
        if (dt.Rows.Count>0)
        {
            hdid.Value = dt.Rows[0]["id"].ToString();

            
            txtDate.Text = dt.Rows[0]["SalaryDate"].ToString();
            ddlEmployee.SelectedValue = dt.Rows[0]["Empid"].ToString();
            lblName.Text = dt.Rows[0]["EmpName"].ToString();
            lblDesignation.Text = dt.Rows[0]["designation"].ToString();

            txtBasic.Text = dt.Rows[0]["BasicPay"].ToString();
            txtDA.Text = dt.Rows[0]["DA"].ToString();
            txtHRA.Text = dt.Rows[0]["HRA"].ToString();
            txtPF.Text = dt.Rows[0]["PF"].ToString();
            txtLIC.Text = dt.Rows[0]["LIC"].ToString();
            txtTransport.Text = dt.Rows[0]["Transport"].ToString();
            txtNetSalary.Text =  dt.Rows[0]["NetSalary"].ToString();

            btnsave.Text="Update";
        }

    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        hdid.Value = gv1.DataKeys[e.RowIndex].Value.ToString();
        cmn.dmloperation("Delete from EmpSalary where id=" + hdid.Value + "");
        FillGrid();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "delete from EmpSalary  where id=" + hdid.Value + "";
        cmn.dmloperation(sql);
        FillGrid();
        reset();

    }

    protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdid.Value = ddlEmployee.SelectedValue.ToString();
        DataTable dt = cmn.mydatatable("Select Id,Name,designation from EmployeeMaster where id=" + hdid.Value.ToString() + "");

        if (dt.Rows.Count > 0)
        {
            lblName.Text = dt.Rows[0]["Name"].ToString();
            lblDesignation.Text = dt.Rows[0]["designation"].ToString();
        }

    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        try
        {

            txtNetSalary.Text = Convert.ToInt32(Convert.ToInt32(txtBasic.Text) + Convert.ToInt32(txtDA.Text) + Convert.ToInt32(txtHRA.Text) - Convert.ToInt32(txtPF.Text) - Convert.ToInt32(txtLIC.Text) - Convert.ToInt32(txtTransport.Text)).ToString();

        }
        catch (Exception ex)
        {
           lblMsg.Text= ex.Message.ToString();
        }

    }
}
