'use strict'
const Database = use('Database')
const Type = use('App/Models/Type')

class TypeController {

	async index ({ request, response }) {
		try {
			const pokemons = await Type.query().with('pokemons').fetch()
			return response.status(200).json({
				"status": "success",
				"data": pokemons
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."+e
			})
		}
	}

}

module.exports = TypeController
