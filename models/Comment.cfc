<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Associations --->
		<cfset belongsTo(name="entry", foreignKey="entryID")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf("name, comment")/>	
		<cfset validatesFormatOf(property="email", type="email", allowBlank="true")/>
	</cffunction>
</cfcomponent>