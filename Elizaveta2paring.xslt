<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
		<strong>
			Näitame kõik nimed
		</strong>

		<ul>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@saasta" order="descending"/>
				<!--desending - suuremast väiksemani-->
				<li>
					<xsl:value-of select="nimi"/>
					,
					<xsl:value-of select="@saasta"/>
					: 
					<xsl:value-of select="concat(nimi, ', ', @saasta)"/>
					, vanus:
					<xsl:value-of select="2025-@saasta"/>
				</li>
			</xsl:for-each>
		</ul>

		<strong>
			Kõik andmed tabelina
		</strong>
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
		<table border="1">
			<tr>
				<th>Nimi</th>
				<th>Laps</th>
				<th>Synniaasta</th>
				<th>Vanus</th>
				<th>Elizoveta vanus</th>
			</tr>
			<xsl:for-each select="//inimene">
			<tr>
				<td>
					<xsl:value-of select="../../nimi"/>
				</td>
				<td>
					<xsl:value-of select="nimi"/>
				</td>
				<td>
					<xsl:value-of select="@saasta"/>
				</td>
				<td>
					<xsl:value-of select="2025-@saasta"/>
				</td>
				<td>
					<xsl:if test="../..">
						<xsl:value-of select="@saasta - ../../@saasta"/>
					</xsl:if>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<strong>Iga inimese kohta näita mitmendal oma vanema sünniaastal ta sündis</strong>
		<ul>
			
		<xsl:for-each select="//inimene">
			<li>
				<xsl:value-of select="nimi"/>
				<xsl:if test="../..">
					- lapsevanemad vanus oli
					<xsl:value-of select="@saasta - ../../@saasta"/> aastad vana
				</xsl:if>
			</li>
			
		</xsl:for-each>
		</ul>

		<strong>
			<ol>
				<li>
				Count() - kogus -yldkogus- kõik nimed xmal jadas:
				<xsl:value-of select="count(//nimi)"/>
				</li>
				<li>
					substring()- eralda kolm esimest tähte nimest |
					<xsl:for-each select="//inimene">
				<xsl:value-of select="substring(nimi, 1, 3)"/> | 
					</xsl:for-each>
				</li>
				<li>
					substring()- eralda kolm viimast tähte nimest |
					<xsl:for-each select="//inimene">
					<xsl:value-of select="substring(nimi, string-length(nimi)-2, 3)"/> | 
					</xsl:for-each>
				</li>
				<li>
					starts-with
					<xsl:for-each select="//inimene[starts-with(nimi, 'E')]">
						<xsl:value-of select="nimi"/>, 
					</xsl:for-each>
				</li>
			</ol>
		</strong>
	</xsl:template>
</xsl:stylesheet>

