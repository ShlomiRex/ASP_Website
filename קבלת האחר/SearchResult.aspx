<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>
<script runat="server">
    DataSet ds = new DataSet();
    void Page_Load()
    {
        if (Session["isUserRegistered"] == null || (Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == false))
            Response.Redirect("Home.aspx");

            string sqlString = "SELECT * FROM Users WHERE firstName LIKE '" + Request.QueryString["searchTextbox"] + "'";
            //string sqlString = "SELECT * FROM Users WHERE firstName % '" + Request.QueryString["searchTextbox"] + "'";
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: lightskyblue;">Search Results:</h1>
<% 
            string htmlString = "";
            htmlString += "<tr stlye='font-color: Red;'>";
            htmlString += "<th>" + " Username " + "</th>";
            htmlString += "<th>" + " Password " + "</th>";
            htmlString += "<th>" + " Birth Year " + "</th>";
            htmlString += "<th>" + " Is Admin? " + "</th>";
            htmlString += "<th>" + " Gender " + "</th>";
            htmlString += "<th>" + " First Name " + "</th>";
            htmlString += "<th>" + " Last Name " + "</th>";
            htmlString += "<th>" + " Adress " + "</th>";
            htmlString += "<th>" + " Email " + "</th>";
            htmlString += "<th>" + " Phone " + "</th></tr>";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                    htmlString += "<tr>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["userName"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["passWord"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["birthYear"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["isAdmin"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["gender"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["firstName"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["lastName"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["adress"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["email"].ToString() + "</td>";
                    htmlString += "<td>" + ds.Tables[0].Rows[i]["phone"].ToString() + "</td>";
                    htmlString += "</tr>";
            }
%>
    <div style="color: white; font-size: x-large; border:medium; border-color: white;">
        <table border="1" style="border-color: white; background-color: black; border:thin;" cellpadding="5px">
<%=htmlString %>
        </table>
    </div>
</asp:Content>

