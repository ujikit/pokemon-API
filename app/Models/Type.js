'use strict'
const Model = use('Model')

class Type extends Model {

	pokemons () {
		return this.hasMany('App/Models/Pokemon')
	}

}

module.exports = Type
