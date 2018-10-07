<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>
<script runat="server">
    DataSet ds = new DataSet();
    void Page_Load()
    {
        if (Session["isUserRegistered"] == null)
            Response.Redirect("Home.aspx");

        if (Session["isUserAdmin"] == null || (bool)Session["isUserAdmin"] == false)
            Response.Redirect("Home.aspx");
        
            string sqlString = "SELECT * FROM Users WHERE userName='"+Request.QueryString["textBox"]+"'";
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

            
            if (ds.Tables[0].Rows.Count == 0)
            {
                Session["alert"] = "There is not such a username. Please try again. Username inserted: "+Request.QueryString["textBox"];
                Response.Redirect("DisplayProfile.aspx");
            }
            
            if ((bool)ds.Tables[0].Rows[0]["isAdmin"] == true)
            {
                Session["alert"] = "This user is admin. Admins canno't delete other admins.";
                Response.Redirect("DisplayProfile.aspx");
            }

            sqlString = "DELETE FROM Users WHERE userName='" + Request.QueryString["textBox"] + "'";
            conn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
            cmd.CommandText = sqlString;
            cmd.Connection = conn;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Session["alert"] = "User has been succsful deleted.";
            Response.Redirect("DisplayProfile.aspx");
        }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

