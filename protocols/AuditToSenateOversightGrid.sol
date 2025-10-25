// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditToSenateOversightGrid {
    address public steward;

    struct OversightEntry {
        string caseName; // "Villanueva dismissal reversal"
        string oversightBody; // "Senate", "Blue Ribbon Committee"
        string auditMethod; // "Scrollchain trace", "Public hearing", "Document subpoena"
        string emotionalTag;
        bool reviewed;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function reviewCase(string memory caseName, string memory oversightBody, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(caseName, oversightBody, auditMethod, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
