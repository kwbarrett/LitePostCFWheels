<!--- 
	title: new.cfm
	author: Ken Barrett
	purpose: I display the add bookmark form
 --->

<cfparam name="bookmark" default=""/>

<cfoutput>
	<h1>Add new link</h1>
	#startFormTag(action="create")#
	<p>
		#textField(label="name", objectName="bookmark", property="name")#
		#textField(label="url", objectName="bookmark", property="url")#
		<br/>
		<br/>
		#submitTag("Add link")#
	</p>
	#endFormTag()#
</cfoutput>