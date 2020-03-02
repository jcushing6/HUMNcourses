<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei xhtml"
    version="2.0">
    
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        method="xhtml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="return2">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:comment>This document is generated from a TEI Master--do not edit!</xsl:comment>
                <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
                <link rel="stylesheet" type="text/css" href="../CSS/hamilton_style.css"/>
                <style type="text/css">
                    @import url("../CSS/hamilton_style.css");
                </style>
            </head>

            <body>
                
                
                <xsl:apply-templates select="tei:text/tei:front"/>
                <hr />
                <xsl:apply-templates select="tei:text/tei:body"/>
                <hr />
                <xsl:apply-templates select="tei:text/tei:back"/>
                <xsl:apply-templates select="tei:text//*/tei:note" mode="endNotes"/>
                <div>
                    <br />
                    <br />
                    <br />
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:castlist"/>
    
    <xsl:template match="tei:head">
        <h1 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="tei:byline">
        <hr/>
        <h5>
            <xsl:text>Edited by: </xsl:text>
            <xsl:apply-templates/>
        </h5>
        <br />
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        <em xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </em>
        
        <br xmlns="http://www.w3.org/1999/xhtml"/>
    </xsl:template>
    
    <xsl:template match="tei:opener">
        <h3 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="tei:sp">
            <xsl:apply-templates/> 
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:speaker">
       <h4>
           <xsl:apply-templates/>
       </h4>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    
    <xsl:template match="tei:p">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br xmlns="http://www.w3.org/1999/xhtml"/>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <strike>
            <xsl:apply-templates/>
        </strike>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='superscript']"> 
        <sup xmlns="http://www.w3.org/1999.xhtml">
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
 
 <xml:template match="tei:div/tei:list/tei:item">
             <xsl:apply-templates/> 
     <br />
                
 </xml:template>
    
    <xsl:template match="tei:persName">
        <font color="blue">
            <xsl:apply-templates/>
        </font>
    </xsl:template>    
    
    <xsl:template match="tei:placeName">
        <font color="green">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    
    <xsl:template match="tei:orgName">
        <font color="pink">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    
    <xsl:template match="tei:objectName">
        <font color="purple">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    
    <xsl:template match="tei:name[@type='event']">
        <font color="orange">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    
    
<!--   
    <xsl:template match="tei:span">
        <br xmlns="http://www.w3.org/1999.xhtml"/>
    </xsl:template>
    
   <xsl:template match="tei:pb">
        <img src="{@facs}">
            <xsl:apply-templates/>
        </img>
    </xsl:template>
    
    <xsl:template match="tei:span">
        <xsl:value-of select="tei:persName | tei:placeName | tei:date" />
        <xsl:if test="not(position()=last())">
            <br />
        </xsl:if>
    </xsl:template>
    
    \*This section handles the position of the note and its link*\
    
    <xsl:template match="tei:note">
        <a xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <sup xmlns="http://www.w3.org/1999/xhtml">
                <xsl:value-of select="@n"/>
            </sup>
        </a>
        <xsl:text> </xsl:text>
    </xsl:template>
    
 -->   
    <xsl:template match="tei:note" mode="endNotes">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <a name="{@n}"/>
            <xsl:value-of select="@n"/>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!--
    <xsl:template match="tei:anchor">
        <a>
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
    </xsl:template>
 -->
    <xsl:template match="tei:anchor">
        <a xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href"><xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>

