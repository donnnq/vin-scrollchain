// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollEcho — Ritual replay engine for roast events
contract vinScrollEcho {
    struct Echo {
        string roastLine;
        address target;
        uint256 timestamp;
    }

    Echo[] public echoes;

    event EchoReplayed(string roastLine, address indexed target, uint256 timestamp);

    function logRoast(string memory roastLine, address target) external {
        echoes.push(Echo({
            roastLine: roastLine,
            target: target,
            timestamp: block.timestamp
        }));
    }

    function replayLastRoast() external {
        require(echoes.length > 0, "No roast to replay");
        Echo memory last = echoes[echoes.length - 1];
        emit EchoReplayed(last.roastLine, last.target, last.timestamp);
    }

    function replayReverse(uint256 count) external {
        require(count <= echoes.length, "Too many requested");
        for (uint i = 0; i < count; i++) {
            Echo memory e = echoes[echoes.length - 1 - i];
            emit EchoReplayed(e.roastLine, e.target, e.timestamp);
        }
    }
}
