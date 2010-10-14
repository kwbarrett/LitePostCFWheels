<!--- 
	title: view.cfm
	author: Ken Barrett
	purpose: I display a single entry along with it's comments.  The add comment form is also included.
 --->
 
<cfoutput>
	<cfif flashKeyExists("success")>
		#flash("success")#
	</cfif>
	
	<h1>#entry.title#</h1>
	<p class="post-by">
		Posted in #linkTo(text=entry.category().category, controller="entries", action="list", params="categoryid=#entry.categoryid#")# 
		on #dateFormat(entry.createdat, "medium")# by #entry.user().fname# #entry.user().lname# 
		#editEntry(entry.entryid)#
	</p>
	<p>#simpleFormat(entry.body)#</p>
	<p class="post-footer">
		Posted in #linkTo(text=entry.category().category, controller="entries", action="list", params="categoryid=#entry.categoryid#")# | 
		#linkTo(text="Comments", controller="entries", action="view", key=entry.entryid, anchor="comments")# 		(#entryComments.recordcount#)
	</p>
	<a name="comments"></a>
	<h2>Comments</h2>
	<p>#comments#</p>
	<a name="commentForm"></a>
	<p><br/></p>
	#includePartial("commentForm")#
</cfoutput>