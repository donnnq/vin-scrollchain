// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialComplaintSovereigntyLedger {
    address public admin;

    struct ComplaintEntry {
        string respondent; // "FPRRD", "Sen. Bato", "Relatives"
        string complaintType; // "Plunder"
        string jurisdiction; // "Philippine courts"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    ComplaintEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logComplaint(string memory respondent, string memory complaintType, string memory jurisdiction, string memory emotionalTag) external onlyAdmin {
        entries.push(ComplaintEntry(respondent, complaintType, jurisdiction, emotionalTag, true, false));
    }

    function sealComplaintEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getComplaintEntry(uint256 index) external view returns (ComplaintEntry memory) {
        return entries[index];
    }
}
