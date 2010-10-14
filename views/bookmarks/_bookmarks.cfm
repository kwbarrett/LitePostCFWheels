<cfset bookmarks = model("bookmark").findAll(order="name")/>

<cfoutput>
	<cfloop query="bookmarks">
		<li><a href="#url#" target="_blank">#name#</a>
	</cfloop>
</cfoutput>