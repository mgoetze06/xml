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
		<fo:table width="265mm" border-style="single" border-width="1pt" background-color="lightgreen">
			<fo:table-column column-number="1" column-width="100%" border-style="single" border-width="1pt"/>
			<fo:table-body>
				<fo:table-row border-style="single" border-width="1pt">
					<fo:table-cell column-number="1">
						<fo:block margin="1mm">
							<xsl:value-of select="@type"/>	
							<xsl:value-of select="name"/>
						</fo:block>		
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
</xsl:stylesheet>
