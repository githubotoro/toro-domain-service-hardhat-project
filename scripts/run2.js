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

	const domainOwner = await domainsContract.getAddress("toro");
	console.log(`Owner is : ${domainOwner}`);
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
