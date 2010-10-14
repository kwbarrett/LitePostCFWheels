<cfset categories = model("category").findAll(order="category")/>

<cfoutput>
	<cfloop query="categories">
		<li>#linkTo(text="#category#", controller="entries", action="list", params="categoryid=#categoryid#")#
	</cfloop>
</cfoutput>