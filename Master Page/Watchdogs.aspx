<%@ Page Title="Watchdogs" Language="C#" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%
    if (Session["isUserRegistered"] == null)
        Response.Redirect("LogIn.aspx");
%>
<p class="TitleHead">Watchdogs</p>
        <p class="text"><u>Day 1</u></p>

        <p class="titleText">
           <b><u>Objectives</u></b>
            <br /><br />1. Protect the cocaine until a pickup vehicle can arrive.
            <br /> 2. Move the cocaine onto the pickup vehicle.
            <br />3. Escape via ground vehicle.
            <br />4. (Alternate) Escape via helicopter. (If vehicle driver is killed.)
        </p><br /><br />

        <!-- ASSETS -->
 <p class="titleText"><b><u>Assets</u></b></p>
                       <div class="assets">
                          <img src="a/Watchdogs/1.png" />
                          <br /><p class="text">Ammo Bag</p>
                       </div>

                       <div class="assets">
                          <img src="a/Watchdogs/2.png" />
                          <br /><p class="text">Medic Bag</p>
                       </div>

                       <div class="assets">
                          <img src="a/Watchdogs/3.png" />
                          <br /><p class="text">Armored Escape</p>
                       </div>
        <!-- ASSETS END -->
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<p class="titleText"><b><u>Walkthough</u></b><br /><br />
The crew starts out inside a truck that is transporting Hector's cocaine, which has been ambushed by the police, forcing them to fight their way out. Under heavy fire, they have to move the cocaine from the truck to a nearby warehouse to wait until a secondary extraction vehicle can arrive. After holding out for several minutes, the vehicle arrives and the crew must throw the cocaine onto the vehicle.<br /><br />
At this point, Bain has arranged for a separate extraction vehicle to arrive for the crew. If they cannot get to the vehicle quickly enough, he is overrun and killed, causing Bain to call in Alex to extract the group via helicopter.  After several more minutes, Alex arrives and positions himself nearby. The group must then fight their way to the helicopter and escape. Any bags of coke still carried by the crew onto the helicopter will spawn with them on day 2, instead of at the pickup truck near the police.<br /><br />
</p>

        <p class="text"><u>Day 2</u></p> <!-- DAY 2 -->
        <p class="titleText">
           <b><u>Objectives</u></b>
            <br /><br />1. Secure the cocaine.
            <br /> 2. Turn on the search lights.
            <br />3. Protect the cocaine until the boat can arrive.
            <br />4. Move the cocaine onto the boat.
            <br />5.Escape via helicopter.
        </p><br /><br />



        <!-- ASSETS -->
 <p class="titleText"><b><u>Assets</u></b></p>
                       <div class="assets">
                          <img src="a/Watchdogs/1Day2.png" />
                          <br /><p class="text">Day 2 Overview</p>
                       </div>

                       <div class="assets">
                          <img src="a/Watchdogs/2Day2.png" />
                          <br /><p class="text">Ammo Bag</p>
                       </div>

                       <div class="assets">
                          <img src="a/Watchdogs/3Day2.png" />
                          <br /><p class="text">Medic Bag</p>
                       </div>

                       <div class="assets">
                          <img src="a/Watchdogs/4Day2.png" />
                          <br /><p class="text">Sniper</p>
                       </div>
        <!-- ASSETS END -->
<div style="clear:both"></div>

<p class="titleText"><b><u>Walkthough</u></b><br /><br />
The crew is dropped off at the docks near the now-abandoned cocaine carrying vehicle.  If they were extracted via helicopter the previous day, Alex drops them off further away from the cocaine.<br /><br />
The crew must move to secure the cocaine before the police can repossess it.  After it is secured, the crew turn on a nearby warehouse's searchlights to signal the boat, which will arrive 2 to 3 minutes later.  Once the boat arrives, the crew must start loading the cocaine on board, a few bags at a time (variable - count the barrels in the back of the boat to know how many you can load), forcing them to stay and defend the remaining cocaine if they intend to steal more than 8 bags. Once the first load of cocaine is loaded on the boat, Alex returns with his helicopter to extract the crew. They can either stay behind and try to secure the remainder of the cocaine, or escape immediately to the helicopter. Any bags of cocaine carried by the crew onto the helicopter are counted, so if fewer bags than players remain, immediate escape is advisable.<br /><br />
</p>
    </div>

</asp:Content>

