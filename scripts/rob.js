const main = async () => {
	const [owner, superCoder] = await hre.ethers.getSigners();
	const domainContractFactory = await hre.ethers.getContractFactory(
		"Domains"
	);
	const domainContract = await domainContractFactory.deploy("ninja");
	await domainContract.deployed();

	console.log("Contract owner:", owner.address);

	// paying more than required
	let txn = await domainContract.register("a16z", {
		value: hre.ethers.utils.parseEther("1234"),
	});
	await txn.wait();

	// getting balance
	const balance = await hre.ethers.provider.getBalance(
		domainContract.address
	);
	console.log("Contract balance:", hre.ethers.utils.formatEther(balance));

	// grabbing funds
	try {
		txn = await domainContract.connect(superCoder).withdraw();
		await txn.wait();
	} catch (error) {
		console.log("Could not rob contract");
	}

	// seeing owner balance
	let ownerBalance = await hre.ethers.provider.getBalance(owner.address);
	console.log(
		"Balance of owner before withdrawal:",
		hre.ethers.utils.formatEther(ownerBalance)
	);

	// trying to rob
	txn = await domainContract.connect(owner).withdraw();
	await txn.wait();

	// fetching balance again to verify the heist
	const contractBalance = await hre.ethers.provider.getBalance(
		domainContract.address
	);
	ownerBalance = await hre.ethers.provider.getBalance(owner.address);

	console.log(
		"Contract balance after withdrawal:",
		hre.ethers.utils.formatEther(contractBalance)
	);
	console.log(
		"Balance of owner after withdrawal:",
		hre.ethers.utils.formatEther(ownerBalance)
	);
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (error) {
		console.log(error);
		process.exit(1);
	}
};

runMain();
