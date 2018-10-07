<%@ Page Title="Display Profile" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>
<script runat="server">
    string htmlString = "";
    DataSet ds = new DataSet();
    void Page_Load()
    {
        if (Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == false)
        {
            if (Session["isUserRegistered"] != null && (bool)Session["isUserRegistered"] == true)
                Response.Redirect("Media.aspx");
            Response.Redirect("LogIn.aspx");
        }

        if (Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == true)
        {
            string sqlString = "SELECT * FROM Users";
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
        else if (Session["isUserRegistered"] == null || (bool)Session["isUserRegistered"] == false) Response.Redirect("LogIn.aspx");
        else Response.Write("Media.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<span style="color: white;">
<h3><%=Session["alert"]%></h3>
<% Session["alert"] = null;%>
</span><br />

    <h1 style="color: lightskyblue;">All Database Data Information:</h1>
    <%
        if (Session["isUserRegistered"] == null)
        {
            Response.Redirect("LogIn.aspx");
        }
        
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            if (ds.Tables[0].Rows[i]["userName"].ToString() == (string)Session["name1"])
                if (ds.Tables[0].Rows[i]["isAdmin"].ToString() == "False")
                    Response.Redirect("Media.aspx");
            
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            Response.Write("<span class='DisplayInfoTextStyle'><u>Username:</u> ");
            Response.Write(ds.Tables[0].Rows[i]["userName"].ToString());
            Response.Write(" <u>Password:</u> ");
            Response.Write(ds.Tables[0].Rows[i]["passWord"].ToString());
            Response.Write("<br /></span>");
        }
        
        
        htmlString += "<tr><div stlye='font-color: Red;'>";
        htmlString += "<th>" + " Username " + "</th>";
        htmlString += "<th>" + " Password " + "</th>";
        htmlString += "<th>" + " Birth Year " + "</th>";
        htmlString += "<th>" + " Is Admin? " + "</th>";
        htmlString += "<th>" + " Gender " + "</th>";
        htmlString += "<th>" + " First Name " + "</th>";
        htmlString += "<th>" + " Last Name " + "</th>";
        htmlString += "<th>" + " Adress " + "</th></div>";
        htmlString += "<th>" + " Email " + "</th></div>";
        htmlString += "<th>" + " Phone " + "</th></div>";
        htmlString += "<th>" + " Delete " + "</th></div>";
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
            htmlString += "<td> <a name='DeleteUserButton' href='DeleteUser.aspx?textBox="+ds.Tables[0].Rows[i]["userName"].ToString()+"'>Delete This User</a> </td>";
            htmlString += "</tr>";
        }
    %>
    <br /><br /><br /><br />




    <div style="color: white; font-size: x-large; border:medium; border-color: white;">
    <table border="1" style="border-color: white; background-color: black; border:thin;" cellpadding="5px">
        <%=htmlString%>
    </table>
    </div>
    <br /><br />
    <span style="color: white;">
        <h1><b><u>Delete User</u></b></h1>
        Insert unsername in order to delete him.
    </span>
    <form action="DeleteUser.aspx" method="get">
        <input type="text" name="textBox" style="width: 400px;"/><br />
        <input type="submit" onclick="checkTextbox" />
    </form>
</asp:Content>

