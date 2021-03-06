[{$smarty.block.parent}]
[{oxstyle include=$oViewConf->getModuleUrl("ffwebcomponents", "out/css/styles.css")}]

<script src="[{$oViewConf->getModuleUrl('ffwebcomponents', 'out/js/ff-web-components/vendor/custom-elements-es5-adapter.js')|escape}]"></script>
<script src="[{$oViewConf->getModuleUrl('ffwebcomponents', 'out/js/ff-web-components/vendor/webcomponents-loader.js')|escape}]"></script>
<script src="[{$oViewConf->getModuleUrl('ffwebcomponents', 'out/js/ff-web-components/bundle.js')|escape}]" defer></script>
<style>[unresolved]{opacity:0;display:none}</style>

<script>
document.addEventListener('ffReady', function (ff) {
    factfinder.communication.fieldRoles = {"brand":"Brand","campaignProductNumber":"ProductNumber","deeplink":"Deeplink","description":"Description","displayProductNumber":"ProductNumber","ean":"EAN","imageUrl":"ImageURL","masterArticleNumber":"Master","price":"Price","productName":"Name","trackingProductNumber":"ProductNumber"};

    ff.eventAggregator.addBeforeDispatchingCallback(function (event) {
        if (event.type === 'search' && !event.searchImmediate && event.navigation !== 'true') {
            event['cl'] = 'search_result';
[{if $oView->getClassKey() neq "search_result"}]
            event.cancel();
            window.location = '[{$oViewConf->getHomeLink()|escape:"javascript"}]' + factfinder.common.dictToParameterString(event);
[{/if}]
        }
    });

[{if $oView->getClassKey() eq "alist"}]
    ff.eventAggregator.addBeforeHistoryPushCallback(function (res, event, url) {
        url = url.replace(/filter=CategoryPath[^&]+&?/, '').replace(/filterCategoryPathROOT[^&]+&?/g, '');
        ff.factfinder.communication.Util.pushParameterToHistory(res, url, event);
        return false;
    });
[{/if}]
});
</script>
