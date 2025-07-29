// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollMirror.sol
/// @notice Logs ancestral resonance to inform sovereign migration

contract vinScrollMirror {
    struct AncestralEcho {
        address soul;
        string lineage;
        string previousMigration;
        string spiritualLesson;
    }

    mapping(address => AncestralEcho) public echoes;
    address public mirrorScribe;

    modifier onlyScribe() {
        require(msg.sender == mirrorScribe, "Unauthorized");
        _;
    }

    constructor() {
        mirrorScribe = msg.sender;
    }

    function inscribeEcho(address soul, string memory lineage, string memory previousMigration, string memory lesson) public onlyScribe {
        echoes[soul] = AncestralEcho(soul, lineage, previousMigration, lesson);
    }

    function revealMirror(address soul) public view returns (AncestralEcho memory) {
        return echoes[soul];
    }
}
