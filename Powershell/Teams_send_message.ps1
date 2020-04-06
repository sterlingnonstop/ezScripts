<#
===============================================================
PowerShell Version: 5.1
===============================================================
#>

#By mail
#Find out the channel email address from Teams application and send your message to it
$to ="teamsChannelEmail@find.it"

#Other parameters
$parms = @{
	SmtpServer = "smtp.test.me"
	From = "your@mail.test.me"
	To = $to
	Subject = "Test Subject"
	Body = "Test Message"
	Encoding = "UTF8"
}

#Send it
Send-MailMessage @parms