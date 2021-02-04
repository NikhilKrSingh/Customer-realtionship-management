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
        sql = "Select * from CustomerMaster where id=" + hdid.Value + "";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
            lblno.Text = dt.Rows[0]["id"].ToString();
            lblname.Text = dt.Rows[0]["name"].ToString();
            lbladdress.Text = dt.Rows[0]["CAddress"].ToString();
            lblgender.Text = dt.Rows[0]["Gender"].ToString();
            lblmobile.Text = dt.Rows[0]["ContactNo"].ToString();
            lblemail.Text = dt.Rows[0]["EmailId"].ToString();
        }
        
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactCustomer.aspx");
    }
    

      // end of Registration 


    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {

            
            
            // send mail 
            //--------------------------------------
            DataTable dtEmail = cmn.mydatatable("Select * from EmailSetup");
            if (dtEmail.Rows.Count > 0)
            {
                string name = dtEmail.Rows[0]["Name"].ToString();
                string FrmEmail = dtEmail.Rows[0]["EmailId"].ToString();
                string Pass = dtEmail.Rows[0]["Password"].ToString();
                string Subject = dtEmail.Rows[0]["Subject"].ToString();

                string Msg = txtMessage.Text.ToString();
                    //"Dear Subscriber; Please use the following details to login." + "\n" + "Login name : " + dr["lname"] + "\n" + "Password : " + dr["pwd"] + "\n" + "WebMaster<br>Digital Literacy Program";


                string ToEmail = lblemail.Text.ToString();
                cmn.SendMail(name.ToString(), FrmEmail.ToString(), Pass.ToString(), ToEmail.ToString(), Subject.ToString(), Msg.ToString());

                lblMsg.Text = "Message send successfully";
                txtMessage.Text = "";
            }
            //// End Send Email
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Send Email To Customer&nbsp;
    </h2>
    <table style="width: 530px">
        <tr>
            <td style="width: 93px">
                Customer ID</td>
            <td>
                <asp:Label ID="lblno" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Name</td>
            <td>
                <asp:Label ID="lblname" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Gender</td>
            <td>
                <asp:Label ID="lblgender" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Address</td>
            <td>
                <asp:Label ID="lbladdress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Mobile</td>
            <td>
                <asp:Label ID="lblmobile" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 93px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 93px">
                Email To</td>
            <td>
                <asp:Label ID="lblemail" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px">
                Your Message</td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="txtMessage" Display="Dynamic" 
            ErrorMessage="Answer 1 is required!" ValidationGroup="a" Width="12px">*</asp:RequiredFieldValidator>
                <br />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 93px">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" Text="Send" 
                    ValidationGroup="a" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        Font-Size="XX-Small" Height="15px" ShowSummary="False" ValidationGroup="a" 
        Width="251px" />
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;<br />
    <asp:Button ID="btnCancel" runat="server" Text="Back" OnClick="btnCancel_Click" CausesValidation="False" /><br />
    <br />
    <asp:HiddenField ID="hdid" runat="server" />
    <br />
</asp:Content>

