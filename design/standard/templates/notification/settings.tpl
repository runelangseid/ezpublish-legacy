
<form method="post" action={"/notification/settings/"|ezurl}>

<div class="maincontentheader">
<h1>{"Notification settings"|i18n("design/standard/section")}</h1>
</div>

{let handlers=fetch('notification','handler_list')}

    <p>
    {section name=Handlers loop=$handlers}
        {*Handler: {$Handlers:item.name}*}
        {include handler=$Handlers:item uri=concat( "design:notification/handler/",$Handlers:item.id_string,"/settings/edit.tpl")}
        {delimiter}<br/>{/delimiter}
    {/section}
    </p>
{/let}

<div>
<input class="button" type="submit" name="Store" value="{'Store'|i18n('design/standard/notification')}" />
<input class="button" type="submit" name="Cancel" value="{'Cancel'|i18n('design/standard/notification')}" />
</div>

</form>