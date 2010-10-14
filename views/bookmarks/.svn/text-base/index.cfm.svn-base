<!--- 
	title: index.cfm
	author: Ken Barrett
	purpose: I display a table of all links
 --->

<cfparam name="bookmarks" default=""/>

<cfoutput>
	<h1>Manage Links</h1>
	<div align="right"><h3>#linkTo(text="New Link", controller="bookmarks", action="new")#</h3></div>
	<table width="75%" border="0">
		<thead>
			<tr>
				<th>Name</th>
				<th>URL</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="bookmarks">
				<tr>
					<td>#name#</td>
					<td>#autoLink(text="#url#", link="all")#</td>
					<td>
						#linkTo(text="Edit", controller="bookmarks", action="edit", key="#bookmarkid#")# | 
						#linkTo(text="Delete", controller="bookmarks", action="delete", confirm="Are you sure?", key="#bookmarkid#")#
						
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>