<cfcomponent extends="Model">
	<cffunction name="init">
		<!--- Associations --->
		<cfset belongsTo(name="user", foreignKey="userID")/>
		<cfset belongsTo(name="category", foreignKey="categoryID")/>
		<cfset hasMany(name="comments", foreignKey="commentID")/>
		
		<!--- Validations --->
		<cfset validatesPresenceOf("title")/>
		<cfset validatesPresenceOf("categoryID", "No category was selected.")/>
		<cfset validatesPresenceOf("body", "Text of the blog entry is required.")/>
	</cffunction>
</cfcomponent>