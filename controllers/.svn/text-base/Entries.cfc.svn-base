<cfcomponent extends="Controller" output="false">
	<cffunction name="index">
		<cfset entries = model('entry').findAll(order='createdAt DESC', include='user, category')/>
		
		<!---<cfset page.title = "Blog Entries"/>--->
		<cfsavecontent variable="page.actionNav">
			<cfoutput>
				#linkTo(text="Add Entry", action="add")#
			</cfoutput>
		</cfsavecontent>
	</cffunction>
	
	<cffunction name="view">
		<cfset entry = model("entry").findByKey(key=params.key)/>
		<cfset entryComments = model("comment").findAll(where="entryID=#params.key#", order="createdat")/>
		<cfset comment = model("comment").new(entryid=params.key)/>
		
		<cfif NOT IsObject(entry)>
			<cfset flashInsert(error="Record not found.")/>
			<cfset redirectTo(controller="main", action="home")>
		</cfif>
		<cfif entryComments.recordCount GT 0>
			<cfsavecontent variable="comments">
				<ol>
					<cfloop query="entryComments">
						<cfoutput>
							<li>
								submitted on #DateFormat(createdat, 'medium')# 
								at #TimeFormat(createdat,'h:mm tt')# 
								by #mailTo(name="#name#", emailAddress="#email#")# - #autolink(text="#url#", link="url")#
								<p>#simpleformat(comment)#</p>
								<cfif structKeyExists(session, "user") AND session.role EQ 'admin'>
									[#linkTo(text="Delete comment", controller="comments", action="delete", key="#commentid#", confirm="Are you sure?")#]
								</cfif>
							</li>
						</cfoutput>
					</cfloop>
				</ol>
			</cfsavecontent>
		<cfelse>
			<cfset comments = "No comments for this entry."/>
		</cfif>
	</cffunction>
	
	<cffunction name="edit">
		<cfset entry = model("entry").findByKey(params.key)>
		<cfif NOT IsObject(entry)>
			<cfset flashInsert(error="The entry was not found.")>
			<cfset renderPage(action="view", key=params.key)>
		<cfelse>
			<cfset categories = model("category").findAll(order="category")>
		</cfif>
	</cffunction>
	
	<cffunction name="update">
		<cfset entry = model("entry").findByKey(key=params.key)>
		<cfif entry.update(params.entry)>
			<cfset flashInsert(success="Your entry has been updated successfully.")>
			<cfset redirectTo(action="view", key=params.key)>
		<cfelse>
			<cfset flashInsert(error="There was a problem with your entry. #errorMessagesFor('entry')#")>
			<cfset redirectTo(action="edit", key=params.key)/>
		</cfif>
	</cffunction>
	
	<cffunction name="new">
		<cfset entry = model("entry").new()/>
		<cfset categories = model("category").findAll(order="category")>
	</cffunction>
	
	<cffunction name="create">
		<cfset params.entry.userid = session.user/>
		<cfset entry = model("entry").new(params.entry)/>
		<cfif entry.save()>
			<cfset flashInsert(success="Your entry has been published")/>
			<cfset redirectTo(action="view", key=entry.entryid)/>
		<cfelse>
			<cfset flashInsert(error="There was a problem with your entry. #errorMessagesFor('entry')#")/>
			<cfset redirectTo(action="new")/>
		</cfif>
	</cffunction>
	
	<cffunction name="list">
		<cfif IsDefined("params.categoryid") AND params.categoryid NEQ "">
			<cfparam name="params.page"  default="1"/>
			<cfset entries = model('entry').findAll(order='createdAt DESC', include='user, category', where='entries.categoryID=#params.categoryid#', page=params.page, perPage=5)/>
					
			<cfif entries.recordcount EQ 0>
				
				<cfset flashInsert(error="No entries in selected category")/>
				<cfset redirectTo(controller="main", action="home")/>
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<cfset entry = model("entry").findByKey(params.key)/>
		<!--- Verify that the company deletes successfully --->
		<cfif entry.delete()>
			<cfset flashInsert(success="The entry was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the entry. #errorMessagesFor('entry')#")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
</cfcomponent>