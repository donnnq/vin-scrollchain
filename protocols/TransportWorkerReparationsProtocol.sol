// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransportWorkerReparationsProtocol {
    address public admin;

    struct ReparationsEntry {
        string workerRole;
        string displacementCause;
        string reparationsClause;
        string emotionalTag;
        bool summoned;
        bool granted;
        bool sealed;
    }

    ReparationsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReparations(string memory workerRole, string memory displacementCause, string memory reparationsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReparationsEntry(workerRole, displacementCause, reparationsClause, emotionalTag, true, false, false));
    }

    function confirmGrant(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function sealReparationsEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getReparationsEntry(uint256 index) external view returns (ReparationsEntry memory) {
        return entries[index];
    }
}
