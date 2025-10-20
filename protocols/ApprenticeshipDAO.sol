// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ApprenticeshipDAO {
    address public admin;

    struct ApprenticeshipEntry {
        string tradeType;
        string sponsorEntity;
        string incentiveClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    ApprenticeshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonApprenticeship(string memory tradeType, string memory sponsorEntity, string memory incentiveClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ApprenticeshipEntry(tradeType, sponsorEntity, incentiveClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealApprenticeshipEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getApprenticeshipEntry(uint256 index) external view returns (ApprenticeshipEntry memory) {
        return entries[index];
    }
}
