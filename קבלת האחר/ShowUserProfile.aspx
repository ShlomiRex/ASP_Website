<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>

<script runat="server">
    DataSet ds = new DataSet();

    string passWord = "";
    int birthYear;
    string email = "";
    string phone = "";
    int gender;
    string firstName = "";
    string lastName = "";
    string adress = "";
    string alert = "";
    
    void Page_Load()
    {
        if (Session["isUserRegistered"] == null || (bool)Session["isUserRegistered"] == false) 
            Response.Redirect("LogIn.aspx");
        
        string userName = Session["name1"].ToString();

        if (Request.Form["passWordReg"] != null && Request.Form["gender"] == null)
        {
            string sqlString2 = "UPDATE Users SET passWord='"+Request.Form["passWordReg"]+"', birthYear="+Request.Form["birthYearReg"]+", email='"+Request.Form["emailReg"]+"', phone='"+Request.Form["phoneReg"]+"', firstName='"+Request.Form["firstNameReg"]+"', lastName='"+Request.Form["lastNameReg"]+"', adress='"+Request.Form["adressReg"]+"' WHERE userName='"+userName+"'";

            SqlConnection conn2 = new SqlConnection();
            conn2.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = sqlString2;
            cmd2.Connection = conn2;

            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();
        }
        else if (Request.Form["passWordReg"] != null)
        {
            string sqlString2 = "UPDATE Users SET passWord='" + Request.Form["passWordReg"] + "', birthYear=" + Request.Form["birthYearReg"] + ", email='" + Request.Form["emailReg"] + "', phone='" + Request.Form["phoneReg"] + "', gender=" + Request.Form["gender"] + ", firstName='" + Request.Form["firstNameReg"] + "', lastName='" + Request.Form["lastNameReg"] + "', adress='" + Request.Form["adressReg"] + "' WHERE userName='" + userName + "'";

            SqlConnection conn2 = new SqlConnection();
            conn2.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = sqlString2;
            cmd2.Connection = conn2;

            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();
        }
        
        string sqlString = "SELECT * FROM Users WHERE userName='"+userName+"'";

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

        passWord = ds.Tables[0].Rows[0]["passWord"].ToString();
        birthYear = (int)ds.Tables[0].Rows[0]["birthYear"];
        email = ds.Tables[0].Rows[0]["email"].ToString();
        phone = ds.Tables[0].Rows[0]["phone"].ToString();
        gender = (int)ds.Tables[0].Rows[0]["gender"];
        firstName = ds.Tables[0].Rows[0]["firstName"].ToString();
        lastName = ds.Tables[0].Rows[0]["lastName"].ToString();
        adress = ds.Tables[0].Rows[0]["adress"].ToString();
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="TitleHead"><%=Session["name1"] %>'s Profile</p><br />
    <span style='color: white; font-size: 25px;'>
        This is your profile information. You can change your information by simply clicking update.<br />
        <%=alert %>
    </span>

 <form method="post" onsubmit="return formCheck()">
     <table>
  <tr><td><span class="RegisterText">Password:</span></td> <td><input type="password" name="passWordReg" id="passwordID" maxlength="12" value="<%=passWord %>"/></td></tr>
  <tr><td><span class="RegisterText">Confirm password:</span></td> <td><input type="password" name="passWordReg2" id="password2ID" maxlength="12" value="<%=passWord %>"/></td></tr>
  <tr><td><span class="RegisterText">Birth Year:</span></td><td><select name="birthYearReg" id="birthID"><% for (int i = 1900; i < 2015; i++)Response.Write("<option>"+i+"</option>");%> <option selected="selected" value="<%=birthYear %>">My Birthyear Is <%=birthYear %></option></select></td></tr>
  <tr><td><span class="RegisterText">Email:</span></td> <td><input type="text" name="emailReg" id="emailID" maxlength="21" value="<%=email %>"/></td></tr>
  <tr><td><span class="RegisterText">Phone:</span></td> <td><input type="text" name="phoneReg" id="phoneID" maxlength="10" value="<%=phone %>"/></td></tr>
  <tr>
      <td><span class="RegisterText">Gender:</span> </td>
      <%
          if (gender == 1)
          {
              Response.Write("<td><span class='RegisterText'>Male</span><input type='radio' name='gender' value='1' checked='checked' /></td>");
              Response.Write("<td><span class='RegisterText'>Female</span><input type='radio' name='gender' value='0' /></td>");
          }
          else if(gender == 0)
          {
              Response.Write("<td><span class='RegisterText'>Male</span><input type='radio' name='gender' value='1' /></td>");
              Response.Write("<td><span class='RegisterText'>Female</span><input type='radio' name='gender' value='0' checked='checked' /></td>");
          }
      %>
  </tr> 
  <tr><td><span class="RegisterText">*Firstname:</span></td> <td><input type="text" name="firstNameReg" maxlength="12" value="<%=firstName %>"/></td></tr> 
  <tr><td><span class="RegisterText">*Lastname:</span></td> <td><input type="text" name="lastNameReg" maxlength="12" value="<%=lastName %>"/></td></tr> 
  <tr><td><span class="RegisterText">*Adress:</span></td> <td><input type="text" name="adressReg" maxlength="12" value="<%=adress %>"/></td></tr> 
  <tr><td><input type='submit' name='submit' value='Update'/></td></tr>
  <tr><td><span style="color: white;">* - You can leave it empty.</span></td></tr>
    </table>
 </form>

<script language="javascript" type="text/javascript">
    function formCheck() {
        if (document.getElementById("passwordID").value == "" || document.getElementById("password2ID").value == "" || document.getElementById("birthID").value == "" || document.getElementById("emailID").value == "" || document.getElementById("phoneID").value == "") {
            alert("Please make sure you typed all information.");
            return false;
        }
        
        if (checkPassword() == false || emailCheck() == false || phoneCheck() == false) {
            return false;
        }
        return true;
    }//formCheck

    function checkPassword() {
        var password = document.getElementById("passwordID").value;
        
        if (password.indexOf(' ') != -1) {
            alert("You aren't allowed to have space in username and password.");
            return false;
        }

        if (document.getElementById("passwordID").value != document.getElementById("password2ID").value) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }//checkUsernameAndPassword

    function phoneCheck() {
        var mone34 = 0;
        if (document.getElementById("phoneID").value.indexOf('0') != 0)
        {
            alert("Phone number must contain 0 at the start.");
            return false;
        }
        if (isNaN(document.getElementById("phoneID").value))
        {
            alert("Your phone number is not a number.")
            return false;
        }
        if (document.getElementById("phoneID").value.length != 10)
        {
            alert("Your phone number doesn't contains 10 digits.");
            return false;
        }

        if (document.getElementById("phoneID").value.indexOf(' ') != -1)
        {
            alert("Phone number contain space.");
            return false;
        }

        for (var i = 0; i < document.getElementById("phoneID").value.length - 1; i++)
        {
            if (document.getElementById("phoneID").value.charAt(i) == '3' && document.getElementById("phoneID").value.charAt(i + 1) == '4')
                mone34++;
        }

        if (mone34 > 2)
        {
            alert("You canno't have '34' in the phone more than 2 times.");
            return false;
        }

        return true;

        return true;
    }//phoneCheck

    function emailCheck() {
        //vgtvgy1@gmail.com   walla gmail yahoo mail
        // max email: 1234567890@12345.1234
        var emailString = document.getElementById("emailID").value;
        var moneShtrudel = 0;
        var mone = 0;
        var mone2 = 0;
        //בדיקת אורך אימייל
        if (emailString.length > 21)
        {
            alert("Your email is not valid.");
            return false;
        }


        ///////////////////////////////////////////////////////////////////////////
        for (var i = 0; i < emailString.length; i++) {
            if (emailString.charAt(i) == '@') {
                moneShtrudel++;
            }
            if (emailString.charAt(i) == ' ') {
                alert("You have space in your email. Invalid.");
                return false;
            }
        }

        if (moneShtrudel != 1) {
            alert("Incorrect form of email.(Emails has only 1 @)");
            return false;
        }
        //////////////////////////////////////////////////////////////////////////////

        for (var i = emailString.indexOf('@') ; i < emailString.lastIndexOf('.') ; i++) {
            mone++;
        }

        if (mone < 2) {
            alert("Dot is not in the correct place.(at least 3 digits after @)");
            return false;
        }

        if (emailString.indexOf('@') < 3 || emailString.indexOf('@') > 7) {
            alert("@ is not in the correct place.");
            return false;
        }

        for (var i = emailString.indexOf('.') ; i <= emailString.length; i++) {
            mone2++;
        }

        if (mone2 <= 3) {
            alert("After dot you must have atleast 2 characters.");
            return false;
        }
        return true;
    }//emailCheck
</script>

</asp:Content>

