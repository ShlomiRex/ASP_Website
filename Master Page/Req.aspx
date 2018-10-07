<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%
        if (Application["visitorsReq"] == null) 
            Application["visitorsReq"] = 0;

        if (Session["userMarked"] == null && Session["isUserRegistered"] != null && (bool)Session["isUserRegistered"] == true)
            Session["userMarked"] = true;

        if (Session["userMarked"] != null && (bool)Session["userMarked"] == true && Session["isUserRegistered"] != null && (bool)Session["isUserRegistered"] == true && Application["visitorsReq"] != null)
        {
            Session["userMarked"] = false;
            Application["visitorsReq"] = (int)Application["visitorsReq"] + 1;
        }
            
        string visitorCounterString = "<h1 style='color: white;'>Visitors so far: " + Application["visitorsReq"] + "</h1>";
    %>

    <% =visitorCounterString %>
    <p class="TitleHead">Requierments</p><br>
            <p class="titleText" style="text-align:center;"><u><b>System Requierments</b></u></p>
            <div style="margin-left:100px;  border:double; border-color: white;float:left; background-image:url(a/Background.jpg); margin-bottom:5%;">
                <div style="background-color:blue; color:white;"><b>Minimum System Requierments:</b></div>
                <p class="reqSettings"><b style="font-size:large"><u>CPU:</u></b> 2 GHz Intel Dual Core Processor</p>
                <p class="reqSettings"><b style="font-size:large"><u>RAM:</u></b> 2 GB RAM</p>
                <p class="reqSettings"><b style="font-size:large"><u>VGA:</u></b> NVIDIA GeForce 8800/ATI Radeon HD 2600 (256MB minimum)</p>
                <p class="reqSettings"><b style="font-size:large"><u>DX:</u></b> 9.0c</p>
                <p class="reqSettings"><b style="font-size:large"><u>OS:</u></b> Windows XP SP3</p>
                <p class="reqSettings"><b style="font-size:large"><u>HDD:</u></b> 10 GB HD space</p>
                <p class="reqSettings"><b style="font-size:large"><u>Sound:</u></b> DirectX 9.0c compatible</p>
            </div>


<div style="margin-left:10px;  border:double; border-color: white; float:left; background-image:url(a/Background.jpg); margin-bottom:5%;"">
                <div style="background-color:blue; color:white;"><b>Recommended System Requirements:</b></div>
                <p class="reqSettings"><b style="font-size:large"><u>CPU:</u></b> 2.3 GHz Intel Quad Core Processor</p>
                <p class="reqSettings"><b style="font-size:large"><u>RAM:</u></b> 3 GB RAM</p>
                <p class="reqSettings"><b style="font-size:large"><u>VGA:</u></b> NVIDIA GeForce GTX460/ATI Radeon HD 5850 (512MB minimum)</p>
                <p class="reqSettings"><b style="font-size:large"><u>DX:</u></b> 9.0c</p>
                <p class="reqSettings"><b style="font-size:large"><u>OS:</u></b> Windows XP SP3/Vista/Windows 7</p>
                <p class="reqSettings"><b style="font-size:large"><u>HDD:</u></b> 10 GB HD space</p>
                <p class="reqSettings"><b style="font-size:large"><u>Sound:</u></b> DirectX 9.0c compatible</p>
            </div>
                 <div style="clear:both"></div>
</div>
</asp:Content>

