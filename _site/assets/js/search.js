let searchData = [];

const baseurl = document.getElementById('search-container').getAttribute('data-baseurl');
fetch(`${baseurl}/search.json`)
	.then(res => res.text())
	.then(text =>
	{
		try
		{
			let cleanedText = text
				.replace(/\\(?!["\\/bfnrtu])/g, '\\\\')
				.replace(/[\u0000-\u001F]/g, '');

			searchData = JSON.parse(cleanedText);
			initSearchBars();
		}
		catch (e)
		{
			console.error("Failed to parse cleaned JSON:", e);
		}
	});

function initSearchBars()
{
	document.querySelectorAll('.search-box').forEach(box =>
	{
		const input = box.querySelector('.search-input');
		const resultsContainer = box.querySelector('.search-results');

		if (!input || !resultsContainer) return;

		input.addEventListener('input', function ()
		{
			const query = this.value.toLowerCase();
			resultsContainer.innerHTML = '';
			if (query.length < 2) return;

			let results = [];
			if (Array.isArray(searchData) && searchData.length > 0)
			{
				results = searchData.filter(item =>
					(item.title?.toLowerCase() || '').includes(query) ||
					(item.tags?.toLowerCase() || '').includes(query) ||
					(item.content?.toLowerCase() || '').includes(query)
				);
			}


			if (results.length > 0)
			{
				results.sort((a, b) =>
				{
					const aTitle = (a.title || '').toLowerCase();
					const bTitle = (b.title || '').toLowerCase();

					const aScore = aTitle === query ? 0 : aTitle.startsWith(query) ? 1 : 2;
					const bScore = bTitle === query ? 0 : bTitle.startsWith(query) ? 1 : 2;

					return aScore - bScore;
				});
			}

			results.slice(0, 10).forEach(result =>
			{
				const li = document.createElement('li');
				li.innerHTML = `<a href="${result.url}">${result.title}</a>`;
				resultsContainer.appendChild(li);
			});
		});

	});
}
