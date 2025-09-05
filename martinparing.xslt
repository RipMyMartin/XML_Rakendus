<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<strong>Näitame kõik nimed</strong>
		<style>
			table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
			}
			td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
			}
			tr:nth-child(even) {
			background-color: #dddddd;
			}
		</style>

		<h2>Inimesed ja nende lapsed</h2>
		<table border="1">
			<tr>
				<th>Nimi</th>
				<th>Elukoht</th>
				<th>Sünniaasta</th>
				<th>Vanus</th>
				<th>Laste arv</th>
			</tr>

			<xsl:for-each select="//inimene">
				<tr>
					<xsl:if test="count(Lapsed/inimene) &gt;= 2">
						<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					</xsl:if>

					<td>
						<xsl:choose>
							<xsl:when test="contains(nimi, S)">
								<span style="color: red;">
									<xsl:value-of select="nimi"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="nimi"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>

					<td>
						<xsl:value-of select="elukoht"/>
					</td>

					<td>
						<xsl:value-of select="@saasta"/>
					</td>

					<td>
						<xsl:value-of select="2025 - @saasta"/>
					</td>

					<td>
						<xsl:value-of select="count(Lapsed/inimene)"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
