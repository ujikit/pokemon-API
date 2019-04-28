'use strict'
const Database = use('Database')
const Category = use('App/Models/Category')

class CategoryController {

	async index ({ request, response }) {
		try {
			const pokemons = await Category.query('pokemons').fetch()
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

module.exports = CategoryController
