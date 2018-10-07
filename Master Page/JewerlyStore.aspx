<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Jewerly Store" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%
    if (Session["isUserRegistered"] == null)
        Response.Redirect("LogIn.aspx");
%>
<p class="TitleHead">Jewerly Store</p><br />
      <p class="text"><u>Day 1</u></p>
        <p class="titleText">
           <b><u>Objectives</u></b>
            <br /><br /> 1. Steal 3 bags of Jewelry. (6 bags on Hard, 8 bags on Very Hard/Overkill)
            <br /> 2. Escape.
        </p><br />


    <p class="titleText"><b><u>Assets</u></b></p>
        <div><!-- ASSETS -->
                       <div class="assets">
                          <img src="a/Jewerly Store/1.png" alt="Expert Driver"/>
                          <br /><p class="text">Expert Driver</p>
                       </div>
        </div><!-- ASSETS END -->
<div style="clear:both"></div>

    <p class="titleText"><b><u>Walkthough</u></b><br /><br />
A straightforward heist, the crew needs to steal the required number of bags from the store, which are obtained by smashing the larger display cases in the storefront area. The crew can opt to steal the jewelry in the smaller display cases in the storefront and back offices for extra cash. There may or may not be a safe to crack for an even larger payday.<br /><br />
The crew can choose between going in stealthy taking out the guards quietly, suppressing the civilians, and grabbing as much loot as possible before the alarm gets raised or guns blazing.<br /><br />
If choosing to be stealthy, it is recommended to have 2 players watching the streets and making sure the civilians do not call the police, as well as eliminating any possible threats. Silenced pistols are recommended to take out civilians that are out of reach. The other 2 players should walk into the store and shout at the civilians. If there is a guard in the store, he should be killed using melee or a silenced gun to avoid alerting any other guards. Remember to answer his pager. The crew should then bag all the jewelry from the front of the store while also keeping the civilians under control. The loot should then be transferred to the escape car. If so desired, the players can move into and loot the back offices, but keep in mind any guards in the back alley that may spot players through the windows.<br /><br />
If the alarm is raised, Twitch the getaway driver will be forced to retreat and come around again due to police presence. The crew will then be forced to defend themselves for several minutes until Twitch can return unnoticed. Once the crew has stolen the required number of jewelry bags, they can either remain behind and steal extra loot or escape.<br /><br />
    </p>
    <!-- MISSION: JEWERLY STORE END -->
</asp:Content>

