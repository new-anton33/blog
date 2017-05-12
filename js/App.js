cur_post = 0;

$(document).ready(function($) {
						   
	$(document).on('click', '#add_post', function(){
			var content = document.getElementsByTagName("iframe")[0].contentDocument.getElementsByTagName("body")[0].innerHTML;
			var author = $('#author').val();
		if(content.length > 5 && author.length > 0) {
			$.post("/controllers/ajax_controller.php?action=insert", {author: author, content: content})
				.done(function () {
					LoadBlogList();
				});
			ClearContent();
		} else {
			alert('Fill in the fields');
		}
	});

	$(document).on('click', '#add_comment', function(){
		var content = document.getElementsByTagName("iframe")[0].contentDocument.getElementsByTagName("body")[0].innerHTML;
		var author = $('#author').val();
		if(content.length > 5 && author.length > 0) {
			$.post("/controllers/ajax_controller.php?action=insert_comment", { author : author, content : content, post_id : cur_post})
				.done(function() {
					LoadPost(cur_post);
				});
			ClearContent();
		} else {
			alert('Fill in the fields');
		}
	});
	
});

function ClearContent(){
	document.getElementsByTagName("iframe")[0].contentDocument.getElementsByTagName("body")[0].innerHTML = '';
	$('#author').val('');
}

function LoadBlogList(){
	$.get("/controllers/ajax_controller.php?action=list")
	.done(function(data) {
	$('#load_content').html(data);
	});
}

function LoadPost(id){
	cur_post = id;
	$.get("/controllers/ajax_controller.php?action=view&id="+id)
		.done(function(data) {
			$('#load_content').html(data);
		});
}

function LoadSlides(id){
	cur_post = id;
	$.get("/controllers/ajax_controller.php?action=top5")
		.done(function(data) {
			$('.carousel-inner').html(data);
		});
}