<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">

    <xsl:output method="html" indent="yes"/>
    <xsl:preserve-space elements="p"/>
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
                <script src="script.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>
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
                        <h3 id="h3Articoli">Seleziona l'articolo che vuoi visualizzare</h3>
                        <!-- Chiamo il template che visualizza titoli e date degli articoli codificati -->
                            <xsl:apply-templates select="/tei:TEI//tei:body/tei:div[@type='article']"/>
                            <xsl:apply-templates select="/tei:TEI//tei:body/tei:div[@type='bibarticle']"/>
                        
                    </div>
                    <!-- Contenitore testo articoli + immagini -->
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

    <!-- Teplate che chiama titoli e date degli articoli (tutti tranne bibliografia, che ha una struttura diversa) -->
    <xsl:template match="/tei:TEI//tei:div[@type='article']">
        <div class="art">
            <xsl:attribute name="onclick">
                appArticoli(<xsl:value-of select="tei:div[@type='textarticle']/@xml:id"/>)
            </xsl:attribute>
            <!-- Assegna al div l'id dell'articolo corrispondente -->
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <!-- Selezione del volume al quale appartiene -->
            <p><xsl:value-of select="tei:div[@type='intestazione']"/></p>
            <!-- Selezione dell'head dell'articolo -->
            <p><xsl:value-of select="tei:div[@type='textarticle']/tei:head"/></p>
        </div>
        <!-- Un div per oggni coppia articolo+immagini, generato come sopra-->
        <div class="ArtImg">
            <!-- Assegna al div l'id del testo articolo corrispondente -->
                <xsl:attribute name="id">
                    <xsl:value-of select="tei:div[@type='textarticle']/@xml:id"/>
                </xsl:attribute>
                <!-- Estrae il testo dell'articolo -->
                <div class="testo">
                    <xsl:for-each select="tei:div[@type='textarticle']/tei:head/following-sibling::*">   
                    <!-- Per ogni sibling, chiama l'apply-templates -->
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                    <!-- <p><xsl:value-of select="tei:div[@type='textarticle']/tei:head/following-sibling::*"/></p> -->
                </div>
            </div>
    </xsl:template>

    <!-- Teplate che chiama titoli e date degli articoli della bibliografia !-->
    <xsl:template match="/tei:TEI//tei:div[@type='bibarticle']">
        <div class="art">
            <xsl:attribute name="onclick">
                appArticoli(<xsl:value-of select="tei:div[@type='textarticle']/@xml:id"/>)
            </xsl:attribute>
            <!-- Assegna al div l'id dell'articolo corrispondente -->
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <!-- Selezione del volume al quale appartiene -->
            <p><xsl:value-of select="tei:div[@type='intestazione']"/></p>
            <!-- Selezione dell'head dell'articolo -->
            <p><xsl:value-of select="tei:div[@type='textarticle']/tei:head"/></p>
        </div>
        <!-- Un div per oggni coppia articolo+immagini, generato come sopra-->
        <div class="ArtImg">
            <!-- Assegna al div l'id del testo articolo corrispondente -->
                <xsl:attribute name="id">
                    <xsl:value-of select="tei:div[@type='textarticle']/@xml:id"/>
                </xsl:attribute>
                <!-- Estrae il testo dell'articolo -->
                <div class="testo">
                    <xsl:for-each select="tei:div[@type='textarticle']/tei:head[@type='subtitle']/following-sibling::*">   
                        <!-- Per ogni div fratello di head, stampa il titolo e il contenuto -->
                            <h4><xsl:value-of select="tei:head"/></h4>
                            <xsl:for-each select="tei:p">
                                <p><xsl:apply-templates/></p>
                            </xsl:for-each>
                    </xsl:for-each>
                    <!-- <p><xsl:value-of select="tei:div[@type='textarticle']/tei:head/following-sibling::*"/></p> -->
                </div>
            </div>
    </xsl:template>

    <!-- Regole per opener -->
    <xsl:template match="tei:salute">
        <p><xsl:value-of select="."/></p>
    </xsl:template>

    <!-- Regole per le citazioni q -->
    <xsl:template match="tei:q">
        <q class="q"><xsl:value-of select="."/></q>
    </xsl:template>

    <!-- Regole per note. Capire come gestire il farla apparire passando il mouse sopra il testo corrispondente! -->
    <xsl:template match="tei:note">
        <div class="note"><xsl:value-of select="."/></div>
    </xsl:template>

</xsl:stylesheet>
