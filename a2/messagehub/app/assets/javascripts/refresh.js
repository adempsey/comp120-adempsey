$("document").ready(function() {
	i = setInterval(function() {
		$.ajax({
			url: "messages.json"
		}).done(function(data) {
			content = ""
			for (i in data) {
				content+='<div class="message"><div class="message_content">';
				content+=data[i].content;
				content+='</div><span class="message_info">Posted by ';
				content+=data[i].username;
				content+=' '+$.timeago(data[i].created_at);
				content+='</span></div>'
			};
			$("#container").html(content);
			console.log(content);
		})
	},5000);
});

