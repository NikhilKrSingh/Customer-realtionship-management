<%@ Page Language="C#" Theme="all" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    commoncontrol cmn = new commoncontrol();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // check whether credentials are valid
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString );
        try
        {
            con.Open(); 
            SqlCommand cmd = new SqlCommand("select * from oe_members where lname = @lname and pwd = @pwd and role=@role",con);
            cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = txtLname.Text;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = txtPwd.Text;
            cmd.Parameters.Add("@role", SqlDbType.VarChar, 10).Value = ddltype.SelectedValue.ToString();
           
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("mid", dr["mid"]);
                Session.Add("stid", dr["EmployeeId"]);
                Session.Add("fullname", dr["fullname"]);
                Session.Add("dlv", dr["dlv"]);
                Session["role"] = ddltype.SelectedItem.Text.ToString();
                // update MEMBERS table for DLV
                dr.Close();
                cmd.CommandText = "update oe_members set dlv = getdate() where lname = @lname";
                cmd.ExecuteNonQuery();


                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Login!";
                dr.Close();
            }

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

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void chkRemember_CheckedChanged(object sender, EventArgs e)
    {

    }


    
</script>



<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Customer Relationship Management</title>
    <style type="text/css">
        .style7
        {
            width: 82%;
        }
            .style9
        {
        }
        .style10
        {
            width: 100%;
        }
        .style12
        {
            width: 142px;
            height: 18px;
        }
        .style13
        {
            width: 289px;
            height: 18px;
        }
        .style14
        {
            width: 142px;
        }
        </style>
</head>
<body bgcolor="#CCCCCC">
<center>
    <form id="form1" runat="server">
    <div style="width: 1000px">
        <table class="style7" bgcolor="White">
            <tr>
                <td>
                    <table class="style7" bgcolor="White">
                        <tr>
                            <td class="style9">
                                <img alt="" src="images/header.jpg" 
                                    style="width: 1000px; height: 75px" /></td>
                        </tr>
                        <tr>
                            <td class="style9">
                                                         <asp:Menu ID="Menu1" runat="server" BackColor="#0099CC" 
                                                             DynamicHorizontalOffset="2" 
                        Font-Names="Verdana" Font-Size="0.8em" 
                                                             ForeColor="White" Height="16px" Orientation="Horizontal" 
                                                             StaticSubMenuIndent="10px" 
                        Width="100%" Font-Bold="True">
                                                             <StaticSelectedStyle BackColor="#5D7B9D" />
                                                             <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                                             <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                                                             <DynamicMenuStyle BackColor="#F7F6F3" />
                                                             <DynamicSelectedStyle BackColor="#5D7B9D" />
                                                             <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                                             <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                                                             <Items>
                                                                 <asp:MenuItem NavigateUrl="~/login.aspx" Text="Home" Value="Home">
                                                                 </asp:MenuItem>
                                                                 <asp:MenuItem NavigateUrl="~/AboutUs.aspx" Text="About Us" Value="About Us">
                                                                 </asp:MenuItem>
                                                                 <asp:MenuItem NavigateUrl="~/enquiry.aspx" Text="Enquiry" Value="Enquiry">
                                                                 </asp:MenuItem>
                                                             </Items>
                                                         </asp:Menu>
                            </td>
                        </tr>
                                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <script language="javascript">



var delay=2000 //set delay in miliseconds
var curindex=0

var randomimages=new Array()

	randomimages[0]="images/1.jpg"
	randomimages[1]="images/2.jpg"
	randomimages[2]="images/3.jpg"
	randomimages[3]="images/4.jpg"
	randomimages[4]="images/5.jpg"
	randomimages[5]="images/6.jpg"

var preload=new Array()

for (n=0;n<randomimages.length;n++)
{
	preload[n]=new Image()
	preload[n].src=randomimages[n]
}

document.write('<img name="defaultimage" src="'+randomimages[Math.floor(Math.random()*(randomimages.length))]+'">')

function rotateimage()
{

if (curindex==(tempindex=Math.floor(Math.random()*(randomimages.length)))){
curindex=curindex==0? 1 : curindex-1
}
else
curindex=tempindex
// 
	document.images.defaultimage.src=randomimages[curindex]
}

setInterval("rotateimage()",delay)

</script>
                                                         <br />
                                                      
                                                         </td>
            </tr>
            <tr>
                <td bgcolor="#0099CC" height="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                                                         <table class="style10">
                                                             <tr>
                                                                 <td align="left" colspan="3" valign="top">
        <table  bgcolor= "#CCCCCC" style="background-color: #CCCCCC; width: 299px; height: 163px;" align="center">
            <tr style="background-color: #336699">
                <td align="center" 
                    style="height: 24px; background-color: #0099CC; color: #FFFFFF;" 
                    colspan="2">
                    Login</td>
            </tr>
            <tr>
                <td align="left" class="style14">User Name</td>
                <td style="width: 289px">
                    <table style="width: 119px">
                        <tr>
                            <td style="width: 100px; height: 26px;">
                                <asp:TextBox ID="txtLname" runat="server" Width="150px" MaxLength="10"></asp:TextBox></td>
                            <td style="width: 100px; height: 26px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLname" ErrorMessage="Llogin name is missing!" Font-Bold="True" Width="1px">*</asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="color: #000000">
                <td align="left" class="style14">Password</td>
                <td style="width: 289px">
                    <table style="width: 163px">
                        <tr>
                            <td style="width: 100px; height: 26px;">
                                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px" 
                                    MaxLength="10"></asp:TextBox></td>
                            <td style="width: 100px; height: 26px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="Password is missing!" Font-Bold="True">*</asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="color: #000000">
                <td align="left" class="style12">
                    Type</td>
                <td class="style13">
                    <table style="width: 171px">
                        <tr>
                            <td style="width: 100px">
                    <asp:DropDownList ID="ddltype" runat="server" Width="158px" OnSelectedIndexChanged="ddltype_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">--Plz Select--</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="User">Employee</asp:ListItem>
                    </asp:DropDownList></td>
                            <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddltype"
                        ErrorMessage="Select type" Font-Bold="True" InitialValue="0" Width="1px">*</asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    </td>
            </tr>
           <tr>
          <td style="height: 22px" align="left">
        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="78px" 
                        OnClick="btnLogin_Click" ForeColor="#CCCCCC" />
                </td> 
          <td style="height: 22px" align="left">
                                <a href="all/forgotpassword.aspx">Forgot Password?</a> </td> 
           </tr> 
           <tr>
          <td colspan="2" style="height: 22px" align="center">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                  HeaderText="Please correct the following errors:" Font-Bold="True" 
                  Font-Size="Small" Height="44px" Width="276px" />
               </td> 
           </tr> 
        </table>
                                                                     </td>
                                                                 </tr>
                                                             <tr>
                                                                 <td align="left" colspan="3" valign="top">
                                                                     &nbsp;</td>
                                                                 </tr>
                                                             <tr>
                                                                 <td align="left" valign="top">
        <asp:SqlDataSource ID="dsLogin" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
            SelectCommand="select * from members where  lname = @lname and pwd = @pwd">
            <SelectParameters>
                <asp:Parameter Name="lname" />
                <asp:Parameter Name="pwd" />
            </SelectParameters>
        </asp:SqlDataSource>
   
                                                                     </td>
                                                                 <td align="left" valign="top" width="700">
                                                                     &nbsp;</td>
                                                                 <td width="300">
                                                                     &nbsp;</td>
                                                                 </tr>
                                                                 </table>
                                                         </td>
            </tr>
            </table>
        <br />
   
    </div>
    </form>
</center>    
</body>
</html>
