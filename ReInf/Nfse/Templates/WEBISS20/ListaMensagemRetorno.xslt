<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" indent="no"/>

  <xsl:strip-space elements="*"/>

  <xsl:template match="*[local-name()='ListaMensagemRetorno']">
    <xsl:for-each select="*[local-name()='MensagemRetorno']">
      <xsl:text>Código: </xsl:text>
      <xsl:value-of select="normalize-space(*[local-name()='Codigo'])"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:text>Mensagem: </xsl:text>
      <xsl:value-of select="normalize-space(*[local-name()='Mensagem'])"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:text>Correção: </xsl:text>
      <xsl:value-of select="normalize-space(*[local-name()='Correcao'])"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:value-of select="'&#xA;'"/>
    </xsl:for-each>
  </xsl:template>  

</xsl:stylesheet>
