<div class="row">
  <div class="alert alert-info">
    <ul>
      <li class="h3">${uiLabelMap.WebtoolsResults}</li>
    </ul>
    <br class="clear"/>
  </div>
  <div class="screenlet-body">
    <#if resultMessage?has_content>
      ${resultMessage}
      <br />
    </#if>

    <#if columns?has_content>
        <table class="basic-table table-responsive hover-bar" cellspacing="0">
            <tr class="header-row">
            <#list columns as column>
                <td>${column}</td>
            </#list>
            </tr>
            <#if records?has_content>
            <#assign alt_row = false>
            <#list records as record>
                <tr <#if alt_row> class="alternate-row"</#if> >
                <#list record as field>
                    <td>${field!}</td>
                </#list>
                </tr>
                <#assign alt_row = !alt_row>
            </#list>
            </#if>
        </table>
    </#if>
  </div>
</div>
