#tag Class
Protected Class gSocket
Inherits URLConnection
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  Try
		    
		    gSocketInterface.xPageReceived(URL, HTTPStatus, Content)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(e As RuntimeException)
		  Try
		    gSocketInterface.xErrorMessage(e.Message)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		  'MsgBox err.Message + err.Reason
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(URL As String, HTTPStatus As Integer)
		  Try
		    
		    gSocketInterface.xHeadersReceived(URL, HTTPStatus)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(pInterface as xSocketInterface)
		  // Calling the overridden superclass constructor.
		  gSocketInterface = pInterface
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gSocketInterface As NameCheapZoneUpdater.xSocketInterface
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="FollowRedirects"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowCertificateValidation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPStatusCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
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
	#tag EndViewBehavior
End Class
#tag EndClass
