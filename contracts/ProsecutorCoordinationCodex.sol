// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProsecutorCoordinationCodex {
    address public admin;

    struct CoordinationNote {
        string prosecutorName;
        string agencyLabel;
        string coordinationStatus;
        string emotionalTag;
        bool confirmed;
    }

    CoordinationNote[] public notes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitNote(string memory prosecutorName, string memory agencyLabel, string memory coordinationStatus, string memory emotionalTag) external onlyAdmin {
        notes.push(CoordinationNote(prosecutorName, agencyLabel, coordinationStatus, emotionalTag, false));
    }

    function confirmNote(uint256 index) external onlyAdmin {
        notes[index].confirmed = true;
    }

    function getNote(uint256 index) external view returns (CoordinationNote memory) {
        return notes[index];
    }
}
