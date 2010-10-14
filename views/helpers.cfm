<!--- Place helper functions here that should be available for use in all view pages of your application --->

<cffunction name="getCommentsForEntry">
	<cfargument name="entryID" type="numeric" />
	<cfset entryComments = model("comments").findAll(where="entryID=#ARGUMENTS.entryID#", order="createdAt ASC")/>
	<cfreturn entryComments/>
</cffunction>

<cffunction name="editEntry">
	<cfargument name="entryid" type="numeric" />
	<cfparam name="editLink"  default=""/>
	<!--- Create the editEntry link --->
	<cfif structKeyExists(session, "user") AND session.role EQ 'admin'>
		<cfsavecontent variable="editLink">
			<cfoutput>
				[#linkTo(text='edit', controller='entries', action='edit', key=ARGUMENTS.entryid)#]
			</cfoutput>
		</cfsavecontent>			
	</cfif>
	<cfreturn '#editLink#'/>
</cffunction>

<cffunction name="adminLinks">
	<cfif structKeyExists(session, "user") AND session.user NEQ "">
		<cfsavecontent variable="adminMenu">
			<cfoutput>		
				<li>#linkTo(text='New Entry', controller='entries', action='new')#</li>
				<li>#linkTo(text='Entries', controller='entries', action='index')#</li>
				<li>#linkTo(text='Categories', controller="categories", action="index")#</li>
				<li>#linkTo(text='Links', controller='bookmarks', action='index')#
			</cfoutput>
		</cfsavecontent>
		<cfreturn adminMenu/>
	</cfif>
</cffunction>

<cffunction name="LoginLogout">
	<cfif structKeyExists(session, "user") AND session.user NEQ "">
		<cfreturn "#linkTo(route='logout', text='Logout')#"/>
	<cfelse>
		<cfreturn "#linkTo(route='login', text='Login')#"/>
	</cfif>
</cffunction>

<cffunction name="loginMenu">
	<cfif structKeyExists(session, "user") AND session.user NEQ "">
		<cfreturn "<li>#linkTo(route='logout', text='Logout')#</li>"/>
	<cfelse>
		<cfsavecontent variable="loginForm">
			<cfoutput>
				<cfif FlashKeyExists("error")>
					<p>#flash("error")#</p>
				</cfif>
				<cfset user = model("user").new()/>
				#startFormTag(controller="main", action="signin")#
					<p>
					#textField(objectName="user", label="Username", property="username")#
					#passwordField(objectName="user", label="Password", property="password")#
					<br/><br/>
					#submitTag(value="Login", class="button")#
					</p>
				#endFormTag()#
			</cfoutput>
		</cfsavecontent>
		<cfreturn loginForm/>	
	</cfif>
</cffunction>