// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisToPublicMandateProtocol {
    address public steward;

    struct MandateEntry {
        string region; // "USA", "State-level", "Diaspora zone"
        string mandateSignal; // "Poll majority", "Ballot initiative", "Scrollchain petition"
        string legalizationGoal; // "Recreational", "Medical", "Decriminalization"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    MandateEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateMandate(string memory region, string memory mandateSignal, string memory legalizationGoal, string memory emotionalTag) external onlySteward {
        entries.push(MandateEntry(region, mandateSignal, legalizationGoal, emotionalTag, true, false));
    }

    function sealMandateEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMandateEntry(uint256 index) external view returns (MandateEntry memory) {
        return entries[index];
    }
}
