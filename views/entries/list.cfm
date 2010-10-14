<cfparam name="entries"  default=""/>
<cfparam name="params.page"  default=""/>
<cfparam name="entryComments" default="">
<cfparam name="editLink"  default=""/>

<cfoutput>
	<!--- <cfif arrayLen(entries)> --->
		<cfloop query="entries">
			<cfset entryComments = getCommentsForEntry(entryID)/>
			<h1>#entries.title#</h1>
			<p class="post-by">
				Posted in #linkTo(text=entries.category, controller="entries", action="list", params="categoryid=#entries.categoryid#")# 
				on #dateFormat(entries.createdat, "medium")# by #entries.fname# #entries.lname# 
				#editEntry(entries.entryid)#
			</p>
			<!---<cfif structKeyExists(session, 'user') AND session.role EQ 'admin'>
				[#linkTo(text='add', controller='entries', action='new')#]
			</cfif>--->
			<p>#entries.body#</p>
			<p class="post-footer">
				Posted in #linkTo(text=entries.category, controller="entries", action="list", params="categoryid=#entries.categoryid#")#  | 
				#linkTo(text="Comments", controller="entries", action="view", key=entries.entryid, anchor="comments")# (#entryComments.recordcount#) | 
				#linkTo(text="Leave comment", controller="entries", action="view", key=entries.entryid, anchor="commentForm")#
			</p>
		</cfloop>
	<!--- <cfelse>
		<p>There are no blog entries to display.</p>
	</cfif> --->
	<strong>#paginationLinks()#</strong>
</cfoutput>