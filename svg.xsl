<?xml version='1.0' encoding='UTF-8' ?> 
<!-- was: no XML declaration present -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:template match="Raport">
        <svg width="40cm" height="75cm"  xmlns="http://www.w3.org/2000/svg">

            <script type="text/ecmascript"> <![CDATA[
		    function markWithColor(evt) {
		      var rect = evt.target;
		      var currentFill = rect.getAttribute("fill");
		      if (currentFill=="#ff0000")
		        rect.setAttribute("fill", "#0000ff");
		      else
		        rect.setAttribute("fill", "#ff0000");
		   }
	  ]]> </script>

            
            <text x="55" y="55" font-family="Verdana" font-size="35" fill="blue" >
                Statusy zadań:
            </text>
            <xsl:for-each select="Zadania/Zadanie">
                <xsl:variable name="zad_pos" select="(position()-1) * 60"/>
                <xsl:variable name="status" select="Status"/>
                <text x="100" y="{$zad_pos + 180}" font-family="Verdana" font-size="30" fill="green" >
                    <xsl:value-of select="Tytuł"/>
                    <animate id="one" attributeType="XML" attributeName="opacity" from="0" to="1" fill="freeze" dur="2s"/>
                </text>
                <text onclick="markWithColor(evt)" x="750" y="{$zad_pos + 180}" font-family="Verdana" font-size="30" fill="#0000ff" opacity="0">
                    <xsl:value-of select="$status"/>
                    <animate attributeType="XML" attributeName="opacity" from="0" to="1" fill="freeze" dur="2s" begin="one.end"/>
                </text>
            </xsl:for-each>
            
            <text x="100" y="1200" font-family="Verdana" font-size="30" fill="blue">
                Statystyki zadań:
            </text>
            <xsl:for-each select="Statystyki/Statystyki_zadań/*">
                <xsl:variable name="stat_pos" select="(position()-1) * 60"/>
                <xsl:variable name="stat" select="."/>
                <xsl:variable name="stat_val" select="number(.) * 10"/>
                <text x="100" y="{$stat_pos + 1250}" font-family="Verdana" font-size="30" fill="green" opacity="0">
                    <animate id="two" attributeType="XML" attributeName="opacity" from="0" to="1" fill="freeze" dur="2s"/>
                    <xsl:value-of select="translate(local-name(), '_', ' ')"/>
                </text>
                <rect onclick="markWithColor(evt)" x="750" y="{$stat_pos + 1210}" height="30" width="0" fill="#0000ff" stroke="black" stroke-width="1">
                    <animate id="three" attributeType="XML" attributeName="width" from="0" to="{$stat_val}" dur="2s" fill="freeze" begin="two.end"/>
                </rect>
                <text x="{760 + $stat_val}" y="{$stat_pos + 1235}" font-family="Verdana" font-size="30" fill="green" opacity="0">
                    <animate attributeType="XML" attributeName="opacity" from="0" to="1" fill="freeze" dur="2s" begin="three.end"/>
                    <xsl:value-of select="$stat"/>
                </text>
            </xsl:for-each>
        </svg>
    </xsl:template>

</xsl:stylesheet>
