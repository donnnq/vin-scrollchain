// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrantWorkerDAO {
    address public admin;

    struct WorkerEntry {
        string originCountry;
        string hostCountry;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    WorkerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWorker(string memory originCountry, string memory hostCountry, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WorkerEntry(originCountry, hostCountry, protectionClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealWorkerEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getWorkerEntry(uint256 index) external view returns (WorkerEntry memory) {
        return entries[index];
    }
}
