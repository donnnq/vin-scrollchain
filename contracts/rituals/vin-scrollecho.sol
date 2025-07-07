// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollEcho {
    struct Echo {
        string sourceType; // "Oracle", "Altar", "Oath", etc.
        string ref;
        string message;
        address origin;
        uint256 timestamp;
    }

    Echo[] public echoes;
    address public immutable echoCaller;

    event EchoResonated(uint256 indexed id, string sourceType, string ref, string message, address origin, uint256 timestamp);

    modifier onlyCaller() {
        require(msg.sender == echoCaller, "Not the echo caller");
        _;
    }

    constructor() {
        echoCaller = msg.sender;
    }

    function resonate(
        string calldata sourceType,
        string calldata ref,
        string calldata message
    ) external onlyCaller {
        echoes.push(Echo({
            sourceType: sourceType,
            ref: ref,
            message: message,
            origin: msg.sender,
            timestamp: block.timestamp
        }));

        emit EchoResonated(echoes.length - 1, sourceType, ref, message, msg.sender, block.timestamp);
    }

    function getEcho(uint256 id) external view returns (Echo memory) {
        require(id < echoes.length, "Invalid echo ID");
        return echoes[id];
    }

    function totalEchoes() external view returns (uint256) {
        return echoes.length;
    }
}
