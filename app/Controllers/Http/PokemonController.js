'use strict'
const Helper = use('Helpers')
const Drive = use('Drive')
const Database = use('Database')
const Pokemon = use('App/Models/Pokemon')
const Category = use('App/Models/Category')

class PokemonController {

	async index ({ request, response }) {
		let { item, page } = request.only(['item', 'page'])
		const a = parseInt(page) || 1;
		const b = parseInt(item) || 10;
		const pokemons = await Pokemon.query().with('category').with('types').orderBy("id", "desc").paginate(a, b)
	  return response.status(200).json({
 	 		status: 'success',
      data: pokemons
	  })
	}

	async store ({ request, response }) {
		const { name_pokemon, category_id, type_id, latitude_pokemon, longitude_pokemon } = request.all()
		const { clientName, extname, fileName, fieldName, tmpPath, headers, size, type, subtype, status, error } = request.file('picture_pokemon', { types: ['image'], size: '20mb' })

		try {
			// Step [1]: Upload Image
			const picture_pokemon = request.file('picture_pokemon', { types: ['image'], size: '20mb' })
			await picture_pokemon.move(Helper.publicPath('uploads/pokemon'), { name: `${name_pokemon}.${extname}`, overwrite: true })
			if (!picture_pokemon.moved()) {
				console.log(picture_pokemon.error())
				return "gagal"
				return picture_pokemon.error()
			}
			// Step [2]: Insert New Pokemon
			await Database.table('pokemons').insert({
				name_pokemon: name_pokemon,
				category_id: JSON.parse(category_id)[0],
				latitude_pokemon: latitude_pokemon,
				longitude_pokemon: longitude_pokemon
			})
			// Step [3]: Checking Inserted Pokemon Name & Pick data for pokemon id to pokemon_type Table
			let pokemon_data = await Database.table('pokemons').where({ name_pokemon: `${name_pokemon}` })
			// Step [4]: Insert New Pokemon Type with Looping
			const type_id_array = JSON.parse(type_id)
			for (var i = 0; i < type_id_array.length; i++) {
				await Database.table('pokemon_type').insert({
					pokemon_id: pokemon_data[0].id,
					type_id: type_id_array[i]
				})
			}
			return response.status(200).json({
				"status": "success",
				"data": "Your pokemon successfully recorded."
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong. \nError Message: "+e
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

	async update ({ request, response, params }) {
		try {
			// console.log(`request all: ${JSON.stringify(request.all())}\n request file: ${JSON.stringify(request.file('picture_pokemon'))}`);
			const { id_pokemon, old_name_pokemon, name_pokemon, category_id, types_id, latitude_pokemon, longitude_pokemon } = request.all()
			const { clientName, extname, fileName, fieldName, tmpPath, headers, size, type, subtype, status, error } = request.file('picture_pokemon', { types: ['image'], size: '20mb' })
			const pokemon = await Pokemon.find(id_pokemon)
			if (!pokemon) {
				return response.status(400).json({
					"status": "error",
					"data": "Pokemon not available."
				})
			}
			if (old_name_pokemon !== name_pokemon) {
				await Drive.delete(Helper.publicPath(`uploads/pokemon/${old_name_pokemon}.${extname}`))
			}

			const picture_pokemon = request.file('picture_pokemon', { types: ['image'], size: '20mb' })
			await picture_pokemon.move(Helper.publicPath('uploads/pokemon'), { name: `${name_pokemon}.${extname}`, overwrite: true })
			if (!picture_pokemon.moved()) {
				console.log(picture_pokemon.error())
				return "gagal"
				return picture_pokemon.error()
			}

			pokemon.name_pokemon = name_pokemon
			pokemon.latitude_pokemon = latitude_pokemon
			pokemon.longitude_pokemon = longitude_pokemon
			await pokemon.save()
			return response.status(200).json({
				"status": "success",
				"data": "Data successfully updated."
			})
		} catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."+e
			})
		}
	}

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

	// SELECT BY NAME
	async getName ({ request, response, params }) {
	  const { name_pokemon, item } = request.only(['name_pokemon', 'item'])
		const a = parseInt(item) || 0;
		try {
			const pokemon = await Pokemon.query()
							              .with("types")
							              .with("category")
							              .where("name_pokemon", "LIKE", "%" + name_pokemon + "%")
							              .orderBy("id", "asc")
							              .limit(a)
							              .fetch();

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
				"data": "Something went wrong."+e
			})
		}
	}

	// Comments
	// async index ({ request, response }) {
	// 	try {
	// 		// with paginate
	// 		// const pokemons = await Pokemon.query().with('categories').with('types').paginate(1,10)
	// 		// with forPage
	// 		// const pokemons = await Pokemon.query().with('categories').with('types').forPage(4,5).fetch()
	// 		// without paginate
	// 		// const pokemons = await Pokemon.query().with('categories').with('types').fetch()
	// 		// pagination: http://192.168.1.129:3333/pokemon?page=2&items=9
	// 		let { item, page } = request.only(['item', 'page'])
	// 		const a = parseInt(page) || 1;
	// 		const b = parseInt(item) || 10;
	// 		const pokemons = await Pokemon.query().with('categories').with('types').paginate(a, b)
	// 		return response.status(200).json({
	// 			"status": "success",
	// 			"data": pokemons
	// 		})
	// 	} catch (e) {
	// 		return response.status(400).json({
	// 			"status": "error",
	// 			"data": "Something went wrong."+e
	// 		})
	// 	}
	// }

}

module.exports = PokemonController
