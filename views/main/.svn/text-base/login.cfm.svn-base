<!--- 
	title: login.cfm
	author: Ken Barrett
	purpose: I present the login form.
 --->

<cfparam name="user">

<cfoutput>
	
	<cfif FlashKeyExists("error")>
		<p>#flash("error")#</p>
	</cfif>
	#startFormTag(controller="main", action="signin")#
		<p>
		#textField(objectName="user", label="Username", property="username")#
		#passwordField(objectName="user", label="Password", property="password")#
		#submitTag(value="Login", class="button")#
		</p>
	#endFormTag()#
	
</cfoutput>