<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ct="http://v_16_2/types/CommonTypes.xsd"
    xmlns:cf="http://v_16_2/participants/Participants.xsd"
    >
    <xsl:output method="html" omit-xml-declaration="yes" />
    <xsl:param name="version" select="4.0"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="/cf:participants" />
    </xsl:template>

    <xsl:template match="/cf:participants">
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
                        margin-top: 1.5em;
                        text-align: justify;
                        
                    }
                    body {
                        font-family: Times New Roman;
                        font-size: 14pt;
                        padding: 20px;
                        margin: 0 auto;
                        max-width:1200
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
                        line-height: 0.9em;
                        margin:0cm;
                        margin-bottom:.0001pt;
                        text-autospace:none;
                        font-size:10.0pt;
                        font-family:"Times New Roman",serif;
                        margin-bottom:12.0pt;
                        text-align:center;
                        border:none;
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
                        font-size: 12pt;
                    }
                    table .list {
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
                        width: 100%;
                        border-collapse: collapse;
                        word-wrap: break-word;
                    }
                    td, th {
                        border: 1pt solid #000000;
                        padding: 2pt 0;
                        font-weight: normal;
                    }
                    td .data {
                        border-bottom: 0 solid;
                    }                    
                </style>
            </head>
            <title>Общий журнал работ</title>
            <body>
                <h2>Уполномоченный представитель застройщика</h2>
                <table>
                    <tr class="list">
                        <th style="width: 6%">N п/п</th>
                        <th>Фамилия, имя, отчество (последнее - при наличии)</th>
                        <th>Должность (при наличии)</th>
                        <th>Наименование, дата, номер документа, подтверждающего полномочие</th>
                        <th>Идентификационный номер в национальном реестре специалистов в области строительства (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется)</th>
                        <th>Подпись</th>
                    </tr>
                    <tr class="list">
                        <th>1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                        <th>6</th>
                    </tr>
                    <xsl:choose>
                        <xsl:when test="cf:developerRepresentatives">
                            <xsl:for-each select="cf:developerRepresentatives/cf:developerRepresentativesList/cf:developerRepresentativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:value-of select="ct:position"/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:choose>
                                                    <xsl:when test="ct:specialistIdNumber">
                                                        <xsl:value-of select="ct:specialistIdNumber"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text>&#8212;</xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:if test="../ct:signature">
                                                    <xsl:call-template name="nameTempl">
                                                        <xsl:with-param name="Person" select="." />
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="cf:operatingPersonRepresentatives">
                            <xsl:for-each select="cf:operatingPersonRepresentatives/cf:operatingPersonRepresentativesList/cf:operatingPersonRepresentativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:value-of select="ct:position"/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:text>&#8212;</xsl:text>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:if test="../ct:signature">
                                                    <xsl:call-template name="nameTempl">
                                                        <xsl:with-param name="Person" select="." />
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="cf:regionalOperatorRepresentatives">
                            <xsl:for-each select="cf:regionalOperatorRepresentatives/cf:regionalOperatorRepresentativesList/cf:regionalOperatorRepresentativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:value-of select="ct:position"/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:text>&#8212;</xsl:text>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:if test="../ct:signature">
                                                    <xsl:call-template name="nameTempl">
                                                        <xsl:with-param name="Person" select="." />
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </table>
                
                <xsl:if test="cf:technicalCustomerRepresentatives">
                    <br/><h2>Уполномоченный представитель технического заказчика</h2>
                    <table>
                        <tr class="list">
                            <th style="width: 6%">N п/п</th>
                            <th>Фамилия, имя, отчество (последнее - при наличии)</th>
                            <th>Должность (при наличии)</th>
                            <th>Наименование, дата, номер документа, подтверждающего полномочие</th>
                            <th>Идентификационный номер в национальном реестре специалистов в области строительства (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется)</th>
                            <th>Подпись</th>
                        </tr>
                        <tr class="list">
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                        </tr>
                        <xsl:for-each select="cf:technicalCustomerRepresentatives/cf:technicalCustomerRepresentativesList/cf:technicalCustomerRepresentativesListItem">
                            <tr>
                                <td>
                                    <p class="data">
                                        <xsl:value-of select="position()"/>
                                    </p>
                                </td>
                                <td>
                                    <xsl:for-each select="ct:representativeSignedPart">
                                        <p class="data">
                                            <xsl:call-template name="nameTempl">
                                                <xsl:with-param name="Person" select="." />
                                            </xsl:call-template>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="ct:representativeSignedPart">
                                        <p class="data">
                                            <xsl:value-of select="ct:position"/>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="ct:representativeSignedPart">
                                        <p class="data">
                                            <xsl:call-template name="docDetailsTempl">
                                                <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                            </xsl:call-template>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="ct:representativeSignedPart">
                                        <p class="data">
                                            <xsl:choose>
                                                <xsl:when test="ct:specialistIdNumber">
                                                    <xsl:value-of select="ct:specialistIdNumber"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>&#8212;</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="ct:representativeSignedPart">
                                        <p class="data">
                                            <xsl:if test="../ct:signature">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </xsl:if>
                                        </p>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:if>
                
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
    
    <!-- Инициалы -->
    <xsl:template name="initials">
        <xsl:param name="NameStr" />
        
        <xsl:if test="$NameStr !=''">
            <xsl:variable name="i">
                <xsl:value-of select="substring($NameStr, 1, 1)" />
            </xsl:variable>
            
            <xsl:value-of select="concat($i, '.')" />
        </xsl:if>
    </xsl:template>

    <!-- Фамилия И.О. -->
    <xsl:template name="nameTempl">
        <xsl:param name="Person"/>
        <xsl:value-of select="$Person/ct:lastName"/><xsl:text> </xsl:text>
        <xsl:call-template name="initials">
            <xsl:with-param name="NameStr" select="$Person/ct:firstName" />
        </xsl:call-template>
        <xsl:if test="$Person/ct:middleName">
            <xsl:call-template name="initials">
                <xsl:with-param name="NameStr" select="$Person/ct:middleName" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!--Реквизиты документов: name № number от «ДД.» ММ.ГГГГ г.-->
    <xsl:template name="docDetailsTempl">
        <xsl:param name="Doc"/>
        <xsl:value-of select="$Doc/ct:name"/> №
        <xsl:value-of select="$Doc/ct:number"/> 
        от 
        <xsl:call-template name="formatdate">
            <xsl:with-param name="DateStr" select="$Doc/ct:date" />
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>