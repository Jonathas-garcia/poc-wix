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


<xsl:template match='wix:Wix/wix:Fragment[2]'>
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
            <xsl:element name="Property" namespace="http://schemas.microsoft.com/wix/2006/wi">
                <xsl:attribute name="Id">ENVIRONMENT</xsl:attribute>
                <xsl:element name="RegistrySearch" namespace="http://schemas.microsoft.com/wix/2006/wi">
                    <xsl:attribute name="Id">ENVIRONMENT</xsl:attribute>
                    <xsl:attribute name="Root">HKCU</xsl:attribute>
                    <xsl:attribute name="Key">System\CurrentControlSet\Policies</xsl:attribute>
                    <xsl:attribute name="Name">ENVIRONMENT</xsl:attribute>
                    <xsl:attribute name="Type">raw</xsl:attribute>
                </xsl:element>    
            </xsl:element>    

  </xsl:copy>
</xsl:template>

    
<xsl:template match='//wix:Wix/wix:Fragment/wix:ComponentGroup/wix:Component[wix:File[@Source and  (contains(@Source, "hml"))]]'>
  
  <xsl:copy>
  <xsl:apply-templates select="@*"/>    
      <xsl:element name="Condition" namespace="http://schemas.microsoft.com/wix/2006/wi">
        <xsl:text disable-output-escaping="yes">&lt;![CDATA[ENVIRONMENT="H"</xsl:text>
        <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
      </xsl:element>    
      <xsl:apply-templates select="node()"/>    
  </xsl:copy>
  
</xsl:template>
<xsl:template match='//wix:Wix/wix:Fragment/wix:ComponentGroup/wix:Component[wix:File[@Source and  (contains(@Source, "prod"))]]'>
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