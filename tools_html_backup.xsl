<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>
        Open Source Tool Collection
    </title>
			</head>
			<body style="font-family:Arial, Helvetica, sans-serif;font-size:12pt; color:green">
				<p class="title">Open Source Tool Collection</p>
				<table class="dash" cellspacing="4" cellpadding="8">
					<xsl:apply-templates select="tools"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tools">
		<tr>
			<td colspan="8" style="font-family:Arial, Helvetica, sans-serif;font-size:1.5em; color:green">Inventory of Open Source Tools</td>
		</tr>
		<tr>
			<td style="width:5%">
				<b>Tool Name</b>
			</td>
			<td style="width:7%">
				<b>Type</b>
			</td>
			<td style="width:20%">
				<b>Description</b>
			</td>
			<td>
				<b>Reference</b>
			</td>
			<td>
				<b>Latest Release</b>
			</td>
			<td>
				<b>GitHub</b>
			</td>

		</tr>
		<xsl:apply-templates select="tool"/>
	</xsl:template>
	<xsl:template match="tool">
		<tr>
			<xsl:variable name="toolType">
				<xsl:value-of select="@type"/>
			</xsl:variable>
			<xsl:call-template name="name"></xsl:call-template>
			<xsl:call-template name="type">
				<xsl:with-param name="toolType" select="$toolType"/>
			</xsl:call-template>
			
			
			<xsl:call-template name="description"></xsl:call-template>
			<xsl:call-template name="link"></xsl:call-template>
			<xsl:call-template name="latestRelease"></xsl:call-template>
			<xsl:call-template name="github"></xsl:call-template>
			
			<!--<xsl:apply-templates/>--> <!--ruft alle folgenden templates auf-->
		</tr>
	</xsl:template>
	<xsl:template name="name" match="name">
		<td>
			<xsl:value-of select="name"/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template name="description">
		<td>
			<xsl:value-of select="description/shortDescr"/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template name="link">
		<td>
			<xsl:value-of select="link"/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template name="latestRelease">
		
		<!-- hier xsl choose einfügen, Wenn keine Version angegeben - No Version information, wenn nur Version ohne Datum, Version und Datum-->		
		<td>
			Version <xsl:value-of select="latestRelease/version"/> released in <xsl:value-of select="format-number(latestRelease/releaseMonth,'00')"/>/<xsl:value-of select="format-number(latestRelease/releaseYear,'0000')"/>
		</td>
	</xsl:template>
	
	<xsl:template name="github">
	<td>
		<xsl:choose>
			<xsl:when test="github/@available='single'">
				<!--There is a single github project page containing all project documentation--> 
				<xsl:value-of select="contributors"/> contributors worked on <xsl:value-of select="releases"/> releases.
			</xsl:when>
			<xsl:when test="github/@available='multiple'">
				<!--There is a single github project page containing all project documentation--> 
				<!--<xsl:value-of select="format-number(.,'00')"/>-->
				There is no single project on Github, multiple wrappers etc. exist.	
			</xsl:when>			
			<xsl:otherwise>No Github information</xsl:otherwise>
		
		</xsl:choose>
	
		<xsl:call-template name="codingLanguage">
</xsl:call-template>
	</td>
	</xsl:template>
	
	<xsl:template name="codingLanguage">
	<li>
		<xsl:value-of select="codingLanguage/@name"/> (<xsl:value-of select="codingLanguage/@share"/>%)	
	</li>
	</xsl:template>
	<xsl:template name="type">
		<xsl:param name="toolType"/>
		<td>
			<xsl:value-of select="$toolType"/>
		</td>
	</xsl:template>
</xsl:stylesheet>
