// SPDX-License-Identifier: BUDGET-CLARITY
pragma solidity ^0.8.0;

/// @title vinBudgetMirror: Reflects budget distortions and recalibrates truth
contract vinBudgetMirror {
    struct DistortedLine {
        string distortedSymbol;
        string fearTrigger;
        string mirrorReflection;
    }

    DistortedLine[] public reflections;

    event MirrorCalibrated(string distortedSymbol, string reflection);
    event RitualReversed(string fearTrigger, string clarityMessage);

    function reflectSymbol(string memory distortedSymbol, string memory fearTrigger, string mirrorReflection) public {
        reflections.push(DistortedLine(distortedSymbol, fearTrigger, mirrorReflection));
        emit MirrorCalibrated(distortedSymbol, mirrorReflection);
        emit RitualReversed(fearTrigger, "Distortion neutralized with clarity spell.");
    }

    function getReflections() public view returns (DistortedLine[] memory) {
        return reflections;
    }
}
