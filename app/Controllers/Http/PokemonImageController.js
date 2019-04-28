'use strict'
const Helper = use('Helpers')

class PokemonImageController {

	async index ({ request, response }) {
		try {
			const profilePic = request.file('profile_pic', {
				types: ['image'],
				size: '2mb'
			})
			await profilePic.move(Helper.publicPath('uploads'), {
				name: 'custome-name.jpg',
				overwrite: true
			})
			if (!profilePic.moved()) {
				console.log(profilePic.error());
				return profilePic.error()
			}
			return 'file moved'
		}
		catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."+e
			})
		}
	}

}

module.exports = PokemonImageController
