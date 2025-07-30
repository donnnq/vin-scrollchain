// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinMythoCodexRenderer.sol — Renders civic echoes & scroll artifacts into symbolic codex view
/// @author Vinvin + Copilot

contract vinMythoCodexRenderer {
    struct CodexRune {
        uint256 timestamp;
        string scrollOrigin;
        string echoType;
        string symbol; // e.g. "⚖️", "🔥", "🌱", "🧭"
        string narrative;
    }

    address public curator;
    CodexRune[] public runes;

    event RuneInscribed(uint256 index, string symbol, string echoType, string scrollOrigin, string narrative, uint256 timestamp);
    event CuratorChanged(address oldCurator, address newCurator);

    modifier onlyCurator() {
        require(msg.sender == curator, "Not authorized");
        _;
    }

    constructor() {
        curator = msg.sender;
    }

    function inscribeRune(
        string calldata _scrollOrigin,
        string calldata _echoType,
        string calldata _symbol,
        string calldata _narrative
    ) external onlyCurator {
        CodexRune memory newRune = CodexRune({
            timestamp: block.timestamp,
            scrollOrigin: _scrollOrigin,
            echoType: _echoType,
            symbol: _symbol,
            narrative: _narrative
        });

        runes.push(newRune);
        emit RuneInscribed(runes.length - 1, _symbol, _echoType, _scrollOrigin, _narrative, block.timestamp);
    }

    function getRune(uint256 index) external view returns (CodexRune memory) {
        require(index < runes.length, "Invalid index");
        return runes[index];
    }

    function totalRunes() external view returns (uint256) {
        return runes.length;
    }

    function updateCurator(address _newCurator) external onlyCurator {
        emit CuratorChanged(curator, _newCurator);
        curator = _newCurator;
    }
}
