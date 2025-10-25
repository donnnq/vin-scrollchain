// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentToBotDetectionGrid {
    address public steward;

    struct BotEntry {
        string platform; // "YouTube", "Twitter", "Facebook", "TikTok"
        string botBehavior; // "Repetitive replies", "Mocking tone", "Off-topic spam"
        string detectionMethod; // "Scrollchain trace", "User flag", "Pattern audit"
        string emotionalTag;
        bool detected;
        bool sealed;
    }

    BotEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectBot(string memory platform, string memory botBehavior, string memory detectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(BotEntry(platform, botBehavior, detectionMethod, emotionalTag, true, false));
    }

    function sealBotEntry(uint256 index) external onlySteward {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getBotEntry(uint256 index) external view returns (BotEntry memory) {
        return entries[index];
    }
}
