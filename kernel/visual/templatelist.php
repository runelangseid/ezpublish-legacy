<?php
//
// Created on: <07-May-2003 15:37:09 bf>
//
// Copyright (C) 1999-2005 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE included in
// the packaging of this file.
//
// Licencees holding a valid "eZ publish professional licence" version 2
// may use this file in accordance with the "eZ publish professional licence"
// version 2 Agreement provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" version 2 is available at
// http://ez.no/ez_publish/licences/professional/ and in the file
// PROFESSIONAL_LICENCE included in the packaging of this file.
// For pricing of this licence please contact us via e-mail to licence@ez.no.
// Further contact information is available at http://ez.no/company/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

$http =& eZHTTPTool::instance();
$module =& $Params["Module"];

$offset = $Params['Offset'];

$doFiltration = false;
$filterString = '';

if ( !is_numeric( $offset ) )
    $offset = 0;

if ( $http->hasVariable( 'filterString' ) )
{
    $filterString = $http->variable('filterString');
    if ( ( strlen( trim( $filterString ) ) > 0 ) ) 
        $doFiltration = true;
}

include_once( "kernel/common/template.php" );
include_once( "kernel/common/eztemplatedesignresource.php" );
include_once( 'lib/ezutils/classes/ezhttptool.php' );

$ini =& eZINI::instance();
$tpl =& templateInit();

$siteAccess = $http->sessionVariable( 'eZTemplateAdminCurrentSiteAccess' );

$overrideArray =& eZTemplatedesignresource::overrideArray( $siteAccess );

$mostUsedOverrideArray = array();
$filteredOverrideArray = array();
$mostUsedMatchArray = array( 'node/view/', 'content/view/embed', 'pagelayout.tpl', 'search.tpl', 'basket' );
foreach ( array_keys( $overrideArray ) as $overrideKey )
{
    foreach ( $mostUsedMatchArray as $mostUsedMatch )
    {
        if ( strpos( $overrideArray[$overrideKey]['template'], $mostUsedMatch ) !== false )
        {
            $mostUsedOverrideArray[$overrideKey] =& $overrideArray[$overrideKey];
        }
    }
    if ( $doFiltration ) {
        if ( strpos( $overrideArray[$overrideKey]['template'], $filterString ) !== false )
        {
            $filteredOverrideArray[$overrideKey] =& $overrideArray[$overrideKey];
        }
    }
}

$tpl->setVariable( 'filterString', $filterString );

if ( $doFiltration )
{
    $tpl->setVariable( 'template_array', $filteredOverrideArray );
    $tpl->setVariable( 'template_count', count( $filteredOverrideArray ) );
}
else
{
    $tpl->setVariable( 'template_array', $overrideArray );
    $tpl->setVariable( 'template_count', count( $overrideArray ) );
}

$tpl->setVariable( 'most_used_template_array', $mostUsedOverrideArray );
$viewParameters = array( 'offset' => $offset );
$tpl->setVariable( 'view_parameters', $viewParameters );

$Result = array();
$Result['content'] =& $tpl->fetch( "design:visual/templatelist.tpl" );
$Result['path'] = array( array( 'url' => false,
                                'text' => ezi18n( 'kernel/design', 'Template list' ) ) );

?>
