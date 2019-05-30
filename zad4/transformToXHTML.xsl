<?xml version="1.0" encoding="UTF-8"?>
<!--https://cedricvb.be/xml-xslt-to-xhtml-transform/-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://xml.apache.org/xslt/java "
                xmlns:java="http://xml.apache.org/xslt/java"
                exclude-result-prefixes="java" >

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
                        <div class="row justify-content-center">
                            <xsl:for-each select="raport/statystyki/autorzy">
                                <div class="card bg-secondary font-weight-bold col-3 d-flex flex-column align-items-center p-2 m-3">
                                    <xsl:for-each select="*">
                                        <div>
                                            <xsl:value-of select="."/>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </xsl:for-each>
                        </div>
                        <xsl:call-template name="trainers"/>
                        <br></br>
                        <xsl:call-template name="pokemons"/>
                        <br></br>
                        <div>
                            <table class="table table-bordered table-dark w-50 m-auto">
                                <thead>
                                    <tr>
                                        <th scope="col">Nazwa statystyki</th>
                                        <th scope="col">Liczba</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="col">Ilość pokemonów</th>
                                        <td scope="col">
                                            <xsl:value-of select="raport/statystyki/liczby/liczbaPokemonów"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Ilość trenerow</th>
                                        <td scope="col">
                                            <xsl:value-of select="raport/statystyki/liczby/liczbaTrenerow"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Ilość trenerow</th>
                                        <td scope="col">
                                            <xsl:value-of select="raport/statystyki/liczby/sredniAtk"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Ilość trenerow</th>
                                        <td scope="col">
                                            <xsl:value-of select="raport/statystyki/liczby/sredniHp"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Ilość trenerow</th>
                                        <td scope="col">
                                            <xsl:value-of select="raport/statystyki/liczby/sredniDef"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br/>
                            <div class="row">
                                <div class="table-responsive col-md-3">
                                    <table class="table table-bordered table-dark ">
                                        <thead>
                                            <tr>
                                                <th scope="col">Pokemony Asha</th>
                                            </tr>
                                            <xsl:for-each select="raport/statystyki/pokemonyAsha/*">
                                                <tr>
                                                    <th scope="col">
                                                        <xsl:value-of select="."/>
                                                    </th>
                                                </tr>
                                            </xsl:for-each>
                                        </thead>
                                    </table>
                                </div>
                                <div class="table-responsive col-md-3">
                                    <table class="table table-bordered table-dark ">
                                        <thead>
                                            <tr>
                                                <th scope="col">Pokemony Brocka</th>
                                            </tr>
                                            <xsl:for-each select="raport/statystyki/pokemonyBrocka/*">
                                                <tr>
                                                    <th scope="col">
                                                        <xsl:value-of select="."/>
                                                    </th>
                                                </tr>
                                            </xsl:for-each>
                                        </thead>
                                    </table>
                                </div>
                                <div class="table-responsive col-md-3">
                                    <table class="table table-bordered table-dark ">
                                        <thead>
                                            <tr>
                                                <th scope="col">Pokemony Misty</th>
                                            </tr>
                                            <xsl:for-each select="raport/statystyki/pokemonyMisty/*">
                                                <tr>
                                                    <th scope="col">
                                                        <xsl:value-of select="."/>
                                                    </th>
                                                </tr>
                                            </xsl:for-each>
                                        </thead>
                                    </table>
                                </div>
                                <div class="table-responsive col-md-3">
                                    <table class="table table-bordered table-dark ">
                                        <thead>
                                            <tr>
                                                <th scope="col">Pokemony Garrego</th>
                                            </tr>
                                            <xsl:for-each select="raport/statystyki/pokemonyGarego/*">
                                                <tr>
                                                    <th scope="col">
                                                        <xsl:value-of select="."/>
                                                    </th>
                                                </tr>
                                            </xsl:for-each>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="m-auto col-md-8">
                                <table class="table table-bordered table-dark m-auto ">
                                    <thead>
                                        <tr>
                                            <th scope="col">Najwyższe formy</th>
                                        </tr>
                                        <xsl:for-each select="raport/statystyki/najwyzszeEwolucje/*">
                                            <tr>
                                                <th scope="col">
                                                    <xsl:value-of select="."/>
                                                </th>
                                            </tr>
                                        </xsl:for-each>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                    <br></br>
                    <div class="text-center bg-dark">
                        Data wygenerowania raportu:
                        <br></br>
                        <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('yyyy-MM-dd HH:mm:ss'), java:java.util.Date.new())" />
                        <br></br>
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
                    <xsl:for-each select="//trainer">
                        <tr>
                            <td>
                                <xsl:value-of select="tname"/>
                            </td>
                            <th>
                                <xsl:value-of select="surname"/>
                            </th>
                            <th>
                                <xsl:value-of select="age"/>
                            </th>
                            <th>
                                <xsl:value-of select="hometown"/>
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
                    <xsl:for-each select="//pokemons/*">
                        <tr>
                            <td>
                                <xsl:value-of select="name"/>
                            </td>
                            <th>
                                <xsl:value-of select="type"/>
                            </th>
                            <th>
                                <xsl:value-of select="HP"/>
                            </th>
                            <th>
                                <xsl:value-of select="DEF"/>
                            </th>
                            <th>
                                <xsl:value-of select="ATK"/>
                            </th>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>

    </xsl:template>
</xsl:stylesheet>
