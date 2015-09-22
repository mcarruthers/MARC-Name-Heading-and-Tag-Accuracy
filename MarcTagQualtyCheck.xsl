<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:marc="http://www.loc.gov/MARC21/slim"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
   
    <xsl:template match="marc:collection">
        <!--Insert column headers in output file-->
        <xsl:text>Name</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Tag</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Record_001</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="marc:record">
            
            <xsl:call-template name="personal_main"/>
            <xsl:call-template name="corporate_main"/>
            <xsl:call-template name="personal_added"/>
            <xsl:call-template name="corporate_added"/>
            <xsl:call-template name="uncontrolled_added"/>
            
        </xsl:for-each>
    </xsl:template>
    
    <!--Find and extract each 100 value from MARC records, along with the tag and 001 field value-->
    <xsl:template name="personal_main">
        <xsl:for-each select="marc:datafield[@tag='100']">
            <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>100</xsl:text>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="../marc:controlfield[@tag='001']"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!--Find and extract each 110 value from MARC records, along with the tag and 001 field value-->
    <xsl:template name="corporate_main">
        <xsl:for-each select="marc:datafield[@tag='110']">
            <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>110</xsl:text>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="../marc:controlfield[@tag='001']"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!--Find and extract each 700 value from MARC records, along with the tag and 001 field value-->
    <xsl:template name="personal_added">
        <xsl:for-each select="marc:datafield[@tag='700']">
            <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>700</xsl:text>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="../marc:controlfield[@tag='001']"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!--Find and extract each 710 value from MARC records, along with the tag and 001 field value-->
    <xsl:template name="corporate_added">
        <xsl:for-each select="marc:datafield[@tag='710']">
            <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>710</xsl:text>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="../marc:controlfield[@tag='001']"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!--Find and extract each 720 value from MARC records, along with the tag and 001 field value-->
    <xsl:template name="uncontrolled_added">
        <xsl:for-each select="marc:datafield[@tag='720']">
            <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>720</xsl:text>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="../marc:controlfield[@tag='001']"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
