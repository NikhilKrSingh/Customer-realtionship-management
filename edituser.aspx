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
            cmn.fillddl(ddlqualification, "Select * from ClassMaster", "name", "cid");

            filltxt();
        }
    }
    protected void filltxt()
    {

          
      hdid.Value = Session["mid"].ToString();
      
        
        string sql;
        sql = "Select * from oe_members where mid=" + hdid.Value +"";
        DataTable dt = cmn.mydatatable(sql);
        if (dt.Rows.Count > 0)
        {
            lblname.Text = dt.Rows[0]["lname"].ToString();
            lblrole.Text = dt.Rows[0]["role"].ToString();
            txtFname.Text = dt.Rows[0]["fullname"].ToString();
            ddlqualification.SelectedValue = dt.Rows[0]["cid"].ToString();
            txtaddress.Text = dt.Rows[0]["address"].ToString();
            txtpin.Text = dt.Rows[0]["pinno"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            txtCEmail.Text = dt.Rows[0]["email"].ToString();
        }
        
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void reset()
    {
     
        txtFname.Text = "";
        ddlqualification.SelectedIndex = 0;
        txtaddress.Text = "";
        txtpin.Text = "";
        txtEmail.Text = "";
        txtCEmail.Text = "";
        lblMsg.Text = "Registration is successful. Please click <a href=../login.aspx>here</a> to login!";
    }
    
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // register 
        try 
        {
            string sql;
            sql = "update oe_members set fullname='" + txtFname.Text.ToString() + "' " +
                " ,cid=" + ddlqualification.SelectedValue  + " ,address='" + txtaddress.Text.ToString() + "',pinno='" + txtpin.Text.ToString() + "' where mid=" + hdid.Value + "";
            cmn.dmloperation(sql);
            reset();
            lblMsg.Text = "Profile updated successfully";
        
                
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error --> " + ex.Message;
        }
        finally
        {
          
        }
    }  // end of Registration 

    protected void txtPwd_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Edit Profile
        <asp:ScriptManager id="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE><TBODY><TR><TD>Login name :</TD><TD><asp:Label id="lblname" runat="server" ForeColor="Red" Font-Bold="True" __designer:wfdid="w4"></asp:Label></TD></TR><TR><TD>Role</TD><TD><asp:Label id="lblrole" runat="server" ForeColor="Red" Font-Bold="True" __designer:wfdid="w3"></asp:Label></TD></TR><TR style="COLOR: #000000"><TD style="BACKGROUND-COLOR: #ff9933" colSpan=2>Personal Details</TD></TR><TR style="COLOR: #000000"><TD>Fullname :</TD><TD><asp:TextBox id="txtFname" runat="server" Width="243px"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="txtFname" ErrorMessage="Fullname is required!"></asp:RequiredFieldValidator></TD></TR><TR style="COLOR: #000000"><TD>Qualification</TD><TD><asp:DropDownList id="ddlqualification" runat="server" Width="246px" AutoPostBack="True"></asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ddlqualification" ErrorMessage="Qualification is required!" InitialValue="0"></asp:RequiredFieldValidator></TD></TR><TR><TD>Address</TD><TD><asp:TextBox id="txtaddress" runat="server" Width="239px" TextMode="MultiLine" MaxLength="500"></asp:TextBox> </TD></TR><TR><TD>Pin Code</TD><TD><asp:TextBox id="txtpin" runat="server" MaxLength="6"></asp:TextBox> </TD></TR><TR><TD>Email Address :</TD><TD><asp:TextBox id="txtEmail" runat="server" Width="240px"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required!"></asp:RequiredFieldValidator></TD></TR><TR><TD>Confirm Email Address :</TD><TD><asp:TextBox id="txtCEmail" runat="server" Width="240px"></asp:TextBox> <asp:CompareValidator id="CompareValidator2" runat="server" ControlToValidate="txtCEmail" ErrorMessage="Confirm Email is not correct!" ControlToCompare="txtEmail"></asp:CompareValidator></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    <asp:Button ID="btnRegister" runat="server" Text="Update Profile" OnClick="btnRegister_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:HiddenField ID="hdid" runat="server" />
    <br />
</asp:Content>

