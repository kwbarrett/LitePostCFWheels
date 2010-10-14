<!--- 
	title: edit.cfm
	author: Ken Barrett
	purpose: I display the edit category form.
 --->

<cfparam name="category" default=""/>

<cfoutput>
	<cfif flashKeyExists("error")>
		#flash("error")#
	</cfif>
	
	#startFormTag(action="update", key="params.key")#
	<p>
		#textField(label="Category name", objectName="category", property="category")#
		#submitTag(value="Update category", class="button")#
	</p>
	#endFormTag()#
</cfoutput>