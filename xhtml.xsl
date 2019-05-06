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
                    <xsl:for-each select="Zadania/Zadanie">
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
