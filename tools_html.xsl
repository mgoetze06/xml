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
			<td>
				<b>Tool Name</b>
			</td>
			<td>
				<b>Description</b>
			</td>
			<td>
				<b>Reference</b>
			</td>
			<td>
				<b>Latest Release</b>
			</td>
		</tr>
		<xsl:apply-templates select="tool"/>
	</xsl:template>
	<xsl:template match="tool">
		<tr>
			<xsl:apply-templates/><!--ruft alle folgenden templates auf-->
		</tr>
	</xsl:template>
	<xsl:template match="name">
		<td>
			<xsl:value-of select="."/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template match="description">
		<td>
			<xsl:value-of select="shortDescr"/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template match="link">
		<td>
			<xsl:value-of select="."/><!--<xsl:value-of select="."/>-->
		</td>
	</xsl:template>
	<xsl:template match="latestRelease">
		
		<!-- hier xsl choose einfügen, Wenn keine Version angegeben - No Version information, wenn nur Version ohne Datum, Version und Datum-->		
		<td>
			Version <xsl:value-of select="version"/> released in <xsl:value-of select="format-number(releaseMonth,'00')"/>/<xsl:value-of select="format-number(releaseYear,'0000')"/>
		</td>
	</xsl:template>
</xsl:stylesheet>
