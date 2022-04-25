const main = async () => {
	const domainsContractFactory = await hre.ethers.getContractFactory(
		"Domains"
	);
	const domainsContract = await domainsContractFactory.deploy();
	await domainsContract.deployed();
	console.log(
		`Domains contract has been deployed to : ${domainsContract.address}`
	);
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (err) {
		console.log(err);
		process.exit(1);
	}
};

runMain();
