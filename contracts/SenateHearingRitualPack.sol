// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingRitualPack {
    address public admin;

    struct HearingEntry {
        string topicLabel;
        string witness;
        string emotionalTag;
        bool summoned;
        bool testified;
    }

    HearingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWitness(string memory topicLabel, string memory witness, string memory emotionalTag) external onlyAdmin {
        entries.push(HearingEntry(topicLabel, witness, emotionalTag, true, false));
    }

    function markTestified(uint256 index) external onlyAdmin {
        entries[index].testified = true;
    }

    function getHearing(uint256 index) external view returns (HearingEntry memory) {
        return entries[index];
    }
}
