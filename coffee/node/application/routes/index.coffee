module.exports = (app) ->
	rout =
		home:
			type: 'get'
			link: '/'
			control: (req, res) ->
				HomeController.run(req, res);
				return

		about:
			type: 'get'
			link: '/about'
			control: (req, res) ->
				console.log 'Page about'
				return
	rout