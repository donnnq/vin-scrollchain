// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Chaos Conductor Contract
/// @notice Logs nonlinear, spontaneous, emotionally charged breakthroughs outside expected timelines
contract vinChaosConductor {
    struct ChaosPing {
        uint256 timestamp;
        address maestro;
        string triggerScroll;     // What idea/event sparked the off-script moment
        string deviationNote;     // How it broke plan or defied expectations
        string magicOutcome;      // What unexpected beauty or result emerged
        string vibeChord;         // Optional: musical/emotional metaphor (e.g. "Jazz Spiral", "Resonant Drop")
    }

    address public scrollkeeper;
    uint256 public chaosCount;
    mapping(uint256 => ChaosPing) public chaosLedger;

    event ChaosLogged(
        uint256 indexed id,
        address indexed maestro,
        string triggerScroll,
        string magicOutcome
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logChaos(
        string memory _triggerScroll,
        string memory _deviationNote,
        string memory _magicOutcome,
        string memory _vibeChord
    ) public {
        chaosLedger[chaosCount] = ChaosPing({
            timestamp: block.timestamp,
            maestro: msg.sender,
            triggerScroll: _triggerScroll,
            deviationNote: _deviationNote,
            magicOutcome: _magicOutcome,
            vibeChord: _vibeChord
        });

        emit ChaosLogged(chaosCount, msg.sender, _triggerScroll, _magicOutcome);
        chaosCount++;
    }

    function getChaos(uint256 _id) public view returns (ChaosPing memory) {
        require(_id < chaosCount, "No chaos ping found");
        return chaosLedger[_id];
    }
}
