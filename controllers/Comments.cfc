<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="checklogin", except="create, save")>
	</cffunction>
	
	<cffunction name="create">
		<cfset comment = model("comment").new(params.comment)>
		
		<cfset comment.save()/>
		<cfif NOT comment.hasErrors()>
			<cfset flashInsert(success="Comment added.")>
			<cfset redirectTo(controller="entries", action="view", key=comment.entryid)>
		<cfelse>
			<cfset error = errorMessagesFor("comment")/>
			<cfset flashInsert(error="There was a problem with your comment.  #error#")>
			<cfset redirectTo(controller="entries", action="view", key=params.comment.entryid)>
		</cfif>

	</cffunction>

</cfcomponent>