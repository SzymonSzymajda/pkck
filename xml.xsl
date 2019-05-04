<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="2.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="tablica_zadań/zadania"/>
        <xsl:apply-templates select="tablica_zadań/użytkownicy"/>

        <!--nie dziala w firefox-->
        <!--<xsl:element name="Data_raportu">-->
            <!--<xsl:value-of select="format-dateTime(current-dateTime(),'[D01]-[M01]-[Y0001]')" />-->
        <!--</xsl:element>-->
    </xsl:template>

    <xsl:template match="tablica_zadań/zadania">
        <xsl:element name="Statystyki_zadań">
            <xsl:element name="Łączna_liczba_zadań">
                <xsl:value-of select="count(tablica/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba_zadań_otwartych">
                <xsl:value-of select="count(tablica[@status='otwarte']/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba_zadań_realizowanych">
                <xsl:value-of select="count(tablica[@status='realizowane']/zadanie)"/>
            </xsl:element>
            <xsl:element name="Liczba_zadań_zamkniętych">
                <xsl:value-of select="count(tablica[@status='zamknięte']/zadanie)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tablica_zadań/użytkownicy">
        <xsl:param name="maxPensja" select="max(użytkownik/pensja)"/>
        <xsl:element name="Najwyższe_wynagrodzenie">
            <!--<xsl:value-of select="$maxPensja"/>-->
        </xsl:element>
        <xsl:element name="Najwięcej_zarabiający_pracownik">
            <xsl:for-each select="użytkownik">
                <xsl:if test="pensja = $maxPensja">
                    <xsl:value-of select="concat(imię, ' ', nazwisko)"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
        <xsl:element name="Najliczniejszy_dział">

        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
