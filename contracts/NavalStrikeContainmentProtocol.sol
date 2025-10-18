// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NavalStrikeContainmentProtocol {
    address public admin;

    struct StrikeEntry {
        string vesselName;
        string originNation;
        string emotionalTag;
        bool contained;
        bool dismantled;
    }

    StrikeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function containStrike(string memory vesselName, string memory originNation, string memory emotionalTag) external onlyAdmin {
        entries.push(StrikeEntry(vesselName, originNation, emotionalTag, true, false));
    }

    function dismantleVessel(uint256 index) external onlyAdmin {
        entries[index].dismantled = true;
    }

    function getStrikeEntry(uint256 index) external view returns (StrikeEntry memory) {
        return entries[index];
    }
}
