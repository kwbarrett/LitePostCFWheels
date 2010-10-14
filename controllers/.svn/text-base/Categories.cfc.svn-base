<cfcomponent extends="Controller" output="false">
	<cffunction name="index">
		<cfset categories = model("category").findAll(order="category")/>
		<cfif categories.recordCount EQ 0>
			<cfset flashInsert(error="No category records found.")/>
		</cfif>
	</cffunction>
	
	<cffunction name="new">
		<cfset category = model("category").new()>
	</cffunction>
	
	<cffunction name="create">
		<cfset category = model("category").new(params.category)>
		
		<cfif category.save()>
			<cfset flashInsert(success="Category added successfully")>
			<cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="Category was not added. #errorMessagesFor('category')#")>
			<cfset category = model("category").new()/>
			<cfset renderPage(action="new")/>
		</cfif>
	</cffunction>
	
	<cffunction name="edit">
		<cfset category = model("category").findByKey(key=params.key)/>
	</cffunction>
	
	<cffunction name="update">
		<cfset category = model("category").findByKey(params.key)>
		
		<cfif category.save()>
			<cfset flashInsert(success="Category was updated")>
			<cfset renderPage(action="index")>
		<cfelse>
			<cfset flashInsert(error="Category was not updated. #errorMessagesFor('category')#")>
			<cfset category = model("category").findByKey(params.key)>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<cfset category = model("category").findByKey(params.key)>
		
		<cfif category.delete()>
			<cfset flashInsert(success="Category was deleted.")>
			<cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="Category was not deleted. #errorMessagesFor('category')#")>
			<cfset category = model("category").findAll()>
			<cfset renderPage(action="index")>
		</cfif>
	</cffunction>
</cfcomponent>