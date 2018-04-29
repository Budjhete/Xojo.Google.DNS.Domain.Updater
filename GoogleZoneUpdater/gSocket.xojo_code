#tag Class
Protected Class gSocket
Inherits Xojo.Net.HTTPSocket
	#tag Event
		Sub Error(err as RuntimeException)
		  Try
		    gSocketInterface.xErrorMessage(err.Message)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		  'MsgBox err.Message + err.Reason
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(URL as Text, HTTPStatus as Integer)
		  Try
		    
		    gSocketInterface.xHeadersReceived(URL, HTTPStatus)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  Try
		    
		    gSocketInterface.xPageReceived(URL, HTTPStatus, Content)
		    
		  Catch re As RuntimeException
		    
		    System.DebugLog re.Message
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(pInterface as xSocketInterface)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  gSocketInterface = pInterface
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gSocketInterface As GoogleZoneUpdater.xSocketInterface
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
