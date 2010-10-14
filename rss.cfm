<cfquery name="entries" datasource="litepost">
	select		*
	from		entries
	inner join categories on entries.categoryID = categories.categoryID
	order by	createdat  desc
</cfquery>


<cfset myStruct = StructNew() />
<cfset mystruct.link = "http://localhost:8501/dev2/rss.cfm" />
<cfset myStruct.title = "LitePost - LitePost on CFWheels - LitePost" />
<cfset mystruct.description = "LitePost is a lightweight CFML-based blog application built in various ColdFusion frameworks." />
<cfset myStruct.language = "en-us"/>
<cfset mystruct.pubDate = Now() />
<cfset mystruct.version = "rss_2.0" />
<cfset myStruct.item = ArrayNew(1) />

<cfloop query="entries">
	<cfset myStruct.item[currentRow] = StructNew() />
	<cfset myStruct.item[currentRow].guid = structNew() />
	<cfset myStruct.item[currentRow].guid.isPermaLink="NO" />
	<cfset myStruct.item[currentRow].guid.value = 'http://localhost/dev2/entries/entry#entryid#/' />
	<cfset myStruct.item[currentRow].pubDate = createDate(year(createdat), month(createdat), day(createdat)) />
	<cfset myStruct.item[currentRow].title = xmlFormat(title) />
	<cfset myStruct.item[currentRow].description = StructNew() />
	<cfset myStruct.item[currentRow].description.value = xmlFormat(body) />
	<cfset myStruct.item[currentRow].category = ArrayNew(1)>
	<cfset myStruct.item[currentRow].category[1] = StructNew()/>
	<cfset myStruct.item[currentRow].category[1].value = "#category#">
	<cfset myStruct.item[currentRow].link = 'http://localhost:8501/dev2/index.cfm/entries/view/#entryid#/' />
</cfloop>

<!--- Generate the feed and save it to a variable. --->
<cffeed action="create" name="#myStruct#" overwrite="true" xmlVar="myXML"/>
<cfcontent type="text/xml" reset="true"><cfoutput>#myXML#</cfoutput>