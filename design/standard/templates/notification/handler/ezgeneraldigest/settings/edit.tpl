{let settings=$handler.settings}

    <input type="checkbox" name="ReceiveDigest_{$handler.id_string}" {$settings.receive_digest|choose("",checked)} />
    <label>{'Receive all messages combined in one digest'|i18n('design/standard/notification')}</label><br/>

    <label>{'Send out'|i18n('design/standard/notification')}</label>

    <select name="Weekday_{$handler.id_string}">
    {section name=WeekDays loop=$handler.all_week_days}
        <option value="{$WeekDays:item}" {section show=eq($WeekDays:item,$settings.day)}selected="selected"{/section}>{$WeekDays:item}</option>
    {/section}
    </select>

    &nbsp;

    <select name="Time_{$handler.id_string}">
    {section name=Time loop=$handler.available_hours}
        <option value="{$Time:item}" {section show=eq($Time:item,$settings.time)}selected="selected"{/section}>{$Time:item}</option>
    {/section}
    </select>

{/let}