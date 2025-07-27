// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinNationSeedVault {
    struct Region {
        uint256 healthIndex;
        uint256 infrastructureGap;
        uint256 educationNeed;
        uint256 seedTokensReceived;
        bool verifiedByCouncil;
    }

    mapping(string => Region) public regions;
    uint256 public totalVaultBalance;

    event SeedReleased(string region, string purpose, uint256 amount);

    modifier onlyVerified(string memory _region) {
        require(regions[_region].verifiedByCouncil, "Region not yet verified for aid.");
        _;
    }

    function depositSurplus(uint256 amount) public {
        totalVaultBalance += amount;
    }

    function verifyRegion(string memory _region) public {
        regions[_region].verifiedByCouncil = true;
    }

    function allocateSeeds(string memory _region) public onlyVerified(_region) {
        Region storage r = regions[_region];
        uint256 totalNeed = r.healthIndex + r.infrastructureGap + r.educationNeed;
        require(totalNeed > 0, "No allocation needed.");

        uint256 allocated = totalNeed * 10;
        require(totalVaultBalance >= allocated, "Vault balance insufficient.");

        r.seedTokensReceived += allocated;
        totalVaultBalance -= allocated;

        emit SeedReleased(_region, "Civic upliftment package", allocated);
    }

    function getRegionStatus(string memory _region) public view returns (string memory) {
        Region memory r = regions[_region];

        if (r.seedTokensReceived > 0) return "Seeds received. Upliftment underway.";
        if (r.verifiedByCouncil) return "Verified. Awaiting allocation.";
        return "Unverified. No action yet.";
    }
}
