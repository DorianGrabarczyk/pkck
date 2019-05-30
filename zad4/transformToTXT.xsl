<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:variable name="endl">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>


    <xsl:template match="/">
        <xsl:call-template name="Trainers"/>
        <xsl:call-template name="Pokemons"/>
        <xsl:call-template name="Stats"/>
    </xsl:template>

    <xsl:template name="Trainers">
        <xsl:value-of select="concat('Trainers', $endl)"/>
        <xsl:for-each select="//trainers/*">
            <xsl:value-of select="concat('Imie Trenera: ',tname,$tab)"/>
            <xsl:value-of select="concat($tab,'Nazwisko Trenera: ',surname,$tab)"/>
            <xsl:value-of select="concat($tab,'Wiek Trenera: ',age,$tab)"/>
            <xsl:value-of select="concat($tab,'Miasto Trenera: ',hometown,$endl)"/>
        </xsl:for-each>
        <xsl:value-of select="$endl"/>
    </xsl:template>
    <xsl:template name="Pokemons">
        <xsl:value-of select="concat('Pokemons', $endl)"/>
        <xsl:for-each select="//pokemons/*">
            <xsl:value-of select="concat('Nazwa Pokemona: ',name,$tab)"/>
            <xsl:value-of select="concat($tab,'Typ pokemona: ',type,$tab)"/>
            <xsl:value-of select="concat($tab,'HP : ',HP,$tab)"/>
            <xsl:value-of select="concat($tab,'DEF : ',DEF,$tab)"/>
            <xsl:value-of select="concat($tab,'ATK : ',ATK,$endl)"/>
        </xsl:for-each>
        <xsl:value-of select="$endl"/>
    </xsl:template>
    <xsl:template name="Stats">
        <xsl:value-of select="concat('Stats', $endl)"/>
            <xsl:value-of select="concat('Nazwa Pokemona: ',raport/statystyki/liczby/liczbaPokemonów,$tab)"/>
            <xsl:value-of select="concat($tab,'Typ pokemona: ',raport/statystyki/liczby/liczbaTrenerow,$tab)"/>
            <xsl:value-of select="concat($tab,'HP : ',raport/statystyki/liczby/sredniHp,$tab)"/>
            <xsl:value-of select="concat($tab,'DEF : ',raport/statystyki/liczby/sredniDef,$tab)"/>
            <xsl:value-of select="concat($tab,'ATK : ',raport/statystyki/liczby/sredniAtk,$endl)"/>
    </xsl:template>

</xsl:stylesheet>