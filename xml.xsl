<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="2.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="Raport">
            <xsl:element name="Zadania">
                <xsl:for-each select="tablica_zadań/zadania/tablica/zadanie">
                    <xsl:sort select="tytuł"/>
                    <xsl:element name="Zadanie">
                        <xsl:variable name="pracownik" select="@wykonawca"/>
                        <xsl:element name="ID">
                            <xsl:value-of select="@id"/>
                        </xsl:element>
                        <xsl:element name="Tytuł">
                            <xsl:value-of select="tytuł"/>
                        </xsl:element>
                        <xsl:element name="Status">
                            <xsl:value-of select="../@status"/>
                        </xsl:element>
                        <xsl:for-each select="../../../użytkownicy/użytkownik">
                            <xsl:if test="@id = $pracownik">
                                <xsl:element name="Imię">
                                    <xsl:value-of select="imię"/>
                                </xsl:element>
                                <xsl:element name="Nazwisko">
                                    <xsl:value-of select="nazwisko"/>
                                </xsl:element>
                                <xsl:element name="Dział">
                                    <xsl:value-of select="dział"/>
                                </xsl:element>
                                <xsl:element name="Email">
                                    <xsl:value-of select="email"/>
                                </xsl:element>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="Statystyki">
                <xsl:apply-templates select="tablica_zadań/zadania"/>
                <xsl:apply-templates select="tablica_zadań/użytkownicy"/>
            </xsl:element>
        </xsl:element>
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
        <xsl:param name="sumPensja" select="sum(użytkownik/pensja)"/>
        <xsl:element name="Statystyki_pracowników">
            <xsl:element name="Liczba_pracowników">
                <xsl:value-of select="count(użytkownik)"/>
            </xsl:element>
            <xsl:element name="Suma_wynagrodzeń">
                <xsl:value-of select="$sumPensja"/>
            </xsl:element>
            <xsl:element name="Całkowity_koszt_wynagrodzeń">
                <xsl:value-of select="$sumPensja*1.2"/>
            </xsl:element>
            <xsl:element name="Liczba_pracowników_w_dziale_WWA01">
                <xsl:value-of select="count(użytkownik[dział = 'WWA01'])"/>
            </xsl:element>
            <xsl:element name="Liczba_pracowników_w_dziale_WWA02">
                <xsl:value-of select="count(użytkownik[dział = 'WWA02'])"/>
            </xsl:element>
            <xsl:element name="Liczba_pracowników_w_dziale_LDZ01">
                <xsl:value-of select="count(użytkownik[dział = 'LDZ01'])"/>
            </xsl:element>
            <xsl:element name="Liczba_pracowników_w_dziale_WDS01">
                <xsl:value-of select="count(użytkownik[dział = 'WDS01'])"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
