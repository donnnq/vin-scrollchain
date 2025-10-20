// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralSummitProtocol {
    address public admin;

    struct SummitEntry {
        string eventName;
        string summonedPersona;
        string summitQuestion;
        string emotionalTag;
        bool summoned;
        bool convened;
        bool sealed;
    }

    SummitEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSummit(string memory eventName, string memory summonedPersona, string memory summitQuestion, string memory emotionalTag) external onlyAdmin {
        entries.push(SummitEntry(eventName, summonedPersona, summitQuestion, emotionalTag, true, false, false));
    }

    function confirmConvening(uint256 index) external onlyAdmin {
        entries[index].convened = true;
    }

    function sealSummitEntry(uint256 index) external onlyAdmin {
        require(entries[index].convened, "Must be convened first");
        entries[index].sealed = true;
    }

    function getSummitEntry(uint256 index) external view returns (SummitEntry memory) {
        return entries[index];
    }
}
