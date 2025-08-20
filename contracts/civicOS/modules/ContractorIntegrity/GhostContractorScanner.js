// nano path: /civicOS/modules/ContractorIntegrity/GhostContractorScanner.js

const fs = require('fs');
const contractorDB = require('./contractorRegistry.json');

function scanForGhosts() {
  const flagged = [];

  contractorDB.forEach(contractor => {
    if (!contractor.ownsEquipment && !contractor.hasCrew && contractor.licenseSource !== 'self') {
      flagged.push({
        name: contractor.name,
        licenseID: contractor.licenseID,
        reason: 'Suspected license rental or ghost operation'
      });
    }
  });

  fs.writeFileSync('ghostFlags.json', JSON.stringify(flagged, null, 2));
  console.log(`🛑 ${flagged.length} ghost contractors flagged.`);
}

scanForGhosts();
