'use strict'
const Model = use('Model')

class Category extends Model {

	pokemons () {
		return this.hasMany('App/Models/Pokemon')
	}

}

module.exports = Category
