<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% 
    if (Session["isUserRegistered"] == null || Session["isUserAdmin"] != null && (bool)Session["isUserAdmin"] == false) 
       Response.Redirect("Media.aspx"); 
%>
    <p class="TitleHead">Search System</p>
        <span style="color: white;">Please Insert First Name To Search</span>
    <form method="get" action="SearchResult.aspx">
        <span style="color: white;">Search User By First Name: </span><input type="text" id="searchTextboxID" name="searchTextbox"/>
        <br /> <input type="submit" value="Search" />
    </form>
</asp:Content>

