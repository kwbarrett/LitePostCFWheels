<cfoutput>
	
	posted in #linkTo(text=entry.category().category, controller="categories", action="list", key=entry.category().categoryid)# | 
	#linkTo(text='Comments', anchor='entry#entry.entryid#', key=entry.category().categoryid)# [#entry.comments().recordCount#]
	
	#errorMessagesFor("comment")#
	
	<!--- comment form --->
	#startFormTag(controller="comments", action="savecomment", key=entry.categoryid, params="fromController=#params.controller#&fromAction=#params.action#&page=#params.page#")#
		#hiddenField(objectName="comment", property="entryid" )#
		#textField(label='Name', objectName='comment', property='name')#
		#textField(label='Email', objectName='comment', property='email')#
		#textField(objectName="comment", property="url", label="URL")#
		#textArea(objectName="comment", property="comment", label="Comment")#
		#submitTag("Submit Comment")#
	#endFormTag()#
	
	<cfset comments = entry.comments(order='createdat ASC')>
	<cfdump var="#comments#">
	<cfloop query="comments">
		submitted on #DateFormat(comments.createdat, 'medium')# 
		at #TimeFormat(comments.createdat,'h:mm tt')# 
		by #entry.comments().name#
		
		<p>#comments.comment#</p>
	</cfloop>
</cfoutput>