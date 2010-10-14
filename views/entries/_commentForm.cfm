<!--- 
	title: commentForm.cfm
	author: Ken Barrett
	purpose: I display the comment form.  An EntryID is required.
 --->
 
<cfoutput>
	<h2>Leave a comment</h2>
	
	<cfif flashKeyExists("error")>
		#flash("error")#
	</cfif>
	<cfif flashKeyExists("success")>
		#flash("success")#
	</cfif>
	
	<!--- comment form --->
	#startFormTag(controller="comments", action="create")#
		<p>
		#hiddenField(objectName="comment", property="entryid" )#
		#textField(label='* Name', objectName='comment', property='name')#
		#textField(label='Email', objectName='comment', property='email')#
		#textField(objectName="comment", property="url", label="URL")#
		#textArea(objectName="comment", property="comment", label="* Comment")#
		<br/>
		#submitTag(value="Submit Comment", class="button")#
		</p>
	#endFormTag()#
</cfoutput>