'use strict'
const Hash = use('Hash')
const Database = use('Database')
const User = use('App/Models/User')

class AuthController {

	async login({request, response, auth}) {
		try {
			const { email, password } = request.all()
			const jwt_token = await auth.attempt(email, password)
			const dataAll = await Database.from('users').where('email', email)
			console.log(dataAll);
			if (jwt_token) {
				return response.status(200).json({
					"status": "success",
					"data": dataAll,
					"token": jwt_token,
					"user_id": dataAll[0].id
				})
			}
		} catch (e) {
			console.log(e);
			return response.status(403).json({
				"status": "error",
				"data": "Invalid username or password."
			})
		}
	}

	async register({request, response}) {
		try {
			let { username, email, password } = request.all();
			const user = await User.create({
				username: username,
				email: email,
				password: await Hash.make(password)
			})
			return response.status(200).json({
				"status": "success",
				"data": "Your have been successfully registered."+JSON.stringify(user)
			})
		}
		catch (e) {
			return response.status(400).json({
				"status": "error",
				"data": "Something went wrong."
			})
		}
	}

}

module.exports = AuthController
