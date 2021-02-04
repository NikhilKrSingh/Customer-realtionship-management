<%@ Page Language="C#" MasterPageFile="~/all/all.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server">
    commoncontrol cmn = new commoncontrol();
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Check email address
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString );
        try
        {
            con.Open();
            // check whether email address is preset
            SqlCommand cmd = new SqlCommand("select * from oe_members where email = @email", con);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.Read())
            {
                lblMsg.Text = "Sorry! Email address is not found!";
                return;     
            }
            

            // send mail 
            //--------------------------------------
            DataTable dtEmail = cmn.mydatatable("Select * from EmailSetup");
            if (dtEmail.Rows.Count > 0)
            {
                string name = dtEmail.Rows[0]["Name"].ToString();
                string FrmEmail = dtEmail.Rows[0]["EmailId"].ToString();
                string Pass = dtEmail.Rows[0]["Password"].ToString();
                string Subject = "Password Recovery [Digital Literacy Program]";

                string Msg = "Dear Subscriber; Please use the following details to login." + "\n" + "Login name : " + dr["lname"]  + "\n" + "Password : " + dr["pwd"] + "\n" + "WebMaster<br>Digital Literacy Program";


                string ToEmail = txtEmail.Text;
                cmn.SendMail(name.ToString(), FrmEmail.ToString(), Pass.ToString(), ToEmail.ToString(), Subject.ToString(), Msg.ToString());

            }
            //// End Send Email
            
            lblMsg.Text = "Details of your account are sent to your email address. Please use them to login!";
           }
        catch (Exception ex)
        {
            lblMsg.Text = "Error --> " + ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Forgot Password !</h2>
    Enter email address :
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Email address is required!"></asp:RequiredFieldValidator><br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
<br />
<br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</asp:Content>

