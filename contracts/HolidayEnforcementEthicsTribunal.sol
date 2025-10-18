// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolidayEnforcementEthicsTribunal {
    address public admin;

    struct TribunalEntry {
        string incidentName;
        string enforcementAction;
        string emotionalTag;
        bool summoned;
        bool judged;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory incidentName, string memory enforcementAction, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(incidentName, enforcementAction, emotionalTag, true, false));
    }

    function judgeTribunal(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
