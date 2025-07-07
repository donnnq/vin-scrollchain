// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollOracle {
    struct Utterance {
        string title;
        string message;
        string tone; // e.g. "Riddle", "Warning", "Blessing", "Prophecy"
        address speaker;
        uint256 timestamp;
    }

    Utterance[] public utterances;
    address public immutable oracleCaller;

    event UtteranceSpoken(uint256 indexed id, string title, string tone, address speaker, uint256 timestamp);

    modifier onlyCaller() {
        require(msg.sender == oracleCaller, "Not the oracle caller");
        _;
    }

    constructor() {
        oracleCaller = msg.sender;
    }

    function speak(
        string calldata title,
        string calldata message,
        string calldata tone
    ) external onlyCaller {
        utterances.push(Utterance({
            title: title,
            message: message,
            tone: tone,
            speaker: msg.sender,
            timestamp: block.timestamp
        }));

        emit UtteranceSpoken(utterances.length - 1, title, tone, msg.sender, block.timestamp);
    }

    function getUtterance(uint256 id) external view returns (Utterance memory) {
        require(id < utterances.length, "Invalid utterance ID");
        return utterances[id];
    }

    function totalUtterances() external view returns (uint256) {
        return utterances.length;
    }
}
