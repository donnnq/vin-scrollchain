// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrantJusticeDAO {
    address public admin;

    struct JusticeEntry {
        string workerName;
        string hostCountry;
        string grievanceType;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJustice(string memory workerName, string memory hostCountry, string memory grievanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(workerName, hostCountry, grievanceType, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealJusticeEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
