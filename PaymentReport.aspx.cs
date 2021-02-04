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
public partial class PaymentReport : System.Web.UI.Page
{
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
               // FillGrid();

                DateTime dt = DateTime.Today;
                txtFdate.Text = DateTime.Now.ToString("dd/MM/yyyy").Replace('-', '/');
                txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy").Replace('-', '/');


            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }

    protected void FillGrid()
    {
        string sql1 = "";
        //if (ddlStatus.SelectedValue=="All")
        //{
        //    sql1="";
        //}
        //else
        //{
        //    sql1 = " and JobCardMaster.Status='"+ ddlStatus.SelectedValue.ToString() + "'";
        //}



        sql1 = sql1 + " And JobCardMaster.JobDate >='" + Convert.ToDateTime(txtFdate.Text).ToString("yyyy-MM-dd") + "' and JobDate <='" + Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd") + "'  ";

        string sql = "select max(JobCardMaster.id) as Id, max(convert(varchar,JobDate,105)) as JobDate, max(customerMaster.Name) as Name, " +
                       " Sum(serviceMaster.charges) as Amount  " +
                       " from JobCardMaster left join customerMaster on  JobCardMaster.customerid=customerMaster.id  " +
                       " left join ServiceDetail on JobCardMaster.id=ServiceDetail.JobNo " +
                       " left join ServiceMaster on ServiceMaster.id=ServiceDetail.serviceId " +
                       " where JobCardMaster.id> 0 " + sql1.ToString() + " group by JobCardMaster.id";

       lblToal.Text="Total Amount (Rs) : " + cmn.dmlscaler("select Sum(serviceMaster.charges) as Amount  " +
                                   " from JobCardMaster left join customerMaster on  JobCardMaster.customerid=customerMaster.id  " +
                                   " left join ServiceDetail on JobCardMaster.id=ServiceDetail.JobNo " +
                                   " left join ServiceMaster on ServiceMaster.id=ServiceDetail.serviceId " +
                                   " where JobCardMaster.id> 0" + sql1.ToString() +"").ToString() ;

        cmn.fillgrid(gv1, sql);
        if (gv1.Rows.Count <= 0)
        {
            lblMsg.Text = "No record found!!";
        }
        else
        {
            lblMsg.Text =gv1.Rows.Count.ToString() + " Records Found!";
        }
    }


   
    protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        FillGrid();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            FillGrid();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}
