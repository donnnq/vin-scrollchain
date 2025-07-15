// scripts/deploy.js
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log('Deploying with ➜', deployer.address);

  const modules = [
    'ScrollAuditLayer',
    'ScrollCelebrationVault',
    'ScrollEventCalendar',
    'ScrollSyndicate',
    'ScrollYoujiTube',
    'ScrollMart',
    'ScrollChannelHub',
    'ScrollScratchIt',
    'ScrollLucky2',
    'ScrollBindEngine',
    'ScrollBitForkTab',
    'ScrollSigilStamp'
  ];

  for (const name of modules) {
    const Factory = await ethers.getContractFactory(name);
    const instance = await Factory.deploy();
    await instance.deployed();
    console.log(`↪ ${name} deployed to:`, instance.address);
  }
}

main()
  .then(() => process.exit(0))
  .catch(err => {
    console.error(err);
    process.exit(1);
  });
