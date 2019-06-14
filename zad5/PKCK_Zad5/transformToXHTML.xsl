<?xml version="1.0" encoding="UTF-8"?>
<!--https://cedricvb.be/xml-xslt-to-xhtml-transform/-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://xml.apache.org/xslt/java "
                xmlns:java="http://xml.apache.org/xslt/java"
                exclude-result-prefixes="java">

    <xsl:output indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Pokemon Cards</title>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
            </head>
            <body class="bg-light">
                <div class="container bg-info text-light">
                    <div id="autorzy">
                        <div class="row justify-content-center pt-4">
                            Autorzy dokumentu
                        </div>
                        
                        <div>
                            <xsl:call-template name="trainers"/>
                        </div>
                        <div>
                            <xsl:call-template name="pokemons"/>
                            <br></br>
                        </div>
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>
    <xsl:template name="trainers">
        <div>
            <table class="table table-bordered table-dark m-auto">
                <thead>
                    <tr>
                        <th colspan="4" class="text-center">
                            Trenerzy
                        </th>
                    </tr>
                    <tr>
                        <th>Imie</th>
                        <th>Nazwisko</th>
                        <th>Wiek</th>
                        <th>Miasto</th>
                    </tr>

                </thead>
                <tbody>
                    <xsl:for-each select="//Trainer">
                        <tr>
                            <td>
                                <xsl:value-of select="Tname"/>
                            </td>
                            <th>
                                <xsl:value-of select="Surname"/>
                            </th>
                            <th>
                                <xsl:value-of select="Age"/>
                            </th>
                            <th>
                                <xsl:value-of select="Hometown"/>
                            </th>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    <xsl:template name="pokemons">
        <div>
            <table class="table table-bordered table-dark m-auto">
                <thead>
                    <tr>
                        <th colspan="5" class="text-center">
                            Pokemony
                        </th>
                    </tr>
                    <tr>
                        <th>Nazwa pokemona</th>
                        <th>Typ</th>
                        <th>HP</th>
                        <th>DEF</th>
                        <th>ATK</th>
                    </tr>

                </thead>
                <tbody>
                    <xsl:for-each select="//Pokemons/*">
                        <tr>
                            <td>
                                <xsl:value-of select="Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Type"/>
                            </td>
                            <td>
                                <xsl:value-of select="Stats/HP"/>
                            </td>
                            <td>
                                <xsl:value-of select="Stats/ATK"/>
                            </td>
                            <td>
                                <xsl:value-of select="Stats/DEF"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>

    </xsl:template>
</xsl:stylesheet>
