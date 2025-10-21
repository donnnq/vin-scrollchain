// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClassroomProcurementSovereigntyLedger {
    address public admin;

    struct ProcurementEntry {
        string projectName;
        string region;
        string procurementLayer; // "Bidding", "Awarding", "Delivery"
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    ProcurementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProcurement(string memory projectName, string memory region, string memory procurementLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(projectName, region, procurementLayer, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealProcurementEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getProcurementEntry(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
