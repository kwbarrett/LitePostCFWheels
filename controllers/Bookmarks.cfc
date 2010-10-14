<cfcomponent extends="Controller" output="false">
	<cffunction name="index">
		<cfset bookmarks = model("bookmark").findAll(order="name")>
		<cfif bookmarks.recordcount EQ 0>
			<cfset flashInsert(error="No records found.")>
		</cfif>
	</cffunction>
	
	<cffunction name="new">
		<cfset bookmark = model("bookmark").new()/>
	</cffunction>
	
	<cffunction name="create">
		<cfset bookmark = model("bookmark").new(params.bookmark)/>
		<cfif bookmark.save()>
			<cfset flashInsert(success="Link was added successfully")/>
			<cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="Unable to add link.  #errorMessagesFor('bookmark')#")>
			<cfset bookmark = model("bookmark").new()/>
			<cfset render(action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="edit">
		<cfset bookmark = model("bookmark").findByKey(params.key)>
		
		<cfif NOT IsObject(bookmark)>
			<cfset flashInsert(error="The bookmark was not found.")>
			<cfset renderPage(action="view", key=params.key)>
		</cfif>
	</cffunction>
	
	<cffunction name="update">
		<cfset bookmark = model("bookmark").findByKey(key=params.key)>
		<cfif bookmark.update(params.bookmark)>
			<cfset flashInsert(success="Your link has been updated successfully.")>
			<cfset redirectTo(action="index", key=params.key)>
		<cfelse>
			<cfset flashInsert(error="There was a problem with your link. #errorMessagesFor('bookmark')#")>
			<cfset redirectTo(action="edit", key=params.key)/>
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<cfset bookmark = model("bookmark").findByKey(params.key)/>
		<!--- Verify that the company deletes successfully --->
		<cfif bookmark.delete()>
			<cfset flashInsert(success="The linkmark was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the link. #errorMessagesFor('bookmark')#")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
</cfcomponent>