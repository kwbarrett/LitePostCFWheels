<cfcomponent extends="Model" output="false">
	<cffunction name="init">
		<!--- Associations --->
		<cfset hasMany(name="entries", foreignKey="entryID")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf("category")/>
	</cffunction>
</cfcomponent>