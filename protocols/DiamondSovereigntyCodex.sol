// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiamondSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string diamondName;
        string historicalOrigin;
        string dismantlingRisk;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory diamondName, string memory historicalOrigin, string memory dismantlingRisk, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(diamondName, historicalOrigin, dismantlingRisk, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
