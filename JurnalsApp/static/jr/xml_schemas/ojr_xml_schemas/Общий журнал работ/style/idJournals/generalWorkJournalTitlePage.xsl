<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ct="http://v_16_2/types/CommonTypes.xsd"
    xmlns:cf="http://v_16_2/idJournals/generalWorkJournalTitlePage.xsd"
    >
    <xsl:output method="html" omit-xml-declaration="yes" />
    <xsl:param name="version" select="4.0"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="/cf:generalWorkJournalTitlePage" />
    </xsl:template>

    <xsl:template match="/cf:generalWorkJournalTitlePage">
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
            <title>Титульный лист общего журнала работ</title>
            <body>
                <h1>Общий журнал, в котором ведется учет выполнения работ по строительству, реконструкции, капитальному ремонту объекта капитального строительства</h1>
                <h1>
                    <xsl:if test="cf:docInfo/cf:number">
                        № <xsl:value-of select="cf:docInfo/cf:number"/>
                    </xsl:if>
                </h1>
                
                <div class="str">
                    <p class="list">по </p>
                    <p class="data"><xsl:value-of select="cf:constructionTypeName"/></p>
                </div>
                <p class="under">(указать строительство, реконструкция, капитальный ремонт)</p>
                <xsl:for-each select="cf:permanentObjectInfo">
                    <p class="data">
                        <xsl:value-of select="ct:permanentObjectName"/>
                    </p>
                    <p class="under">(наименование объекта капитального строительства, его почтовый или строительный адрес)</p>
                    <p class="data">
                        <xsl:for-each select="ct:permanentObjectAddress">
                            <xsl:choose>
                                <xsl:when test="ct:postalAddress">
                                    <xsl:for-each select="ct:postalAddress">
                                        <xsl:call-template name="postalAddress"/>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:when test="ct:constructionSiteAddress">
                                    <xsl:for-each select="ct:constructionSiteAddress">
                                        <xsl:call-template name="constructionSiteAddress"/>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </p>
                </xsl:for-each>
                <!-- Застройщик -->
                <xsl:for-each select="cf:developerWithRepresentatives">
                    <xsl:for-each select="cf:developer">
                        <p class="list">Застройщик </p>
                        <xsl:call-template name="orgTemplWithUnder">
                            <xsl:with-param name="Org" select="." />
                        </xsl:call-template>
                        <xsl:if test="ct:organization/ct:sro">
                            <xsl:for-each select="ct:organization/ct:sro">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо или индивидуальный предприниматель (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <h2>Уполномоченный представитель застройщика</h2>
                    
                    <xsl:for-each select="cf:developerRepresentativesIdsList">
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
                            <xsl:for-each select="cf:developerRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                  
                                    </td>
                                    <td>
                                       
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                    
                </xsl:for-each>
                <!-- Технический заказчик -->
                <xsl:for-each select="cf:technicalCustomerWithRepresentatives">
                    <xsl:for-each select="cf:technicalCustomer">
                        <p class="list">Технический заказчик </p>
                        <xsl:call-template name="orgTemplWithUnder">
                            <xsl:with-param name="Org" select="." />
                        </xsl:call-template>
                        <xsl:if test="ct:organizationInfo/ct:sro">
                            <xsl:for-each select="ct:organizationInfo/ct:sro">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <h2>Уполномоченный представитель технического заказчика</h2>
                    
                    <xsl:for-each select="cf:technicalCustomerRepresentativesIdsList">
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
                            <xsl:for-each select="cf:technicalCustomerRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                      
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                       
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                    
                </xsl:for-each>
                <!-- Лицо, ответственное за эксплуатацию здания, сооружения, или региональный оператор (заполняется в случае, если договор строительного подряда заключается с лицом, ответственным за эксплуатацию здания, сооружения, или региональным оператором) -->
                <xsl:for-each select="cf:operatingPersonWithRepresentatives">
                    <xsl:for-each select="cf:operatingPerson">
                        <p class="list">Лицо, ответственное за эксплуатацию здания, сооружения (заполняется в случае, если договор строительного подряда заключается с лицом, ответственным за эксплуатацию здания, сооружения) </p>
                        <xsl:call-template name="orgTemplWithUnder">
                            <xsl:with-param name="Org" select="." />
                        </xsl:call-template>
                        <xsl:if test="ct:organizationInfo/ct:sro">
                            <xsl:for-each select="ct:organizationInfo/ct:sro">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо или индивидуальный предприниматель (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <h2>Уполномоченный представитель лица, ответственного за эксплуатацию здания, сооружения (заполняется в случае, если договор строительного подряда заключается с лицом, ответственным за эксплуатацию здания, сооружения)</h2>
                    
                    <xsl:for-each select="cf:operatingPersonRepresentativesIdsList">
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
                            <xsl:for-each select="cf:operatingPersonRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                      
                                    </td>
                                    <td>
                                     
                                    </td>
                                    <td>
                                     
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                     
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                <!--Региональный оператор-->
                <xsl:for-each select="cf:regionalOperatorWithRepresentatives">
                    <xsl:for-each select="cf:regionalOperator">
                        <p class="list">Региональный оператор (заполняется в случае, если договор строительного подряда заключается с региональным оператором) </p>
                        <xsl:call-template name="orgTemplWithUnder">
                            <xsl:with-param name="Org" select="." />
                        </xsl:call-template>
                        <xsl:if test="ct:organizationInfo/ct:sro">
                            <xsl:for-each select="ct:organizationInfo/ct:sro">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо или индивидуальный предприниматель (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <h2>Уполномоченный представитель регионального оператора (заполняется в случае, если договор строительного подряда заключается с региональным оператором)</h2>
                    
                    <xsl:for-each select="cf:regionalOperatorRepresentativesIdsList">
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
                            <xsl:for-each select="cf:regionalOperatorRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                   
                                    </td>
                                    <td>
                                   
                                    </td>
                                    <td>
                                 
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                    
                </xsl:for-each>
                <!-- !Сведения о выданном разрешении на строительство -->
                <xsl:for-each select="cf:permissionToConstructionRoot">
                    <p class="list">Сведения о выданном разрешении на строительство (заполняется в случае, если разрешение на строительство требуется в соответствии со статьей 51 Градостроительного кодекса Российской Федерации (Собрание законодательства Российской Федерации, 2005, N 1, ст. 16; 2022, N 29, ст. 5317))</p>
                    <p class="data">
                        <xsl:call-template name="docDetailsTempl">
                            <xsl:with-param name="Doc" select="ct:docDetails" />
                        </xsl:call-template>
                    </p>
                    <p class="under">(номер, дата выдачи разрешения на строительство,</p>
                    <p class="data">
                        <xsl:value-of select="ct:executiveAuthorityName"/>
                    </p>
                    <p class="under">наименование органа исполнительной власти, государственной корпорации или органа местного самоуправления, выдавших разрешение)</p>
                </xsl:for-each>
                <!-- Лицо, осуществляющее подготовку проектной документации -->
                <xsl:for-each select="cf:projectDocumentationContractor">
                    <p class="list">Лицо, осуществляющее подготовку проектной документации </p>
                    <xsl:call-template name="orgTemplWithUnder">
                        <xsl:with-param name="Org" select="." />
                    </xsl:call-template>
                    <xsl:if test="ct:organizationInfo/ct:sro">
                        <xsl:for-each select="ct:organizationInfo/ct:sro">
                            <p class="data">
                                <xsl:value-of select="ct:name"/>
                                <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                            </p>
                            <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо или индивидуальный предприниматель (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
                
                <h2>Уполномоченный представитель лица, осуществляющего подготовку проектной документации, по вопросам проверки соответствия выполняемых работ проектной документации (далее - авторский надзор)</h2>
                <xsl:for-each select="cf:designerSupervisionRepresentativesList">
                    <table>
                        <tr class="list">
                            <th style="width: 6%">N п/п</th>
                            <th>Полное и (или) сокращенное наименование или фамилия, имя, отчество (последнее - при наличии) лица, осуществляющего подготовку проектной документации, сведения о разделах проектной документации, подготовленных этим лицом</th>
                            <th>Фамилия, имя, отчество (последнее - при наличии), должность (при наличии)</th>
                            <th>Наименование, дата, номер документа, подтверждающего полномочие</th>
                            <th>Идентификационный номер в национальном реестре специалистов в области архитектурно-строительного проектирования (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется)</th>
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
                        <xsl:for-each select="cf:designerSupervisionRepresentativesListItem/cf:representativesIdsList/cf:representativesIdsListItem">
                            <tr>
                                <td>
                                    <p class="data">
                                        <xsl:value-of select="position()"/>
                                    </p>
                                </td>
                                <td>
                                    <p class="data">
                                        <xsl:call-template name="orgTempl">
                                            <xsl:with-param name="Orgs" select="../../cf:organization" />
                                        </xsl:call-template>
                                    </p>
                                    <p class="data">
                                        <xsl:for-each select="../../cf:projectDocSectionsList/ct:projectDocSectionsListItem">
                                            <xsl:value-of select="ct:name"/> №
                                            <xsl:value-of select="ct:number"/>
                                            <xsl:if test="position() != last()">
                                                <xsl:text>, </xsl:text>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </p>
                                </td>
                                <td>
                              
                                </td>
                                <td>
                                
                                </td>
                                <td>
                         
                                </td>
                                <td>
                             
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                
                <!-- !Сведения об экспертизе проектной документации (Н) -->
                <xsl:for-each select="cf:projectDocumentationExaminationDetails">
                    <p class="list">Сведения о положительном заключении экспертизы проектной документации (заполняется в случае, если при строительстве, реконструкции объекта капитального строительства в соответствии со статьей 49 Градостроительного кодекса Российской Федерации (Собрание законодательства Российской Федерации, 2005, N 1, ст. 16; 2022, N 29, ст. 5317) проводится экспертиза проектной документации)</p>
                    <p class="data">
                        <xsl:call-template name="docDetailsTempl">
                            <xsl:with-param name="Doc" select="cf:expertiseConclusionRequisites" />
                        </xsl:call-template>
                    </p>
                    <p class="under">(номер и дата выдачи,</p>
                    <p class="data">
                        <xsl:value-of select="cf:executiveAuthorityName"/>
                    </p>
                    <p class="under">орган или организация, его утвердившие)</p>
                </xsl:for-each>
                <!-- Лицо, осуществляющее строительство, реконструкцию, капитальный ремонт -->
                <xsl:for-each select="cf:buildingContractorWithRepresentatives">
                    <xsl:for-each select="cf:buildingContractor">
                        <p class="list">Лицо, осуществляющее строительство, реконструкцию, капитальный ремонт </p>
                        <xsl:call-template name="orgTemplWithUnder">
                            <xsl:with-param name="Org" select="." />
                        </xsl:call-template>
                        <xsl:if test="ct:organizationInfo/ct:sro">
                            <xsl:for-each select="ct:organizationInfo/ct:sro">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН саморегулируемой организации, членом которой является указанное юридическое лицо или индивидуальный предприниматель (за исключением случаев, когда членство в саморегулируемых организациях в области инженерных изысканий, архитектурно-строительного проектирования, строительства, реконструкции, капитального ремонта объектов капитального строительства не требуется))</p>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <h2>Уполномоченный представитель лица, осуществляющего строительство, реконструкцию, капитальный ремонт</h2>
                    <xsl:for-each select="cf:buildingContractorRepresentativesIdsList">
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
                            <xsl:for-each select="cf:buildingContractorRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                 
                                    </td>
                                    <td>
                                     
                                    </td>
                                    <td>
                                   
                                    </td>
                                    <td>
                                    
                                    </td>
                                    <td>
                                   
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                    
                </xsl:for-each>
                
                <!-- Уполномоченный представитель застройщика по вопросам строительного контроля -->
                
                <xsl:for-each select="cf:developerWithRepresentatives"> 
                    <xsl:for-each select="cf:constructionControlRepresentativesList">
                        <br/><h2>Уполномоченный представитель застройщика по вопросам строительного контроля</h2>
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
                            <xsl:for-each select="cf:constructionControlRepresentativesListItem/cf:constructionControlRepresentativeId">
                                <tr>
                                    <td>
                                    
                                    </td>
                                    <td>
                                
                                    </td>
                                    <td>
                              
                                    </td>
                                    <td>
                          
                                    </td>
                                    <td>
                                
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- Уполномоченный представитель технического заказчика по вопросам строительного контроля -->
                
                <xsl:for-each select="cf:technicalCustomerWithRepresentatives">
                    <xsl:for-each select="cf:constructionControlRepresentativesList">
                        <br/><h2>Уполномоченный представитель технического заказчика по вопросам строительного контроля</h2>
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
                            <xsl:for-each select="cf:constructionControlRepresentativesListItem/cf:constructionControlRepresentativeId">
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                              
                                    </td>
                                    <td>
                                   
                                    </td>
                                    <td>
                                  
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- Уполномоченный представитель лица, ответственного за эксплуатацию здания, сооружения по вопросам строительного контроля -->
                
                <xsl:for-each select="cf:operatingPersonWithRepresentatives"> 
                    <xsl:for-each select="cf:constructionControlRepresentativesList">
                        <br/><h2>Уполномоченный представитель лица, ответственного за эксплуатацию здания, сооружения по вопросам строительного контроля</h2>
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
                            <xsl:for-each select="cf:constructionControlRepresentativesListItem/cf:constructionControlRepresentativeId">
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- Уполномоченный представитель регионального оператора по вопросам строительного контроля -->
                
                <xsl:for-each select="cf:regionalOperatorWithRepresentatives"> 
                    <xsl:for-each select="cf:constructionControlRepresentativesList">
                        <br/><h2>Уполномоченный представитель регионального оператора по вопросам строительного контроля</h2>
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
                            <xsl:for-each select="cf:constructionControlRepresentativesListItem/cf:constructionControlRepresentativeId">
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                
               <!--  Уполномоченный представитель лица, осуществляющего строительство, реконструкцию, капитальный ремонт, по вопросам строительного контроля -->
                
                <xsl:for-each select="cf:buildingContractorWithRepresentatives">
                    <xsl:for-each select="cf:constructionControlRepresentativesIdsList">
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
                            <xsl:for-each select="cf:constructionControlRepresentativesIdsListItem">
                                <tr>
                                    <td>
                                       
                                    </td>
                                    <td>
                                       
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                       
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
                
                 <!--Другие лица, осуществляющие строительство, реконструкцию, капитальный ремонт, их уполномоченные представители (Н) -->
                
                <xsl:for-each select="cf:otherDevelopersRepresentativesList">
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
                        <xsl:for-each select="cf:otherDevelopersRepresentativesListItem/cf:representativesIdsList/cf:representativesIdsListItem">
                            <tr>
                                <td>
                                    <p class="data">
                                        <xsl:value-of select="position()"/>
                                    </p>
                                </td>
                                <td>
                                    <p class="data">
                                        <xsl:call-template name="orgTempl">
                                            <xsl:with-param name="Orgs" select="../../cf:otherDeveloper" />
                                        </xsl:call-template>
                                    </p>
                                    <p class="data">
                                        <xsl:for-each select="../../cf:otherDeveloper/*/*/ct:address">
                                            Адрес: <xsl:call-template name="postalAddress"/>
                                        </xsl:for-each>
                                        
                                    </p>
                                </td>
                                <td>
                                  
                                </td>
                                <td>
                                    <p class="data">
                                        <xsl:for-each select="../../cf:workList/cf:work">
                                            <xsl:value-of select="."/>
                                            <xsl:if test="position() != last()">
                                                <xsl:text>, </xsl:text>
                                            </xsl:if> 
                                        </xsl:for-each>
                                    </p>
                                </td>
                                <td>
                                  
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                
                <!--Сведения о представителе государственного строительного надзора (Н)-->
                <xsl:for-each select="cf:stateSupervisoryAuthorityInfo">
                    <p class="list">Сведения о государственном строительном надзоре </p>
                    <xsl:for-each select="cf:supervisoryAuthorityInfo">
                        <p class="data">
                            <xsl:value-of select="ct:name"/>
                            <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                            <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                            <xsl:text> </xsl:text>
                            <xsl:for-each select="ct:address">
                                <xsl:call-template name="postalAddress"/>
                            </xsl:for-each>
                            <xsl:text> </xsl:text>
                            <xsl:for-each select="ct:contactInfo">
                                <xsl:call-template name="contactInfo"/>
                            </xsl:for-each>
                        </p>
                        <p class="under">(наименование органа государственного строительного надзора, почтовые реквизиты, телефон/факс, адрес электронной почты (при наличии)</p>
                    </xsl:for-each>
                    <xsl:for-each select="cf:supervisoryAuthorityOfficialPerson">
                        <p class="data">
                            <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:firstName"/><xsl:text> </xsl:text>
                            <xsl:if test="ct:middleName">
                                <xsl:value-of select="ct:middleName"/>
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="ct:position"/>
                        </p>
                        <p class="under">фамилия, имя, отчество (последнее - при наличии), должность должностного лица,</p>
                        <xsl:for-each select="ct:administrativeDocument">
                            <p class="data">
                                <xsl:call-template name="docDetailsTempl">
                                    <xsl:with-param name="Doc" select="." />
                                </xsl:call-template>
                            </p>
                            <p class="under">номер, дата приказа (распоряжения) о назначении должностного лица ответственным за осуществление государственного строительного надзора на объекте капитального строительства)</p>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- !Общие сведения об объекте капитального строительства -->
                <xsl:for-each select="cf:permanentObjectCommonInfo">
                    <p class="list">Общие сведения об объекте капитального строительства </p>
                    <p class="data">
                        <xsl:value-of select="../cf:permanentObjectInfo/ct:permanentObjectName"/>
                    </p>
                    <p class="under">(наименование объекта капитального строительства,</p>
                    <p class="data">
                        <xsl:value-of select="cf:projectCharacteristics"/>
                    </p>
                    <p class="under">краткие проектные характеристики объекта капитального строительства)</p>
                    <p class="list">Начало строительства, реконструкции, капитального ремонта объекта капитального строительства </p>
                    <p class="data">
                        <xsl:call-template name="formatdate">
                            <xsl:with-param name="DateStr" select="cf:constructionStartDate" />
                        </xsl:call-template>
                    </p>
                    <p class="under">(дата)</p>
                    <p class="list">Окончание строительства, реконструкции, капитального ремонта объекта капитального строительства </p>
                    <p class="data">
                        <xsl:call-template name="formatdate">
                            <xsl:with-param name="DateStr" select="cf:constructionEndDate" />
                        </xsl:call-template>
                    </p>
                    <p class="under">(дата)</p>
                </xsl:for-each>
                <!-- !Общие сведения об общем журнале работ (Н) -->
                <xsl:for-each select="cf:generalWorkJournalCommonInfo">
                    <xsl:for-each select="cf:generalWorkJournalCommonInfoSignedPart">
                        <p class="list">В настоящем журнале 
                            <span class="data">
                                <xsl:for-each select="cf:journalVolume">
                                    <xsl:value-of select="cf:value"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="cf:unit"/>
                                </xsl:for-each>
                            </span>
                            .
                        </p>
                        <p class="list">В журнале содержится учет выполнения работ с <span class="data">
                            <xsl:call-template name="formatdate">
                                <xsl:with-param name="DateStr" select="cf:worksPeriod/ct:beginDate" />
                            </xsl:call-template></span>
                            <xsl:if test="cf:worksPeriod/ct:endDate">
                                по <span class="data">
                                    <xsl:call-template name="formatdate">
                                        <xsl:with-param name="DateStr" select="cf:worksPeriod/ct:endDate" />
                                    </xsl:call-template></span>
                            </xsl:if>.</p>
                        <!-- Представитель -->
                        <xsl:if test="../cf:developerRepresentativeSignature">
                            <xsl:for-each select="cf:developerRepresentative">
                                <div style="display: flex; justify-content: space-between; align-items:baseline ; width: 100%; gap:3em">
                                    <div style="flex: 1;">
                                        <p class="data"><br/></p>
                                        <p class="under" >(подпись)</p> 
                                    </div>
                                    <div style="flex: 2;">
                                        <p class="data">
                                            <xsl:call-template name="nameTempl">
                                                <xsl:with-param name="Person" select="." />
                                            </xsl:call-template>
                                        </p>
                                        <p class="under" >(расшифровка подписи)</p> 
                                    </div>
                                    <div style="flex: 3;">
                                        <p class="data">
                                            <xsl:value-of select="ct:position"/></p>
                                        <p class="under">(должность (при наличии) - для застройщика или технического заказчика, являющегося юридическим лицом)</p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
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
    
    <xsl:template match="ct:passportDetails">
        <xsl:choose>
            <xsl:when test="ct:documentDetailsForeignCitizen">
                <xsl:for-each select="ct:documentDetailsForeignCitizen">
                    <xsl:value-of select="ct:docName"/><xsl:text> </xsl:text>
                    <xsl:if test="ct:series">
                        Серия:
                        <xsl:value-of select="ct:series"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    №<xsl:value-of select="ct:number"/> дата выдачи:
                    <xsl:call-template name="formatdate">
                        <xsl:with-param name="DateStr" select="ct:dateIssue" />
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="ct:passportDetailsRussianFederation">
                <xsl:for-each select="ct:passportDetailsRussianFederation">
                    серия:<xsl:value-of select="ct:series"/>
                    №<xsl:value-of select="ct:number"/> дата выдачи:
                    <xsl:call-template name="formatdate">
                        <xsl:with-param name="DateStr" select="ct:dateIssue" />
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="orgTemplWithUnder">
        <xsl:param name="Org"/>
        <xsl:choose>
            <xsl:when test="ct:organization">
                <xsl:for-each select="ct:organization">
                    <xsl:choose>
                        <xsl:when test="ct:legalEntity">
                            <xsl:for-each select="ct:legalEntity">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:address">
                                        <xsl:call-template name="postalAddress"/>
                                    </xsl:for-each>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:contactInfo">
                                        <xsl:call-template name="contactInfo"/>
                                    </xsl:for-each>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН, место нахождения юридического лица, телефон/факс, адрес электронной почты (при наличии))</p>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="ct:individualEntrepreneur">
                            <xsl:for-each select="ct:individualEntrepreneur">
                                <p class="data">
                                    <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                                    <xsl:value-of select="ct:firstName"/>
                                    <xsl:if test="ct:middleName">
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="ct:middleName"/>
                                    </xsl:if>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:address">
                                        <xsl:call-template name="postalAddress"/>
                                    </xsl:for-each>
                                    <xsl:text> ОГРНИП: </xsl:text><xsl:value-of select="ct:ogrnip"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(фамилия, имя, отчество (последнее - при наличии), адрес места жительства, ОГРНИП, ИНН индивидуального предпринимателя)</p>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="ct:organizationInfo">
                <xsl:for-each select="ct:organizationInfo">
                    <xsl:choose>
                        <xsl:when test="ct:legalEntity">
                            <xsl:for-each select="ct:legalEntity">
                                <p class="data">
                                    <xsl:value-of select="ct:name"/>
                                    <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:address">
                                        <xsl:call-template name="postalAddress"/>
                                    </xsl:for-each>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:contactInfo">
                                        <xsl:call-template name="contactInfo"/>
                                    </xsl:for-each>
                                </p>
                                <p class="under">(полное и (или) сокращенное наименование, ОГРН, ИНН, место нахождения юридического лица, телефон/факс, адрес электронной почты (при наличии))</p>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="ct:individualEntrepreneur">
                            <xsl:for-each select="ct:individualEntrepreneur">
                                <p class="data">
                                    <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                                    <xsl:value-of select="ct:firstName"/>
                                    <xsl:if test="ct:middleName">
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="ct:middleName"/>
                                    </xsl:if>
                                    <xsl:text> </xsl:text>
                                    <xsl:for-each select="ct:address">
                                        <xsl:call-template name="postalAddress"/>
                                    </xsl:for-each>
                                    <xsl:text> ОГРНИП: </xsl:text><xsl:value-of select="ct:ogrnip"/>
                                    <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                </p>
                                <p class="under">(фамилия, имя, отчество (последнее - при наличии), адрес места жительства, ОГРНИП, ИНН индивидуального предпринимателя)</p>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="ct:individual">
                <xsl:for-each select="ct:individual">
                    <p class="data">
                        <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                        <xsl:value-of select="ct:firstName"/>
                        <xsl:if test="ct:middleName">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="ct:middleName"/>
                        </xsl:if>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="ct:passportDetails" />
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:address">
                            <xsl:call-template name="postalAddress"/>
                        </xsl:for-each>
                        <xsl:for-each select="ct:contactInfo">
                            <xsl:call-template name="contactInfo"/>
                        </xsl:for-each>
                    </p>
                    <p class="under">(фамилия, имя, отчество (последнее - при наличии), паспортные данные, адрес места жительства, телефон/факс, адрес электронной почты (при наличии) - для физических лиц, не являющихся индивидуальными предпринимателями)</p>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="orgTempl">
        <xsl:param name="Orgs"/>
        <xsl:choose>
            <xsl:when test="$Orgs/ct:organization">
                <xsl:for-each select="$Orgs/ct:organization">
                    <xsl:choose>
                        <xsl:when test="ct:legalEntity">
                            <xsl:for-each select="ct:legalEntity">
                                <xsl:value-of select="ct:name"/>
                                <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="ct:individualEntrepreneur">
                            <xsl:for-each select="ct:individualEntrepreneur">
                                <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                                <xsl:value-of select="ct:firstName"/>
                                <xsl:if test="ct:middleName">
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ct:middleName"/>
                                </xsl:if>
                                <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                <xsl:text> ОГРНИП: </xsl:text><xsl:value-of select="ct:ogrnip"/>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Orgs/ct:organizationInfo">
                <xsl:for-each select="$Orgs/ct:organizationInfo">
                    <xsl:choose>
                        <xsl:when test="ct:legalEntity">
                            <xsl:for-each select="ct:legalEntity">
                                <xsl:value-of select="ct:name"/>
                                <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                <xsl:text> ОГРН: </xsl:text><xsl:value-of select="ct:ogrn"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="ct:individualEntrepreneur">
                            <xsl:for-each select="ct:individualEntrepreneur">
                                <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                                <xsl:value-of select="ct:firstName"/>
                                <xsl:if test="ct:middleName">
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ct:middleName"/>
                                </xsl:if>
                                <xsl:text> ИНН: </xsl:text><xsl:value-of select="ct:inn"/>
                                <xsl:text> ОГРНИП: </xsl:text><xsl:value-of select="ct:ogrnip"/>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Orgs/ct:individual">
                <xsl:for-each select="ct:individual">
                    <xsl:value-of select="ct:lastName"/><xsl:text> </xsl:text>
                    <xsl:value-of select="ct:firstName"/>
                    <xsl:if test="ct:middleName">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="ct:middleName"/>
                    </xsl:if>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="ct:passportDetails" />
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
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
    
    <xsl:template name="postalAddress">
        <xsl:choose>
            <xsl:when test="ct:stringAddress">
                <xsl:value-of select="ct:stringAddress"/>
            </xsl:when>
            <xsl:when test="ct:detalizedAddress">
                <xsl:for-each select="ct:detalizedAddress">
                    <xsl:value-of select="ct:country"/><xsl:text> </xsl:text>
                    <xsl:value-of select="ct:entityOfFederation"/><xsl:text> </xsl:text>
                    <xsl:value-of select="ct:districtOrRegionCode"/><xsl:text> </xsl:text>
                    <xsl:if test="ct:settlement">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="ct:settlement"/>
                    </xsl:if>
                    <xsl:if test="ct:locality">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:locality">
                            <xsl:value-of select="ct:localityType"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:localityName"/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ct:planningStructure">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:planningStructure">
                            <xsl:value-of select="ct:planningStructureElement"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:planningStructureObject"/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ct:roadNetwork">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:roadNetwork">
                            <xsl:value-of select="ct:roadNetworkElement"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:roadNetworkObject"/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ct:addressingObjectType">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="ct:addressingObjectType"/>
                    </xsl:if>
                    <xsl:if test="ct:plotNumber">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="ct:plotNumber"/>
                    </xsl:if>
                    <xsl:if test="ct:building">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:building">
                            <xsl:value-of select="ct:buildingType"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:buildingNumber"/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ct:room">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="ct:room">
                            <xsl:value-of select="ct:roomType"/><xsl:text> </xsl:text>
                            <xsl:value-of select="ct:roomNumber"/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ct:parkingSpaceNumber">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="ct:parkingSpaceNumber"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="ct:stringAddressFIAS">
                <xsl:for-each select="ct:stringAddressFIAS">
                    <xsl:value-of select="ct:stringAddress"/>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="contactInfo">
        <xsl:value-of select="ct:phone"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="ct:email"/>
    </xsl:template> 
        
    <xsl:template name="constructionSiteAddress">
        <xsl:value-of select="ct:country"/><xsl:text> </xsl:text>
        <xsl:for-each select="ct:entitysOfFederationList/ct:entitysOfFederationListItem">
            <xsl:value-of select="."/><xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="ct:districtOrRegionCodeList/ct:districtOrRegionCodeListItem">
            <xsl:value-of select="."/><xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:if test="ct:settlement">
            <xsl:text> </xsl:text>
            <xsl:value-of select="ct:settlement"/>
        </xsl:if>
        <xsl:if test="ct:locality">
            <xsl:text> </xsl:text>
            <xsl:for-each select="ct:locality">
                <xsl:value-of select="ct:localityType"/><xsl:text> </xsl:text>
                <xsl:value-of select="ct:localityName"/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ct:planningStructure">
            <xsl:text> </xsl:text>
            <xsl:for-each select="ct:planningStructure">
                <xsl:value-of select="ct:planningStructureElement"/><xsl:text> </xsl:text>
                <xsl:value-of select="ct:planningStructureObject"/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ct:roadNetwork">
            <xsl:text> </xsl:text>
            <xsl:for-each select="ct:roadNetwork">
                <xsl:value-of select="ct:roadNetworkElement"/><xsl:text> </xsl:text>
                <xsl:value-of select="ct:roadNetworkObject"/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ct:addressingObjectType">
            <xsl:text> </xsl:text>
            <xsl:value-of select="ct:addressingObjectType"/>
        </xsl:if>
        <xsl:if test="ct:plotNumber">
            <xsl:text> </xsl:text>
            <xsl:value-of select="ct:plotNumber"/>
        </xsl:if>
        <xsl:if test="ct:building">
            <xsl:text> </xsl:text>
            <xsl:for-each select="ct:building">
                <xsl:value-of select="ct:buildingType"/><xsl:text> </xsl:text>
                <xsl:value-of select="ct:buildingNumber"/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ct:room">
            <xsl:text> </xsl:text>
            <xsl:for-each select="ct:room">
                <xsl:value-of select="ct:roomType"/><xsl:text> </xsl:text>
                <xsl:value-of select="ct:roomNumber"/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ct:parkingSpaceNumber">
            <xsl:text> </xsl:text>
            <xsl:value-of select="ct:parkingSpaceNumber"/>
        </xsl:if>
        <xsl:if test="ct:arbitraryAddress">
            <xsl:text> </xsl:text>
            <xsl:value-of select="ct:arbitraryAddress"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>