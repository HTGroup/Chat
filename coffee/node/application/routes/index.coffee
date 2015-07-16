module.exports = (app) ->
	rout =
		home:
			type: 'get'
			link: '/'
			control: (req, res) ->
				console.log(app)
				res.render 'index', title: 'iBuilder'
				return

		about:
			type: 'get'
			link: '/about'
			control: (req, res) ->
				console.log 'Page about'
				return
	rout