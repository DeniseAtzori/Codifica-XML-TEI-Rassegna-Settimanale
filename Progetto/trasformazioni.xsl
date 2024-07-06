<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">

    <xsl:output method="html" indent="yes"/>
    
    <!-- Pagina html che, all'apertura, visualizza titolo, blocco main e footer. Nel blocco main sono elencati gli articoli codificati per il progetto. Ciascuno di essi è cliccabile e rende visibile il div che contiene articolo e immagini corrispondenti, che si apre sotto l'elenco degli articoli.
    -->

    <xsl:template match="/">
        <html>
            <!-- Metadata della pagina HTML -->
            <head>
                <title>
                    <!-- Estrazione del titolo -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" href="stile.css"/>
            </head>
            <body>
                <header>
                    <!-- Titolo -->
                    <h1 id="titPrincip">
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                    <h4>
                        <!-- i nostri nomi -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/>
                        <br/><br/>
                        <!-- la data dell'esame -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
                    </h4>
                </header>
                <main>
                    <!-- Contenitore menù articoli (cliccabili) -->
                    <div id="menuArticoli">
                        <h3 id="h3Articoli">Seleziona l'articolo che vuoi visualizzare:</h3>
                        <!-- Chiamo il template che visualizza titoli e date degli articoli codificati -->
                            <xsl:apply-templates select="/tei:TEI//tei:body/tei:div[@type='article']"/>
                    </div>
                    <!-- Contenitore testo articoli + immagini -->
                    <div id="contenitoreArt">
                        <!-- Un div per oggni coppia articolo+immagini, generato come sopra con un apply-templates, da scrivere -->
                        
                    </div>
                </main>
                <footer>
                    <p>
                        <!-- info Codifica -->
                        <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:note"/>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Teplate che chiama titoli e date degli articoli -->
    <xsl:template match="/tei:TEI//tei:div[@type='article']">
        <div class="art">
            <!-- Assegna al div l'id dell'articolo corrispondente -->
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <!-- Selezione dell'head dell'articolo -->
            <xsl:value-of select="tei:head"/>
            <!-- Selezione del volume al quale appartiene -->
            <p><xsl:value-of select="tei:div[@type='intestazione']"/></p>
        </div>
    </xsl:template>

    <!-- Da scrivere: template che visualizza titolo e testo dell'articolo corrispondente -->

    

</xsl:stylesheet>
