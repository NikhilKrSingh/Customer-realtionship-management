<%@ Page Language="C#" MasterPageFile="~/main.master" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // cmn.fillddl(ddlqualification, "Select * from ClassMaster", "name", "cid");

            filltxt();
        }
    }
    protected void filltxt()
    {
        hdid.Value = Request.QueryString["id"].ToString();
        string sql;
        sql = "Select * from Enquiry where eid=" + hdid.Value + "";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
            lblno.Text = dt.Rows[0]["eid"].ToString();
            lbldate.Text = dt.Rows[0]["EnquiryDate"].ToString();
            lblname.Text = dt.Rows[0]["name"].ToString();
            lbladdress.Text = dt.Rows[0]["address"].ToString();
            lblpin.Text = dt.Rows[0]["pin"].ToString();
            lblmobile.Text = dt.Rows[0]["mobile"].ToString();
            lblemail.Text = dt.Rows[0]["email"].ToString();
            lblremarks.Text = dt.Rows[0]["remarks"].ToString();
        }
        
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewenquiry.aspx");
    }
    

      // end of Registration 


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        View Enquiry Details&nbsp;
    </h2>
    <table style="width: 530px">
        <tr>
            <td style="width: 93px">
                Enquiry No</td>
            <td>
                <asp:Label ID="lblno" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Enquiry Date</td>
            <td>
                <asp:Label ID="lbldate" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Name</td>
            <td>
                <asp:Label ID="lblname" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Address</td>
            <td>
                <asp:Label ID="lbladdress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Pin</td>
            <td>
                <asp:Label ID="lblpin" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Mobile</td>
            <td>
                <asp:Label ID="lblmobile" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Email</td>
            <td>
                <asp:Label ID="lblemail" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Remarks</td>
            <td>
                <asp:Label ID="lblremarks" runat="server"></asp:Label></td>
        </tr>
    </table>
    &nbsp;&nbsp;<br />
    <asp:Button ID="btnCancel" runat="server" Text="Back" OnClick="btnCancel_Click" CausesValidation="False" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:HiddenField ID="hdid" runat="server" />
    <br />
</asp:Content>

