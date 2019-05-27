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
									<fo:block font-weight="bold">Tytu�</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Status</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Imi�</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Nazwisko</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Dzia�</fo:block>
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
											<xsl:value-of select="Tytu�"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Status"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Imi�"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Nazwisko"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Dzia�"/>
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
								<fo:block>��czna liczba zada�: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zada�/��czna_liczba_zada�"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zada� otwartych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zada�/Liczba_zada�_otwartych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zada� realizowanych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zada�/Liczba_zada�_realizowanych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba zada� zamkni�tych: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_zada�/Liczba_zada�_zamkni�tych"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:block text-align="left" font-weight="bold" font-size="20" space-before="1em">Pracownicy</fo:block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracownik�w: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Liczba_pracownik�w"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Suma wynagrodze�: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Suma_wynagrodze�"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Ca�kowity koszt wynagrodze�: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Ca�kowity_koszt_wynagrodze�"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracownik�w w dziale WWA01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Liczba_pracownik�w_w_dziale_WWA01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracownik�w w dziale WWA02: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Liczba_pracownik�w_w_dziale_WWA02"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracownik�w w dziale LDZ01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Liczba_pracownik�w_w_dziale_LDZ01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block>
						<fo:list-item>
							<fo:list-item-label>
								<fo:block>Liczba pracownik�w w dziale WSD01: </fo:block>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:block margin-left="20em">
									<xsl:value-of select="Raport/Statystyki/Statystyki_pracownik�w/Liczba_pracownik�w_w_dziale_WDS01"/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
