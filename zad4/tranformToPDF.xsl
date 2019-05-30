<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="raport" page-height="auto" page-width="auto">
                    <fo:region-body region-name="region" margin="0.75in" background-color="#FFFFFF"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="raport">
                <fo:flow flow-name="region">
                    <fo:block padding-bottom="5px" text-align="center">
                        <fo:inline font-size="25px" font-weight="bold">
                            Pokedex
                        </fo:inline>
                    </fo:block>
                    <fo:block padding-bottom="5px" text-align="center">
                        <fo:inline font-size="25px" font-weight="bold">
                            Trenerzy
                        </fo:inline>
                    </fo:block>
                    <xsl:call-template name="Trainers"/>
                    <fo:block padding="5px" text-align="center">
                        <fo:inline font-size="25px" font-weight="bold">
                            Pokemony
                        </fo:inline>
                    </fo:block>
                    <xsl:call-template name="Pokemons"/>
                    <fo:block padding-top="5px" text-align="center">
                        <fo:inline font-size="25px" font-weight="bold">
                            Statystyki
                        </fo:inline>
                    </fo:block>
                    <xsl:call-template name="Stats"/>
                    <fo:block padding-top="5px" text-align="center">
                        <fo:inline font-size="25px" font-weight="bold">
                            Pokemony trenerów
                        </fo:inline>
                    </fo:block>
                    <xsl:call-template name="TrainersPokes"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template name="Trainers">
        <fo:table border="1.0pt solid black" table-layout="fixed" width="100%">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">
                            Imie
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Nazwisko</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Wiek</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Miasto</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="//trainers/*">
                    <fo:table-row>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="tname"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="surname"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="age"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="hometown"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    <xsl:template name="Pokemons">
        <fo:table page-break-after="always" border="1.0pt solid black" table-layout="fixed" width="100%">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">
                            Nazwa
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Typ</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">HP</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">DEF</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">ATK</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="//pokemons/*">
                    <fo:table-row>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="name"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="type"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="HP"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="DEF"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                            <fo:block>
                                <xsl:value-of select="ATK"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    <xsl:template name="Stats">
        <fo:table border="1.0pt solid black" table-layout="fixed" width="100%">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Nazwa Statystki</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                        <fo:block font-weight="bold" text-align="center">Liczba</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            Ilosc pokemonów
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            <xsl:value-of select="raport/statystyki/liczby/liczbaPokemonów"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            Liczba trenerow
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            <xsl:value-of select="raport/statystyki/liczby/liczbaTrenerow"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            Sredni Atak
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            <xsl:value-of select="raport/statystyki/liczby/sredniAtk"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            Srednie HP
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            <xsl:value-of select="raport/statystyki/liczby/sredniHp"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            Sredni Def
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                        <fo:block>
                            <xsl:value-of select="raport/statystyki/liczby/sredniDef"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    <xsl:template name="TrainersPokes">
        <fo:block>
            <fo:inline-container inline-progression-dimension="49.9%">
                <fo:table page-break-after="always" border="1.0pt solid black" table-layout="fixed" width="100%">
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                                <fo:block font-weight="bold" text-align="center">
                                    Pokemony Asha
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <xsl:for-each select="//raport/statystyki/pokemonyAsha/*">
                            <fo:table-row>
                                <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                                    <fo:block>
                                        <xsl:value-of select="."/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
                <fo:table page-break-after="always" border="1.0pt solid black" table-layout="fixed" width="100%">
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                                <fo:block font-weight="bold" text-align="center">
                                    Pokemony Brocka
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <xsl:for-each select="//raport/statystyki/pokemonyBrocka/*">
                            <fo:table-row>
                                <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                                    <fo:block>
                                        <xsl:value-of select="."/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
                <fo:table page-break-after="always" border="1.0pt solid black" table-layout="fixed" width="100%">
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                                <fo:block font-weight="bold" text-align="center">
                                    Pokemony Misty
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <xsl:for-each select="//raport/statystyki/pokemonyMisty/*">
                            <fo:table-row>
                                <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                                    <fo:block>
                                        <xsl:value-of select="."/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
                <fo:table page-break-after="always" border="1.0pt solid black" table-layout="fixed" width="100%">
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell padding="5pt" border="1.0pt solid black" background-color="#547fc4">
                                <fo:block font-weight="bold" text-align="center">
                                    Pokemony Garego
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <xsl:for-each select="//raport/statystyki/pokemonyGarego/*">
                            <fo:table-row>
                                <fo:table-cell padding="5pt" text-align="center" border="1.0pt solid black">
                                    <fo:block>
                                        <xsl:value-of select="."/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
            </fo:inline-container>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>