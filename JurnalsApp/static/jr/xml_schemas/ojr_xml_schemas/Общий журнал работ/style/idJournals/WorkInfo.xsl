<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:ct="http://v_16_2/types/CommonTypes.xsd"
  xmlns:cf="http://v_16_2/idJournals/WorkInfo.xsd">
  <xsl:output method="html" omit-xml-declaration="yes" />
  <xsl:param name="version" select="4.0"/>

    <xsl:template match="/">
      <xsl:apply-templates select="/cf:workInfo" />
  </xsl:template>
    
  <xsl:template match="/cf:workInfo">
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
          <title>Сведения о выполнении работ</title>
      <body>
        <h1>
          РАЗДЕЛ 3. Сведения о выполнении работ в процессе строительства, реконструкции, капитального ремонта объекта капитального строительства
        </h1>
        <table class="block-form">
          <tr>
            <th class="list" style="height:20pt ; width: 6%"> № п/п </th>
            <th class="list" style="height:20pt"> Дата выполнения работ </th>
            <th class="list" style="height:20pt"> Условия производства работ </th>
            <th class="list" style="height:20pt"> Наименование работ, выполняемых в процессе строительства, реконструкции, капитального ремонта объекта капитального строительства с указанием осей, рядов, отметов, пикетов, этажей, ярусов, секций, помещений, в которых выполнялись работы, сведения о методах выполнения работ, применяемых строительных материалах, изделиях и конструкциях, проведенных испытаниях конструкций, оборудования, систем, сетей и устройств (опробование вхолостую или под нагрузкой, подача электроэнергии, давления, испытания на прочность и герметичность) </th>
            <th class="list" style="height:20pt"> Должность (при наличии), фамилия, инициалы, подпись уполномоченного представителя лица, осуществляющего строительство, реконструкцию, капитальный ремонт </th>                     
          </tr>
          <tr>
            <th class="list" style="height:20pt"> 1 </th>
            <th class="list" style="height:20pt"> 2 </th>
            <th class="list" style="height:20pt"> 3 </th>
            <th class="list" style="height:20pt"> 4 </th>
            <th class="list" style="height:20pt"> 5 </th>
          </tr>
          <xsl:for-each select="cf:arrayInfo">
            <tr class="data">
              <td>
                <xsl:value-of select="position()"/>
              </td>
              <xsl:for-each select="cf:info">
                <td>
                  <xsl:call-template name="formatdate">
                    <xsl:with-param name="DateStr" select="cf:workRecordInfo/cf:workCompletionDate"/>
                  </xsl:call-template>
                </td>
                <td>
                  <xsl:value-of select="cf:workConditions"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="cf:testingsInfoList">
                      <xsl:for-each select="cf:testingsInfoList/cf:testingsInfoListItem">
                        <xsl:value-of select="ct:workName"/><xsl:text> </xsl:text>
                        <xsl:if test="ct:constructionStructureElement">
                          <xsl:value-of select="ct:constructionStructureElement/ct:structureElementName"/>
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <br/>
                        <xsl:if test="ct:workMethodsList">
                          <xsl:value-of select="ct:workMethodsList/ct:workMethodsListItem"/>
                          <br/>
                        </xsl:if>
                        <xsl:for-each select="ct:location">
                          <xsl:choose>
                            <xsl:when test="ct:obligatoryAxes">
                              <xsl:for-each select="ct:obligatoryAxes">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryRanks">
                              <xsl:for-each select="ct:obligatoryRanks">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryMarks">
                              <xsl:for-each select="ct:obligatoryMarks">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryFloors">
                              <xsl:for-each select="ct:obligatoryFloors">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryTiers">
                              <xsl:for-each select="ct:obligatoryTiers">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatorySections">
                              <xsl:for-each select="ct:obligatorySections">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryPremises">
                              <xsl:for-each select="ct:obligatoryPremises">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:place">
                              <xsl:value-of select="ct:place"/>
                            </xsl:when>
                          </xsl:choose>
                          <br/>
                        </xsl:for-each>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="cf:constructionWorksInfoList">
                      <xsl:for-each select="cf:constructionWorksInfoList/cf:constructionWorksInfoListItem">
                        <xsl:value-of select="ct:workName"/><xsl:text> </xsl:text>
                        <xsl:if test="ct:constructionStructureElement">
                          <xsl:value-of select="ct:constructionStructureElement/ct:structureElementName"/>
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <br/>
                        <xsl:if test="ct:workMethodsList">
                          <xsl:value-of select="ct:workMethodsList/ct:workMethodsListItem"/>
                          <br/>
                        </xsl:if>
                        <xsl:for-each select="ct:location">
                          <xsl:choose>
                            <xsl:when test="ct:obligatoryAxes">
                              <xsl:for-each select="ct:obligatoryAxes">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryRanks">
                              <xsl:for-each select="ct:obligatoryRanks">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryMarks">
                              <xsl:for-each select="ct:obligatoryMarks">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryFloors">
                              <xsl:for-each select="ct:obligatoryFloors">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryTiers">
                              <xsl:for-each select="ct:obligatoryTiers">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatorySections">
                              <xsl:for-each select="ct:obligatorySections">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:obligatoryPremises">
                              <xsl:for-each select="ct:obligatoryPremises">
                                <xsl:call-template name="location" />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="ct:place">
                              <xsl:value-of select="ct:place"/>
                            </xsl:when>
                          </xsl:choose>
                          <br/>
                        </xsl:for-each>
                      </xsl:for-each>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:if test="cf:usedMaterials">
                    При работе были применены:
                    <br/>
                    <xsl:value-of select="cf:usedMaterials/cf:usedMaterial/ct:name"/>
                  </xsl:if>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="../cf:signature">
                      <xsl:for-each select="cf:representative">
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

  <!-- Вывод времени в формате чч:мм-->
    
  <xsl:template
    name="formattime">
    <xsl:param name="TimeStr" />
    <xsl:variable name="hh">
      <xsl:value-of select="substring(string($TimeStr), 1, 2)" />
    </xsl:variable>
    <xsl:variable name="m">
      <xsl:value-of select="substring(string($TimeStr), 4, 2)" />
    </xsl:variable>
    <xsl:value-of select="concat($hh, ' час. ', $m,  ' мин.' )" />
    
  </xsl:template>

  <!-- Инициалы -->
  <xsl:template
    name="initials">
    <xsl:param name="NameStr" />
    <xsl:if test="$NameStr !=''">
      <xsl:variable name="i">
        <xsl:value-of select="substring($NameStr, 1, 1)" />
      </xsl:variable>
      <xsl:value-of select="concat($i, '.')" />
    </xsl:if>
  </xsl:template>   
  
  <xsl:template name="location">
    <xsl:if test="ct:axes">
      Ось:<xsl:value-of select="ct:axes"/>
    </xsl:if>
    <xsl:if test="ct:ranks">
      Ряд:<xsl:value-of select="ct:ranks"/>
    </xsl:if>
    <xsl:if test="ct:marks">
      Отметка:<xsl:value-of select="ct:marks"/>
    </xsl:if>
    <xsl:if test="ct:floors">
      Этаж:<xsl:value-of select="ct:floors"/>
    </xsl:if>
    <xsl:if test="ct:tiers">
      Ярус:<xsl:value-of select="ct:tiers"/>
    </xsl:if>
    <xsl:if test="ct:sections">
      Секция:<xsl:value-of select="ct:sections"/>
    </xsl:if>
    <xsl:if test="ct:premises">
      Помещение:<xsl:value-of select="ct:premises"/>
    </xsl:if>
  </xsl:template>
    
</xsl:stylesheet>