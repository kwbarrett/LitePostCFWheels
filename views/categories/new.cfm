<!--- 
	title: new.cfm
	author: Ken Barrett
	purpose: I display the add category form
 --->

<cfparam name="category" default=""/>

<cfoutput>
	<cfif flashKeyExists("error")>
		#flash("error")#
	</cfif>
	
	#startFormTag(action="create")#
	<p>
		#textField(label="Category name", objectName="category", property="category")#
		#submitTag(value="Add Category", class="button")#
	</p>
	#endFormTag()#
</cfoutput>