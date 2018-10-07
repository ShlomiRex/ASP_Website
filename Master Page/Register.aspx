<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ import Namespace ="System.Data.SqlClient" %>
<%@ import Namespace ="System.Data" %>

<script runat="server" enablepagemethods="true">
    DataSet ds = new DataSet();
    string write = "";
    
    void Page_Load()
    {
        if (Request.Form["userNameReg"] != null && Request.Form["passWordReg"] != null && Request.Form["birthYearReg"] != null && Request.Form["emailReg"] != null && Request.Form["phoneReg"] != null)
        {
            string userChecker = "SELECT * FROM Users WHERE userName='" + Request.Form["userNameReg"] + "'";

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = userChecker;
            cmd.Connection = conn;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            conn.Open();
            da.Fill(ds);
            conn.Close();

            if (Request.Form["userNameReg"] != null && ds.Tables[0].Rows.Count > 0)
            {
                write += "<h2 style='color: white;'>*This username is already in use.<br /></h3>";
                return;
            }
            if (Request.Form["userNameReg"] != null)
            {
                string sqlString = "INSERT INTO Users VALUES ('" + Request.Form["userNameReg"] + "','" + Request.Form["passWordReg"] + "','" + Request.Form["birthYearReg"] + "','" + '0' + "','" + Request.Form["gender"] + "', '" + Request.Form["firstNameReg"] + "' , '" + Request.Form["lastNameReg"] + "','" + Request.Form["adressReg"] + "','" + Request.Form["emailReg"] + "','" + Request.Form["phoneReg"] + "')";
                conn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;";
                cmd.CommandText = sqlString;
                cmd.Connection = conn;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                write = null;
                Response.Redirect("LogIn.aspx");
            }
        }//if 
        }//function Page_Load()
</script> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript" type="text/javascript">



    function formCheck()
    {
        
        if (document.getElementById("usernameID").value == "" || document.getElementById("passwordID").value == "" || document.getElementById("birthID").value == "" || document.getElementById("emailID").value == "" || document.getElementById("phoneID").value == "") {
            alert("Please make sure you typed all information.");
            return false;
        }

        if (checkUsernameAndPassword() == false || birthYearCheck() == false || emailCheck() == false || phoneCheck() == false) 
            return false;

        return true;
    }//formCheck













    function checkUsernameAndPassword()
    {
        // maximum password and username length: 12.
        var username = document.getElementById("usernameID").value;
        var password = document.getElementById("passwordID").value;

        if (username.indexOf(' ') != -1 || password.indexOf(' ') != -1)
        {
        alert("You aren't allowed to have space in username and password.");
        return false;
        }
        return true;
    }//checkUsernameAndPassword












/*
    function birthYearCheck() {
        if (isNaN(document.getElementById("birthID").value)) {
            alert("Birthday must be a number.");
            return false;
        }

        if (document.getElementById("birthID").value != null && (document.getElementById("birthID").value > 2013 || document.getElementById("birthID").value < 1900)) {
            alert("Invalid birth year! It must be between 1900 - 2013 !");
            return false;
        }
        return true;
    }// birthyearCheck
*/











    function phoneCheck()
    {
        var allowedChars = "0123456789";
        var phone = document.getElementById("phoneID").value;
        var character;
        if (phone.indexOf('0') != 0) {
            alert("Phone number must contain 0 at the start.");
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

        for (var i = 0; i < phone.length; i++)
        {
            character = phone.charAt(i);
            if (allowedChars.indexOf(character) == -1)
            {
                alert("Your phone number must contain numbers only, without '-'.");
                return false;
            }
        }

        return true;
    }//phoneCheck














    function emailCheck()
    {
        //vgtvgy1@gmail.com   walla gmail yahoo mail
        // max email: 1234567890@12345.1234
        var emailString = document.getElementById("emailID").value;
        var moneShtrudel = 0;
        var mone = 0;
        var mone2 = 0;
        //בדיקת אורך אימייל
        if (emailString.length > 21) {
            alert("Your email is not valid.");
            return false;
        }


        ///////////////////////////////////////////////////////////////////////////
        for (var i = 0; i < emailString.length; i++)
        {
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

        for (var i = emailString.indexOf('@'); i < emailString.lastIndexOf('.'); i++) {
            mone++;
        }

        if (mone < 2) {
            alert("Dot is not in the correct place.(at least 3 digits after @)");
            return false;
        }

        if (emailString.charAt(0) == '.' || emailString.charAt(emailString.length - 1) == '.')
        {
            alert("Dot cannot be in first place or last place.");
            return false;
        }

        if (emailString.indexOf('@') < 3 || emailString.indexOf('@') > 7) {
            alert("@ is not in the correct place.");
            return false;
        }

        for (var i = emailString.indexOf('.'); i <= emailString.length; i++) {
            mone2++;
        }

        if (mone2 <= 3) {
            alert("After dot you must have atleast 2 characters.");
            return false;
        }
        return true;
    }//emailCheck
</script>

<p class="TitleHead">Registeration</p><br /><br />
<%=write %>
 <form method="post" onsubmit ="return formCheck()">
     <table>
  <tr><td><span class="RegisterText">Username:</span></td> <td><input type="text" name="userNameReg" id="usernameID" maxlength="12"/></td></tr>
  <tr><td><span class="RegisterText">Password:</span></td> <td><input type="password" name="passWordReg" id="passwordID" maxlength="12"/></td></tr>
  <tr><td><span class="RegisterText">Birth Year:</span></td><td><select name="birthYearReg" id="birthID"><% for (int i = 1900; i < 2015; i++)Response.Write("<option>"+i+"</option>");%></select></td></tr>
  <tr><td><span class="RegisterText">Email:</span></td> <td><input type="text" name="emailReg" id="emailID" maxlength="21"/></td></tr>
  <tr><td><span class="RegisterText">Phone:</span></td> <td><input type="text" name="phoneReg" id="phoneID" maxlength="10"/></td></tr>
  <tr><td><span class="RegisterText">Gender:</span> </td> <td><span class="RegisterTextGener">Male</span></><input type="radio" name="gener" value="1" checked="checked" /></td> <td><span class="RegisterTextGener">Female</span> <input type="radio" name="gener" value="0" /></td></tr> 
  <tr><td><span class="RegisterText">*Firstname:</span></td> <td><input type="text" name="firstNameReg" maxlength="12"/></td></tr> 
  <tr><td><span class="RegisterText">*Lastname:</span></td> <td><input type="text" name="lastNameReg" maxlength="12"/></td></tr> 
  <tr><td><span class="RegisterText">*Adress:</span></td> <td><input type="text" name="adressReg" maxlength="12"/></td></tr> 
  <tr><td><input type='submit' name='submit' value='Submit and Register'/></td></tr>
  <tr><td><span style="color: white;">* - You can leave it empty.</span></td></tr>
    </table>
 </form> 
</asp:Content>