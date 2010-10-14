<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">

	<cffunction name="init">
		<cfset filters(through="checkLogin", except="login, signin, home, list, view, about")/>
	</cffunction>

	<cffunction name="checkLogin">
		<cfif NOT structKeyExists(session, "user") OR NOT IsDefined("session.user")>
			<cfset redirectTo(controller="main", action="login")/>
		</cfif>
	</cffunction>
	
</cfcomponent>