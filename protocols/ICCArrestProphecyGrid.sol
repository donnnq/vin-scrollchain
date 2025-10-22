// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCArrestProphecyGrid {
    address public admin;

    struct ProphecyEntry {
        string broadcaster; // "Sangkay Janjan"
        string prophecyTarget; // "Sen. Bato", "Sen. Bong Go"
        string prophecyType; // "ICC arrest rumor"
        string emotionalTag;
        bool prophesied;
        bool sealed;
    }

    ProphecyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logProphecy(string memory broadcaster, string memory prophecyTarget, string memory prophecyType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProphecyEntry(broadcaster, prophecyTarget, prophecyType, emotionalTag, true, false));
    }

    function sealProphecyEntry(uint256 index) external onlyAdmin {
        require(entries[index].prophesied, "Must be prophesied first");
        entries[index].sealed = true;
    }

    function getProphecyEntry(uint256 index) external view returns (ProphecyEntry memory) {
        return entries[index];
    }
}
