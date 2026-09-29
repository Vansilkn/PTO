<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ct="http://v_16_2/types/CommonTypes.xsd"
    xmlns:cf="http://v_16_2/gsn/gsn35.xsd">
    <xsl:output method="html" omit-xml-declaration="yes" />
    <xsl:param name="version" select="4.0"/>

    <xsl:template match="/">

        <xsl:apply-templates select="/cf:gsn35" />

    </xsl:template>

    <xsl:template match="/cf:gsn35">


        <!-- Начало основного шаблона -->
        <html>
            <head>
                <style type="text/css">
                    h1 {
                    font-family: Times New Roman;
                    font-size: 14pt;
                    text-align:center;
                    font-weight: bold;
                    width: 100%;
                    margin-top: 0px;
                    }
                    h2 {
                    font-family: Times New Roman;
                    font-size: 12pt;
                    text-align:center;
                    font-weight: bold;
                    width: 100%;
                    margin-top: 0px;
                    }
                    p {
                    font-family: Times New Roman;
                    font-size: 14pt;
                    margin-bottom: 5px;
                    text-indent: 0px;
                    text-align: justify;
                    
                    }
                    body {
                    font-family: Times New Roman;
                    font-size: 14pt;
                    padding: 20px;
                    margin: 0 auto;
                    max-width:1600
                    }
                    .attachment{
                    margin:0cm;
                    margin-bottom:.0001pt;
                    font-size:10.0pt;
                    font-family:Times New Roman;
                    margin-left:290.6pt;
                    text-align:right;
                    }
                    .title {
                    font-size: 12pt;
                    text-align:center
                    }
                    .mso {
                    font-size: 12pt;
                    text-align:center
                    }
                    .under {
                    text-align:center;
                    font-size:9.0pt;
                    line-height:150%;
                    font-family:Times New Roman;
                    }
                    .data {
                    margin-bottom:1.0pt;
                    font-family: Times New Roman;
                    font-style: italic;
                    border-bottom: 1px solid;
                    font-size: 10pt;
                    text-align: center;
                    
                    flex-grow: 1; 
                    align-content: end;
                    }
                    .list {
                    font-size: 9pt;
                    }
                    .pagebreak {
                    page-break-before: always;
                    }
                    .str {
                    display: flex;  
                    }
                    table {
                    table-layout: fixed;
                    width: 98%;
                    border-collapse: collapse;
                    word-wrap: break-word;
                    
                    margin: 20pt 0 20pt 10pt;
                    }
                    .block-form{
                    border-collapse: collapse;
                    margin-top: 0;
                    margin-bottom: 0;
                    }
                    th {
                    border: 1pt solid #000000;
                    padding: 2;
                    font-weight: normal;
                    height:80pt;
                    }
                    td, th {
                    border: 1pt solid #000000;
                    padding: 2;
                    }
                    td .data {
                    border-bottom: 0 solid;
                    }
                </style>
            </head>
            <title>Сведения о государственном строительном надзоре</title>
            <body>
                <h1>РАЗДЕЛ 6. Сведения о государственном строительном надзоре при строительстве, реконструкции объекта капитального строительства</h1>
                <table class="block-form">
                    <tr>
                        <th class="list" style="height:20pt ; width: 6%"> № п/п </th>
                        <th class="list" style="height:20pt"> Дата контрольного (надзорного) мероприятия </th>
                        <th class="list" style="height:20pt"> Данные о проведенных органом государственного строительного надзора контрольных (надзорных) мероприятиях </th>
                        <th class="list" style="height:20pt"> Срок устранения выявленных нарушений </th> 
                        <th class="list" style="height:20pt"> Должность, фамилия, инициалы, подпись должностного лица </th> 
                        <th class="list" style="height:20pt"> Фактическая дата устранения выявленных нарушений </th> 
                        <th class="list" style="height:20pt"> Должность, фамилия, инициалы, подпись должностного лица </th> 
                    </tr>
                    <tr>
                        <th class="list" style="height:20pt"> 1 </th>
                        <th class="list" style="height:20pt"> 2 </th>
                        <th class="list" style="height:20pt"> 3 </th>
                        <th class="list" style="height:20pt"> 4 </th>
                        <th class="list" style="height:20pt"> 5 </th>
                        <th class="list" style="height:20pt"> 6 </th>
                        <th class="list" style="height:20pt"> 7 </th>
                    </tr>
                    <xsl:for-each select="cf:gsnInfo">
                        <xsl:for-each select="cf:infoAboutStateSupervisionList/cf:infoAboutStateSupervisionListItem">
                            <tr class="data">
                                <xsl:for-each select="cf:stateSupervisionSignedData">
                                    <xsl:for-each select="cf:infoAboutStateSupervisionSignedData">
                                        <td>
                                            <xsl:value-of select="cf:sequenceNumber"/>
                                        </td>
                                        <td>
                                            <xsl:call-template name="formatdate">
                                                <xsl:with-param name="DateStr" select="cf:controlEventActInfo/ct:date"/>
                                            </xsl:call-template>
                                        </td>
                                        <td>
                                            <xsl:value-of select="cf:controlEventRegistryNumber"/><xsl:text> </xsl:text>
                                            <xsl:for-each select="cf:controlEventActInfo">
                                                <xsl:value-of select="ct:name"/> 
                                                №
                                                <xsl:value-of select="ct:number"/>
                                                от
                                                <xsl:call-template name="formatdate">
                                                    <xsl:with-param name="DateStr" select="ct:date" />
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <xsl:if test="cf:controlEventResultsInfo">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="cf:controlEventResultsInfo"/>
                                            </xsl:if>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="cf:defectsFixingPlanDateInfo">
                                                    <xsl:call-template name="formatdate">
                                                        <xsl:with-param name="DateStr" select="cf:defectsFixingPlanDateInfo/cf:date"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    &#8212;
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="../cf:stateSupervisionOfficialSignature">
                                                    <xsl:for-each select="cf:stateSupervisionOfficialInfo">
                                                        <xsl:value-of select="ct:position" />
                                                        <br/>
                                                        <xsl:value-of select="ct:lastName" />
                                                        <xsl:text> </xsl:text>
                                                        <xsl:call-template name="initials">
                                                            <xsl:with-param name="NameStr" select="ct:firstName" />
                                                        </xsl:call-template>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:call-template name="initials">
                                                            <xsl:with-param name="NameStr" select="ct:middleName" />
                                                        </xsl:call-template>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    &#8212;
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </xsl:for-each>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="cf:defectsFixingFactDateInfo">
                                                <xsl:call-template name="formatdate">
                                                    <xsl:with-param name="DateStr" select="cf:defectsFixingFactDateInfo/cf:date"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                &#8212;
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="../cf:stateSupervisionOfficialSignature">
                                                <xsl:for-each select="cf:stateSupervisionOfficialInfo">
                                                    <xsl:value-of select="ct:position" />
                                                    <br/>
                                                    <xsl:value-of select="ct:lastName" />
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="initials">
                                                        <xsl:with-param name="NameStr" select="ct:firstName" />
                                                    </xsl:call-template>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="initials">
                                                        <xsl:with-param name="NameStr" select="ct:middleName" />
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                &#8212;
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    

    <!-- Вывод даты в формате ДД.ММ.ГГГГ-->
    <xsl:template name="formatdate">
        <xsl:param name="DateStr" />
        <xsl:variable name="dd">
            <xsl:value-of select="substring(string($DateStr), 9, 2)" />
        </xsl:variable>
        
        <xsl:variable name="mm">
            <xsl:value-of select="substring(string($DateStr), 6, 2)" />
        </xsl:variable>
        
        <xsl:variable name="yyyy">
            <xsl:value-of select="substring(string($DateStr), 1, 4)" />
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$mm = 01">
                <xsl:value-of select="concat('«', $dd, '» ', 'января ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 02">
                <xsl:value-of select="concat('«', $dd, '» ', 'февраля ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 03">
                <xsl:value-of select="concat('«', $dd, '» ', 'марта ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 04">
                <xsl:value-of select="concat('«', $dd, '» ', 'апреля ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 05">
                <xsl:value-of select="concat('«', $dd, '» ', 'мая ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 06">
                <xsl:value-of select="concat('«', $dd, '» ', 'июня ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 07">
                <xsl:value-of select="concat('«', $dd, '» ', 'июля', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 08">
                <xsl:value-of select="concat('«', $dd, '» ', 'августа ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 09">
                <xsl:value-of select="concat('«', $dd, '» ', 'сентября ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 10">
                <xsl:value-of select="concat('«', $dd, '» ', 'октября ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 11">
                <xsl:value-of select="concat('«', $dd, '» ', 'ноября ', $yyyy, ' г.' )" />
            </xsl:when>
            <xsl:when test="$mm = 12">
                <xsl:value-of select="concat('«', $dd, '» ', 'декабря ', $yyyy, ' г.' )" />
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    <!-- Вывод даты в формате ДД.ММ.ГГГГ чч:мм-->  
    <xsl:template name="formatdatetime">
        <xsl:param name="DateTimeStr" />
        
        <xsl:variable name="dd">
            <xsl:value-of select="substring(string($DateTimeStr), 9, 2)" />
        </xsl:variable>
        
        <xsl:variable name="mm">
            <xsl:value-of select="substring(string($DateTimeStr), 6, 2)" />
        </xsl:variable>
        
        <xsl:variable name="yyyy">
            <xsl:value-of select="substring(string($DateTimeStr), 1, 4)" />
        </xsl:variable>
        
        <xsl:variable name="hh">
            <xsl:value-of select="substring(string($DateTimeStr), 12, 2)" />
        </xsl:variable>
        
        <xsl:variable name="m">
            <xsl:value-of select="substring(string($DateTimeStr), 15, 2)" />
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$mm = 01">
                <xsl:value-of select="concat('«', $dd, '» ', 'января ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 02">
                <xsl:value-of select="concat('«', $dd, '» ', 'февраля ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 03">
                <xsl:value-of select="concat('«', $dd, '» ', 'марта ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 04">
                <xsl:value-of select="concat('«', $dd, '» ', 'апреля ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 05">
                <xsl:value-of select="concat('«', $dd, '» ', 'мая ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 06">
                <xsl:value-of select="concat('«', $dd, '» ', 'июня ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 07">
                <xsl:value-of select="concat('«', $dd, '» ', 'июля', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 08">
                <xsl:value-of select="concat('«', $dd, '» ', 'августа ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 09">
                <xsl:value-of select="concat('«', $dd, '» ', 'сентября ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 10">
                <xsl:value-of select="concat('«', $dd, '» ', 'октября ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 11">
                <xsl:value-of select="concat('«', $dd, '» ', 'ноября ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
            <xsl:when test="$mm = 12">
                <xsl:value-of select="concat('«', $dd, '» ', 'декабря ', $yyyy, ' г. ', $hh, ' час. ', $m,  ' мин.' )" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="initials">
        <xsl:param name="NameStr" />
        
        <xsl:if test="$NameStr !=''">
            <xsl:variable name="i">
                <xsl:value-of select="substring($NameStr, 1, 1)" />
            </xsl:variable>
            
            <xsl:value-of select="concat($i, '.')" />
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
