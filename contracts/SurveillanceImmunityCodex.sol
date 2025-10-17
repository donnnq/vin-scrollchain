// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SurveillanceImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string actorName;
        string corridor;
        string emotionalTag;
        bool archived;
        bool immune;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveActor(string memory actorName, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(actorName, corridor, emotionalTag, true, false));
    }

    function markImmune(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getActor(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
