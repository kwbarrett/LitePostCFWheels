<!--- 
	title: edit.cfm
	author: Kenneth Barrett
	purpose: I display the edit entry form
 --->

<cfparam name="entry" default=""/>
<cfparam name="categories"  default=""/>

<cfoutput>
	<h1>New Entry</h1>
	#errorMessagesFor("entry")#
	
	<cfif flashKeyExists("error")>
		#flash("error")#
	</cfif>
	
	#startFormTag(action="create")#
	<p>
	#textField(objectName="entry", label="Title", property="title", size="60")#
	#textArea(objectName="entry", label="Entry", property="body", rows="5", cols="50")#
	#select(objectName="entry", label="Category", property="categoryID", options=categories, valueField="categoryID", textField="category", includeBlank="--Select category--")#
	<br/><br/>
	#submitTag(value="Publish", class="button")#
	</p>
	#endFormTag()#
</cfoutput>