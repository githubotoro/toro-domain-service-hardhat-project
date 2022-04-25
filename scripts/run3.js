const main = async () => {
	const [owner, randomPerson] = await hre.ethers.getSigners();

	const domainsContractFactory = await hre.ethers.getContractFactory(
		"Domains"
	);
	const domainsContract = await domainsContractFactory.deploy();
	await domainsContract.deployed();

	console.log(`Contract deployed to : ${domainsContract.address}`);
	console.log(`Contract deployed by : ${owner.address}`);

	const txn = await domainsContract.register("toro");
	await txn.wait();

	const domainAddress = await domainsContract.getAddress("toro");
	console.log(`Owner is : ${domainAddress}`);

	// trying to set record to a domain, that doesn't belong to me
	txn = await domainsContract
		.connect(randomPerson)
		.setRecord("toro", "Hahaha! This is my domain now.");
	await txn.wait();
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
