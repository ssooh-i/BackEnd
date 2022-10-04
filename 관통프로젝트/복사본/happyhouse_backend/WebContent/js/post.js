let titles = document.querySelectorAll(".article-title");
		titles.forEach(function(title) {
			title.addEventListener("click", function() {
				document.querySelector("#articleno").value = this
						.getAttribute("data-no");
				document.querySelector("#form-no-param").submit();
			});
		});

		document.querySelector("#btn-mv-register").addEventListener("click",
				function() {
					location.href = "${root}/board?act=mvwrite";
				});

		document.querySelector("#btn-search").addEventListener("click",
				function() {
					let form = document.querySelector("#form-search");
					form.setAttribute("action", "${root}/board");
					form.submit();
				});