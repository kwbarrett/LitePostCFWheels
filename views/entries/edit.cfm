<!--- 
	title: edit.cfm
	author: Kenneth Barrett
	purpose: I display the edit entry form
 --->

<cfparam name="entry" default=""/>
<cfoutput>
	<h1>Edit Entry</h1>
	#errorMessagesFor("entry")#
	
	<cfif flashKeyExists("error")>
		#flash("error")#
	</cfif>
	
	#startFormTag(action="update", key="#params.key#")#
	<p>
		#hiddenField(objectName="entry", property="entryID")#
		#textField(objectName="entry", label="Title", property="title")#
		#textArea(objectName="entry", label="Entry", property="body", rows="5", cols="50")#
		#select(objectName="entry", label="Category", property="categoryID", options=categories, valueField="categoryID", textField="category", includeBlank="--Select category--")#
		<br/>
		<br/>
		#submitTag(value="Submit Changes", class="button")#
	</p>
	#endFormTag()#
</cfoutput>