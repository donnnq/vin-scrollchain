// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LogisticsWorkerDAO {
    address public admin;

    struct WorkerEntry {
        string workerRole;
        string cooperativeName;
        string benefitClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
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

    function summonWorkerClause(string memory workerRole, string memory cooperativeName, string memory benefitClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WorkerEntry(workerRole, cooperativeName, benefitClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealWorkerEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getWorkerEntry(uint256 index) external view returns (WorkerEntry memory) {
        return entries[index];
    }
}
