// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlunderComplaintKarmaRegistry {
    address public admin;

    struct ComplaintEntry {
        string respondent; // "FPRRD", "Sen. Bato", "Relatives"
        string complaintType; // "Plunder"
        string source; // "GMA News"
        string emotionalTag;
        bool filed;
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

    function fileComplaint(string memory respondent, string memory complaintType, string memory source, string memory emotionalTag) external onlyAdmin {
        entries.push(ComplaintEntry(respondent, complaintType, source, emotionalTag, true, false));
    }

    function sealComplaintEntry(uint256 index) external onlyAdmin {
        require(entries[index].filed, "Must be filed first");
        entries[index].sealed = true;
    }

    function getComplaintEntry(uint256 index) external view returns (ComplaintEntry memory) {
        return entries[index];
    }
}
