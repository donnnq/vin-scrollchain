// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxpayerReliefDAO {
    address public admin;

    struct ReliefEntry {
        string programName;
        string sector;
        string reliefType;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRelief(string memory programName, string memory sector, string memory reliefType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReliefEntry(programName, sector, reliefType, emotionalTag, true, false, false));
    }

    function deployRelief(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealRelief(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
