#tag Class
Protected Class ZoneUpdater
	#tag Method, Flags = &h0
		Shared Function CheckIP() As String
		  Dim s As New HTTPSecureSocket
		  
		  Dim ss As String = s.Get("https://app.kanjo.ca/whatmyip.php", 3)
		  
		  if ss.DefineEncoding(Encodings.UTF8).Length<7 or ss.DefineEncoding(Encodings.UTF8).Length>16 then
		    ss = s.get("https://ipv4.icanhazip.com/", 2)
		    Dim nn As String = ss.DefineEncoding(Encodings.UTF8)
		    Return nn.Left(nn.Length-1)
		  else
		    Dim nn As String = ss.DefineEncoding(Encodings.UTF8)
		    Return nn.Left(nn.Length)
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myInteface as NameCheapZoneUpdater.xSocketInterface)
		  gInterface = myInteface
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  'dim url as String = "https://domains.google.com/nic/update?hostname="+zone+"."+YourDomain+"&myip="+ip
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
