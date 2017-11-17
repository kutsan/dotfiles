#!/usr/bin/env node

/**
 * Provides Bitcoin and Ethereum spot currency data for a widget made with KWGT
 */

const { exec } = require('child_process')
const path = require('path')
const https = require('https')

function getCurrency(currency) {
	return new Promise((resolve, reject) => {
		https.get(`https://api.coinbase.com/v2/prices/${currency}-USD/spot`, (res) => {
				if (res.statusCode !== 200) {
					reject(`Request failed. ${res.statusCode}`)
				}

				res.setEncoding('utf8')

				let rawData = ''

				res.on('data', chunk => rawData += chunk)
				res.on('end', () => {
					const parsedData = JSON.parse(rawData)

					resolve(Math.round(parseFloat(parsedData.data.amount)))
				})
			})
			.on('error', () => reject(`Connection failed.`))
	})
}

Promise.all([getCurrency('BTC'), getCurrency('ETH')])
	.then(([bitcoinPrice, ethereumPrice]) => {
		const intentName = 'get_currency'
		const intentData = JSON.stringify({
			bitcoin: bitcoinPrice,
			ethereum: ethereumPrice
		})

		// Send broadcast data to Tasker
		exec(
			`am broadcast --user 0 -a net.dinglish.tasker.termux_${intentName} -e termux_data '${intentData}'`,
			(err, stout, sterr) => {
				if (err) {
					throw new Error(err)
				}
			}
		)
	})
	.catch(console.error)
