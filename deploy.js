const hre = require("hardhat");

async function main() {
  const NFTCollection = await hre.ethers.getContractFactory("NFTCollection");
  const nft = await NFTCollection.deploy();

  await nft.waitForDeployment();

  console.log(`NFT Collection deployed to ${nft.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
