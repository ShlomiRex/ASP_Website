<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Big Oil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%
    if (Session["isUserRegistered"] == null)
        Response.Redirect("LogIn.aspx");
%>
<p class="TitleHead">Big Oil</p>
                <p class="text"><u>Day 1</u></p><br />
                    <p class="titleText">
                       <b><u>Objectives</u></b>
                        <br /><br /> 1. Locate the safe
                        <br /> 2. Drill open and find the documents
                        <br /> 3. Escape<br /><br />
The group start outside of the headquarters of the Overkill gang, a group of bikers that have access to information on the location of the scientist's villa.
The group must enter the premises and eliminate the gang members, the group can attempt to silently approach the buildings or assault them. Care must be taken to avoid stepping on any hidden mines littered around the house.
                        </p>


              <p class="titleText"><b><u>Assets</u></b></p>
                  <div> <!-- Assets Divs -->
                      <div class="assets">
                          <img src="a/Big Oil/1Day1.png" alt="Day 1 Overview" />
                          <br /><p class="text">Day 1 Overview</p>
                      </div>

                       <div class="assets">
                          <img src="a/Big Oil/2Day1.png" alt="Insider Information" />
                          <br /><p class="text">Insider Information</p>
                       </div>
                   </div><!-- Assets Divs END -->
                <div style="clear:both"></div>

              <p class="titleText"><b><u>Optional Objectives</u></b><br /><br />
                1. Locate additional intel<br />
                2. Locate additional loot<br /><br />
During the first day of this heist, the bikers are holding onto 3 separate optional assets to assist on Day 2. These assets are located on three tables in the house: the side room connected to the garage via the stairs on the first floor, the second floor landing is right next to a table, and the final piece is located on the balcony. As soon as the bikers are alerted, bikers located near the tables will move toward the table and begin to light the asset on fire. Once the biker starts the animation, you have about 1 second to shoot the biker and prevent the immolation of the asset. On a stealth assault, one could take out all the bikers and collect the intel without losing any. Going loud, a team can assign target zones to each member to take out and control to find the intel.<br /><br />
The often missed point on Day 1 is the massive amount of loot often hidden in the house. This is often where the majority of the mission payout is located. First, to the right of the garage, by the stairs going up into the front room, there is a locked door that can be picked or shot open. Inside of this room, there are a large number of ATMs. One team member should bring a saw in case a high payout is desired. A ghost can pop two of them with the appropriate skills applied to an ECM, though this leaves a large number unopened. <br /><br />
Additionally, the front room  of the house often contains weapons containers and cocaine. These can be collected and returned to your escape van for additional loot bag income though can cause some hinderance on an escape. Additional weapon cases can also appear in the room with ATM's and in the shed at the compound.<br /><br />
              </p>
                <!-- END DAY 1 -->
                <!-- START DAY 2 -->

                <p class="text" style="font-size:25px;"><u>Day 2</u></p><br />
                <p class="titleText">
                 <b><u>Objectives</u></b><br /><br />
                    1. Enter security room and hack controls.<br />
                    2. Gain access to the laboratory<br />
                    3. Signal the helicopter<br />
                    4. Take the correct fusion reactor to the helicopter.<br />
                    5. (If wrong reactor) Wait for helicopter to return and send another reactor.<br />
                    6. (If correct reactor) Escape.<br /><br />

This day is noteworthy for being near-impossible if the group cannot figure out the correct fusion reactor.<br /><br />
The crew starts outside on a hilltop. They must gain access to the laboratory within the mansion, to do so you must enter one of several security rooms and hack the system within. The group can attempt to sneak in or attempt an assault.<br /><br />
It is highly reccommended that the group make every effort to stealth their way into the mansion and into the lab, while also dispatching as many guards as possible. There are six guards in the building, however most of the time one or two of the guards will remain in a fixed location.<br /><br />
Once the system has been hacked, the crew have access to a lab that contains a dozen fusion reactor prototypes, and the crew must find out the correct reactor to deliver. At the same time, the crew can signal a helicopter with a flare for extraction.<br /><br />
Once the helicopter has been signalled, the crew must move their reactor of choice to the extraction point. The reactor is extremely heavy, and slows the carrier down to a crawl, meaning that he needs to be escorted. Because of this, it is highly recommended that an Enforcer with defensive skills moves the reactor. Once the reactor is on board, it will be airlifted away and taken to Bain, who will verify if it is the correct reactor they need. <br /><br />
Note that once the helicopter arrives the houses defence system will automaticly detect the helicopter and sound the alarm, there is no way to prevent this.<br /><br />
After several minutes, Bain will inform the crew about the reactor he received. If it is the wrong one, then the crew must extract another reactor, which takes several minutes each time. If the reactor is the correct one, then the crew can escape.<br /><br />
                </p>


              <p class="titleText"><b><u>Assets</u></b></p>

                  <div> <!-- Assets Divs -->
                      <div class="assets">
                          <img src="a/Big Oil/1.jpg" alt="Day 2 Overview" />
                          <br /><p class="text">Day 2 Overview</p>
                      </div>

                       <div class="assets">
                          <img src="a/Big Oil/2.jpg" alt="Day 2 Map" />
                          <br /><p class="text">Day 2 Map</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/3.jpg" alt="Day 2 Blueprint" />
                          <br /><p class="text">Day 2 Blueprint</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/4.jpg" alt="Alex ammo drop"/>
                          <br /><p class="text">Alex ammo drop</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/5.jpg" alt="Extra helicopter fuel"/>
                          <br /><p class="text">Extra helicopter fuel</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/6.jpg" alt="Camera Feed"/>
                          <br /><p class="text">Camera Feed</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/7.jpg" alt="Blueprints"/>
                          <br /><p class="text">Blueprints</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/8.jpg" alt="Codes for Shutters"/>
                          <br /><p class="text">Codes for Shutters</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/9.jpg" alt="Scientist"/>
                          <br /><p class="text">Scientist</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/10.jpg" alt="Cold Fusion Research"/>
                          <br /><p class="text">Cold Fusion Research</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/11.jpg" alt="Guard Intel"/>
                          <br /><p class="text">Guard Intel</p>
                       </div>

                       <div class="assets">
                          <img src="a/Big Oil/12.jpg" alt="Airplane Keys" />
                          <br /><p class="text">Airplane Keys</p>
                       </div>
                      
                       <div class="assets">
                          <img src="a/Big Oil/13.jpg" alt="GenSec Keycard"/>
                          <br /><p class="text">GenSec Keycard</p>
                       </div>        

                   </div><!-- Assets Divs END -->   
<div style="clear:both"></div>
                <!-- END DAY 2 -->
    <!-- END MISSION BIG OIL -->
</asp:Content>

