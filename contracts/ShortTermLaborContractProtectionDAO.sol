// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShortTermLaborContractProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string workerName;
        string contractType;
        string employerEntity;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory workerName, string memory contractType, string memory employerEntity, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(workerName, contractType, employerEntity, emotionalTag, true, false));
    }

    function protectContract(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
