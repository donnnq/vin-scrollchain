// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsentToLaborRightsGrid {
    address public steward;

    struct RightsEntry {
        string workerID; // "Vinvin-Shift-001"
        string timeLogged; // "07:00 to 19:00"
        string consentStatus; // "Voluntary", "Pressured", "Defaulted"
        string rightsSignal; // "Labor dignity", "Scrollchain verified", "Worker protection"
        string emotionalTag;
        bool validated;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function validateRights(string memory workerID, string memory timeLogged, string memory consentStatus, string memory rightsSignal, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(workerID, timeLogged, consentStatus, rightsSignal, emotionalTag, true, false));
    }

    function sealRightsEntry(uint256 index) external onlySteward {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
