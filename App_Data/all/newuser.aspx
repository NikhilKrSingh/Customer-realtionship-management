<%@ Page Language="C#" MasterPageFile="~/all/all.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    commoncontrol cmn = new commoncontrol();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cmn.fillddl(ddlqualification, "Select * from ClassMaster", "name", "cid");
        }

    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login.aspx");
    }
    protected void reset()
    {
        txtLname.Text = "";
        txtFname.Text = "";
        ddlqualification.SelectedIndex = 0;
        txtaddress.Text = "";
        txtpin.Text = "";
        txtPwd.Text = "";
        txtCpwd.Text = "";
        txtEmail.Text = "";
        txtCEmail.Text = "";
        lblMsg.Text = "Registration is successful. Please click <a href=../login.aspx>here</a> to login!";
    }
    
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // register 
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try 
        {
            con.Open();
            // check whether login name is unique 
            SqlCommand cmd = new SqlCommand("select * from oe_members where lname = @lname", con);
            cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = txtLname.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblMsg.Text = "Login name is not unqiue. Plase enter a different login name!";
                return;     
            }
            dr.Close();
            
            // check whether email address is unique
            cmd.Parameters.Clear(); 
            cmd.CommandText = "select * from oe_members where email = @email";
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblMsg.Text = "Email address is not unqiue!";
                return;     
            }
            dr.Close();   
            
            // get next MID
            cmd.CommandText = "select  isnull(max(mid),0) + 1 from oe_members";
            int mid = (Int32) cmd.ExecuteScalar ();
            // insert row into OE_MEMEBERS
            cmd.Parameters.Clear ();
            cmd.CommandText = "insert into oe_members values(@mid,@lname,@pwd,@fullname,@cid,@Address,@pinNO,@email,null,getdate(),@role)";
            cmd.Parameters.Add("@mid", SqlDbType.Int).Value =  mid;
            cmd.Parameters.Add("@lname", SqlDbType.VarChar,10).Value = txtLname.Text;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar,10).Value = txtPwd.Text; 
            cmd.Parameters.Add("@fullname", SqlDbType.VarChar,30).Value = txtFname.Text;
            cmd.Parameters.Add("@cid", SqlDbType.Int).Value = ddlqualification.SelectedValue;
            cmd.Parameters.Add("@address", SqlDbType.VarChar, 500).Value = txtaddress.Text;
            cmd.Parameters.Add("@PinNo", SqlDbType.VarChar, 12).Value = txtpin.Text; 
            cmd.Parameters.Add("@email", SqlDbType.VarChar,30).Value = txtEmail.Text;
            cmd.Parameters.Add("@role", SqlDbType.VarChar, 10).Value = "User";
            if (cmd.ExecuteNonQuery() > 0)

                reset();
            ///lblMsg.Text = "Registration is successful. Please click <a href=../login.aspx>here</a> to login!";
            else
                lblMsg.Text = "Sorry! Some error occured during registration!";
                
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error --> " + ex.Message;
        }
        finally
        {
            con.Close();
        }
    }  // end of Registration 

    protected void txtPwd_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
    New User Registration
    </h2>
    <table style="width: 577px">
        <tr>
            <td colspan="2" style="background-color: #ff6633">
                Login Details</td>
        </tr>
        <tr>
            <td>
                Login name :</td>
            <td >
                <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLname"
                    ErrorMessage="Login Name Required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Password :
            </td>
            <td >
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="149px" OnTextChanged="txtPwd_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                    ErrorMessage="Password is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Confirm Password :</td>
            <td >
                <asp:TextBox ID="txtCpwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCpwd"
                    ErrorMessage="Confirm password required!"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                    ControlToValidate="txtCpwd" ErrorMessage="Passwords do not match!"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: #ff6600">
                Personal Information</td>
        </tr>
        <tr>
            <td >
                Fullname :</td>
            <td >
                <asp:TextBox ID="txtFname" runat="server" Width="243px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFname"
                    ErrorMessage="Fullname is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                Qualification</td>
            <td>
                &nbsp;<asp:DropDownList ID="ddlqualification" runat="server" Width="215px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlqualification" ErrorMessage="Qualification is required !"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Width="239px" MaxLength="500"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtaddress"
                    ErrorMessage="Address is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                Pin Code</td>
            <td>
                <asp:TextBox ID="txtpin" runat="server" MaxLength="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtpin"
                    ErrorMessage="Pin code is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                Email Address :</td>
            <td >
                <asp:TextBox ID="txtEmail" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email address is required!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                Confirm Email Address :</td>
            <td>
                <asp:TextBox ID="txtCEmail" runat="server" Width="240px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtEmail"
                    ControlToValidate="txtCEmail" ErrorMessage="Confirm Email is not correct!"></asp:CompareValidator></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server" Width="326px"></asp:Label><br />
</asp:Content>

