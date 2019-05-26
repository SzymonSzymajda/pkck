<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:text>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------&#xA;</xsl:text>
		<xsl:text>| ID zadania |                         Tytuł                         |      Status      |      Imię      |      Nazwisko      |   Dział   |             Email             |&#xA;</xsl:text>
		<xsl:text>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------&#xA;</xsl:text>
		<xsl:for-each select="Raport/Zadania/Zadanie">
			<xsl:value-of select="concat('|   ',ID,substring('                        ',1,9 - string-length(ID)),
										 '|   ',Tytuł,substring('                                              ',1,52 - string-length(Tytuł)),
										 '|     ',Status,substring('                    ',1,13 - string-length(Status)),
										 '|      ',Imię,substring('                      ',1,10 - string-length(Imię)),
										 '|      ',Nazwisko,substring('                                      ',1,14 - string-length(Nazwisko)),
										 '|   ',Dział,substring('                                          ',1,8 - string-length(Dział)),
										 '|    ',Email,substring('                                         ',1,27 - string-length(Email))
										 )"/>
			<xsl:text>|&#xA;</xsl:text>
		<xsl:text>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------&#xA;</xsl:text>
		</xsl:for-each>
		
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:apply-templates select="Raport/Statystyki/Statystyki_zadań"/>
		
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:apply-templates select="Raport/Statystyki/Statystyki_pracowników"/>
	</xsl:template>
	
	<xsl:template match="Raport/Statystyki/Statystyki_zadań">
		<xsl:text>-------------------------------------&#xA;</xsl:text>
		<xsl:value-of select="concat('|  Łączna liczba zadań         | ', Łączna_liczba_zadań, substring('   ',1,3 - string-length(Łączna_liczba_zadań)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Liczba zadań otwartych      | ', Liczba_zadań_otwartych, substring('   ',1,3 - string-length(Liczba_zadań_otwartych)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Liczba zadań realizowanych  | ', Liczba_zadań_realizowanych, substring('   ',1,3 - string-length(Liczba_zadań_realizowanych)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Liczba zadań zamkniętych    | ', Liczba_zadań_zamkniętych, substring('   ',1,3 - string-length(Liczba_zadań_zamkniętych)), '|&#xA;')"/>
		<xsl:text>-------------------------------------&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="Raport/Statystyki/Statystyki_pracowników">
		<xsl:text>---------------------------------------------------------&#xA;</xsl:text>
		<xsl:value-of select="concat('|  Liczba pracowników                 |     ', Liczba_pracowników, substring('                ',1,12 - string-length(Liczba_pracowników)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Suma wynagrodzeń                   |     ', Suma_wynagrodzeń, substring('             ',1,12 - string-length(Suma_wynagrodzeń)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Całkowity koszt wynagrodzeń        |     ', Całkowity_koszt_wynagrodzeń, substring('             ',1,12 - string-length(Całkowity_koszt_wynagrodzeń)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Liczba pracowników w dziale WWA01  |     ', Liczba_pracowników_w_dziale_WWA01, substring('            ',1,12 - string-length(Liczba_pracowników_w_dziale_WWA01)), '|&#xA;')"/>
		<xsl:value-of select="concat('|  Liczba pracowników w dziale WWA02  |     ', Liczba_pracowników_w_dziale_WWA02, substring('            ',1,12 - string-length(Liczba_pracowników_w_dziale_WWA02)), '|&#xA;')"/>

		<xsl:value-of select="concat('|  Liczba pracowników w dziale LDZ01  |     ', Liczba_pracowników_w_dziale_LDZ01, substring('            ',1,12 - string-length(Liczba_pracowników_w_dziale_LDZ01)), '|&#xA;')"/>

		<xsl:value-of select="concat('|  Liczba pracowników w dziale WDS01  |     ', Liczba_pracowników_w_dziale_WDS01, substring('            ',1,12 - string-length(Liczba_pracowników_w_dziale_WDS01)), '|&#xA;')"/>

		<xsl:text>---------------------------------------------------------&#xA;</xsl:text>
	</xsl:template>
	
</xsl:stylesheet>
