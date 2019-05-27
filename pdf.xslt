<?xml version="1.0" encoding="ISO-8859-2"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Zadania" page-height="8.5in" page-width="11in" font-family="sans-serif">
					<fo:region-body region-name="only_region" margin="1in" background-color="white"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Podsumowanie" page-height="11in" page-width="8.5in" font-family="sans-serif">
					<fo:region-body region-name="only_region" margin="1in" background-color="white"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="Zadania">
				<fo:flow flow-name="only_region">
					<fo:table border="solid 2pt black">
						<fo:table-column column-width="1in"/>
						<fo:table-column column-width="2in"/>
						<fo:table-column column-width="1in"/>
						<fo:table-column column-width="1in"/>
						<fo:table-column column-width="1in"/>
						<fo:table-column column-width="1in"/>
						<fo:table-column column-width="2.5in"/>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-weight="bold">ID</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Tytuł</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Status</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Imię</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Nazwisko</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Dział</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Email</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="Raport/Zadania/Zadanie">
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="ID"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Tytuł"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Status"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Imię"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Nazwisko"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Dział"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block wrap-option="wrap">
											<xsl:value-of select="Email"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
			<fo:page-sequence master-reference="Podsumowanie">
				<fo:flow flow-name="only_region">
					<fo:block text-align="left" font-weight="bold" font-size="20">Zadania</fo:block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Łączna liczba zadań: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Łączna_liczba_zadań"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zadań otwartych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_otwartych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zadań realizowanych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_realizowanych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zadań zamkniętych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zadań/Liczba_zadań_zamkniętych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:block text-align="left" font-weight="bold" font-size="20" space-before="1em">Pracownicy</fo:block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracowników: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Suma wynagrodzeń: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Suma_wynagrodzeń"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Całkowity koszt wynagrodzeń: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Całkowity_koszt_wynagrodzeń"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracowników w dziale WWA01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracowników w dziale WWA02: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WWA02"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracowników w dziale LDZ01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_LDZ01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracowników w dziale WSD01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracowników/Liczba_pracowników_w_dziale_WDS01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
