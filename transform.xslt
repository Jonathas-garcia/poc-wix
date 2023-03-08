<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="wix:Directory">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match='wix:Wix/wix:Fragment/wix:DirectoryRef/wix:Directory/wix:Component[wix:File[@Source and  (contains(@Source, "hml"))]]'>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="Condition" namespace="http://schemas.microsoft.com/wix/2006/wi">
				<xsl:text disable-output-escaping="yes">&lt;![CDATA[ENVIRONMENT="H"</xsl:text>
				<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
			</xsl:element>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match='wix:Wix/wix:Fragment/wix:DirectoryRef/wix:Directory/wix:Component[wix:File[@Source and  (contains(@Source, "prod"))]]'>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="Condition" namespace="http://schemas.microsoft.com/wix/2006/wi">
				<xsl:text disable-output-escaping="yes">&lt;![CDATA[ENVIRONMENT="P"</xsl:text>
				<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
			</xsl:element>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>