
function RatingVoting(entityTypeId, entityId, randInt, voteAction)
{
	BX.showWait('rating_voting_'+entityTypeId+'_'+entityId+'_'+randInt);
	
	BX.ajax({
		url: '/bitrix/components/bitrix/rating.vote/vote.php', 
		method: 'POST',
		dataType: 'json',
		data: {'ENTITY_TYPE_ID' : entityTypeId, 'ENTITY_ID' : entityId, 'VOTE_ACTION' : voteAction},
		onsuccess: function(data)
		{
			var ratingMarkup = document.getElementById("rating-vote-"+entityTypeId+"-"+entityId+"-"+randInt);
			var ratingMarkupPlus = document.getElementById("rating-vote-"+entityTypeId+"-"+entityId+"-"+randInt+"-plus");
			var ratingMarkupMinus = document.getElementById("rating-vote-"+entityTypeId+"-"+entityId+"-"+randInt+"-minus");
			var ratingMarkupResult = document.getElementById("rating-vote-"+entityTypeId+"-"+entityId+"-"+randInt+"-result");
			
			BX.addClass(ratingMarkup, 'rating-vote-disabled');
			ratingMarkupPlus.onclick = "";
			ratingMarkupMinus.onclick = "";
			if (data['result'] == "true") {
				ratingMarkupResult.title = data['resultTitle'];
				ratingMarkupResult.innerHTML = data['resultValue'];
				BX.removeClass(ratingMarkupResult, data['resultStatus'] == 'minus' ? 'rating-vote-result-plus' : 'rating-vote-result-minus');
				BX.addClass(ratingMarkupResult, data['resultStatus'] == 'minus' ? 'rating-vote-result-minus' : 'rating-vote-result-plus');
		    }
		    BX.closeWait('rating_voting_'+entityTypeId+'_'+entityId); 
		},
		onfailure: function(data)
		{
			BX.closeWait('rating_voting_'+entityTypeId+'_'+entityId+'_'+randInt); 
		} 
	});
	
}