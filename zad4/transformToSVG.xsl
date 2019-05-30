<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg">

    <xsl:template match="/">
        <svg>
            <xsl:call-template name="title"/>
            <xsl:call-template name="chart"/>
        </svg>
    </xsl:template>
    <xsl:template name="title">
        <svg width="1920" height="1600">
            <text id="Title" x="0" y="0" style="font-family:Georgia; font-size:300%; font-weight: bold">
                Stats
                <animate attributeType="XML" attributeName="y" from="0" to="200" dur="2s" fill="freeze"/>
                <animate attributeType="XML" attributeName="x" from="0" to="200" dur="2s" fill="freeze"/>

            </text>
        </svg>
    </xsl:template>
    <xsl:template name="chart">
        <svg>
            <!--<g transform="translate(100 100)">-->
            <line x1="200" y1="600" x2="500" y2="600" stroke="black" stroke-width="2"/>
            <text x="130" y="330" style="font-family:Georgia; font-weight: bold;">Value</text>
            <line x1="200" y1="600" x2="200" y2="300" stroke="black" stroke-width="2"/>
            <text x="450" y="620" style="font-family:Georgia; font-weight: bold;">Stats type</text>

            <text x="320" y="620" fill="#535453" style="font-family:Georgia; font-weight: bold;">DEF</text>
            <text x="320" fill="#535453" style="font-family:Georgia; font-weight: bold;">
                <xsl:attribute name="y">
                    <xsl:value-of select="(599-(raport/statystyki/liczby/sredniDef)*4 )- 20"/>
                </xsl:attribute>
                <xsl:value-of select="(raport/statystyki/liczby/sredniDef)"/>
            </text>
            <text x="250" y="620" fill="#f6d809" style="font-family:Georgia; font-weight: bold;">HP</text>
            <text x="250" fill="#f6d809" style="font-family:Georgia; font-weight: bold;">
                <xsl:attribute name="y">
                    <xsl:value-of select="(599-(raport/statystyki/liczby/sredniHp)*4 )- 20"/>
                </xsl:attribute>
                <xsl:value-of select="(raport/statystyki/liczby/sredniHp)"/>
            </text>
            <text x="390" y="620" fill="#ff3939" style="font-family:Georgia; font-weight: bold;">ATK</text>
            <text x="390" fill="#ff3939" style="font-family:Georgia; font-weight: bold;">
                <xsl:attribute name="y">
                    <xsl:value-of select="(599-(raport/statystyki/liczby/sredniAtk)*4 )- 20"/>
                </xsl:attribute>
                <xsl:value-of select="(raport/statystyki/liczby/sredniAtk)"/>
            </text>
            <rect fill="#f6d809">
                <xsl:attribute name="x">
                    <xsl:value-of select="250"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="599-(raport/statystyki/liczby/sredniHp)*4"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:value-of select="50"/>
                </xsl:attribute>
                <animate attributeName="height" attributeType="XML" begin="0s" dur="2s" from="0" repeatCount="1"
                         fill="freeze">
                    <xsl:attribute name="to">
                        <xsl:value-of select="(raport/statystyki/liczby/sredniHp)*4"/>
                    </xsl:attribute>
                </animate>
            </rect>
            <!--</g>-->
            <rect fill="#535453">
                <xsl:attribute name="x">
                    <xsl:value-of select="320"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="599-(raport/statystyki/liczby/sredniDef)*4"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:value-of select="50"/>
                </xsl:attribute>
                <animate attributeName="height" attributeType="XML" begin="0s" dur="2s" from="0" repeatCount="1"
                         fill="freeze">
                    <xsl:attribute name="to">
                        <xsl:value-of select="(raport/statystyki/liczby/sredniDef)*4"/>
                    </xsl:attribute>
                </animate>
            </rect>
            <rect fill="#ff3939">
                <xsl:attribute name="x">
                    <xsl:value-of select="390"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="599-(raport/statystyki/liczby/sredniAtk)*4"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:value-of select="50"/>
                </xsl:attribute>
                <animate attributeName="height" attributeType="XML" begin="0s" dur="2s" to="0" repeatCount="1"
                         fill="freeze">
                    <xsl:attribute name="to">
                        <xsl:value-of select="(raport/statystyki/liczby/sredniAtk)*4"/>
                    </xsl:attribute>
                </animate>
            </rect>
        </svg>
    </xsl:template>
</xsl:stylesheet>