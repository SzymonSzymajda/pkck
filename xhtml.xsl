<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <title>Raport aktualnych zadań</title>
            </head>
            <body style="background-color:#d1e2ff">
                <table border="2" bgcolor="#6fa3f7" align="center" style="text-align:center" >
                    <caption><b>Tabela z aktualnymi zadaniami</b></caption>
                    <tr>
                        <th>ID</th>
                        <th>Tytuł</th>
                        <th>Status</th>
                        <th>Dział</th>
                        <th>Imię pracownika</th>
                        <th>Nazwisko pracownika</th>
                        <th>Email pracownika</th>
                    </tr>
                    <xsl:for-each select="Raport/Zadania/Zadanie">
                        <tr>
                            <td><xsl:value-of select="ID"/></td>
                            <td><xsl:value-of select="Tytuł"/></td>
                            <td><xsl:value-of select="Status"/></td>
                            <td><xsl:value-of select="Imię"/></td>
                            <td><xsl:value-of select="Nazwisko"/></td>
                            <td><xsl:value-of select="Dział"/></td>
                            <td><xsl:value-of select="Email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table border="4" align="center" style="text-align:center">
                    <caption><b>Statystyki zadań</b></caption>
                    <tr>
                        <th>Łączna liczba zadań</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Łączna_liczba_zadań"/></td>
                    </tr>
                    <tr>
                        <th>Liczba zadań otwartych</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_otwartych"/></td>
                    </tr>
                    <tr>
                        <th>Liczba zadań realizowanych</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_realizowanych"/></td>
                    </tr>
                    <tr>
                        <th>Liczba zadań zamkniętych</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_zamkniętych"/></td>
                    </tr>
                </table>
                <table border="4" style="text-align:center" align="center">
                    <caption><b>Statystyki zadań</b></caption>
                    <tr>
                        <th>Suma wynagrodzeń</th>
                        <td><xsl:value-of select="concat(Raport/Statystyki/Statystyki_pracowników/Suma_wynagrodzeń, ' zł')"/></td>
                    </tr>
                    <tr>
                        <th>Całkowity koszt wynagrodzeń</th>
                        <td><xsl:value-of select="concat(Raport/Statystyki/Statystyki_pracowników/Całkowity_koszt_wynagrodzeń, ' zł')"/></td>
                    </tr>
                    <tr>
                        <th>Łączna liczba pracowników</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników"/></td>
                    </tr>
                    <tr>
                        <th>Liczebność działu WWA01</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA01"/></td>
                    </tr>
                    <tr>
                        <th>Liczebność działu WWA02</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA02"/></td>
                    </tr>
                    <tr>
                        <th>Liczebność działu LDZ01</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_LDZ01"/></td>
                    </tr>
                    <tr>
                        <th>Liczebność działu WDS01</th>
                        <td><xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WDS01"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
