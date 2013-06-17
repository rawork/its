function showmails2($typef)
{
	if($typef == 0)
	{
		document.getElementById('block-block-25').style.display = 'none';
		document.getElementById('block-block-24').style.display = 'block';
		//document.getElementById('feedback').style.display = 'none';
	}
	if($typef == 1)
	{
		document.getElementById('block-block-24').style.display = 'none';	
		document.getElementById('block-block-25').style.display = 'block';
		//document.getElementById('feedback').style.display = 'none';
	}	
}