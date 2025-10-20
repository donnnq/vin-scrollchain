// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradesmenIncentiveDAO {
    address public admin;

    struct IncentiveEntry {
        string tradeType;
        string incentiveType;
        string deploymentRegion;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    IncentiveEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIncentive(string memory tradeType, string memory incentiveType, string memory deploymentRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(IncentiveEntry(tradeType, incentiveType, deploymentRegion, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealIncentiveEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getIncentiveEntry(uint256 index) external view returns (IncentiveEntry memory) {
        return entries[index];
    }
}
