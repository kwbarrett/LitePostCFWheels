<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>

<meta name="Description" content="Information architecture, Web Design, Web Standards." />
<meta name="Keywords" content="your, keywords" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="Distribution" content="Global" />
<meta name="Author" content="Erwin Aligam - ealigam@gmail.com" />
<meta name="Robots" content="index,follow" />
	<cfoutput>
		#javascriptIncludeTag("jquery-1.4.2.min.js")#
		#javascriptIncludeTag("jquery.dataTables.js")#
	</cfoutput>
	<title>LitePost</title>
	<cfoutput>#styleSheetLinkTag("MarketPlace")#</cfoutput>

</head>

<body>

<!-- wrap starts here -->
<div id="wrap">

	<!--header -->
	<div id="header">			
				
		<div id="header-links">
		<p>
			<cfoutput>
				#linkTo(route="home", text="Home")# | 
				#loginlogout()# | 
				#linkTo(controller="main", action="about", text="About")# | 
				<a href="http://localhost:8501/LitePostCFWheels/rss.cfm">RSS</a>
			</cfoutput>		
		</p>		
		</div>		
		
	<!--header ends-->					
	</div>
		
	<div id="header-photo">
	
		<h1 id="logo-text">
			<cfoutput>#linkTo(route="home", text="LitePost On Wheels")#</cfoutput>
		</h1>		
		<h2 id="slogan">a lightweight ColdFusion-based blog application built CFWheels framework</h2>	
			
	</div>		
			
	<!-- navigation starts-->	
	<div  id="nav">
		<ul>
			<cfoutput>
				<li>#linkTo(route="home", text="Home")#</li>
				<li>#linkTo(controller="main", action="about", text="About")#</li>
			</cfoutput>
			<!---<li><a href="index.html">Home</a></li>
			<li id="current"><a href="2-columns.html">2-Columns</a></li>
			<li><a href="index.html">Archives</a></li>			
			<li><a href="index.html">Services</a></li>
			<li><a href="index.html">Support</a></li>
			<li><a href="index.html">About</a></li>	--->	
		</ul>
	<!-- navigation ends-->	
	</div>					
			
	<!-- content-wrap starts -->
	<div id="content-wrap" class="two-col"  >	
	
		<div id="sidebar">
			<!--- change this to a login form and admin menu --->
			<h1>Menu</h1>	
			<ul class="sidemenu">
			
			<cfoutput>
				#loginMenu()#
				#adminLinks()#
			</cfoutput>		
			</ul>
					
			<h1>Categories</h1>
			<!--- list of categories that link to entries by category --->
			<ul class="sidemenu">	
				<cfoutput>
					#includePartial("../categories/categories")#
				</cfoutput>
			</ul>	
				
			<h1>Links</h1>
			<!--- list of bookmarks goes here --->
			<ul class="sidemenu">
				<cfoutput>
					#includePartial("../bookmarks/bookmarks")#
				</cfoutput>
			</ul>
			
			<!---<h1>Sponsors</h1>
			<ul class="sidemenu">
                <li><a href="http://www.dreamtemplate.com" title="Website Templates">DreamTemplate</a></li>
				<li><a href="http://www.themelayouts.com" title="WordPress Themes">ThemeLayouts</a></li>
				<li><a href="http://www.imhosted.com" title="Website Hosting">ImHosted.com</a></li>
				<li><a href="http://www.dreamstock.com" title="Stock Photos">DreamStock</a></li>
				<li><a href="http://www.evrsoft.com" title="Website Builder">Evrsoft</a></li>
                <li><a href="http://www.webhostingwp.com" title="Web Hosting">Web Hosting</a></li>
			</ul>--->
			
			<h1>Wise Words</h1>
			<p>&quot;We are what we repeatedly do. Excellence, then, 
			is not an act, but a habit.&quot; </p>
					
			<p class="align-right">- Aristotle</p>
					
		<!-- sidebar ends -->		
		</div>
		
		<div id="main">
			<cfoutput>
				#contentForLayout()#		
			</cfoutput>		
		</div>
		
	<!-- content-wrap ends-->	
	</div>
		
	<!-- footer starts -->			
	<div id="footer-wrap"><div id="footer">				
			
            <p>
			&copy; 2010 LitePost on CFWheels

            &nbsp;&nbsp;&nbsp;&nbsp;

			<a href="http://www.bluewebtemplates.com/" title="Website Templates">website templates</a> by <a href="http://www.styleshout.com/">styleshout</a> 

   		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<cfoutput>#linkTo(route="home", text="Home")# | </cfoutput>
   		    <!--- <a href="index.html">Sitemap</a> | --->
	   	   	<a href="http://localhost:8501/LitePostCFWheels/rss.cfm">RSS</a> | 
            <a href="http://validator.w3.org/check?uri=referer">XHTML</a> |
			<a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
			</p>
			
	</div></div>
	<!-- footer ends-->	
	
<!-- wrap ends here -->
</div>

</body>
</html>
