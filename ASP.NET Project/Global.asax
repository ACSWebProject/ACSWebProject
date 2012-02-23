<%@ Application Language="C#" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        Exception CurrentException;
        CurrentException = Server.GetLastError();
        try
        {
            string LogFilePath = Server.MapPath("ErrorLog.txt");
            if (File.Exists(LogFilePath))
            {
                StreamWriter sw;
                sw = File.AppendText(LogFilePath);
                sw.WriteLine(DateTime.Now.ToString());
                sw.WriteLine(CurrentException.ToString());
                sw.Close();
            }
            else
            {
                StreamWriter sw = new StreamWriter(LogFilePath);
                sw.WriteLine(DateTime.Now.ToString());

                sw.WriteLine(CurrentException.ToString());
                sw.Close();
            }

        }
        catch (Exception ex)
        {
            // There could be a problem when writing to text file
        }
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
