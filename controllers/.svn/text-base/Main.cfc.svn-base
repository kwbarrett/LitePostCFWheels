<cfcomponent extends="Controller" output="false">
	<cffunction name="home">
		<!--- <cfparam name="page.title"  default=""/> --->
		<cfparam name="params.page"  default="1"/>
		<cfparam name="addLink" default=""/>
		<!--- Get 5 latest blog entries --->
		<cfset entries = model('entry').findAll(order='createdAt DESC', include='user, category', page=params.page, perPage=5)/>
		
		<!--- Create a new Comment object --->
		<cfset comment = model("comment").new() />
		
		<!--- Render view --->
		<cfset renderPage(controller='entries', action='list')/>		
	</cffunction>
	
	<cffunction name="login">
		<cfset user = model("user").new()/>
	</cffunction>
	
	<cffunction name="signin">
		<cfset user = model("user").findOne(where="username='#params.user.username#' AND password='#params.user.password#'")/>
		
		<cfif IsObject(user)>
			<cfset session.user = user.userID/>
			<cfset session.role = user.role>
			<cfset redirectTo(action="home")>
		<cfelse>
			<cfset flashInsert(error="The username and password you entered are not valid.")>
			<cfset user = model("user").new()/>
			<cfset renderPage(action="login")>
		</cfif>
	</cffunction>
	
	<cffunction name="logout">
		<cfset structDelete(session, "user")/>
		<cfset redirectTo(route="home")/>
	</cffunction>
</cfcomponent>