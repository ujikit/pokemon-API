'use strict'
const Database = use('Database')
const Pokemon = use('App/Models/Pokemon')

class PokemonController {

	async index ({ request, response }) {
		try {
			// with paginate
			// const pokemons = await Pokemon.query().with('categories').with('types').paginate(1,10)
			// with forPage
			// const pokemons = await Pokemon.query().with('categories').with('types').forPage(4,5).fetch()
			// without paginate
			const pokemons = await Pokemon.query().with('categories').with('types').fetch()
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

	async store ({ request, response }) {
		const { name, image_url, type_id, category_id, latitude, longitude } = request.all()
		try {
			const pokemon = new Pokemon()
			pokemon.name = name
			pokemon.image_url = image_url
			pokemon.type_id = type_id
			pokemon.category_id = category_id
			pokemon.latitude = latitude
			pokemon.longitude = longitude
			await pokemon.save()
			return response.status(200).json({
				"status": "success",
				"data": "Your pokemon successfully recorded."
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."+e
			})
		}
	}

	async show ({ request, response, params }) {
		try {
			const pokemon = await Pokemon.find(params.id)
			if (!pokemon) {
				return response.status(400).json({
					"status": "error",
					"data": "Pokemon not available."
				})
			}
			return response.status(200).json({
				"status": "success",
				"data": pokemon
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."
			})
		}
	}
	//
	async update ({ request, response, params }) {
		try {
			const { name, image_url, type_id, category_id, latitude, longitude } = request.all()
			const pokemon = await Pokemon.find(params.id)
			if (!pokemon) {
				return response.status(400).json({
					"status": "error",
					"data": "Pokemon not available."
				})
			}
			pokemon.name = name
			pokemon.image_url = image_url
			pokemon.type_id = type_id
			pokemon.category_id = category_id
			pokemon.latitude = latitude
			pokemon.longitude = longitude
			await pokemon.save()
			return response.status(200).json({
				"status": "success",
				"data": "Data successfully updated."
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."
			})
		}
	}
	//
	async destroy ({ request, response, params }) {
		try {
			const pokemon = await Pokemon.find(params.id)
			if (!pokemon) {
				return response.status(400).json({
					"status": "error",
					"data": "Pokemon not available."
				})
			}
			else {
				await pokemon.delete()
				return response.status(200).json({
					"status": "success",
					"data": "Data successfully deleted."
				})
			}
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."
			})
		}
	}



}

module.exports = PokemonController
