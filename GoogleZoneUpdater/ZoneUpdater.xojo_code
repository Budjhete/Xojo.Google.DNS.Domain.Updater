#tag Class
Protected Class ZoneUpdater
	#tag Method, Flags = &h0
		Function CheckIP() As text
		  dim s as new HTTPSecureSocket
		  
		  dim ss as string = s.get("https://domains.google.com/checkip", 10)
		  
		  
		  Return ss.DefineEncoding(Encodings.UTF8).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myInteface as GoogleZoneUpdater.xSocketInterface)
		  gSocking = new GoogleZoneUpdater.gSocket(myInteface)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  dim url as text = "https://domains.google.com/nic/update?hostname="+zone+"."+YourDomain+"&myip="+ip
		  
		  gSocking.RequestHeader("User-Agent") = "Chrome/41.0 "+YourGmail
		  gSocking.RequestHeader("Authorization") =  "Basic " + EncodeBase64(UserName+":"+Password).ToText
		  //sock.RequestHeader("Content-Length", "8")
		  
		  gSocking.Send("GET", url)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gSocking As GoogleZoneUpdater.gSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		ip As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		UserName As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		YourDomain As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		YourGmail As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Zone As Text
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
			Type="Text"
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
			Type="Text"
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
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YourDomain"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YourGmail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Zone"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
