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

public partial class EmpAttendanceReport : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    string P;
    string L;
    string A;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
               
                //fillddl();
                //reset();
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
            //string sql;
            //    if (btnsave.Text.ToString() == "Save")
            //    {
            //            sql = "insert into students(sname,bcode,stdemail) " +
            //                " values('" + txtname.Text.ToString() + "'," + ddlbatch.SelectedValue.ToString() + ",'" + txtemail.Text.ToString() + "')";
                    
            //    }
            //    else
            //    {
            //        sql = "update students set sname='" + txtname.Text.ToString() + "' " +
            //              " ,bcode=" + ddlbatch.SelectedValue.ToString() + ",stdEmail='" + txtemail.Text.ToString() + "' where admno=" + hdid.Value + "";
            //    }

            //    cmn.dmloperation(sql);
            //    FillGrid();
            //    reset();
           
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message.ToString();
            
        }
    }

protected void reset()
{
    try
    {
        //btnsave.Text = "Save";
        //hdid.Value = "0";
        //txtname.Text = "";
        //ddlbatch.SelectedIndex = 0;
        lblmsg.Text = "";

    }
    catch (Exception ex)
    {
        ex.Message.ToString();
    }
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
        try
        {
            //string sql = "SELECT MAX(AdNo) AS No, MAX(StdName) AS stName, MAX(P) AS PP, MAX(L) AS LL, MAX(A) AS AA, sum(P+L+A) AS TT, (MAX(P)*100/sum(P+L+A)) AS Per  " +
            //           " FROM     (SELECT MAX(attendance.admno) AS AdNo, MAX(StudentMaster.name) AS StdName, COUNT(*) AS P, 0 AS L, 0 AS A " +
            //           " FROM      attendance LEFT OUTER JOIN StudentMaster ON attendance.admno = StudentMaster.id " +
            //           " WHERE   (attendance.status = 'p') and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "' GROUP BY attendance.admno " +
            //           " UNION " +
            //           " SELECT MAX(attendance_2.admno) AS AdNo, MAX(students_2.name) AS StdName, 0 AS P, COUNT(*) AS L, 0 AS A " +
            //           " FROM     attendance AS attendance_2 LEFT OUTER JOIN " +
            //           " StudentMaster AS students_2 ON attendance_2.admno = students_2.id " +
            //           " WHERE  (attendance_2.status = 'l') and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "'  GROUP BY attendance_2.admno " +
            //            " UNION SELECT MAX(attendance_1.admno) AS AdNo, MAX(students_1.name) AS StdName, 0 AS P, 0 AS L, COUNT(*) AS A " +
            //            " FROM     attendance AS attendance_1 LEFT OUTER JOIN " +
            //            " StudentMaster AS students_1 ON attendance_1.admno = students_1.id WHERE  (attendance_1.status = 'a') " +
            //            "  and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "' GROUP BY attendance_1.admno) AS derivedtbl_1 GROUP BY AdNo ";






            string sql = "SELECT MAX(AdNo) AS No, MAX(StdName) AS stName, MAX(P) AS PP, MAX(L) AS LL, MAX(A) AS AA, sum(P+L+A) AS TT, (MAX(P)*100/sum(P+L+A)) AS Per  " +
                      " FROM     (SELECT MAX(EmpAttendance.admno) AS AdNo, MAX(EmployeeMaster.name) AS StdName, COUNT(*) AS P, 0 AS L, 0 AS A " +
                      " FROM      EmpAttendance LEFT OUTER JOIN EmployeeMaster ON EmpAttendance.admno = EmployeeMaster.id " +
                      " WHERE   (EmpAttendance.status = 'p') and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "' GROUP BY EmpAttendance.admno " +
                      " UNION " +
                      " SELECT MAX(attendance_2.admno) AS AdNo, MAX(students_2.name) AS StdName, 0 AS P, COUNT(*) AS L, 0 AS A " +
                      " FROM     EmpAttendance AS attendance_2 LEFT OUTER JOIN " +
                      " EmployeeMaster AS students_2 ON attendance_2.admno = students_2.id " +
                      " WHERE  (attendance_2.status = 'l') and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "'  GROUP BY attendance_2.admno " +
                       " UNION SELECT MAX(attendance_1.admno) AS AdNo, MAX(students_1.name) AS StdName, 0 AS P, 0 AS L, COUNT(*) AS A " +
                       " FROM     EmpAttendance AS attendance_1 LEFT OUTER JOIN " +
                       " EmployeeMaster AS students_1 ON attendance_1.admno = students_1.id WHERE  (attendance_1.status = 'a') " +
                       "  and adate >='" + txtFdate.Text.ToString() + "'  and adate <='" + txtToDate.Text.ToString() + "' GROUP BY attendance_1.admno) AS derivedtbl_1 GROUP BY AdNo ";
            cmn.fillgrid(gv1, sql);
        }
        catch (Exception ex)
        {
            lblmsg.Text= ex.Message.ToString();
        }
    }
    //protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    hdid.Value = gv1.DataKeys[gv1.SelectedIndex].Value.ToString();
    //    string Email;
      

    //    string sql1 = "SELECT MAX(AdNo) AS No, MAX(StdName) AS stName, MAX(P) AS PP, MAX(L) AS LL, MAX(A) AS AA " +
    //       " FROM     (SELECT MAX(attendance.admno) AS AdNo, MAX(students.sname) AS StdName, COUNT(*) AS P, 0 AS L, 0 AS A " +
    //       " FROM      attendance LEFT OUTER JOIN students ON attendance.admno = students.admno " +
    //       " WHERE   (attendance.status = 'p') GROUP BY attendance.admno " +
    //       " UNION " +
    //       " SELECT MAX(attendance_2.admno) AS AdNo, MAX(students_2.sname) AS StdName, 0 AS P, COUNT(*) AS L, 0 AS A " +
    //       " FROM     attendance AS attendance_2 LEFT OUTER JOIN " +
    //       " students AS students_2 ON attendance_2.admno = students_2.admno " +
    //       " WHERE  (attendance_2.status = 'l') GROUP BY attendance_2.admno " +
    //        " UNION SELECT MAX(attendance_1.admno) AS AdNo, MAX(students_1.sname) AS StdName, 0 AS P, 0 AS L, COUNT(*) AS A " +
    //        " FROM     attendance AS attendance_1 LEFT OUTER JOIN " +
    //        " students AS students_1 ON attendance_1.admno = students_1.admno WHERE  (attendance_1.status = 'a') " +
    //        " GROUP BY attendance_1.admno)  AS derivedtbl_1  where adNo=" + hdid.Value + " GROUP BY AdNo ";

    //    DataTable Newdt = cmn.mydatatable(sql1);
    //    if (Newdt.Rows.Count > 0)
    //    {
    //        P = Newdt.Rows[0]["PP"].ToString();
    //        L = Newdt.Rows[0]["LL"].ToString();
    //        A = Newdt.Rows[0]["AA"].ToString();
    //    }
    //    else
    //    {
    //        lblmsg.Text = "This student has not entered Email id";
    //    }

    //    DataTable dt = cmn.mydatatable("Select * from students where admno=" + hdid.Value.ToString() + "");
    //    if (dt.Rows.Count > 0)
    //    {
    //     Email = dt.Rows[0]["stdEmail"].ToString();
    //    }
        
    //    DataTable dtEmail = cmn.mydatatable("Select * from EmailSetup");
    //    if (dtEmail.Rows.Count > 0)
    //    {
    //        Email = dt.Rows[0]["stdEmail"].ToString();

    //        string name = dtEmail.Rows[0]["Name"].ToString();
    //        string FrmEmail = dtEmail.Rows[0]["EmailId"].ToString();
    //        string Pass = dtEmail.Rows[0]["Password"].ToString();
    //        string Subject = dtEmail.Rows[0]["Subject"].ToString();
    //        string Msg = "Your Attendance record :: Present :- " + P.ToString() + " Leave :- " + L.ToString() + " Absent :- " + A.ToString();
    //        string ToEmail = Email.ToString();
    //        cmn.SendMail(name.ToString(), FrmEmail.ToString(), Pass.ToString(), ToEmail.ToString(), Subject.ToString(), Msg.ToString());


    //        //filltxt(hdid.Value);
    //    }

    //}
    protected void filltxt(string id)
    {
        try
        {
            //DataTable dt = cmn.mydatatable("Select * from students where admno=" + id + "");
            //if (dt.Rows.Count > 0)
            //{
            //    hdid.Value = dt.Rows[0]["admno"].ToString();
            //    txtname.Text = dt.Rows[0]["sName"].ToString();
            //    ddlbatch.SelectedValue = dt.Rows[0]["bcode"].ToString();
            //    btnsave.Text = "Update";
            //}
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
   
    protected void btndel_Click(object sender, EventArgs e)
    {
        try
        {
            //string sql;
            //sql = "delete from students  where admno=" + hdid.Value + "";
            //cmn.dmloperation(sql);
            //FillGrid();
            //reset();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    }

    protected void fillddl()
    {
        //cmn.fillddl(ddlbatch, "Select bcode as Id,Course as Name from batches", "Name", "Id");
    }
    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
}
