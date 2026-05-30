#tag Class
Protected Class ZoneUpdater
	#tag Method, Flags = &h0
		Shared Function CheckIP() As String
		  Dim s As New URLConnection
		  
		  Dim ss As String
		  Dim nn As String
		  
		  Try
		    ss = s.SendSync("GET", "https://app.kanjo.ca/whatmyip.php", 3)
		    nn = ss.DefineEncoding(Encodings.UTF8).Trim
		    
		    If nn.Length >= 7 And nn.Length <= 15 And nn.IndexOf(".") >= 0 Then
		      Dim internalIP As Boolean = nn.Left(4) = "127." Or nn.Left(3) = "10." Or nn.Left(8) = "192.168." Or nn.Left(8) = "169.254."

		      If nn.Left(4) = "172." Then
		        Dim secondOctet As Integer = nn.NthField(".", 2).IntegerValue
		        If secondOctet >= 16 And secondOctet <= 31 Then internalIP = True
		      End If

		      If Not internalIP Then Return nn
		    End If
		  Catch error As RuntimeException
		  End Try

		  Try
		    ss = s.SendSync("GET", "https://ipv4.icanhazip.com/", 2)
		    nn = ss.DefineEncoding(Encodings.UTF8).Trim
		    Return nn
		  Catch error As RuntimeException
		    Return ""
		  End Try
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myInteface as NameCheapZoneUpdater.xSocketInterface)
		  gInterface = myInteface
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  dim url as string = "https://dynamicdns.park-your-domain.com/update?host="+zone+"&domain="+YourDomain+"&password="+Password+"&ip="+ip
		  
		  gSocking = new NameCheapZoneUpdater.gSocket(gInterface)
		  
		  gSocking.RequestHeader("User-Agent") = "Chrome/41.0 "
		  'gSocking.RequestHeader("Authorization") =  "Basic " + EncodeBase64(UserName+":"+Password)
		  //sock.RequestHeader("Content-Length", "8")
		  
		  'AddHandler gSocking.ContentReceived, AddressOf gSocking.Handle_ContentReceived
		  
		  gSocking.Send("GET", url)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gInterface As NameCheapZoneUpdater.xSocketInterface
	#tag EndProperty

	#tag Property, Flags = &h0
		gSocking As NameCheapZoneUpdater.gSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		ip As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UserName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		YourDomain As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Zone As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ip"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YourDomain"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Zone"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
