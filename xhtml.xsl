<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <title>Raport aktualnych zadań</title>
            </head>
            <body style="background-color:#e5e5a2">
                <table border="2" style="text-align:center" >
                    <caption><b>Tabela z aktualnymi zadaniami</b></caption>
                    <tr>
                        <th id="a1">ID</th>
                        <th id="a2">Tytuł</th>
                        <th id="a3">Status</th>
                        <th id="a4">Dział</th>
                        <th id="a5">Imię pracownika</th>
                        <th id="a6">Nazwisko pracownika</th>
                        <th id="a7">Email pracownika</th>
                    </tr>
                    <xsl:for-each select="Raport/Zadania/Zadanie">
                        <tr>
                            <td headers="a1"><xsl:value-of select="ID"/></td>
                            <td headers="a2"><xsl:value-of select="Tytuł"/></td>
                            <td headers="a3"><xsl:value-of select="Status"/></td>
                            <td headers="a4"><xsl:value-of select="Imię"/></td>
                            <td headers="a5"><xsl:value-of select="Nazwisko"/></td>
                            <td headers="a6"><xsl:value-of select="Dział"/></td>
                            <td headers="a7"><xsl:value-of select="Email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table border="4" style="text-align:center">
                    <caption><b>Statystyki zadań</b></caption>
                    <tr>
                        <th id="z1">Łączna liczba zadań</th>
                        <td headers="z1"><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Łączna_liczba_zadań"/></td>
                    </tr>
                    <tr>
                        <th id="z2">Liczba zadań otwartych</th>
                        <td headers="z2"><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_otwartych"/></td>
                    </tr>
                    <tr>
                        <th id="z3">Liczba zadań realizowanych</th>
                        <td headers="z3"><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_realizowanych"/></td>
                    </tr>
                    <tr>
                        <th id="z4">Liczba zadań zamkniętych</th>
                        <td headers="z4"><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_zamkniętych"/></td>
                    </tr>
                </table>
                <table border="4" style="text-align:center">
                    <caption><b>Statystyki pracowników</b></caption>
                    <tr>
                        <th id="p1">Suma wynagrodzeń</th>
                        <td headers="p1"><xsl:value-of select="concat(Raport/Statystyki/Statystyki_pracowników/Suma_wynagrodzeń, ' zł')"/></td>
                    </tr>
                    <tr>
                        <th id="p2">Całkowity koszt wynagrodzeń</th>
                        <td headers="p2"><xsl:value-of select="concat(Raport/Statystyki/Statystyki_pracowników/Całkowity_koszt_wynagrodzeń, ' zł')"/></td>
                    </tr>
                    <tr>
                        <th id="p3">Łączna liczba pracowników</th>
                        <td headers="p3"><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników"/></td>
                    </tr>
                    <tr>
                        <th id="p4">Liczebność działu WWA01</th>
                        <td headers="p4"><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA01"/></td>
                    </tr>
                    <tr>
                        <th id="p5">Liczebność działu WWA02</th>
                        <td headers="p5"><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA02"/></td>
                    </tr>
                    <tr>
                        <th id="p6">Liczebność działu LDZ01</th>
                        <td headers="p6"><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_LDZ01"/></td>
                    </tr>
                    <tr>
                        <th id="p7">Liczebność działu WDS01</th>
                        <td headers="p7"><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WDS01"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
