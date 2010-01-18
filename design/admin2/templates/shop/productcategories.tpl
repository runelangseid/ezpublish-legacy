{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{if $errors}
    <div class="message-warning">
        <h2>{'Input did not validate'|i18n( 'design/admin/shop/productcategories' )}</h2>
        <ul>
        {foreach $errors as $error}
            <li>{$error|wash}</li>
        {/foreach}
        </ul>
   </div>
{/if}

<form action={'shop/productcategories'|ezurl} method="post" name="ProductCategories">

<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">
<h1 class="context-title">{'Product categories [%categories]'|i18n( 'design/admin/shop/productcategories',, hash( '%categories', $categories|count ) )}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

{if $categories}
<table class="list" cellspacing="0">
<tr>
    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/admin/shop/productcategories' )}" title="{'Invert selection.'|i18n( 'design/admin/shop/productcategories' )}" onclick="ezjs_toggleCheckboxes( document.ProductCategories, 'CategoryIDList[]' ); return false;" /></th>
    <th>{'Name'|i18n( 'design/admin/shop/productcategories' )}</th>
</tr>

{def $id_string=''}
{foreach $categories as $cat sequence array( bglight, bgdark ) as $seq_color}
{if and( is_set( $last_added_id ), eq( $last_added_id, $cat.id) )}
    {set $id_string='id="LastAdded"'}
{/if}
<tr class="{$seq_color}">
    <td><input type="checkbox" name="CategoryIDList[]" value="{$cat.id}" title="{'Select product category for removal.'|i18n( 'design/admin/shop/productcategories' )}" /></td>
    <td><input type="text" name="category_name_{$cat.id}" {$id_string} value="{$cat.name|wash}" size="24" /></td>
</tr>
{/foreach}
</table>
{else}
<div class="block">
<p>{'There are no product categories.'|i18n( 'design/admin/shop/productcategories' )}</p>
</div>
{/if}

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml">
<div class="block">
<div class="button-left">
    {if $categories}
    <input class="button" type="submit" name="RemoveCategoryButton" value="{'Remove selected'|i18n( 'design/admin/shop/productcategories' )}" title="{'Remove selected product categories.'|i18n( 'design/admin/shop/productcategories' )}" />
    {else}
    <input class="button-disabled" type="submit" name="RemoveCategoryButton" value="{'Remove selected'|i18n( 'design/admin/shop/productcategories' )}" disabled="disabled" />
    {/if}
    <input class="button" type="submit" name="AddCategoryButton" value="{'New product category'|i18n( 'design/admin/shop/productcategories' )}" title="{'Create a new product category.'|i18n( 'design/admin/shop/productcategories' )}" />
</div>
<div class="button-right">
    {if $categories}
    <input class="button" type="submit" name="SaveCategoriesButton" value="{'Apply changes'|i18n( 'design/admin/shop/productcategories' )}" title="{'Click this button to store changes if you have modified any of the fields above.'|i18n( 'design/admin/shop/productcategories' )}" />
    {else}
    <input class="button-disabled" type="submit" name="SaveCategoriesButton" value="{'Apply changes'|i18n( 'design/admin/shop/productcategories' )}" disabled="disabled" />
    {/if}
</div>
<div class="break"></div>
</div>
{* DESIGN: Control bar END *}</div></div>
</div>

</div>

</form>

{literal}
<script language="JavaScript" type="text/javascript">
<!--
jQuery(function( $ )//called on document.ready
{
    var lastAddedItem = document.getElementById('LastAdded');

    if ( lastAddedItem != null )
    {
        lastAddedItem.select();
        lastAddedItem.focus();
    }
});
-->
</script>
{/literal}

