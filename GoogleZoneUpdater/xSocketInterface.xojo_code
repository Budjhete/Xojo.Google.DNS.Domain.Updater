#tag Interface
Protected Interface xSocketInterface
	#tag Method, Flags = &h0
		Sub xErrorMessage(error as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xHeadersReceived(URL as Text, HTTPStatus as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xPageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Interface
#tag EndInterface
