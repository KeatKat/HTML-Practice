<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="forecast">
        <html>
            <head>
                <title>Weather Forecast</title>
            </head>
            <body>
                <h1><xsl:value-of select="@queryLocation"/> [<xsl:value-of select="@queryTime"/>]</h1>

                <table border="1">
                    <tr style="text-align: center; background-color:yellow">
                        <th width="80px">Date</th>
                        <th width="110px">Mon</th>
                        <th width="110px">Tue</th>
                        <th width="110px">Wed</th>
                        <th width="110px">Thu</th>
                        <th width="110px">Fri</th>
                        <th width="110px">Sat</th>
                        <th width="110px">Sun</th>
                    </tr>
                    <xsl:apply-templates select="weather">
                        <xsl:sort select="@yyyymmdd" order="descending"/>
                    </xsl:apply-templates>              
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="weather">
        <tr style="text-align: center">
            <td height="135px" style="background-color:yellow">
                <xsl:value-of select="date"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="month"/>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Mon'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Tue'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Wed'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Thu'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Fri'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Sat'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="dayOfWeek = 'Sun'">
                    <xsl:call-template name="tableCell"/>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="month">
        <xsl:if test=". = 1">Jan</xsl:if>
        <xsl:if test=". = 2">Feb</xsl:if>
        <xsl:if test=". = 3">Mar</xsl:if>
        <xsl:if test=". = 4">Apr</xsl:if>
        <xsl:if test=". = 5">May</xsl:if>
        <xsl:if test=". = 6">Jun</xsl:if>
        <xsl:if test=". = 7">Jul</xsl:if>
        <xsl:if test=". = 8">Aug</xsl:if>
        <xsl:if test=". = 9">Sep</xsl:if>
        <xsl:if test=". = 10">Oct</xsl:if>
        <xsl:if test=". = 11">Nov</xsl:if>
        <xsl:if test=". = 12">Dec</xsl:if>
    </xsl:template>

    <xsl:template name="tableCell">
        <xsl:value-of select="highest"/>&#176; - <xsl:value-of select="lowest"/>&#176;
        <img>
            <xsl:attribute name="src">
            <xsl:value-of select="overallCode"/>
            <xsl:text>.png</xsl:text>
            </xsl:attribute>
        </img> <br/>
        <xsl:choose>
            <xsl:when test="overallCode = 'cloudy'">
                <span style="color:blue">
                     <xsl:value-of select="overall"/>
                </span>
            </xsl:when>
            <xsl:when test="overallCode = 'thunderstorm' or overallCode='rain'">
                <span style="color:green">
                     <xsl:value-of select="overall"/>
                </span>
            </xsl:when>
            <xsl:when test="overallCode = 'sunny'">
                <span style="color:red">
                     <xsl:value-of select="overall"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span style="color:purple">
                    <xsl:value-of select="overall"/>
               </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>