// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriWorkerDignityProtocol {
    address public admin;

    struct DignityEntry {
        string workerName;
        string region;
        string dignityType;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDignityProtection(string memory workerName, string memory region, string memory dignityType, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(workerName, region, dignityType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealDignityProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
