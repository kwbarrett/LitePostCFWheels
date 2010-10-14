<!--- 
	title: index.cfm
	author: Ken Barrett
	purpose: I display the list of categories
 --->

<cfparam name="categories"  default=""/>

<cfoutput>
	<h1>Manage Categories</h1>
	<div align="right"><h3>#linkTo(text='New Category', controller='categories', action='new')#</h3></div>
	<table id="categoriesTable">
		<thead>
			<tr>
				<th>Category</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="categories">
				<tr bgcolor="###iif(currentrow MOD 2,DE('ffffff'),DE('efefef'))#">
					<td>#category#</td>
					<td>
						#linkTo(text="Edit", controllers="categories", action="edit", key=categoryid)# | 
						#linkTo(text="Delete", controllers="categories", action="delete", key=categoryid, confirm="Are you sure>")#
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>