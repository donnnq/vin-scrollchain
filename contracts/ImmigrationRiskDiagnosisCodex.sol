// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmigrationRiskDiagnosisCodex {
    address public admin;

    struct RiskProfile {
        string passportHolder;
        string riskFactor; // e.g., smuggling, espionage, cybercrime
        string diagnosticNote;
        string emotionalTag;
        bool flagged;
    }

    RiskProfile[] public profiles;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProfile(string memory passportHolder, string memory riskFactor, string memory diagnosticNote, string memory emotionalTag) external onlyAdmin {
        profiles.push(RiskProfile(passportHolder, riskFactor, diagnosticNote, emotionalTag, false));
    }

    function flagProfile(uint256 index) external onlyAdmin {
        profiles[index].flagged = true;
    }

    function getProfile(uint256 index) external view returns (RiskProfile memory) {
        return profiles[index];
    }
}
