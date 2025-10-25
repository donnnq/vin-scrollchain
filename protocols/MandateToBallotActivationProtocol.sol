// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MandateToBallotActivationProtocol {
    address public steward;

    struct BallotEntry {
        string region; // "State", "City", "Diaspora zone"
        string mandateType; // "Cannabis legalization", "Decriminalization", "Medical access"
        string activationMethod; // "Citizen initiative", "Scrollchain petition", "Diaspora council"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    BallotEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateBallot(string memory region, string memory mandateType, string memory activationMethod, string memory emotionalTag) external onlySteward {
        entries.push(BallotEntry(region, mandateType, activationMethod, emotionalTag, true, false));
    }

    function sealBallotEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getBallotEntry(uint256 index) external view returns (BallotEntry memory) {
        return entries[index];
    }
}
