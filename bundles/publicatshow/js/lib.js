function openContestWindow(curimg, title_for_java, title_for_img, comment_for_java, a_prev, a_next, curid, numweek)
{
	++numweek;
	$('#opencontestwindow').remove();
	tetetext = '<div id="opencontestwindow"><div class="bbwrap"><div class="bbtitle">' + title_for_java + '</div><div class="bbtitleimg">Неделя ' + numweek + ' - ' + title_for_img + '</div><div class="bbcomment">' + comment_for_java + '</div><p><img src="/upload/publicat/' + curimg + '_big.jpg" /></p><a id="abbclose" onclick="$(\'#opencontestwindow\').remove();" href="javascript:void(0);"></a><a id="abbprev" onclick="document.getElementById(\'aname' + curid + '_' + a_prev + '\').onclick();" href="javascript:void(0);"></a><a id="abbnext" onclick="document.getElementById(\'aname' + curid + '_' + a_next + '\').onclick();" href="javascript:void(0);"></a></div></div>';
	$('body').append(tetetext);
}