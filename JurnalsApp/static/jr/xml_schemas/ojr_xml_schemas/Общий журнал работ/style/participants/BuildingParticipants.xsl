<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ct="http://v_16_2/types/CommonTypes.xsd"
    xmlns:cf="http://v_16_2/participants/BuildingParticipants.xsd"
    >
    <xsl:output method="html" omit-xml-declaration="yes" />
    <xsl:param name="version" select="4.0"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="/cf:buildingParticipants" />
    </xsl:template>

    <xsl:template match="/cf:buildingParticipants">
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
                <xsl:for-each select="/cf:buildingParticipants">
                    <xsl:for-each select="cf:buildingContractorRepresentatives">
                        <br/><h2>Уполномоченный представитель лица, осуществляющего строительство, реконструкцию, капитальный ремонт</h2>
                        <table>
                            <tr class="list">
                                <th style="width: 6%">N п/п</th>
                                <th>Фамилия, имя, отчество (последнее - при наличии)</th>
                                <th>Должность (при наличии)</th>
                                <th>Наименование, дата, номер документа, подтверждающего полномочие</th>
                                <th>Идентификационный номер в национальном реестре специалистов в области строительства (за исключением случаев, когда членство в
                                    саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства,
                                    реконструкции, капитального ремонта объектов капитального строительства не требуется)</th>
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
                            <xsl:for-each select="cf:buildingContractorRepresentativesList/cf:buildingContractorRepresentativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:buildingContractorRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:buildingContractorRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:value-of select="ct:position"/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:buildingContractorRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <p class="data">
                                            <xsl:for-each select="cf:buildingContractorRepresentativeWithSignature/ct:representativeSignedPart">
                                                <xsl:choose>
                                                    <xsl:when test="ct:specialistIdNumber">
                                                        <xsl:value-of select="ct:specialistIdNumber"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text>&#8212;</xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:buildingContractorRepresentativeWithSignature/ct:representativeSignedPart">
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
                        
                        <br/><h2>Уполномоченный представитель лица, осуществляющего строительство, реконструкцию, капитальный ремонт, по вопросам строительного контроля</h2>
                        <table>
                            <tr class="list">
                                <th style="width: 6%">N п/п</th>
                                <th>Фамилия, имя, отчество (последнее - при наличии)</th>
                                <th>Должность (при наличии)</th>
                                <th>Наименование, дата, номер документа, подтверждающего полномочие</th>
                                <th>Подпись</th>
                            </tr>
                            <tr class="list">
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                            </tr>
                            <xsl:for-each select="cf:constructionControlRepresentativesList/cf:constructionControlRepresentativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:constructionControlRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:constructionControlRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:value-of select="ct:position"/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:constructionControlRepresentativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:constructionControlRepresentativeWithSignature/ct:representativeSignedPart">
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
                    </xsl:for-each>
                    
                    <xsl:if test="cf:otherBuildingContractorRepresentativesList">
                        <br/><h2>Другие лица, осуществляющие строительство, реконструкцию, капитальный ремонт, их уполномоченные представители</h2>
                        <table>
                            <tr class="list">
                                <th style="width: 6%">N п/п</th>
                                <th>Фамилия, имя, отчество (последнее - при наличии), адрес места жительства, ОГРНИП, ИНН - для индивидуальных предпринимателей, полное и (или) сокращенное наименование, ОГРН, ИНН, место нахождения - для юридических лиц, фамилия, имя, отчество (последнее - при наличии) паспортные данные, адрес места жительства - для физических лиц, не являющихся индивидуальными предпринимателями</th>
                                <th>Фамилия, имя, отчество (последнее - при наличии), должность (при наличии) уполномоченного представителя лица, осуществляющего строительство, реконструкцию, капитальный ремонт, наименование, дата, номер документа, подтверждающего полномочие</th>
                                <th>Выполняемые работы по строительству, реконструкции, капитальному ремонту объекта капитального строительства</th>
                                <th>Подпись уполномоченного представителя лица, осуществляющего строительство, реконструкцию, капитальный ремонт</th>
                            </tr>
                            <tr class="list">
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                            </tr>
                            <xsl:for-each select="cf:otherBuildingContractorRepresentativesList/cf:otherBuildingContractorRepresentativesListItem/cf:representativesList/cf:representativesListItem">
                                <tr>
                                    <td>
                                        <p class="data">
                                            <xsl:value-of select="position()"/>
                                        </p>
                                    </td>
                                    <td>
                                        <!-- Информация из GeneralWorkJournal -->
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:representativeWithSignature/ct:representativeSignedPart">
                                            <p class="data">
                                                <xsl:call-template name="nameTempl">
                                                    <xsl:with-param name="Person" select="." />
                                                </xsl:call-template>
                                                <br/><xsl:value-of select="ct:position"/><br/>
                                                <xsl:call-template name="docDetailsTempl">
                                                    <xsl:with-param name="Doc" select="ct:administrativeDocument" />
                                                </xsl:call-template>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <!-- Информация из GeneralWorkJournal -->
                                    </td>
                                    <td>
                                        <xsl:for-each select="cf:representativeWithSignature/ct:representativeSignedPart">
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
                    
                    <br/><h2 class="section">РАЗДЕЛ 1<br/>
                    Список инженерно-технического персонала лица, осуществляющего строительство, реконструкцию, капитальный ремонт, занятого при строительстве, реконструкции, капитальном ремонте объекта капитального строительства</h2>
                    <table>
                        <col width="5%"/>
                        <col width="25%"/>
                        <tr class="list">
                            <th style="width: 6%">N п/п</th>
                            <th>Полное и (или) сокращенное наименование или фамилия, имя отчество (последнее - при наличии) лица, осуществляющего строительство, реконструкцию, капитальный ремонт</th>
                            <th>Фамилия, инициалы, должность (при наличии) лица, входящего в список инженерно-технического персонала</th>
                            <th>Дата начала работ на объекте капитального строительства с указанием вида работ</th>
                            <th>Дата окончания работ на объекте капитального строительства</th>
                            <th>Должность (при наличии), фамилия, инициалы, подпись уполномоченного представителя лица, осуществляющего строительство, реконструкцию, капитальный ремонт</th>
                        </tr>
                        <tr class="list">
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                        </tr>
                        <xsl:for-each select="cf:buildingContractorEngineersList/cf:buildingContractorEngineersListItem">
                            <tr>
                                <td>
                                    <p class="data">
                                        <xsl:value-of select="position()"/>
                                    </p>
                                </td>
                                <td>
                                    <xsl:for-each select="cf:buildingContractorEngineerSignedPart/cf:buildingContractorEngineerRepresentative">
                                        <p class="data">
                                            <xsl:value-of select="cf:buildingContractorOrganizationName"/>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="cf:buildingContractorEngineerSignedPart/cf:buildingContractorEngineerRepresentative">
                                        <p class="data">
                                            <xsl:call-template name="nameTempl">
                                                <xsl:with-param name="Person" select="cf:engineerRepresentative" />
                                            </xsl:call-template>
                                        </p>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="cf:buildingContractorEngineerSignedPart/cf:buildingContractorEngineerRepresentative">
                                        <xsl:for-each select="cf:workPeriod">
                                            <p class="data">
                                                <xsl:call-template name="formatdate">
                                                    <xsl:with-param name="DateStr" select="cf:dateStart" />
                                                </xsl:call-template><br/>
                                                <xsl:value-of select="../cf:workType"/>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="cf:buildingContractorEngineerSignedPart/cf:buildingContractorEngineerRepresentative">
                                        <xsl:for-each select="cf:workPeriod">
                                            <p class="data">
                                                <xsl:choose>
                                                    <xsl:when test="cf:dateEnd">
                                                        <xsl:call-template name="formatdate">
                                                            <xsl:with-param name="DateStr" select="cf:dateEnd" />
                                                        </xsl:call-template>   
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text>&#8212;</xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="cf:authorizedRepresentativeSignature">
                                            <xsl:for-each select="cf:buildingContractorEngineerSignedPart/cf:authorizedRepresentative">
                                                <p class="data">
                                                    <xsl:value-of select="ct:position"/><br/>
                                                    <xsl:call-template name="nameTempl">
                                                        <xsl:with-param name="Person" select="." />
                                                    </xsl:call-template>    
                                                </p>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>&#8212;</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
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