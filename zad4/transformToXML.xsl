<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:pokedex="http://www.przyklad.pl/pokedex"
        exclude-result-prefixes="pokedex"
>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="pokedex:pokedex">
        <raport>
            <trainers>
                <xsl:apply-templates select="//trainers"/>
            </trainers>
            <pokemons>
                <xsl:apply-templates select="//pokemons"/>
            </pokemons>
            <statystyki>
                <liczby>
                    <liczbaTrenerow>
                        <xsl:value-of select="count(trainers/trainer)"/>
                    </liczbaTrenerow>
                    <liczbaPokemonów>
                        <xsl:value-of select="count(pokemons/pokemon)"/>
                    </liczbaPokemonów>
                    <sredniAtk>
                        <xsl:variable name="sum" select="sum(pokemons/pokemon/stats/ATK)"/>
                        <xsl:variable name="ccount" select="count(pokemons/pokemon)"/>
                        <xsl:variable name="avg" select="($sum div $ccount)"/>
                        <xsl:value-of select="format-number($avg,'0.00')"/>
                    </sredniAtk>
                    <sredniHp>
                        <xsl:variable name="sum" select="sum(pokemons/pokemon/stats/HP)"/>
                        <xsl:variable name="ccount" select="count(pokemons/pokemon)"/>
                        <xsl:variable name="avg" select="($sum div $ccount)"/>
                        <xsl:value-of select="format-number($avg,'0.00')"/>
                    </sredniHp>
                    <sredniDef>
                        <xsl:variable name="sum" select="sum(pokemons/pokemon/stats/DEF)"/>
                        <xsl:variable name="ccount" select="count(pokemons/pokemon)"/>
                        <xsl:variable name="avg" select="($sum div $ccount)"/>
                        <xsl:value-of select="format-number($avg,'0.00')"/>
                    </sredniDef>
                </liczby>
                <pokemonyAsha>
                    <xsl:for-each select=" pokemons/pokemon[@trainerid='t1']">
                        <xsl:sort order="descending"/>
                        <poke>
                            <xsl:value-of select="name"/>
                        </poke>
                    </xsl:for-each>
                </pokemonyAsha>
                <pokemonyBrocka>
                    <xsl:for-each select="pokemons/pokemon[@trainerid='t2']">
                        <poke>
                            <xsl:value-of select="name"/>
                        </poke>
                    </xsl:for-each>
                </pokemonyBrocka>
                <pokemonyMisty>
                    <xsl:for-each select="pokemons/pokemon[@trainerid='t3']">
                        <poke>
                            <xsl:value-of select="name"/>
                        </poke>
                    </xsl:for-each>
                </pokemonyMisty>
                <pokemonyGarego>
                    <xsl:for-each select="pokemons/pokemon[@trainerid='t4']">
                        <poke>
                            <xsl:value-of select="name"/>
                        </poke>
                    </xsl:for-each>
                </pokemonyGarego>
                <najwyzszeEwolucje>
                    <xsl:for-each select="pokemons/pokemon">
                        <xsl:if test="@id mod 3 &lt; 1">
                            <poke>
                                <xsl:value-of select="name"/>
                            </poke>
                        </xsl:if>
                    </xsl:for-each>
                </najwyzszeEwolucje>
                <autorzy>
                    <xsl:for-each select="metainfo/datas">
                        <xsl:for-each select="*">
                            <autor>
                                <xsl:value-of select="."/>
                            </autor>
                        </xsl:for-each>
                    </xsl:for-each>
                </autorzy>
            </statystyki>
        </raport>
    </xsl:template>
    <xsl:template match="trainers">
        <xsl:for-each select="trainer">
            <xsl:sort select="surname" order="descending"/>
            <trainer>
                <tname>
                    <xsl:value-of select="tname"/>
                </tname>
                <surname>
                    <xsl:value-of select="surname"/>
                </surname>
                <age>
                    <xsl:value-of select="age"/>
                </age>
                <gender>
                    <xsl:value-of select="gender"/>
                </gender>
                <region>
                    <xsl:value-of select="region"/>
                </region>
                <hometown>
                    <xsl:value-of select="hometown"/>
                </hometown>
                <class>
                    <xsl:value-of select="class"/>
                </class>
            </trainer>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="pokemons">
        <xsl:for-each select="pokemon">
            <xsl:sort select="name" order="descending"/>
            <pokemon>
                <name>
                    <xsl:value-of select="name"/>
                </name>
                <type>
                    <xsl:value-of select="type"/>
                </type>
                <HP>
                    <xsl:value-of select=" stats/HP"/>
                </HP>
                <DEF>
                    <xsl:value-of select="stats/DEF"/>
                </DEF>
                <ATK>
                    <xsl:value-of select="stats/ATK"/>
                </ATK>
            </pokemon>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
