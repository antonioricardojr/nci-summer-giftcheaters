/**
 * cbpAnimatedHeader.min.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
var cbpAnimatedHeader=function(){function e(){window.addEventListener("scroll",function(){a||(a=!0,setTimeout(n,250))},!1)}function n(){var e=c();e>=o?classie.add(t,"cbp-af-header-shrink"):classie.remove(t,"cbp-af-header-shrink"),a=!1}function c(){return window.pageYOffset||r.scrollTop}var r=document.documentElement,t=document.querySelector(".cbp-af-header"),a=!1,o=300;e()}();