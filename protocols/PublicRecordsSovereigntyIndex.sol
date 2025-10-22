// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicRecordsSovereigntyIndex {
    address public admin;

    struct SovereigntyEntry {
        string recordType; // "Audit logs", "Blueprints", "Project contracts"
        string agency; // "DPWH"
        string preservationMethod; // "Cloud backup", "Scrollchain archive", "Witness affidavit"
        string emotionalTag;
        bool indexed;
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

    function indexRecord(string memory recordType, string memory agency, string memory preservationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(recordType, agency, preservationMethod, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
