const main = async () => {
	const [owner, randomPerson] = await hre.ethers.getSigners();

	const domainsContractFactory = await hre.ethers.getContractFactory(
		"Domains"
	);
	const domainsContract = await domainsContractFactory.deploy("toro");
	await domainsContract.deployed();

	console.log(`Contract deployed to : ${domainsContract.address}`);
	console.log(`Contract deployed by : ${owner.address}`);

	let txn = await domainsContract.register("yupuday", {
		value: hre.ethers.utils.parseEther("0.01"),
	});
	await txn.wait();

	txn = await domainsContract.register("yoyagna", {
		value: hre.ethers.utils.parseEther("0.01"),
	});
	await txn.wait();

	const domainAddress = await domainsContract.getAddress("yupuday");
	console.log(`Owner is : ${domainAddress}`);

	const balance = await hre.ethers.provider.getBalance(
		domainsContract.address
	);
	console.log(
		`Contract balance is : ${hre.ethers.utils.formatEther(balance)}`
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
