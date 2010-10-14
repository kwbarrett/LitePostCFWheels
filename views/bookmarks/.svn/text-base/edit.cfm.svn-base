<!--- 
	title:edit.cfm
	author: Ken Barrett
	purpose: I display the edit link form
 --->

<cfparam name="bookmark" default=""/>

<cfoutput>
	<h1>Edit link</h1>
	#startFormTag(action="update", key=params.key)#
	#hiddenField(objectName="bookmark", property="bookmarkid")#
	<p>
		#textField(label="name", objectName="bookmark", property="name")#
		#textField(label="url", objectName="bookmark", property="url")#
		<br/>
		<br/>
		#submitTag("Update link")#
	</p>
	#endFormTag()#
</cfoutput>