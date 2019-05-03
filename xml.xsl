<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="Statystyki">
            <xsl:element name="Łączna liczba zadań">
                <xsl:value-of select="count(tablica_zadań/zadania/tablica/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba zadań otwartych">
                <xsl:value-of select="count(tablica_zadań/zadania/tablica[@status='otwarte']/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba zadań realizowanych">
                <xsl:value-of select="count(tablica_zadań/zadania/tablica[@status='realizowane']/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba zadań zamkniętych">
                <xsl:value-of select="count(tablica_zadań/zadania/tablica[@status='zamknięte']/zadanie)"/>
            </xsl:element>


        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
