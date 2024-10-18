function includeHTML() 
{
	var elements = document.querySelectorAll('[inc]');

	elements.forEach
	(function(elmnt)
		{
			var file = elmnt.getAttribute('inc');
			if (file)
			{
				fetch(file)
				.then
				(response =>
					{
						if (!response.ok)
						{
							throw new Error('Network response was not ok');
						}
						return response.text();
					}
				)
				.then
				(data =>
					{
						elmnt.innerHTML = data;
						elmnt.removeAttribute('inc');
					}
				)
				.catch
				(error =>
				{
				  console.error('Error fetching the file:', error);
				}
				);
			}
		}
	);
}

