// nano path: /civicOS/modules/SanctumIntegrity/SanctumScanner.js

const fs = require('fs');
const sanctumDB = require('./sanctumSites.json');

function scanSanctums() {
  const flagged = [];

  sanctumDB.forEach(site => {
    if (site.structureExists && !site.approvedForContinuation) {
      flagged.push({
        location: site.location,
        issue: 'Unapproved continuation of existing structure'
      });
    }

    if (!site.structureExists && site.currentStructure !== '') {
      flagged.push({
        location: site.location,
        issue: 'Ghost structure detected—no physical presence'
      });
    }
  });

  fs.writeFileSync('sanctumFlags.json', JSON.stringify(flagged, null, 2));
  console.log(`🔍 ${flagged.length} sanctums flagged for review.`);
}

scanSanctums();
