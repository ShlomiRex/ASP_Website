<%@ Page Title="Log In" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>


<script runat="server">
    DataSet ds = new DataSet();
    void Page_Load()
    {
        if (Session["mone"] != null && (int)Session["mone"] == 0)
            Response.Redirect("Home.aspx");
        
        
        
        if (Request.Form["name"] != null && Request.Form["passw"] != null)
        {
            string sqlString = "SELECT * From Users WHERE userName='" + Request.Form["name"] + "' COLLATE Latin1_General_BIN AND passWord='" + Request.Form["passw"] + "' COLLATE Latin1_General_BIN";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sqlString;
            cmd.Connection = conn;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            conn.Open();
            da.Fill(ds);
            conn.Close();
        }


        if (Request.Form["name"] != null && Request.Form["passw"] != null && ds.Tables[0].Rows.Count > 0)
            if ((bool)ds.Tables[0].Rows[0]["isAdmin"] == true) 
                Session["isUserAdmin"] = true;
            else 
                Session["isUserAdmin"] = false;

        bool isThereSuchAUser = false;
        if (Request.Form["name"] != null && Request.Form["passw"] != null && ds.Tables[0].Rows.Count != 0)
        {
            Application["visitorsOnline"] = (int)Application["visitorsOnline"] + 1;

            if (Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == true)
                Application["adminsOnline"] = (int)Application["adminsOnline"] + 1;

            Session["isUserRegistered"] = true;
            Session["name1"] = Request.Form["name"];
            Session["mone"] = null;
            Session["moneWrite"] = null;
            isThereSuchAUser = true;
            Response.Redirect("Home.aspx");
        }
        else
        {
            if (Session["isUserRegistered"] != null && (bool)Session["isUserRegistered"] == true)
            {
                Session["userMarked"] = null;
                Application["visitorsOnline"] = (int)Application["visitorsOnline"] - 1;

                if (Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == true)
                    Application["adminsOnline"] = (int)Application["adminsOnline"] - 1;

                Session["isUserAdmin"] = null;
                Session["isUserRegistered"] = null;
                Response.Redirect("Home.aspx");
            }

            if (isThereSuchAUser == false && Request.Form["name"] != null && Request.Form["passw"] != null)
            {
                if (Session["mone"] == null)
                {
                    Session["mone"] = 3;
                    Session["moneWrite"] = "<br /><span style='color: white; font-size: 25px;'>You have 3 more try(s) to log in.</span>";
                }
                else if (Session["mone"] != null && (int)Session["mone"] > 0)
                    Session["mone"] = (int)Session["mone"] - 1;

                if (Session["mone"] != null && (int)Session["mone"] != 3)
                    Session["moneWrite"] = "<br /><span style='color: white; font-size: 25px;'>You have " + Session["mone"] + " more try(s) to log in.</span>";

                if (Session["mone"] != null && (int)Session["mone"] == 0)
                {
                    Application["visitorsOnline"] = (int)Application["visitorsOnline"] - 1;
                    Response.Redirect("Home.aspx");
                }
            }
        }
        
        
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="TitleHead">Log In / Log Out</p><br />
    <span style='color: white; font-size: 30px;'>Insert your information.</span>

<%
    if(Session["moneWrite"] != null)
       Response.Write(Session["moneWrite"]);
%>

<div style="border: solid; border-color: white; margin-right: 40%; margin-left: 40%; color: white; margin-top:3%;">
 <form method="post">
 <span style='color: white; font-size: 25px;'>Username: </span><input type='text' name='name' /><br />
 <span style='color: white; font-size: 25px;'>Password: </span><input type='password' name='passw' /><br />
 OK <input type='submit' name='submit' value='Log In' />
 </form>
</div><br /><br />
 <div style="color: white; font-size: x-large;">Not registered? <a href="Register.aspx" style="text-decoration:dotted; color: yellow;">Join the community now!</a></div>
</asp:Content>

