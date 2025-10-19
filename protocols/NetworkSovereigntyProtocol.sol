// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NetworkSovereigntyProtocol {
    address public admin;

    struct SovereigntyEntry {
        string region;
        string deviceType;
        string threatType;
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

    function summonSovereignty(string memory region, string memory deviceType, string memory threatType, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(region, deviceType, threatType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSovereignty(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
