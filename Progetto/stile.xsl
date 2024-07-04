<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">

    <xsl:output method="html" indent="yes"/>

    <!-- Template iniziale: -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" href=""/>
            </head>
            <body>
                <header>
                    <h1>
                        <!-- titolo -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                    <h4>
                        <!-- sottotitolo -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:note"/>
                    </h4>
                    <p>
                        <!-- i nostri nomi -->
                        <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/>
                    </p>
                    <p>
                        <!-- la data dell'esame -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
                    </p>
                </header>
                <main>
                    <xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
                </main>
            </body>
        </html>
    </xsl:template>



    <!-- Template per il corpo del testo: 
     per ora stampa articoli con i titoli-->
    <xsl:template match="tei:body">
        <!-- testi articoli -->
        <xsl:for-each select="tei:div[@type='article']">
                <h2><xsl:value-of select="tei:head"/></h2>
                <p><xsl:value-of select="tei:p"/></p>
        </xsl:for-each>
        <!-- testo notizie -->
        <xsl:for-each select="tei:div[@type='news']">
                <h2><xsl:value-of select="tei:head"/></h2>
                <p><xsl:value-of select="tei:p"/></p>
        </xsl:for-each>
        <!-- testo racconto -->
        <xsl:for-each select="tei:div[@type='tale']">
                <h2><xsl:value-of select="tei:head"/></h2>
                <p><xsl:value-of select="tei:p"/></p>
        </xsl:for-each>
        <!-- bibliografie -->
        <h2><xsl:value-of select="tei:div[@type='section']/tei:head" /></h2>
        <!-- bibliografie testi -->
        <xsl:for-each select="tei:div[@type='section']/tei:div[@type='bibliography']">
                <h2><xsl:value-of select="tei:head"/></h2>
                <p><xsl:value-of select="tei:p"/></p>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
