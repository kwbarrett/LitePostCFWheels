<!--- 
	title: index.cfm
	author: Ken Barrett
	purpose: I display a list of all entries
 --->

<cfparam name="entries" default="">
<cfparam name="categories" default="">

<cfoutput>
	<h1>Manage Entries</h1>
	<div align="right"><h3>#linkTo(text='New Entry', controller='entries', action='new')#</h3></div>
	<table id="entriesTable">
		<thead class="first">
			<tr>
				<th>Added</th>
				<th>Category</th>
				<th>Author</th>
				<th>Title</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="entries">
				<tr bgcolor="###iif(currentrow MOD 2,DE('ffffff'),DE('efefef'))#">
					<td>#DateFormat(createdat, 'short')#</td>
					<td>#category#</td>
					<td>#fname# #lname#</td>
					<td>#title#</td>
					<td nowrap="nowrap">
						#linkTo(text="Edit", action="edit", key=entryid)# | 
						#linkTo(text="Delete", action="delete", key=entryid, confirm="Are you sure?")#
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>