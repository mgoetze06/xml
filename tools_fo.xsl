<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="tools">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Open Source Tool Collection" page-height="210mm" page-width="297mm" margin-left="15mm" margin-right="15mm" margin-top="10mm" margin-bottom="10mm">
					<fo:region-body margin-top="15"/>
					<fo:region-before extent="15mm"/>
					<fo:region-after extent="15mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="Open Source Tool Collection">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block margin-bottom="5mm" border-bottom="0.5pt solid black" text-align="center" font-size="14pt" font-weight="bold">Open Source Tool Collection</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<!--<xsl:apply-templates/>-->	

					<xsl:apply-templates select="tool"/>
				</fo:flow>	
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="tool">
		<fo:block margin-bottom="5mm" >
			<fo:inline> </fo:inline>
		</fo:block>
		<fo:table width="265mm" border-style="single" border-width="1pt">
			<fo:table-column column-number="1" column-width="20%" border-style="single" border-width="1pt" text-align="center"/>
			<fo:table-column column-number="2" column-width="80%" border-style="single" border-width="1pt" text-align="center"/>
			<fo:table-body>
				<xsl:variable name="toolType">
					<xsl:value-of select="@type"/>
				</xsl:variable>
				
				<xsl:apply-templates select="name"/>
				
				<xsl:call-template name="type">
					<xsl:with-param name="toolType" select="$toolType"/>
				</xsl:call-template>
				<xsl:apply-templates select="description"/>
				<xsl:apply-templates select="link"/>
				<xsl:apply-templates select="latestRelease"/>
				<xsl:apply-templates select="github"/>
			</fo:table-body>
		</fo:table>
	</xsl:template>





<xsl:template match="name">
				<fo:table-row border-style="single" border-width="1pt" background-color="lightgreen">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Name </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	
							<xsl:value-of select="."/><!-- this is a new comment-->
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>
</xsl:template>
<xsl:template name="type">
	<xsl:param name="toolType"/>
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Type </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	
							<xsl:choose>
								<xsl:when test="$toolType='library'">Library</xsl:when>
								<xsl:otherwise>Standalone Application</xsl:otherwise>
							</xsl:choose>
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>
</xsl:template>

<xsl:template match="description">
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Description </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	
							<xsl:value-of select="shortDescr"/>
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>
</xsl:template>
<xsl:template match="link">
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Link </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	
							<xsl:value-of select="."/>
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>
</xsl:template>
<xsl:template match="latestRelease">
	<xsl:variable name="versionInfo" select="./child::*[1]"></xsl:variable>
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Latest Release </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	

								<xsl:choose>
									<xsl:when test="$versionInfo = ''">
									No version information.
									</xsl:when>

									<xsl:otherwise>
									Version <xsl:value-of select="version"/> released in <xsl:value-of select="format-number(releaseMonth,'00')"/>/<xsl:value-of select="format-number(releaseYear,'0000')"/>
									</xsl:otherwise>
								</xsl:choose>
							
							
							
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>
</xsl:template>
<xsl:template match="github">
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<fo:inline>Github </fo:inline>
						</fo:block>		
					</fo:table-cell>
					<fo:table-cell column-number="2">
						<fo:block margin="1mm">	
							<xsl:choose>
								<xsl:when test="@available='single'">
									<!--There is a single github project page containing all project documentation--> 
									<xsl:value-of select="contributors"/> contributors worked on <xsl:value-of select="releases"/> releases with these coding languages:
								</xsl:when>
								<xsl:when test="@available='multiple'">
									<!--There is a single github project page containing all project documentation--> 
									<!--<xsl:value-of select="format-number(.,'00')"/>-->
									There is no single project on Github, multiple wrappers etc. exist.	
								</xsl:when>			
								<xsl:otherwise>No Github information</xsl:otherwise>
							
							</xsl:choose> 
							<xsl:apply-templates select="codingLanguage"/>

							
							
						</fo:block>		
					</fo:table-cell>					
				</fo:table-row>

</xsl:template>
<xsl:template match="codingLanguage">
							<fo:list-block>
								<fo:list-item>
								 <fo:list-item-label>
								   <fo:block></fo:block>
								 </fo:list-item-label>
								 <fo:list-item-body>
								 	<fo:block>
										<xsl:value-of select="@name"/> (<xsl:value-of select="@share"/>%)
									</fo:block>
								 </fo:list-item-body>
								 </fo:list-item>
							</fo:list-block>

</xsl:template>

</xsl:stylesheet>
